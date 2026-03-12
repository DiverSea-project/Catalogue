# Turkish Waters (Çanakkale Onsekiz Mart University - DEU) Case Study Metadata

## Overview
This folder contains the metadata documentation for datasets collected in the Turkish Waters case study within the DiverSea project. The case study is coordinated by Çanakkale Onsekiz Mart University (DEU) and focuses on a multi-disciplinary assessment of marine ecosystems in critical transition zones between the Sea of Marmara, the Çanakkale Strait (Dardanelles), and the Aegean Sea.

The datasets integrate physical oceanography, biogeochemistry, plankton ecology, environmental DNA (eDNA), and seagrass meadow assessments to provide a comprehensive picture of ecosystem structure and function.

## Study Area

The data were collected from three key locations representing different ecological and hydrological regimes:
- Sea of Marmara (Pasalimani) – A semi-enclosed basin with brackish water influence.
- Çanakkale Strait (Dardanelles) – A dynamic connective channel regulating water exchange between the Marmara and Aegean Seas.
- Aegean Sea (Foça) – A fully marine, open coastal environment.

These sites capture a gradient of salinity, stratification, and anthropogenic influence, making them ideal for comparative ecological studies.

## Data Types

The Turkish Waters case study includes a diverse range of datasets:
- Physical Oceanography: Underwater CTD (Conductivity, Temperature, Density) profiles collected using a CastAway sensor.
- Water Column Biogeochemistry: Chemical and nutrient parameters from water samples.
- Phytoplankton Data: Species lists, abundance, and images from preserved water samples.
- Environmental DNA (eDNA): Molecular data from DNA extracted from seawater, sediment, and plant tissue samples (stored as FASTQ files).
- Seagrass (Posidonia) Meadow Data:  
  ◦ Photogrammetry: Orthomosaics of visible seagrass meadows.  
  ◦ In-situ Measurements: Shoot density, lower limit depth, and meadow type from visual census by diving.  
  ◦ Laboratory Measurements: Epiphyte biomass, phenological measurements, and annual productivity.

## Data Collection Methods

Data were collected using a comprehensive suite of methods during a campaign in March 2025:
- CTD Profiling: CastAway sensor deployed to measure physical water column properties (ICES, HELCOM standards).
- Water Sampling: Collection of water samples for biogeochemical analysis and phytoplankton identification.
- Molecular Analysis: DNA extraction and sequencing from environmental samples (water, sediment, plant tissue).
- Diver-Based Surveys: Visual census and underwater measurements of seagrass meadows following RAC/SPA - UNEP/MAP monitoring protocols (2014).
- Photogrammetry: Drone or underwater imaging to create orthomosaics for seagrass mapping.
- Laboratory Analysis: Processing of seagrass samples for epiphyte biomass, phenology, and productivity.

## Data Formats

The datasets are stored in a variety of formats reflecting their diverse nature:
- CSV files (CTD sensor data, numerical measurements)
- XML files (biogeochemistry, phytoplankton data, seagrass measurements)
- Image files (phytoplankton micrographs)
- FASTQ files (raw eDNA sequencing data)
- GEOTIFF files (orthomosaics from photogrammetry)

File sizes range from small numerical files (KB-MB) to large image and sequencing datasets (up to 120 GB total for phytoplankton images).

## Potential Analyses

The datasets support a wide range of integrated analyses:
- Correlation analysis between physical (CTD), chemical (biogeochemistry), and biological (phytoplankton, eDNA) parameters to understand ecosystem drivers.
- Seagrass habitat mapping and health assessment using photogrammetry and in-situ measurements.
- Comparative analysis of seagrass meadow characteristics (density, productivity, epiphyte load) across different sites and with other DiverSea case studies.
- Biodiversity assessment combining traditional microscopy (phytoplankton) with molecular (eDNA) methods.
- Ecosystem status assessment in a critical transitional water corridor.

## Access and Sharing
All datasets are currently project-limited and restricted to research purposes only. Data sharing is currently private, pending publication of related scientific articles or project completion. Access will be reviewed for future public release.

## Database Statistics Summary

| Table Name                         | Row Count | Column Count | Key Content                                                      |
|:---------------------------------:|:---------:|:------------:|:----------------------------------------------------------------:|
| phytoplankton                       | 4,713     | 11           | Phytoplankton species abundance, biomass, and cell volume        |
| posidonia_phenology                 | 560       | 13           | Seagrass shoot-level phenological measurements                  |
| posidonia_undamaged_scales_lengths  | 323       | 3            | Historical growth records from seagrass scales                  |
| posidonia_lepido                     | 267       | 8            | Lepidochronological analysis of seagrass rhizomes               |
| images_phytoplankton                 | 260       | 4            | Microscope images of phytoplankton species                      |
| posidonia_biomass                    | 90        | 14           | Epiphyte and leaf biomass measurements                           |
| posidonia_field                      | 45        | 7            | In-situ seagrass coverage and density measurements               |
| seawater_measurements                | 22        | 18           | Biogeochemical parameters from water samples                     |
| seawater_samples                     | 22        | 11           | Metadata for seawater collection events                          |
| posidonia_species_coverage           | 15        | 3            | Associated species coverage within seagrass meadows              |
| sediment_measurements_2              | 10        | 6            | Total Nitrogen, Total Organic Carbon, Total Carbon in sediments  |
| posidonia_analysis                   | 5         | 3            | Parent table linking seagrass analyses                           |
| posidonia_samples                    | 5         | 19           | Comprehensive seagrass sampling site metadata                    |
| dataset                              | 4         | 10           | High-level dataset descriptions                                  |
| organization                         | 1         | 3            | Partner organization information                                 |
