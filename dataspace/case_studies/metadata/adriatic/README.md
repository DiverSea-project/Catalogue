# Adriatic Case Study Metadata

## Overview

This folder contains the metadata documentation for datasets collected in the Adriatic Sea case study within the DiverSea project. The case study is coordinated by Università Politecnica delle Marche (UNIVPM) and focuses on monitoring biodiversity and environmental conditions along the Italian Adriatic coast.

The datasets combine remote sensing, field surveys, environmental sampling and molecular analyses to study coastal ecosystems and their response to environmental pressures.

---

## Study Area

The data were collected along the Adriatic coast of Italy, including:
- Marche region (Gabicce Mare, Conero Riviera, Falconara Marittima)
- Apulia region (Torre Guaceto Marine Protected Area)

These sites represent different environmental conditions and levels of anthropogenic impact, including protected and impacted coastal areas.

---

## Data Types

The Adriatic case study includes several types of datasets:
- Drone imagery – UAV surveys used to map seagrass meadows and macroalgal forests.
- Photoquadrat images – Underwater photographic surveys used to analyze macrobenthic community composition and coverage.
- Environmental DNA (eDNA) data – Molecular data for prokaryotes and eukaryotes collected from sediment and seawater samples.
- Benthic biodiversity data – Meiofauna and macrofauna abundance, biomass and diversity.
- Environmental parameters – Abiotic measurements such as temperature, salinity, pH, sediment granulometry, chlorophyll-a and organic matter composition.

---

## Data Collection Methods

Data were collected using a combination of remote sensing and field sampling methods, including:
- UAV drone surveys
- Underwater photoquadrat imaging
- Sediment coring
- Seawater sampling
- Scraping of standardized rock surfaces
- Laboratory molecular analysis of environmental DNA

Sampling campaigns were conducted between 2018 and 2025, with both historical and newly collected datasets.

---

## Data Formats

The datasets are stored in several formats, including:
- JPEG images (drone imagery and photoquadrats)
- CSV files (environmental and biodiversity measurements)
- Phyloseq files (eDNA sequence data)
- Text metadata files describing dataset structure and acquisition parameters

Individual datasets range from small analytical files (<10 MB) to large image collections (several GB).

---

## Potential Analyses

The datasets support a range of ecological and environmental analyses, such as:
- Mapping the distribution of seagrass and macroalgal habitats
- Assessing biodiversity and ecosystem status under the Marine Strategy Framework Directive (MSFD)
- Investigating relationships between biodiversity and environmental conditions
- Comparing sites with different levels of anthropogenic pressure or protection

---

## Access and Sharing

Currently, datasets are project-restricted and stored in local project repositories.
Data will become publicly available upon publication of the related scientific articles or datasets.

---

## Database Statistics Summary

| Table Name                     | Row Count | Column Count | Key Content                                   |
|:-------------------------------:|:---------:|:------------:|:--------------------------------------------:|
| microbiome_composition_results  | 30,325    | 4            | Species abundance counts per sample           |
| microbiome_taxonomy_species     | 16,107    | 12           | Taxonomic classification of microbial species|
| benthic_coverage                | 37        | 6            | Photoquadrat-based coverage estimates         |
| microbiome_composition_samples  | 36        | 4            | Sample metadata for microbiome analyses      |
| sediment_measurements           | 15        | 13           | Physical sediment properties                  |
| macrobenthos_general_data       | 15        | 11           | Macrofauna biodiversity indices               |
| dataset                         | 2         | 10           | High-level dataset descriptions               |
| data_gathering_types            | 1         | 2            | Lookup table for data collection methods     |
