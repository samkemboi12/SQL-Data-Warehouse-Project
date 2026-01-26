Ahh, I see the issue 👍 — GitHub needs **pure Markdown tables** with proper pipes and spacing. Here’s a **clean, copy-paste-ready version** that will render perfectly in GitHub.

You can paste this directly into your `.md` file 👇

---

# Data Catalog – Gold Layer

## Overview

The **Gold Layer** contains business-ready data modeled to support reporting, dashboards, and advanced analytics. The data is organized into **dimension tables** and **fact tables** to enable efficient querying and consistent business definitions.

---

## 1. `gold.dim_customers`

### Description

Stores customer information enriched with demographic and geographic attributes, providing a single source of truth for customer analysis.

### Columns

| Column Name     | Data Type    | Description                                                                     |
| --------------- | ------------ | ------------------------------------------------------------------------------- |
| customer_key    | INT          | Surrogate key uniquely identifying each customer record in the dimension table. |
| customer_id     | INT          | Numeric identifier assigned to the customer in the source system.               |
| customer_number | NVARCHAR(50) | Business-facing alphanumeric customer identifier used for reference.            |
| first_name      | NVARCHAR(50) | Customer’s given name as captured in the system.                                |
| last_name       | NVARCHAR(50) | Customer’s family or last name.                                                 |
| country         | NVARCHAR(50) | Country of residence for the customer (e.g., Australia).                        |
| marital_status  | NVARCHAR(50) | Marital status of the customer (e.g., Married, Single).                         |
| gender          | NVARCHAR(50) | Gender recorded for the customer (e.g., Male, Female, n/a).                     |
| birthdate       | DATE         | Date of birth of the customer in YYYY-MM-DD format.                             |
| create_date     | DATE         | Date when the customer record was created in the system.                        |

---

## 2. `gold.dim_products`

### Description

Contains product master data including classification, pricing, and lifecycle information used for product-level analysis.

### Columns

| Column Name          | Data Type    | Description                                                     |
| -------------------- | ------------ | --------------------------------------------------------------- |
| product_key          | INT          | Surrogate key uniquely identifying each product record.         |
| product_id           | INT          | Internal numeric identifier assigned to the product.            |
| product_number       | NVARCHAR(50) | Alphanumeric product code used for tracking and categorization. |
| product_name         | NVARCHAR(50) | Descriptive product name including key attributes.              |
| category_id          | NVARCHAR(50) | Identifier representing the product category.                   |
| category             | NVARCHAR(50) | High-level product classification (e.g., Bikes, Components).    |
| subcategory          | NVARCHAR(50) | Detailed classification within the product category.            |
| maintenance_required | NVARCHAR(50) | Indicates whether the product requires maintenance (Yes/No).    |
| cost                 | INT          | Base cost of the product expressed in whole currency units.     |
| product_line         | NVARCHAR(50) | Product line or series the item belongs to.                     |
| start_date           | DATE         | Date when the product became available for sale.                |

---

## 3. `gold.fact_sales`

### Description

Holds transactional sales records and serves as the primary fact table for revenue and sales performance analysis.

### Columns

| Column Name   | Data Type    | Description                                          |
| ------------- | ------------ | ---------------------------------------------------- |
| order_number  | NVARCHAR(50) | Unique alphanumeric identifier for each sales order. |
| product_key   | INT          | Surrogate key linking to the product dimension.      |
| customer_key  | INT          | Surrogate key linking to the customer dimension.     |
| order_date    | DATE         | Date the order was placed.                           |
| shipping_date | DATE         | Date the order was shipped to the customer.          |
| due_date      | DATE         | Date when payment for the order was due.             |
| sales_amount  | INT          | Total monetary value of the sales line item.         |
| quantity      | INT          | Number of product units sold.                        |
| price         | INT          | Selling price per unit.                              |

---

If you want, I can also:

* Convert this to **docs-style data catalog**
* Add **primary key / foreign key notes**
* Align wording with **enterprise data warehouse standards**

Just say the word 👌
