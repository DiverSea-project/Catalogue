#!/usr/bin/env python3
"""
Combined Santorini seagrass + tourism scenario model with Monte Carlo uncertainty.

Scenarios:
1. base
2. mpa_no_traffic: protected seagrass pieces have marine traffic = 0
3. mpa_no_traffic_pollution05: protected seagrass pieces have marine traffic = 0 and marine_pollution_per_tourist = 0.5
4. seagrass_weight_1: SD parameter seagrass_weight = 1

Outputs are written to:
/projects/DiverSea/output/3_seagrass_tourism_marine_traffic_3_scenarios

The model:
- cuts seagrass polygons into 5x5 km pieces
- computes marine traffic density on these cut pieces
- runs the SD model per scenario piece
- repeats stochastic edge degradation N_MONTE_CARLO times in parallel
- visualizes tourism maps and mean seagrass presence probability as in the 3_... script
"""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Tuple
import os

import geopandas as gpd
import numpy as np
import pandas as pd
import pysd
import rasterio
from joblib import Parallel, delayed
from matplotlib import pyplot
from matplotlib.cm import ScalarMappable
from matplotlib.colors import Normalize
from rasterio.features import rasterize
from rasterio.plot import show as rioshow
from rasterio.transform import from_origin
from rasterstats import zonal_stats
from scipy.ndimage import binary_erosion, convolve, distance_transform_edt
from shapely.geometry import box
from tqdm import tqdm

# =============================================================================
# Configuration
# =============================================================================

MODEL_FILE = Path("s:/projects/DiverSea/input/vensim/v2_seagrass_traffic/DIVERSEA_SFM_CS_Hellenic_V2.22.py")
LAND_FILE = Path("s:/projects/DiverSea/input/spatial_data/islands_shp.shp")
MARINE_TRAFFIC_FILE = Path("s:/projects/DiverSea/input/spatial_data/vessel_density_mean_2017to2023_reproj.tif")
SEAGRASS_FILE = Path("s:/projects/DiverSea/input/spatial_data/GreekSeagrass_L8_repaired_clipped.shp")
TOURISM_HOTSPOTS_FILE = Path("s:/projects/DiverSea/input/spatial_data/osm_tourism_accommodation.shp")

# This follows your protected-area scenario script. Change to protected_area.shp if needed.
PROTECTED_AREA_FILE = Path("s:/projects/DiverSea/input/spatial_data/protected_area_real.shp")

OUTPUT_DIR = Path("s:/projects/DiverSea/output/3_seagrass_tourism_marine_traffic_3_scenarios_lorenz")
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

TARGET_EPSG = 32635

BBOX = box(346079, 4016760, 366824, 4040474)
BBOX_XMIN = 346079
BBOX_YMIN = 4016760
BBOX_XMAX = 366824
BBOX_YMAX = 4040474

FINE_RESOLUTION = 30
TOURISM_RASTER_RESOLUTION = 60
COARSE_CELL_SIZE = 5000
MIN_PATCH_AREA_M2 = 1000
MAX_BATCH_SIZE = 100
BATCH_FRACTION = 0.01

PLOT_YEARS = [2014, 2020, 2030, 2040, 2050]
SD_INITIAL_AREA_FRACTION_2014 = 0.76

TOURISM_VAR_CANDIDATES = ["annual number of tourists", "annual_number_of_tourists"]
TOURISM_DISTANCE_SCALE_M = 450
TOURISM_RANDOM_SEED = 42

MARINE_LITTER_PARAM = "marine_pollution_per_tourist"

# Monte Carlo settings. Set to 1 for a quick test; set to 100 for final runs.
N_MONTE_CARLO = 100
RANDOM_SEED = 42
N_JOBS = int(os.environ.get("SLURM_CPUS_PER_TASK", 16))
PARALLEL_BACKEND = "loky"
VERBOSE = 10
SAVE_ALL_YEAR_RASTERS = True
DENSITY_CACHE_DECIMALS = 4

# Reused structuring elements for Monte Carlo erosion.
KERNEL_8N = np.array(
    [[1, 1, 1],
     [1, 0, 1],
     [1, 1, 1]],
    dtype=np.uint8,
)
STRUCTURE_3X3 = np.ones((3, 3), dtype=np.uint8)

SCENARIOS = {
    "base": {
        "title": "Base scenario",
        "seagrass_weight": None,
        "use_mpa": False,
        "mpa_remove_traffic": False,
        "mpa_pollution_value": None,
    },
    "mpa_no_traffic": {
        "title": "Scenario 1 - MPA, marine traffic removed",
        "seagrass_weight": None,
        "use_mpa": True,
        "mpa_remove_traffic": True,
        "mpa_pollution_value": None,
    },
    "mpa_no_traffic_pollution05": {
        "title": "Scenario 2 - MPA, traffic removed + pollution per tourist = 0.5",
        "seagrass_weight": None,
        "use_mpa": True,
        "mpa_remove_traffic": True,
        "mpa_pollution_value": 0.5,
    },
    "seagrass_weight_1": {
        "title": "Scenario 3 - seagrass_weight = 1",
        "seagrass_weight": 1.0,
        "use_mpa": False,
        "mpa_remove_traffic": False,
        "mpa_pollution_value": None,
    },
}

# =============================================================================
# Dataclasses
# =============================================================================

@dataclass
class GridSpec:
    transform: object
    width: int
    height: int
    crs: str
    extent: Tuple[float, float, float, float]


@dataclass
class PieceData:
    piece_uid: str
    parent_patch_id: int
    initial_mask: np.ndarray
    initial_pixel_count: int
    target_pixels_by_year: np.ndarray
    local_window: Tuple[slice, slice]


# =============================================================================
# Spatial helpers
# =============================================================================

def build_global_grid(bounds: Tuple[float, float, float, float], resolution: float, epsg: int) -> GridSpec:
    xmin, ymin, xmax, ymax = bounds
    width = int(np.ceil((xmax - xmin) / resolution))
    height = int(np.ceil((ymax - ymin) / resolution))
    transform = from_origin(xmin, ymax, resolution, resolution)
    extent = (xmin, xmin + width * resolution, ymin, ymin + height * resolution)
    return GridSpec(transform=transform, width=width, height=height, crs=f"EPSG:{epsg}", extent=extent)


def build_global_coarse_grid(bounds: Tuple[float, float, float, float], cell_size: float, crs: str) -> gpd.GeoDataFrame:
    xmin, ymin, xmax, ymax = bounds
    x0 = np.floor(xmin / cell_size) * cell_size
    y0 = np.floor(ymin / cell_size) * cell_size
    x1 = np.ceil(xmax / cell_size) * cell_size
    y1 = np.ceil(ymax / cell_size) * cell_size
    polys, cell_ids = [], []
    ix = 0
    x = x0
    while x < x1:
        iy = 0
        y = y0
        while y < y1:
            polys.append(box(x, y, x + cell_size, y + cell_size))
            cell_ids.append(f"cx{ix}_cy{iy}")
            y += cell_size
            iy += 1
        x += cell_size
        ix += 1
    return gpd.GeoDataFrame({"coarse_cell_id": cell_ids}, geometry=polys, crs=crs)


def rasterize_geometry_to_grid(geometry, grid: GridSpec, all_touched: bool = False) -> np.ndarray:
    return rasterize(
        [(geometry, 1)],
        out_shape=(grid.height, grid.width),
        transform=grid.transform,
        fill=0,
        dtype=np.uint8,
        all_touched=all_touched,
    )


def compute_mask_window(mask: np.ndarray, pad: int = 1) -> Tuple[slice, slice]:
    rows, cols = np.nonzero(mask)
    if len(rows) == 0:
        return slice(0, 0), slice(0, 0)

    row_min = max(int(rows.min()) - pad, 0)
    row_max = min(int(rows.max()) + pad + 1, mask.shape[0])
    col_min = max(int(cols.min()) - pad, 0)
    col_max = min(int(cols.max()) + pad + 1, mask.shape[1])
    return slice(row_min, row_max), slice(col_min, col_max)


# =============================================================================
# Loading and preprocessing
# =============================================================================

def load_inputs():
    model = pysd.load(str(MODEL_FILE))
    land_gdf = gpd.read_file(LAND_FILE).to_crs(epsg=TARGET_EPSG)
    seagrass_gdf = gpd.read_file(SEAGRASS_FILE).to_crs(epsg=TARGET_EPSG)
    hotspots_gdf = gpd.read_file(TOURISM_HOTSPOTS_FILE).to_crs(epsg=TARGET_EPSG)
    protected_gdf = gpd.read_file(PROTECTED_AREA_FILE).to_crs(epsg=TARGET_EPSG)
    land_gdf = gpd.clip(land_gdf, BBOX)
    seagrass_gdf = gpd.clip(seagrass_gdf, BBOX).reset_index(drop=True)
    hotspots_gdf = gpd.clip(hotspots_gdf, BBOX).reset_index(drop=True)
    protected_gdf = gpd.clip(protected_gdf, BBOX).reset_index(drop=True)
    seagrass_gdf["area_m2"] = seagrass_gdf.geometry.area
    seagrass_gdf = seagrass_gdf[seagrass_gdf["area_m2"] >= MIN_PATCH_AREA_M2].reset_index(drop=True)
    seagrass_gdf["parent_patch_id"] = np.arange(1, len(seagrass_gdf) + 1)
    return model, land_gdf, seagrass_gdf, hotspots_gdf, protected_gdf


def cut_seagrass_into_5km_pieces(seagrass_parent_gdf: gpd.GeoDataFrame) -> gpd.GeoDataFrame:
    coarse_grid_gdf = build_global_coarse_grid((BBOX_XMIN, BBOX_YMIN, BBOX_XMAX, BBOX_YMAX), COARSE_CELL_SIZE, seagrass_parent_gdf.crs)
    seagrass_subset = seagrass_parent_gdf[["parent_patch_id", "geometry"]].copy()
    cut_gdf = gpd.overlay(seagrass_subset, coarse_grid_gdf, how="intersection", keep_geom_type=True)
    cut_gdf = cut_gdf.reset_index(drop=True)
    cut_gdf["base_piece_id"] = np.arange(1, len(cut_gdf) + 1)
    cut_gdf["area_m2"] = cut_gdf.geometry.area
    cut_gdf = cut_gdf[cut_gdf["area_m2"] >= 1.0].reset_index(drop=True)
    return cut_gdf


def add_base_vessel_density(cut_gdf: gpd.GeoDataFrame) -> Tuple[gpd.GeoDataFrame, float]:
    cut_gdf = cut_gdf.copy()
    stats = zonal_stats(cut_gdf, str(MARINE_TRAFFIC_FILE), stats="mean", nodata=np.nan, all_touched=True)
    cut_gdf["mean_vessel_density"] = [s["mean"] if s["mean"] is not None else np.nan for s in stats]
    base_max_density = cut_gdf["mean_vessel_density"].max()
    if (not np.isfinite(base_max_density)) or base_max_density <= 0:
        cut_gdf["relative_vessel_density"] = 0.0
    else:
        cut_gdf["relative_vessel_density"] = (cut_gdf["mean_vessel_density"] / base_max_density).fillna(0.0)
    return cut_gdf, float(base_max_density) if np.isfinite(base_max_density) else 0.0


def relative_density_from_mean(mean_density: float, base_max_density: float) -> float:
    if (not np.isfinite(base_max_density)) or base_max_density <= 0:
        return 0.0
    if (not np.isfinite(mean_density)) or mean_density < 0:
        return 0.0
    return float(mean_density / base_max_density)


# =============================================================================
# Scenario geometry construction
# =============================================================================

def build_scenario_pieces(base_cut_gdf, protected_gdf, scenario_name, scenario_config, base_max_density):
    if (not scenario_config["use_mpa"]) or protected_gdf.empty:
        gdf = base_cut_gdf.copy()
        gdf["piece_type"] = "full_base"
        gdf["is_protected_piece"] = False
        gdf["scenario_piece_uid"] = [f"{scenario_name}_basepiece_{pid}" for pid in gdf["base_piece_id"]]
        return gdf.reset_index(drop=True)

    protected_union = protected_gdf.union_all()
    intersects_mask = base_cut_gdf.geometry.intersects(protected_union)
    unaffected = base_cut_gdf.loc[~intersects_mask].copy()
    affected = base_cut_gdf.loc[intersects_mask].copy()
    pieces = []

    if len(unaffected) > 0:
        unaffected["piece_type"] = "full_unaffected"
        unaffected["is_protected_piece"] = False
        unaffected["scenario_piece_uid"] = [f"{scenario_name}_basepiece_{pid}_unaffected" for pid in unaffected["base_piece_id"]]
        pieces.append(unaffected)

    if len(affected) > 0:
        protected_subset = protected_gdf[["geometry"]].copy()
        affected_subset = affected[["base_piece_id", "parent_patch_id", "coarse_cell_id", "geometry", "area_m2", "mean_vessel_density", "relative_vessel_density"]].copy()
        protected_part = gpd.overlay(affected_subset, protected_subset, how="intersection", keep_geom_type=True)
        unprotected_part = gpd.overlay(affected_subset, protected_subset, how="difference", keep_geom_type=True)

        if len(unprotected_part) > 0:
            unprotected_part = unprotected_part.copy()
            unprotected_part["piece_type"] = "cut_unprotected"
            unprotected_part["is_protected_piece"] = False
            unprotected_part["area_m2"] = unprotected_part.geometry.area
            stats = zonal_stats(unprotected_part, str(MARINE_TRAFFIC_FILE), stats="mean", nodata=np.nan, all_touched=True)
            unprotected_part["mean_vessel_density"] = [s["mean"] if s["mean"] is not None else np.nan for s in stats]
            unprotected_part["relative_vessel_density"] = unprotected_part["mean_vessel_density"].apply(lambda x: relative_density_from_mean(x, base_max_density))
            unprotected_part["scenario_piece_uid"] = [f"{scenario_name}_basepiece_{pid}_unprotected_{i}" for i, pid in enumerate(unprotected_part["base_piece_id"])]
            pieces.append(unprotected_part)

        if len(protected_part) > 0:
            protected_part = protected_part.copy()
            protected_part["piece_type"] = "cut_protected"
            protected_part["is_protected_piece"] = True
            protected_part["area_m2"] = protected_part.geometry.area
            if scenario_config["mpa_remove_traffic"]:
                protected_part["mean_vessel_density"] = 0.0
                protected_part["relative_vessel_density"] = 0.0
            protected_part["scenario_piece_uid"] = [f"{scenario_name}_basepiece_{pid}_protected_{i}" for i, pid in enumerate(protected_part["base_piece_id"])]
            pieces.append(protected_part)

    if not pieces:
        return gpd.GeoDataFrame(columns=["base_piece_id", "parent_patch_id", "coarse_cell_id", "geometry", "area_m2", "mean_vessel_density", "relative_vessel_density", "piece_type", "is_protected_piece", "scenario_piece_uid"], geometry="geometry", crs=base_cut_gdf.crs)

    scenario_gdf = gpd.GeoDataFrame(pd.concat(pieces, ignore_index=True), geometry="geometry", crs=base_cut_gdf.crs)
    scenario_gdf = scenario_gdf[scenario_gdf["area_m2"] >= 1.0].reset_index(drop=True)
    return scenario_gdf


# =============================================================================
# SD model helpers
# =============================================================================

def run_seagrass_model_for_piece(model, relative_vessel_density, seagrass_weight=None, marine_pollution_per_tourist=None):
    params = {"marine_traffic_per_tourist": float(relative_vessel_density)}
    if seagrass_weight is not None:
        params["seagrass_weight"] = float(seagrass_weight)
    if marine_pollution_per_tourist is not None:
        params[MARINE_POLLUTION_PARAM] = float(marine_pollution_per_tourist)
    results = model.run(params=params, return_columns=["seagrass_area"], return_timestamps=PLOT_YEARS)
    return results["seagrass_area"].to_numpy(dtype=float)


def target_fraction_from_sd(area_series, t_idx):
    if len(area_series) == 0:
        return 0.0
    return float(np.clip(area_series[t_idx] / SD_INITIAL_AREA_FRACTION_2014, 0.0, 1.0))


def prepare_piece_data_for_scenario(model, scenario_gdf, scenario_config, grid):
    piece_data = []
    sd_cache = {}
    for _, row in scenario_gdf.iterrows():
        initial_mask = rasterize_geometry_to_grid(row.geometry, grid, all_touched=False).astype(bool)
        initial_pixel_count = int(np.count_nonzero(initial_mask))
        if initial_pixel_count == 0:
            area_series = np.zeros(len(PLOT_YEARS), dtype=float)
        else:
            piece_pollution_value = None
            if bool(row["is_protected_piece"]) and scenario_config["mpa_pollution_value"] is not None:
                piece_pollution_value = float(scenario_config["mpa_pollution_value"])
            cache_key = (round(float(row["relative_vessel_density"]), DENSITY_CACHE_DECIMALS), scenario_config["seagrass_weight"], piece_pollution_value)
            if cache_key in sd_cache:
                area_series = sd_cache[cache_key]
            else:
                area_series = run_seagrass_model_for_piece(
                    model=model,
                    relative_vessel_density=float(row["relative_vessel_density"]),
                    seagrass_weight=scenario_config["seagrass_weight"],
                    marine_pollution_per_tourist=piece_pollution_value,
                )
                sd_cache[cache_key] = area_series

        target_pixels_by_year = np.rint(
            np.clip(area_series / SD_INITIAL_AREA_FRACTION_2014, 0.0, 1.0) * initial_pixel_count
        ).astype(np.int32, copy=False)
        piece_data.append(PieceData(
            piece_uid=str(row["scenario_piece_uid"]),
            parent_patch_id=int(row["parent_patch_id"]),
            initial_mask=initial_mask,
            initial_pixel_count=initial_pixel_count,
            target_pixels_by_year=target_pixels_by_year,
            local_window=compute_mask_window(initial_mask),
        ))
    return piece_data


# =============================================================================
# Monte Carlo erosion
# =============================================================================

def erode_subpatch_batched(
    full_patch,
    subpatch_mask,
    target_pixels,
    rng,
    local_window=None,
    MAX_BATCH_SIZE=100,
    BATCH_FRACTION=0.01,
):
    """
    Batched erosion of a subpatch:
    - Removal only happens inside subpatch_mask
    - Neighbourhood is recomputed from the current local padded window each batch
    """

    out = full_patch.astype(bool, copy=True)

    if local_window is None:
        local_window = compute_mask_window(subpatch_mask)

    row_slice, col_slice = local_window
    local_out = out[row_slice, col_slice]
    local_subpatch = subpatch_mask[row_slice, col_slice].astype(bool, copy=False)

    if local_subpatch.size == 0:
        return out.astype(np.uint8, copy=False)

    target_pixels = int(target_pixels)
    current_pixels = int(np.count_nonzero(local_out & local_subpatch))

    if current_pixels == 0 or target_pixels >= current_pixels:
        return out.astype(np.uint8, copy=False)

    if target_pixels <= 0:
        local_out[local_subpatch] = False
        return out.astype(np.uint8, copy=False)

    while current_pixels > target_pixels:
        pixels_left = current_pixels - target_pixels

        batch_size = min(
            MAX_BATCH_SIZE,
            pixels_left,
            max(1, int(BATCH_FRACTION * pixels_left))
        )

        # Recompute from current local window each batch (window includes halo via local_window).
        neighbour_count = convolve(
            local_out.astype(np.uint8, copy=False),
            KERNEL_8N,
            mode="constant",
            cval=0
        )

        # Only allow removal inside subpatch
        active = local_out & local_subpatch

        # Priority 1: isolated
        isolated = np.flatnonzero((active & (neighbour_count == 0)).ravel())

        # Priority 2: weak edges
        weak_edge = np.flatnonzero((active & (neighbour_count <= 2)).ravel())

        if len(isolated) > 0:
            candidates = isolated
        elif len(weak_edge) > 0:
            candidates = weak_edge
        else:
            eroded = binary_erosion(
                local_out,
                structure=STRUCTURE_3X3
            )
            edge_pixels = np.flatnonzero(
                (active & (~eroded)).ravel()
            )

            if len(edge_pixels) == 0:
                candidates = np.flatnonzero(active.ravel())
            else:
                candidates = edge_pixels

        if len(candidates) == 0:
            break

        n_remove = min(batch_size, len(candidates))

        chosen = rng.choice(candidates, size=n_remove, replace=False)
        chosen_rows, chosen_cols = np.unravel_index(chosen, local_out.shape)
        local_out[chosen_rows, chosen_cols] = False
        current_pixels -= n_remove

    return out.astype(np.uint8, copy=False)


def group_piece_data_by_parent(piece_data):
    grouped = {}
    for piece in piece_data:
        grouped.setdefault(piece.parent_patch_id, []).append(piece)
    return grouped


def run_single_monte_carlo(piece_data, seed):
    rng = np.random.default_rng(seed)
    grouped = group_piece_data_by_parent(piece_data)
    n_times = len(PLOT_YEARS)
    height, width = piece_data[0].initial_mask.shape
    run_stack = np.zeros((n_times, height, width), dtype=np.uint8)
    parent_current = {}
    for parent_id, pieces in grouped.items():
        parent_mask = np.zeros((height, width), dtype=np.uint8)
        for piece in pieces:
            parent_mask = np.maximum(parent_mask, piece.initial_mask)
        parent_current[parent_id] = parent_mask
        run_stack[0] += parent_mask
    for t_idx in range(1, n_times):
        for parent_id, pieces in grouped.items():
            full_parent = parent_current[parent_id].copy()

            # Randomize update order to avoid directional seam bias from fixed piece iteration.
            for piece in rng.permutation(pieces):
                if piece.initial_pixel_count == 0:
                    continue
                full_parent = erode_subpatch_batched(
                    full_patch=full_parent,
                    subpatch_mask=piece.initial_mask,
                    target_pixels=piece.target_pixels_by_year[t_idx],
                    rng=rng,
                    local_window=piece.local_window,
                    MAX_BATCH_SIZE=MAX_BATCH_SIZE,
                    BATCH_FRACTION=BATCH_FRACTION,
                )
            parent_current[parent_id] = full_parent
            run_stack[t_idx] += full_parent
    return np.clip(run_stack, 0, 1).astype(np.uint8)


def monte_carlo_chunk(piece_data, seeds):
    n_times = len(PLOT_YEARS)
    height, width = piece_data[0].initial_mask.shape

    sum_maps = np.zeros((n_times, height, width), dtype=np.float32)

    for seed in seeds:
        run_stack = run_single_monte_carlo(piece_data, seed).astype(np.float32)
        sum_maps += run_stack

    return sum_maps, len(seeds)


def monte_carlo_for_scenario(piece_data, n_runs, base_seed, n_jobs):
    all_seeds = [base_seed + i for i in range(n_runs)]

    effective_jobs = os.cpu_count() if n_jobs == -1 else n_jobs
    n_chunks = min(effective_jobs, n_runs)

    seed_chunks = np.array_split(all_seeds, n_chunks)
    seed_chunks = [list(chunk) for chunk in seed_chunks if len(chunk) > 0]

    results = Parallel(
        n_jobs=n_jobs,
        backend=PARALLEL_BACKEND,
    )(
        delayed(monte_carlo_chunk)(piece_data, seeds)
        for seeds in tqdm(seed_chunks, total=len(seed_chunks), desc="Monte Carlo runs", disable=n_jobs == 1)
    )

    total_n = sum(n for _, n in results)

    sum_maps = None

    for s, _ in results:
        if sum_maps is None:
            sum_maps = s
        else:
            sum_maps += s

    mean_maps = sum_maps / total_n
    variance_maps = mean_maps * (1.0 - mean_maps)
    variance_maps = np.maximum(variance_maps, 0.0)
    std_maps = np.sqrt(variance_maps)

    return mean_maps.astype(np.float32), std_maps.astype(np.float32)

# =============================================================================
# Tourism mapping
# =============================================================================

def get_tourism_fraction_series(model, seagrass_weight=None):
    params = {}
    if seagrass_weight is not None:
        params["seagrass_weight"] = float(seagrass_weight)
    output = model.run(params=params, return_timestamps=PLOT_YEARS)
    for name in TOURISM_VAR_CANDIDATES:
        if name in output.columns:
            vals = output[name].to_numpy(dtype=float)
            if np.nanmax(vals) > 1.5:
                vals = vals / 100.0
            vals = np.clip(vals, 0.0, 1.0)
            print(f"Using tourism SD output column: {name}")
            return vals
    raise KeyError("Could not find a tourism fraction column in the PySD model. Update TOURISM_VAR_CANDIDATES.")


def build_tourism_grid(bounds, resolution):
    xmin, ymin, xmax, ymax = bounds
    width = int(np.ceil((xmax - xmin) / resolution))
    height = int(np.ceil((ymax - ymin) / resolution))
    transform = from_origin(xmin, ymax, resolution, resolution)
    extent = (xmin, xmin + width * resolution, ymin, ymin + height * resolution)
    return transform, width, height, extent


def build_tourism_probability_surface(land_gdf, hotspots_gdf):
    transform, width, height, extent = build_tourism_grid((BBOX_XMIN, BBOX_YMIN, BBOX_XMAX, BBOX_YMAX), TOURISM_RASTER_RESOLUTION)
    land_mask = rasterize(
        [(geom, 1) for geom in land_gdf.geometry if geom is not None and not geom.is_empty],
        out_shape=(height, width), transform=transform, fill=0, dtype=np.uint8, all_touched=True
    ).astype(bool)
    hotspot_mask = rasterize(
        [(geom, 1) for geom in hotspots_gdf.geometry if geom is not None and not geom.is_empty],
        out_shape=(height, width), transform=transform, fill=0, dtype=np.uint8, all_touched=True
    ).astype(bool)
    if hotspot_mask.sum() == 0:
        raise ValueError("No hotspot cells found inside the tourism raster grid.")
    dist_to_hotspot = distance_transform_edt(~hotspot_mask) * TOURISM_RASTER_RESOLUTION
    prob = np.exp(-dist_to_hotspot / TOURISM_DISTANCE_SCALE_M) * land_mask.astype(float)
    if prob.sum() <= 0:
        raise ValueError("Tourism probability surface is empty.")
    prob = prob / prob.sum()
    return transform, width, height, extent, land_mask, hotspot_mask, prob


def sample_binary_tourism_map(probability_surface, n_cells, rng):
    flat_prob = probability_surface.ravel().astype(float)
    out = np.zeros_like(flat_prob, dtype=np.uint8)
    if flat_prob.sum() <= 0 or n_cells <= 0:
        return out.reshape(probability_surface.shape)
    flat_prob = flat_prob / flat_prob.sum()
    n_cells = min(int(n_cells), int(np.count_nonzero(flat_prob > 0)))
    chosen = rng.choice(flat_prob.size, size=n_cells, replace=False, p=flat_prob)
    out[chosen] = 1
    return out.reshape(probability_surface.shape)


def update_binary_tourism_map(prev_map, probability_surface, n_cells, rng):
    """
    Update the tourism map incrementally to ensure temporal continuity.
    - If n_cells increases: add cells from inactive pixels (weighted by probability).
    - If n_cells decreases: remove cells from active pixels (weighted by inverse probability).
    """
    shape = probability_surface.shape
    flat_prob = probability_surface.ravel().astype(float)
    flat_prev = prev_map.ravel()
    current_active_indices = np.where(flat_prev == 1)[0]
    n_current = len(current_active_indices)
    
    out = flat_prev.copy()
    
    if n_cells == n_current:
        return out.reshape(shape)
    
    if n_cells > n_current:
        # Add cells
        n_to_add = n_cells - n_current
        inactive_indices = np.where(flat_prev == 0)[0]
        # Only consider inactive indices with non-zero probability
        candidate_indices = inactive_indices[flat_prob[inactive_indices] > 0]
        
        if len(candidate_indices) == 0:
            return out.reshape(shape)
            
        n_to_add = min(n_to_add, len(candidate_indices))
        p = flat_prob[candidate_indices]
        p = p / p.sum()
        chosen = rng.choice(candidate_indices, size=n_to_add, replace=False, p=p)
        out[chosen] = 1
        
    else:
        # Remove cells
        n_to_remove = n_current - n_cells
        if n_to_remove >= n_current:
            return np.zeros_like(flat_prev).reshape(shape)
            
        # For removal, we prefer to remove cells with LOW probability.
        # We can use (1 - normalized_prob) or simply 1/prob (with epsilon)
        # to weight the removal.
        p_active = flat_prob[current_active_indices]
        # Avoid division by zero, use a small epsilon or max(prob) - prob
        # If we use 1 - p_active, we need to be careful if p_active is already normalized.
        # Let's use max(p_active) - p_active + epsilon to favor removing low prob cells.
        p_removal = np.max(p_active) - p_active + 1e-10
        p_removal = p_removal / p_removal.sum()
        
        to_remove = rng.choice(current_active_indices, size=n_to_remove, replace=False, p=p_removal)
        out[to_remove] = 0
        
    return out.reshape(shape)


def run_tourism_simulation(model, scenario_config, tourism_prob):
    tourism_fraction_series = get_tourism_fraction_series(model, seagrass_weight=scenario_config["seagrass_weight"])
    rng = np.random.default_rng(TOURISM_RANDOM_SEED)
    max_tourism_cells = int(np.count_nonzero(tourism_prob > 0))
    tourism_maps = []
    
    # Initialize with an empty map of the correct shape
    current_map = np.zeros(tourism_prob.shape, dtype=np.uint8)
    
    for t_idx, year in enumerate(PLOT_YEARS):
        fraction = float(tourism_fraction_series[t_idx])
        n_cells = int(np.round(fraction * max_tourism_cells))
        
        # Incremental update
        current_map = update_binary_tourism_map(current_map, tourism_prob, n_cells, rng)
        
        tourism_maps.append(current_map.copy())
        print(f"  Tourism map {year}: fraction={fraction:.3f}, active cells={int(current_map.sum())}")
    return tourism_fraction_series, tourism_maps

# =============================================================================
# Plotting and output
# =============================================================================

def save_geotiff(path, array, grid, nodata=np.nan):
    meta = {
        "driver": "GTiff", "height": array.shape[0], "width": array.shape[1],
        "count": 1, "dtype": rasterio.float32, "crs": grid.crs,
        "transform": grid.transform, "nodata": nodata, "compress": "deflate",
    }
    with rasterio.open(path, "w", **meta) as dst:
        dst.write(array.astype(np.float32), 1)


def save_tourism_geotiff(path, array, transform):
    meta = {
        "driver": "GTiff", "height": array.shape[0], "width": array.shape[1],
        "count": 1, "dtype": rasterio.uint8, "crs": f"EPSG:{TARGET_EPSG}",
        "transform": transform, "nodata": 0, "compress": "deflate",
    }
    with rasterio.open(path, "w", **meta) as dst:
        dst.write(array.astype(np.uint8), 1)


def plot_input_diagnostics(land_gdf, seagrass_parent_gdf, base_cut_gdf, protected_gdf):
    with rasterio.open(MARINE_TRAFFIC_FILE) as src:
        fig, ax = pyplot.subplots(figsize=(10, 8))
        img = rioshow(src, ax=ax, cmap="viridis")
        pyplot.colorbar(img.get_images()[0], ax=ax, label="Vessel Density")
        land_gdf.plot(ax=ax, color="none", edgecolor="black", linewidth=0.5)
        seagrass_parent_gdf.plot(ax=ax, facecolor="none", edgecolor="green", linewidth=1.0)
        if not protected_gdf.empty:
            protected_gdf.plot(ax=ax, facecolor="none", edgecolor="red", linewidth=1.2)
        ax.set_title("Inputs: marine traffic, seagrass, and MPA")
        ax.set_xlim(BBOX_XMIN, BBOX_XMAX); ax.set_ylim(BBOX_YMIN, BBOX_YMAX)
        pyplot.tight_layout()
        pyplot.savefig(OUTPUT_DIR / "00_inputs_overview.png", dpi=180, bbox_inches="tight")
        pyplot.close(fig)

    fig, ax = pyplot.subplots(figsize=(10, 8))
    land_gdf.plot(ax=ax, color="lightgray", edgecolor="black", linewidth=0.5)
    base_cut_gdf.plot(ax=ax, column="relative_vessel_density", cmap="viridis", edgecolor="black", linewidth=0.5)
    if not protected_gdf.empty:
        protected_gdf.plot(ax=ax, facecolor="none", edgecolor="red", linewidth=1.2)
    sm = ScalarMappable(cmap="viridis", norm=Normalize(vmin=float(base_cut_gdf["relative_vessel_density"].min()), vmax=float(base_cut_gdf["relative_vessel_density"].max())))
    sm.set_array([])
    pyplot.colorbar(sm, ax=ax, label="Relative marine traffic density")
    ax.set_title("Relative marine traffic density per 5x5 km seagrass piece")
    ax.set_xlim(BBOX_XMIN, BBOX_XMAX); ax.set_ylim(BBOX_YMIN, BBOX_YMAX)
    ax.set_xticks([]); ax.set_yticks([])
    pyplot.tight_layout()
    pyplot.savefig(OUTPUT_DIR / "00_relative_marine_traffic_per_5x5km_piece.png", dpi=180, bbox_inches="tight")
    pyplot.close(fig)

    base_cut_gdf.to_file(OUTPUT_DIR / "00_base_5x5km_cutpieces_relative_traffic.gpkg", driver="GPKG")
    base_cut_gdf.drop(columns="geometry").to_csv(OUTPUT_DIR / "00_base_5x5km_cutpieces_relative_traffic.csv", index=False)


def plot_scenario_tourism_seagrass(scenario_name, scenario_title, tourism_maps, tourism_fraction_series, tourism_extent, tourism_land_mask, hotspots_gdf, mean_maps, land_gdf, grid):
    fig, axes = pyplot.subplots(2, len(PLOT_YEARS), figsize=(4.5 * len(PLOT_YEARS), 9))
    axes = np.atleast_2d(axes)
    for t_idx, year in enumerate(PLOT_YEARS):
        ax_t = axes[0, t_idx]
        bg = np.where(tourism_land_mask, 1.0, np.nan)
        ax_t.imshow(bg, cmap="Greys", alpha=0.15, extent=tourism_extent, origin="upper", interpolation="nearest")
        tourist_mask = np.where(tourism_maps[t_idx] == 1, 1, np.nan)
        ax_t.imshow(tourist_mask, cmap="Greys", vmin=0, vmax=1, extent=tourism_extent, origin="upper", interpolation="nearest")
        if not hotspots_gdf.empty:
            hotspots_gdf.plot(ax=ax_t, color="black", markersize=4, alpha=0.8)
        land_gdf.plot(ax=ax_t, facecolor="none", edgecolor="black", linewidth=0.4)
        ax_t.set_title(f"Tourists - {year}\n{tourism_fraction_series[t_idx]:.2f}")
        ax_t.set_xlim(BBOX_XMIN, BBOX_XMAX); ax_t.set_ylim(BBOX_YMIN, BBOX_YMAX)
        ax_t.set_xticks([]); ax_t.set_yticks([])

        ax_s = axes[1, t_idx]
        im = ax_s.imshow(mean_maps[t_idx], cmap="Greens", vmin=0, vmax=1, extent=grid.extent, origin="upper", interpolation="nearest")
        land_gdf.plot(ax=ax_s, color="lightgray", edgecolor="black", linewidth=0.5, zorder=5)
        ax_s.set_title(f"Mean seagrass presence - {year}")
        ax_s.set_xlim(BBOX_XMIN, BBOX_XMAX); ax_s.set_ylim(BBOX_YMIN, BBOX_YMAX)
        ax_s.set_xticks([]); ax_s.set_yticks([])

    fig.suptitle(f"Santorini tourism presence and seagrass extent\n{scenario_title}", fontsize=16)
    cbar = fig.colorbar(im, ax=axes[1, :].tolist(), fraction=0.02, pad=0.02)
    cbar.set_label("Mean seagrass presence probability")
    pyplot.tight_layout()
    out_png = OUTPUT_DIR / f"{scenario_name}_tourism_seagrass_mean_maps.png"
    pyplot.savefig(out_png, dpi=180, bbox_inches="tight")
    pyplot.close(fig)
    print(f"Saved scenario figure to: {out_png}")


def save_scenario_rasters(scenario_name, mean_maps, std_maps, grid):
    scenario_dir = OUTPUT_DIR / scenario_name
    scenario_dir.mkdir(parents=True, exist_ok=True)
    indices = range(len(PLOT_YEARS)) if SAVE_ALL_YEAR_RASTERS else [len(PLOT_YEARS) - 1]
    for t_idx in indices:
        year = PLOT_YEARS[t_idx]
        save_geotiff(scenario_dir / f"mean_seagrass_presence_{year}.tif", mean_maps[t_idx], grid)
        save_geotiff(scenario_dir / f"std_seagrass_presence_{year}.tif", std_maps[t_idx], grid)


# =============================================================================
# Main workflow
# =============================================================================

def main():
    print("Loading inputs...")
    model, land_gdf, seagrass_parent_gdf, hotspots_gdf, protected_gdf = load_inputs()
    print(f"Parent seagrass patches kept: {len(seagrass_parent_gdf)}")
    print(f"Tourism hotspots inside bbox: {len(hotspots_gdf)}")

    print("Cutting seagrass into 5x5 km pieces...")
    base_cut_gdf = cut_seagrass_into_5km_pieces(seagrass_parent_gdf)
    base_cut_gdf, base_max_density = add_base_vessel_density(base_cut_gdf)
    print(f"5x5 km seagrass pieces: {len(base_cut_gdf)}")
    print(base_cut_gdf[["base_piece_id", "parent_patch_id", "coarse_cell_id", "area_m2", "mean_vessel_density", "relative_vessel_density"]])

    seagrass_grid = build_global_grid((BBOX_XMIN, BBOX_YMIN, BBOX_XMAX, BBOX_YMAX), FINE_RESOLUTION, TARGET_EPSG)

    print("Building tourism probability surface...")
    tourism_transform, tourism_width, tourism_height, tourism_extent, tourism_land_mask, tourism_hotspot_mask, tourism_prob = build_tourism_probability_surface(land_gdf, hotspots_gdf)

    print("Saving input diagnostics...")
    plot_input_diagnostics(land_gdf, seagrass_parent_gdf, base_cut_gdf, protected_gdf)

    scenario_summaries = []

    for scenario_name, scenario_config in SCENARIOS.items():
        print("=" * 80)
        print(f"Preparing scenario: {scenario_name}")
        scenario_gdf = build_scenario_pieces(base_cut_gdf, protected_gdf, scenario_name, scenario_config, base_max_density)

        scenario_dir = OUTPUT_DIR / scenario_name
        scenario_dir.mkdir(parents=True, exist_ok=True)
        scenario_gdf.to_file(scenario_dir / f"{scenario_name}_pieces.gpkg", driver="GPKG")
        scenario_gdf.drop(columns="geometry").to_csv(scenario_dir / f"{scenario_name}_pieces.csv", index=False)

        print(scenario_gdf[["scenario_piece_uid", "parent_patch_id", "coarse_cell_id", "piece_type", "is_protected_piece", "area_m2", "mean_vessel_density", "relative_vessel_density"]])

        print("Preparing SD trajectories and masks...")
        piece_data = prepare_piece_data_for_scenario(model, scenario_gdf, scenario_config, seagrass_grid)

        effective_jobs = os.cpu_count() if N_JOBS == -1 else N_JOBS
        print(f"Running Monte Carlo for {scenario_name}: {N_MONTE_CARLO} runs, n_jobs={effective_jobs}")
        mean_maps, std_maps = monte_carlo_for_scenario(piece_data, N_MONTE_CARLO, RANDOM_SEED, N_JOBS)

        print("Running tourism maps...")
        tourism_fraction_series, tourism_maps = run_tourism_simulation(model, scenario_config, tourism_prob)

        save_scenario_rasters(scenario_name, mean_maps, std_maps, seagrass_grid)
        indices = range(len(PLOT_YEARS)) if SAVE_ALL_YEAR_RASTERS else [len(PLOT_YEARS) - 1]
        for t_idx in indices:
            year = PLOT_YEARS[t_idx]
            save_tourism_geotiff(OUTPUT_DIR / scenario_name / f"{scenario_name}_tourism_binary_{year}.tif", tourism_maps[t_idx], tourism_transform)
        save_tourism_geotiff(OUTPUT_DIR / scenario_name / f"{scenario_name}_tourism_mask.tif", tourism_land_mask, tourism_transform)

        plot_scenario_tourism_seagrass(
            scenario_name=scenario_name,
            scenario_title=scenario_config["title"],
            tourism_maps=tourism_maps,
            tourism_fraction_series=tourism_fraction_series,
            tourism_extent=tourism_extent,
            tourism_land_mask=tourism_land_mask,
            hotspots_gdf=hotspots_gdf,
            mean_maps=mean_maps,
            land_gdf=land_gdf,
            grid=seagrass_grid,
        )

        scenario_summaries.append({
            "scenario": scenario_name,
            "title": scenario_config["title"],
            "n_pieces": len(scenario_gdf),
            "n_monte_carlo": N_MONTE_CARLO,
            "mean_presence_2050_sum_cells": float(mean_maps[-1].sum()),
            "std_presence_2050_mean": float(std_maps[-1].mean()),
            "tourism_fraction_2050": float(tourism_fraction_series[-1]),
        })

    summary_df = pd.DataFrame(scenario_summaries)
    summary_df.to_csv(OUTPUT_DIR / "scenario_summary.csv", index=False)
    print(summary_df)
    print(f"Done. Outputs saved in: {OUTPUT_DIR}")


if __name__ == "__main__":
    main()
