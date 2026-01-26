# Data Warehouse Project
---
## Project Objective
The objective of this project is to design and implement a data warehouse that consolidates sales data from multiple source systems into a centralized, analytics-ready environment. The project focuses on data ingestion, cleansing, standardization, and data modeling using the Medallion Architecture (Bronze, Silver, and Gold), ensuring the data is accurate, reliable, and well organized for reporting and analysis. As a result, the data warehouse ensures that the organization’s data is consistent, high-quality, and ready for business intelligence applications.

## Data Architecture

The project implements the **Medallion Architecture** with **Bronze, Silver, and Gold layers**:

* **Bronze Layer:** Raw, unprocessed data ingested directly from source systems. For this project, CSV files are loaded into **SQL Server**.
* **Silver Layer:** Cleansed and standardized data; includes normalization, formatting, and validation to prepare data for analysis.
* **Gold Layer:** Business-ready data structured into a **star schema**, optimized for reporting, dashboards, and analytical queries.

<img width="721" height="369" alt="Untitled Diagram drawio" src="https://github.com/user-attachments/assets/1885b4eb-9f56-4a3b-99bf-c63bb97b9ccc" />



---

## Project Scope

This project covers the following:

* **Data Architecture Design:** Implement a modern data warehouse with Bronze, Silver, and Gold layers.
* **ETL Pipelines:** Extract, transform, and load data from multiple source systems.
* **Data Modeling:** Build **fact and dimension tables** optimized for analysis and reporting.

---
## Data Flow
The data flow in this project follows a structured and layered approach aligned with the Medallion Architecture. Raw data is ingested from source systems into the Bronze layer in batch mode and stored without modification to preserve the original records. The data is then processed in the Silver layer, where cleansing, standardization, validation, and enrichment transformations are applied to improve data quality and consistency. Finally, the refined data is loaded into the Gold layer, where it is modeled into business-ready fact and dimension tables optimized for analytical queries and reporting.
                     <img width="545" height="337" alt="Data Flow Diagram drawio" src="https://github.com/user-attachments/assets/9b3b7d43-b3e1-49c2-a0be-4a6fda7f0336" />



## Implemented Skills 

* SQL Development & Optimization
* Data Architecture & Warehouse Design
* ETL Pipeline Creation
* Data Modeling & Star Schema Design
* Business Analytics & Reporting

---

##  Tools & Resources

All tools used in this project :

* **Project Dataset:** CSV files from ERP and CRM source systems.
* **SQL Server Express:** Lightweight relational database server.
* **SQL Server Management Studio (SSMS):** GUI for database management and query execution.
* **GitHub Repository:** Version control and collaboration.
* **Draw.io (diagrams.net):** Design data flows, architecture diagrams, and models.
* **Notion Template:** Step-by-step project planning and task tracking.

---

### Data Engineering: Building the Warehouse

**Objective:**
Consolidate sales data from multiple sources into a **centralized SQL Server warehouse**, enabling robust analytical reporting.

**Key Specifications:**

* **Sources:** ERP and CRM CSV files.
* **Data Quality:** Cleanse, validate, and resolve data issues.
* **Integration:** Merge both sources into a unified, analysis-ready data model.
* **Scope:** Latest dataset only; historical tracking is optional.
* **Documentation:** Include clear documentation for stakeholders and analytics teams.

---

### Data Analysis: BI & Reporting

**Objective:**
Develop SQL-based analytics to deliver actionable insights on:

* **Customer Behavior:** Trends, segmentation, and engagement metrics.
* **Product Performance:** Sales, categories, and lifecycle analysis.
* **Sales Trends:** Daily, monthly, and overall revenue trends.

These insights empower business stakeholders to make **strategic decisions** backed by data.


---
### Contact Info:
For more information, please contact me through : samkemboi201@gmail.com or <br>
[![Email](https://img.shields.io/badge/Email-red?style=for-the-badge&logo=gmail&logoColor=white)](sam12@gmail.com)
[![GitHub](https://img.shields.io/badge/GitHub-black?style=for-the-badge&logo=github)](https://github.com/samkemboi12/samkemboi12)
[![Twitter](https://img.shields.io/badge/Twitter-black?style=for-the-badge&logo=twitter)](https://x.com/SamEssays)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/samwel-kipkemboi-32a8732a6/)
[![Medium](https://img.shields.io/badge/Medium-black?style=for-the-badge&logo=medium)](https://medium.com/@yourhandle)

