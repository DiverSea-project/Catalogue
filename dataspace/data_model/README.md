# Data Model

## Overview

This folder contains the SQL scripts and documentation for the DiverSea project's unified database schema. The schema is designed to accommodate all case studies (Adriatic, Atlantic, Balearic Islands, Ukrainian Black Sea, Turkish Waters, Norwegian and Hellenic Islands) under a consistent structure, enabling cross-case study analysis and integration.

The data model follows a modular design and can be separated in the following key thematic groups:

- Group Dataset – The core administrative layer that defines datasets, their categories and the contributing organizations.

- Group Biotic – A comprehensive collection of tables for biological observations, including fish, macrobenthos, plankton, eDNA results and specialized monitoring for Posidonia seagrass.

- Group Abiotic – Technical tables for environmental parameters, including physical oceanography (CTD), seawater chemistry and sediment analysis.

- Group Files – A specialized module for managing external file references such as LiDAR, sonar, hydrophone audio and various imagery types (aerial, underwater and ground surveys).

- Group Reference – The foundational lookup tables for sampling devices, protocols, taxonomic species lists and survey classifications.

- Group Standards – Tables dedicated to maintaining and mapping international and project-specific standards to datasets.

A detailed description of the schema, including entity-relationship diagrams and table group visualizations, is provided in the accompanying PDF documentation. The SQL script (diversea_schema.sql) can be executed to generate the complete database structure across all case studies.

![data model](figures/data_model_full.jpg "Data model")

## Group dataset

This group serves as the entry point for all data in the schema. The central dataset table links every record to a specific location, time range and data gathering type. It is supported by organization and dataset_categories to ensure clear ownership and classification across the multi-partner project.

![data model](figures/data_model_group_dataset.png "Group dataset")

## Group biotic

This group captures biodiversity at multiple scales:

- Macro-organisms: Tables for fish_data, macrobenthos, meiofauna and macrofauna.

- Molecular/Microbial: Dedicated structures for bacteria_edna_results, eukaryotes_edna_results and microbiome_composition_results.

- Plankton & Seagrass: Specific monitoring for phytoplankton, zooplankton and highly detailed tables for posidonia (biomass, phenology and coverage).

- Indices: Tables like biological_pollution and macrofauna_diversity_index store computed ecological metrics.

![data model](figures/data_model_group_biotic.png "Group biotic")

## Group abiotic

This group contains environmental variables through structured measurement tables:

- Water Column: ctd_measurements (basic and chemical) and seawater_samples track parameters like salinity, temperature, nutrients and chlorophyll.

- Seabed: sediment_measurements and sediment_contamination tables record granulometry and chemical pollutants.

- Dynamic Data: Includes water_temperature_logs, marine_litter counts and ground_surveys_habitat.

![data model](figures/data_model_group_abiotic.png "Group abiotic")

## Group files

To handle high-volume raw data, this group stores metadata and file paths for external assets:

- Acoustics: audio_hydrophones metadata.

- Remote Sensing: lidar_files, sonar_files and hypso_data_files.

- Visual Media: Separate tables for images_aerial, images_underwater, images_phytoplankton and video_ground_survey.

![data model](figures/data_model_group_files.png "Group files")

## Group reference

This group maintains data integrity by providing standardized lookup values, ensuring consistency across all researchers and case studies.

- Methodology & Equipment: Centralizes definitions for sampling_devices, sampling_protocols and substrate_types to standardize fieldwork.

- Survey Metadata: Categorizes field effort through survey_encounter_type and survey_tracks_vessel_type for sailing and AUV missions.

- Taxonomy: Provides the foundational species lists to prevent naming discrepancies in biological records.

![data model](figures/data_model_group_reference.png "Group reference")

## Group standards

This specialized module is dedicated to aligning DiverSea data with international and project-specific frameworks.

- Compliance Mapping: The standards table defines the specific frameworks or quality control levels required for the project.

- Dataset Integration: The standards_datasets mapping table links these global standards directly to specific datasets, ensuring that all entries remain compliant and interoperable for external sharing.

![data model](figures/data_model_group_standards.png "Group standards")

