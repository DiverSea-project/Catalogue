# Knowledge Base

This folder contains the semantic representation of the DiverSea Data Space, implemented as an RDF/OWL ontology.

## Overview

The knowledge base represents the **logical model of the DiverSea Data Space**, enabling a shared and formalised understanding of the heterogeneous data collected across all case studies.

The ontology is developed using Semantic Web standards and tools (e.g. Protégé) and is serialized in RDF format. It defines:

* **Concepts (classes)** covering multiple perspectives, including:

  * Project structure (e.g. case studies, tasks, stakeholders)
  * Domain knowledge (e.g. biodiversity, ecosystems, human activities)
  * Data and resources (e.g. datasets, methods, technologies)
* **Object properties** describing relationships between concepts (e.g. dependencies, associations, data flows)
* **Data properties** defining qualitative and quantitative attributes (e.g. identifiers, measurements, descriptors)
* **Taxonomies and groupings** organising concepts into structured hierarchies

The ontology currently includes a large number of concepts, relationships, and attributes, forming a comprehensive representation of the project knowledge.

## Contents

* `biodiversity.rdf` – RDF ontology describing the conceptual model of the DiverSea Data Space, including domain concepts, relationships, and attributes

## Purpose

The knowledge base supports:

* **Logical unification of heterogeneous data** from multiple case studies
* **Semantic interoperability** across different domains (biology, environmental science, data science, etc.)
* **Data integration and harmonisation** within the DiverSea Data Space
* **Support for advanced data analysis**, including AI/ML and system-level modelling
* **Semantic search and reasoning** over datasets and analytical workflows

## Role in DiverSea Data Space

Within the overall architecture of the DiverSea Data Space:

* The ontology acts as a **semantic layer** on top of the unified data model
* It complements the **relational database model** by providing conceptual meaning and relationships
* It supports services such as **semantic data search** and **data discovery**
* It serves as a bridge between:

  * Case study data (WP1)
  * Data integration and modelling (WP2)
  * Data analysis and modelling (WP3 & WP4)

## Ontology Scope

The ontology covers multiple dimensions of the project, including:

* **Ecosystem and biodiversity concepts** (biotic, abiotic, environmental factors)
* **Data structures and datasets** (files, records, attributes)
* **Geographical and spatial context**
* **Institutions, stakeholders, and roles**
* **Analytical tasks and workflows**
* **Resources such as methods, tools, and technologies**

It also models **conceptual dependencies**, such as:

* Data generation and provenance
* Relationships between ecosystems and biodiversity
* Links between datasets and analytical processes

## Usage

The ontology can be used for:

* Exploration and editing in semantic tools such as Protégé
* Integration into RDF triplestores and graph databases
* Querying using SPARQL
* Supporting semantic services (e.g. semantic search, knowledge discovery)

## Notes

* The ontology is continuously evolving as the project progresses and new data and requirements emerge
* It is designed to be extensible and alignable with external standards and ontologies
* In later stages, it is expected to support integration with European data platforms such as EMODnet and Copernicus
