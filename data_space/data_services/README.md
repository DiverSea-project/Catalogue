# Data Services

This folder contains the documents describing the six data services of the project:

- Context Exploration
- Data Source Gelolocation
- DiverSea Catalogue
- Raw Dataset archive
- Semantic data search
- Structured Data Repository

---

## Context Exploration

An AI-powered natural language chat service enabling conversational exploration of DiverSea repositories, environments, data sources, geolocations, and related project activities. 

* **Key Features**: 
  * Supports multilingual spoken and written text interaction for map navigation and query formulation.
  * Provides spatial navigation and coordinate tracking using Cesium.
  * Utilizes advanced LLM technologies (Qwen3-32B via vLLM and Qdrant) for keyword-driven query analysis and contextual information retrieval.
* **Access & Support**: Available online at [https://chatbot-diversea.gate-ai.eu](https://chatbot-diversea.gate-ai.eu). For technical issues, contact the service administrator at boris.kraychev@gate-ai.eu.

---

## Data Source Gelolocation

A live, real-time mapping service that geolocates all available DiverSea case study data sources on a world map.

* **Key Features**: 
  * Allows interactive 3D spatial navigation and coordinate tracking using Terria, Cesium, and JavaScript.
  * Integrates with GeoServer, PostgreSQL, and PostGIS to execute SQL queries and fetch dataset metadata.
  * Displays dataset information, institution details, and statistics in interactive pop-up windows.
* **Access & Support**: Available online at [https://datamap-diversea.gate-ai.eu/](https://datamap-diversea.gate-ai.eu/) with no credentials required. For inquiries, contact the service administrator at viktor.sowinski@gate-ai.eu.

---

## DiverSea Catalogue

## DiverSea Catalogue

The central entry point into the DiverSea Data Space hosted on GitHub, providing a public view of all project resources and data space components.

* **Key Features**: 
  * Acts as an overarching hub offering multiple perspectives on project data, including archiving, geolocating, browsing, searching, and contextual exploration.
  * Organizes core project areas such as data analytics, data space architecture, documents, ecological services, software, and stakeholders.
* **Access & Support**: Publicly accessible via web browser at [https://github.com/DiverSea-project/Catalogue](https://github.com/DiverSea-project/Catalogue) with no registration or credentials required. For administrative inquiries, contact the DiverSea Data Space administrator at stoyan.nikolov@gate-ai.eu.

---

## Raw Dataset archive

## Raw Dataset archive

A virtual Internet file system hosted on a dedicated GATE Institute server that stores the original, unmodifiable raw data files for all DiverSea case studies.

* **Key Features**: 
  * Organizes raw datasets by specific project case studies, including the Black Sea, Turkish Waters, Hellenic Islands, Adriatics, Balearics, Atlantic Coast, and Norwegian Coast.
  * Allows secure browsing and direct downloading of original dataset files without modification to preserve data integrity.
  * Future integration will allow datasets to be downloaded via European environmental and biodiversity repositories like Copernicus and EmoNet.
* **Access & Support**: Accessible online at [https://datafiles-diversea.gate-ai.eu/](https://datafiles-diversea.gate-ai.eu/). Due to security restrictions, access credentials are restricted to work package leaders who can grant them to team members. For external data approvals or inquiries, contact stoyan.nikolov@gate-ai.eu.

---

## Semantic data search

## Semantic data search

A web service that enables intelligent data discovery across the data space based on the project's ontology and analytical use cases.

* **Key Features**: 
  * Powered by GraphDB hosting the project's ontology to search across both the structured data repository and raw dataset file repository.
  * Translates interactive user queries made through standard web browsers into SPARQL queries automatically using Python.
  * Displays structured results including table columns, primary/foreign keys, measurements, locations, and time details.
* **Access & Support**: Available online at [https://datasearch-diversea.gate-ai.eu](https://datasearch-diversea.gate-ai.eu). Supports free search for public data or advanced search/download for registered users. For profile role allocations, contact nikolay.shivarov@gate-ai.eu.

---

## Structured Data Repository

## Structured Data Repository

A browsing and management service that allows users to explore project data in a structured, curated format that meets all project quality, structuring, and formatting standards.

* **Key Features**: 
  * Provides detailed tabular data views for case studies, such as the Posidonia dataset from the Eastern Mediterranean coast.
  * Allows authorized personnel to inspect underlying database schemas and tables.
  * Enables the export of structured data for local onsite use in simulations, data analysis, and predictions.
  * Future integration will allow public access and downloading via Copernicus and EMODnet services.
* **Access & Support**: Accessible online via [https://datasets-diversea.gate-ai.eu/](https://datasets-diversea.gate-ai.eu/). Due to security restrictions, access credentials are currently limited to pre-set users assigned via work package leaders or authorized through the data space administrator at stoyan.nikolov@gate-ai.eu.

---
