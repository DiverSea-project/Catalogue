# Hellenic Volcanic Arc Case Study Metadata

## Overview
This folder contains the metadata documentation for datasets collected in the Hellenic Volcanic Arc case study within the DiverSea project. The case study is coordinated by the National and Kapodistrian University of Athens (NKUA) and focuses on investigating biodiversity patterns and the impacts of tourism along a unique geological and environmental gradient.

The datasets combine original field samples, molecular analyses and publicly available socio-economic and environmental timeseries to study the relationship between ecosystem health and human activities.

## Study Area

The data were collected from multiple sites along the Hellenic Volcanic Arc, a geologically active region in the Aegean Sea. The specific islands and locations include:
- Methana
- Milos
- Santorini
- Nisyros
- Kos

These sites provide a natural laboratory to study biodiversity under varying volcanic influence and levels of touristic development. Additionally, Santorini serves as a focal point for integrating socio-economic data.

## Data Types

The Hellenic Islands case study includes several distinct types of datasets:
- Phytoplankton and Protozooplankton Census Data: Species lists, abundance (cells mL⁻¹) and biomass (mg L⁻¹) from seawater samples collected along the volcanic arc.
- Environmental DNA (eDNA) Data: Microbial community data (16s and 18s ASVs) derived from seawater and sediment samples, providing taxonomic profiles for prokaryotes and microbial eukaryotes. This data is stored in Phyloseq objects.
- Sample Metadata: Tables containing environmental parameters and sample information (coding, coordinates, site description) for all sampling sites.
- Socio-economic and Environmental Timeseries: Publicly sourced data for Santorini (2000-2024) on tourism, waste production, maritime traffic, construction and environmental conditions (phytoplankton concentration, physical-chemical water parameters, seagrass health).

## Data Collection Methods

Data were collected or compiled using a combination of methods:
- Field Sampling: Single sampling events per site (2024-2025) using Niskin bottles for water collection and sediment coring, following international scientific standards.
- Microscopic Analysis: Identification and enumeration of phytoplankton and protozooplankton communities.
- Molecular Analysis: eDNA extraction, sequencing and bioinformatic processing to generate microbial community data, with raw data deposited in NCBI's Sequence Read Archive (SRA).
- Public Data Compilation: Downloading and processing timeseries data from public repositories such as Copernicus, EMODnet, INSETE, the Hellenic Statistical Authority and the Greek Electronic Waste Registry.

## Data Formats

The datasets are stored in a variety of formats:
- CSV files (phytoplankton census data, socio-economic timeseries, sample information tables)
- RDS files (Phyloseq objects containing eDNA data)
- Raw sequence data files are stored in the NCBI SRA public repository.

## Potential Analyses

The datasets support a range of integrated ecological and socio-environmental analyses, such as:
- Biodiversity pattern analysis along the volcanic arc, comparing sites with different geological characteristics.
- Structural component analysis to assess the impact of tourism-related pressures (e.g., waste, construction, traffic) on marine biodiversity patterns, specifically in Santorini.
- Correlation between microscopic and molecular (eDNA) assessments of plankton communities.
- Long-term trend analysis of environmental quality and ecosystem health in relation to human activities.

## Access and Sharing

Access and sharing conditions vary by dataset type:
- Phytoplankton Census Data: Project-limited and currently private.
- eDNA Data (Phyloseq objects): Publicly accessible for non-commercial use. Raw data files are deposited in the public NCBI SRA repository.
- Socio-economic and Environmental Timeseries: Sourced from public databases and intended for non-commercial use as part of the MARBIOSE Dashboard (WP4).

## Database Statistics Summary

| Table Name                     | Row Count  | Column Count | Key Content                                                   |
|:-------------------------------:|:---------:|:------------:|:------------------------------------------------------------:|
| macrophytobenthos_frame         | 1,738     | 7            | Biomass and surface index measurements per sampling frame    |
| macrozoobenthos                 | 1,558     | 12           | Species abundance and biomass from sediment samples          |
| macrophytobenthos               | 469       | 25           | Comprehensive macrophyte community measurements and indices |
| zooplankton                     | 702       | 10           | Zooplankton species abundance and biomass                    |
| phytoplankton                   | 388       | 11           | Phytoplankton species abundance, biomass and cell volume    |
| macrophytes_eco_status          | 53        | 7            | Ecological status based on macrophyte indices (SWx)          |
| invasive_alien_species          | 46        | 10           | Records of non-indigenous species in the region             |
| abiotic_measurements            | 25        | 11           | Physical and chemical water parameters                       |
| fish_data                       | 22        | 12           | Fish species counts and weights from surveys                 |
| biological_pollution            | 18        | 9            | Biological pollution indices (ACI, RCI, SBCI)                |
| phytoplankton_eco_status        | 17        | 8            | Ecological status based on phytoplankton metrics             |
| macrozoobenthos_eco_status      | 16        | 7            | Ecological status based on M-AMBI index                      |
| dataset                         | 8         | 10           | High-level dataset descriptions                               |
| sampling_protocols              | 6         | 3            | Standardized methods for sample collection                   |
| ecological_status_class         | 5         | 2            | Lookup table for ecological status categories                |
| substrate_types                 | 2         | 2            | Lookup table for benthic substrate types                     |
| organization                    | 1         | 3            | Partner organization information                               |
| sampling_devices                | 1         | 3            | Equipment used for sample collection                           |
