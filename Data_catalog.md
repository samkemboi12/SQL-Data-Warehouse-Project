## Data Catalog – Gold Layer
### Overview

The Gold Layer represents the curated, business-ready data used for analytics, dashboards, and reporting. Data in this layer is modeled using dimension and fact tables to ensure consistency, clarity, and performance for business intelligence use cases.

1. gold.dim_customers
Description

This dimension table contains customer information enhanced with demographic and location attributes. It provides a unified customer view for analytical queries and reporting.

Columns
Column Name	Data Type	Description
customer_key	INT	Surrogate key that uniquely identifies each customer record in the dimension table.
customer_id	INT	System-generated numeric identifier assigned to each customer.
customer_number	NVARCHAR(50)	Business-level alphanumeric customer identifier used for reference and tracking.
first_name	NVARCHAR(50)	Customer’s given name as stored in the source system.
last_name	NVARCHAR(50)	Customer’s family or surname.
country	NVARCHAR(50)	Country where the customer resides (e.g., Australia).
marital_status	NVARCHAR(50)	Customer’s marital status such as Married or Single.
gender	NVARCHAR(50)	Gender value recorded for the customer (e.g., Male, Female, n/a).
birthdate	DATE	Customer’s date of birth in YYYY-MM-DD format.
create_date	DATE	Date when the customer record was first created in the system.
2. gold.dim_products
Description

This table stores product master data, including categorization, pricing, and lifecycle attributes. It is used to analyze sales and performance by product characteristics.

Columns
Column Name	Data Type	Description
product_key	INT	Surrogate key uniquely identifying each product in the dimension table.
product_id	INT	Internal numeric identifier assigned to the product.
product_number	NVARCHAR(50)	Alphanumeric product code used for inventory and classification purposes.
product_name	NVARCHAR(50)	Full descriptive name of the product, including relevant attributes.
category_id	NVARCHAR(50)	Identifier representing the product’s category.
category	NVARCHAR(50)	High-level product grouping such as Bikes or Components.
subcategory	NVARCHAR(50)	More granular product classification within a category.
maintenance_required	NVARCHAR(50)	Indicates whether ongoing maintenance is required (Yes/No).
cost	INT	Base cost of the product expressed in whole monetary units.
product_line	NVARCHAR(50)	Product line or series the item belongs to (e.g., Road, Mountain).
start_date	DATE	Date when the product became active or available for sale.
3. gold.fact_sales
Description

The sales fact table captures transactional sales records and serves as the core dataset for revenue and performance analysis. It links to customer and product dimensions using surrogate keys.

Columns
Column Name	Data Type	Description
order_number	NVARCHAR(50)	Unique alphanumeric identifier for each sales order (e.g., SO54496).
product_key	INT	Foreign key linking to gold.dim_products.
customer_key	INT	Foreign key linking to gold.dim_customers.
order_date	DATE	Date when the sales order was created.
shipping_date	DATE	Date the order was shipped to the customer.
due_date	DATE	Date when payment for the order was expected.
sales_amount	INT	Total sales value for the order line in whole currency units.
quantity	INT	Number of product units sold in the order line.
price	INT	Unit selling price of the product.
