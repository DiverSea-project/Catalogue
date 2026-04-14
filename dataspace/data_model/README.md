# Data Model

## Overview

This folder contains the unified data model of the DiverSea Data Space, including the SQL schema, documentation, and visual representations of the database structure.

The data model is designed to support the **storage, harmonisation, and structured representation of heterogeneous datasets** collected across all project case studies (Adriatic, Atlantic Coast, Balearic Islands, Black Sea, Turkish Waters, Norwegian Coast, and Hellenic Volcanic Arc).

It represents the **physical layer of the DiverSea Data Space**, complementing the semantic layer defined in the knowledge base (ontology), and enabling efficient data storage, querying, and integration.

The model is implemented as a **relational database schema (PostgreSQL)** and can be deployed using the provided SQL scripts.

---

## Design Principles

The data model is developed based on:

* Metadata collected from all case studies
* Iterative refinement using real data samples
* The need to support diverse data types (structured, semi-structured, binary)
* Compatibility with analytical workflows in WP3 and WP4

It follows a **modular and extensible architecture**, allowing integration of new datasets and adaptation to evolving analytical requirements.

---

## Structure of the Data Model

The schema is organised into several thematic groups, each representing a specific aspect of the data space:

### Group Dataset

The **core administrative layer** of the data model.

It defines:

* Datasets and their metadata
* Data ownership and contributing organisations
* Dataset categorisation and classification

This group acts as the **entry point**, linking all records to their:

* Origin (case study)
* Spatial and temporal context
* Data collection methodology

![data model](figures/data_model_group_dataset.png "Group dataset")

---

### Group Biotic

This group captures **biodiversity and biological observations** across multiple levels of granularity.

It includes:

* **Macro-organisms**: fish, macrobenthos, meiofauna, macrofauna
* **Molecular data**: eDNA-based results (bacteria, eukaryotes, microbiome composition)
* **Primary producers**: phytoplankton, zooplankton
* **Habitat-specific monitoring**: detailed Posidonia seagrass data (biomass, phenology, coverage)
* **Ecological indicators**: biodiversity indices and pollution metrics

This structure enables both **raw data storage and derived ecological indicators**.

![data model](figures/data_model_group_biotic.png "Group biotic")

---

### Group Abiotic

This group represents **environmental and physical parameters** describing the marine ecosystem.

It includes:

* **Water column measurements**: CTD data (temperature, salinity, depth), chemical properties, nutrients
* **Seawater samples**: laboratory analysis results
* **Seabed data**: sediment composition, granulometry, contamination
* **Dynamic observations**: time-series data (e.g. temperature logs), marine litter, habitat surveys

These datasets provide the **environmental context** required for interpreting biodiversity patterns.

![data model](figures/data_model_group_abiotic.png "Group abiotic")

---

### Group Files

This group manages **unstructured and high-volume data assets** stored outside the relational database.

It includes metadata and references for:

* **Acoustic data**: hydrophone recordings
* **Remote sensing data**: LiDAR, sonar, bathymetric and spatial datasets
* **Visual media**: aerial, underwater and ground images, videos
* **Specialised scientific outputs**: phytoplankton imagery and survey media

The actual files are stored externally (e.g. file systems), while the database maintains **structured metadata and access references**.

![data model](figures/data_model_group_files.png "Group files")

---

### Group Reference

This group ensures **data consistency, standardisation, and integrity** across all datasets.

It includes:

* **Sampling methodologies and equipment**: devices, protocols, substrate types
* **Survey classifications**: encounter types, vessel types, mission categories
* **Taxonomic references**: standardised species lists

This layer acts as a **controlled vocabulary and lookup system**, reducing ambiguity and ensuring harmonised data entry across case studies.

![data model](figures/data_model_group_reference.png "Group reference")

---

### Group Standards

This group supports **alignment with international and project-specific standards**.

It includes:

* Definitions of standards, frameworks, and quality requirements
* Mapping between datasets and applicable standards

This enables:

* **Interoperability with external systems**
* **Compliance with FAIR principles**
* Preparation for integration with platforms such as EMODnet and Copernicus

![data model](figures/data_model_group_standards.png "Group standards")

---

## Full Data Model

A complete overview of the schema is provided in the full entity-relationship diagram:

![data model](figures/data_model_full.jpg "Data model")

Additional documentation, including detailed descriptions and diagrams of each group, is available in:

* `data_model.pdf`

---

## Usage

The database schema can be deployed by executing the provided SQL script:

* `biodiversity.sql`

This will create a relational database capable of storing:

* Structured datasets from all case studies
* References to unstructured data (files, media, sensor outputs)
* Standardised metadata for interoperability and analysis

---

## Role in DiverSea Data Space

Within the overall architecture:

* The data model provides the **physical storage layer** of the data space
* It is derived from case study metadata and real datasets
* It supports **data integration, harmonisation, and querying**
* It serves as input for:

  * Semantic modelling (ontology / knowledge base)
  * Analytical workflows (AI/ML, statistical modelling, system dynamics)

Together with the ontology, it forms the **core infrastructure of the DiverSea Data Space**.

---

## Notes

* The data model is expected to evolve as new datasets and analytical requirements emerge
* Future versions may include transformations and extensions driven by WP3 and WP4 analytical needs
* The schema is designed to be reusable and deployable across different environments and case studies
