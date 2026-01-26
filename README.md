# Data Warehouse Project
---

## Project Objective
* The objective of this project is to design and implement a data warehouse that integrates sales data from Customer Relationship Management (CRM) and Enterprise Resource Planning (ERP) source systems into a centralized, analytics ready environment. 
* It focuses on data ingestion, cleansing, standardization, and data modeling using the Medallion Architecture.
* Establishes data quality checks and verification ensuring the data is accurate, reliable, and well organized for reporting and analysis.
* As a result, the data warehouse ensures that the organization’s data is consistent, high-quality, and ready for business intelligence applications.

## Project Scope

This project covers the following:

* **Data Architecture Design:** Implement a modern data warehouse with Bronze, Silver, and Gold layers.
* **ETL Pipelines:** Extract, transform, and load data from multiple source systems.
* **Data Modeling:** Build **fact and dimension tables** optimized for analysis and reporting.
  
**Key Specifications:**

* **Sources:** ERP and CRM CSV files.
* **Data Quality:** Cleanse, validate, and resolve data issues.
* **Integration:** Merge both sources into a unified, analysis-ready data model.
* **Scope:** The project focuses on loading and processing the latest available data.
* **Documentation:** Include clear documentation for stakeholders and analytics teams in the data catalog.

## Data Architecture

The project implements the **Medallion Architecture** with **Bronze, Silver, and Gold layers**:

* **Bronze Layer:** Raw, unprocessed data ingested directly from source systems. For this project, CSV files are loaded into **SQL Server**.
* **Silver Layer:** Cleansed and standardized data; includes normalization, formatting, and validation to prepare data for analysis.
* **Gold Layer:** Business-ready data structured into a **star schema**, optimized for reporting, dashboards, and analytical queries.

     <img width="721" height="369" alt="Untitled Diagram drawio" src="https://github.com/user-attachments/assets/1885b4eb-9f56-4a3b-99bf-c63bb97b9ccc" />
     
  *Figure 1: Shows the Medallion Architecture, highlighting the Bronze, Silver, and Gold data layers.*

---
## Data Flow
*  Raw data is ingested from source systems into the Bronze layer in batch mode and stored without modification to preserve the original records.
*  The data is then processed in the Silver layer, where cleansing, standardization, validation, and enrichment transformations are applied to improve data quality and consistency.
*  Finally, the refined data is loaded into the Gold layer, where it is modeled into business-ready fact and dimension tables optimized for analytical queries and reporting

<img width="545" height="337" alt="Data Flow Diagram drawio" src="https://github.com/user-attachments/assets/9b3b7d43-b3e1-49c2-a0be-4a6fda7f0336" />

*Figure 2: shows the flow of data from raw ingestion in the Bronze layer to analytics-ready tables in the Gold layer.*
## Data Quality Checks and Validation
* The project includes scripts to perform data quality checks and verification across the Bronze and Silver layers.
* These scripts validate completeness, consistency, and accuracy of the ingested data, ensuring that only high quality data is loaded into the Gold layer for modeling and reporting.

## Data Model
* The data model in this project is designed using a star schema.
*  The Gold layer consists of a central fact table that captures transactional sales data, surrounded by dimension tables that provide descriptive context such as customer and product information.
*  This modeling approach simplifies complex queries, improves query performance, and ensures consistency in business metrics..

<img width="596" height="375" alt="Data_Model(Star_schema) drawio" src="https://github.com/user-attachments/assets/d6f62491-792b-4018-b1d3-7c67a885d840" />

####### *Figure 3: Star schema of the Gold layer showing fact and dimension tables.*
---

##  Tools & Resources

All tools used in this project :

* **Project Dataset:** CSV files from ERP and CRM source systems.
* **SQL Server Express:** Lightweight relational database server.
* **SQL Server Management Studio (SSMS):** GUI for database management and query execution.
* **GitHub Repository:** Track changes and ensuring that all project files, scripts, and documentation are securely stored and easily accessible.
* **Draw.io :** Design data flows, architecture diagrams, and models.
* **Trello:** Planning and progress tracking tool.
---
## Implemented Skills 

* SQL Development & Optimization
* Data Architecture & Warehouse Design
* ETL Pipeline Creation
* Data Modeling & Star Schema Design
* Business Analytics & Reporting
---
## How to Use this Project
This project is organized to allow users to easily explore the data warehouse design, scripts, and documentation.
* Clone the Repository.
* Set Up the Database; Install SQL Server Express and SQL Server Management Studio (SSMS). Create the database and schemas as provided SQL scripts.
* Load Source Data (Bronze Layer); Execute the ingestion scripts to load the ERP and CRM CSV files into the Bronze layer tables.
* Run Transformation Scripts (Silver Layer); Execute the Silver layer scripts to perform data cleansing, standardization, validation, and enrichment.
* Build Analytics Tables (Gold Layer);Run the Gold layer scripts to generate fact and dimension tables modeled using a star schema.
* Review Data Quality Checks;Use the provided data quality and validation scripts to verify data completeness, accuracy, and consistency across layers.
* Explore Documentation and Diagrams provided int duagrams folder to review the architecture, data flow, data model and overall system design.
### Contact Info:
For more information, please contact me through : samkemboi201@gmail.com or <br>
[![Email](https://img.shields.io/badge/Email-red?style=for-the-badge&logo=gmail&logoColor=white)](sam12@gmail.com)
[![GitHub](https://img.shields.io/badge/GitHub-black?style=for-the-badge&logo=github)](https://github.com/samkemboi12/samkemboi12)
[![Twitter](https://img.shields.io/badge/Twitter-black?style=for-the-badge&logo=twitter)](https://x.com/SamEssays)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/samwel-kipkemboi-32a8732a6/)
[![Medium](https://img.shields.io/badge/Medium-black?style=for-the-badge&logo=medium)](https://medium.com/@yourhandle)

