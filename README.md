# DiverSea Catalogue

## Overview

This repository contains the public catalogue of the DiverSea project, providing structured metadata, data models and  semantic artefacts for datasets generated and collected within the project.

**DiverSea** (Integrated Observation, Mapping, Monitoring and Prediction for Functional Biodiversity of Coastal Seas) is a Horizon Europe research project coordinated by the Norwegian University of Science and Technology. The project aims to advance marine biodiversity monitoring through the integration of molecular techniques, environmental observations and  data-driven analytical approaches.

The catalogue serves as a **central access point to the technical artefacts of the DiverSea Data Space**, supporting transparency, reproducibility and  interoperability in accordance with FAIR principles.

---

## Purpose of the Catalogue

The DiverSea catalogue provides a structured and accessible overview of the data and data infrastructure developed within the project. Its main objectives are to:

* Document datasets produced in the project case studies
* Provide standardized metadata descriptions
* Describe the unified data model and database structure
* Publish the ontology for semantic data integration
* Support data discovery and reuse by researchers and stakeholders

---

## Repository Structure

### Data Analytics

<!-- This section contains analytical components, workflows and  methodologies developed for processing and analysing the DiverSea datasets.

It supports:

* Statistical analysis
* Machine learning and predictive modelling
* Data-driven insights for marine biodiversity monitoring -->

---

### Dataspace

This is the **core component of the repository**, representing the DiverSea Data Space.

It integrates datasets, models and  services into a unified data infrastructure.

#### Case Studies

Contains descriptive metadata for datasets produced in the DiverSea case studies, including:

* Adriatic Sea
* Atlantic Coast
* Balearic Islands
* Black Sea
* Hellenic Volcanic Arc
* Norwegian/Swedish Coast
* Turkish Waters

Each dataset entry includes:

* **Origin** – Geographic source (region, coordinates)
* **Source** – Data provider (partner, institution, NGO, etc.)
* **Timeline** – Temporal coverage
* **Content** – Thematic focus (e.g. biodiversity, sediments, marine mammals)
* **Type** – Data type (sensor, imagery, statistical, etc.)
* **Related Data** – Links to other datasets
* **Potential Analysis** – Possible analytical use cases
* **Meta-data Format** – Description format (SQL, JSON, ontology, etc.)
* **Standards** – Applicable standards and guidelines
* **Data Format** – Technical formats (CSV, images, binary, etc.)
* **Data Location** – Storage/access method
* **Mode of Transfer** – Data ingestion mechanism
* **Access** – Permission level
* **Sharing** – Data sharing conditions

This section enables understanding of the **structure, origin and  usability of datasets without direct access to raw data**.

---

#### Data Model

The data model defines the **unified relational schema** used to structure and store DiverSea datasets.

It includes:

* Entity-relationship models
* Table structures and attributes
* Data group organisation (biotic, abiotic, datasets, files, etc.)
* Visual diagrams of the database

---

#### Data Services

<!-- This section describes the services developed to access, explore and  process data within the DiverSea Data Space.

These include:

* **Raw Data Archiving** – Access to original datasets
* **Data Source Mapping** – Geospatial visualization of datasets
* **Structured Data Browsing** – Exploration of curated datasets
* **Unstructured Data Exploration** – Interaction with non-tabular data
* **Semantic Data Search** – Ontology-based discovery of relevant datasets

These services enable **multi-level interaction with the data**, from raw access to semantic querying. -->

---

#### Database

The database includes the SQL script for creating the unified data model of the case studies. It ensures **consistent data storage and integration**.

---

### Documents

<!-- This section contains project-related documentation supporting the data space, including:

* Deliverables
* Technical reports
* Methodological descriptions
* Supporting materials for data collection and processing -->

---

### Ecological Services

<!-- This section focuses on ecosystem-related outputs and models derived from the data.

It may include:

* Ecosystem services assessments
* Environmental indicators
* Biodiversity evaluation metrics
* Domain-specific analytical outputs -->

---

### Knowledge Base

This section contains the **ontology of the DiverSea Data Space**, implemented in RDF/OWL format.

It provides:

* A semantic model of the data and domain concepts
* Relationships between datasets, ecosystems and  analytical processes
* Support for semantic interoperability and reasoning

The knowledge base acts as the **semantic layer** complementing the relational data model.

---

### Publications

<!-- This section includes scientific outputs generated within the project, such as:

* Research papers
* Conference proceedings
* Reports and articles

It reflects the dissemination and scientific contribution of DiverSea. -->

---

### Software

<!-- This section contains software tools and components developed to support:

* Data processing
* Data integration
* Analytical workflows
* Data services and interfaces -->

---

### Stakeholders

<!-- This section provides information about stakeholders involved in or targeted by the project, including:

* Research institutions
* Public authorities
* NGOs
* Industry partners

It supports engagement, dissemination and  collaboration activities. -->

---

### System Analysis

The System Analysis section contains the MARBIOSE Dashboard, which integrates system-dynamics modelling with spatial data and scenario analysis to investigate marine biodiversity, ecosystem pressures and ecosystem services.

The MARBIOSE Dashboard provides a spatial representation of modelled ecosystem responses and allows users to explore how different environmental and management scenarios may affect the spatial distribution of ecosystem conditions.

The system analysis includes:

* **System-Dynamics Modelling** – A system-dynamics model implemented in Vensim and converted to Python using PySD. The current implementation focuses on the interactions between tourism, marine pressures and seagrass ecosystems in the Hellenic Volcanic Arc/Santorini case study.
* **Spatial Data Integration** – Integration of seagrass distribution, marine traffic density, tourism hotspots and protected-area data to spatially distribute the outputs of the system-dynamics model.
* **Spatial Scenario Analysis** – Generation of spatial scenarios by combining the system-dynamics model with spatially differentiated environmental pressures and management conditions.
* **Seagrass Spatial Modelling** – Spatialization of modelled seagrass dynamics using 5 × 5 km spatial units, followed by rasterization and stochastic spatial erosion. Multiple Monte Carlo simulations are used to estimate mean seagrass presence probabilities.
* **Tourism Pressure Mapping** – Generation of spatial tourism-pressure maps based on tourism hotspots and their distance from surrounding areas, using an exponential distance-decay function.
* **Management Scenarios** – Implementation of scenarios including a baseline scenario, marine-traffic restrictions within protected areas, additional marine-pollution assumptions, and scenarios where tourism sensitivity is linked to seagrass decline.
* **Spatial Outputs** – Generation of spatial outputs for visualization in the MARBIOSE Dashboard, including raster-based seagrass probability maps and spatial pressure layers.

The MARBIOSE Dashboard provides the interface for exploring these spatial scenarios and their results.

---

## Role in DiverSea Data Space

The catalogue serves as the **public interface of the DiverSea Data Space**, providing access to its key artefacts:

* Metadata of datasets
* Unified data model
* Ontology (knowledge base)
* Supporting documentation and services

<!-- It enables:

* Transparency and reproducibility
* Cross-domain data integration
* Interoperability with external platforms (e.g. EMODnet, Copernicus)
* Support for advanced data analysis and research -->
