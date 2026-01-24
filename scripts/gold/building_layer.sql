-- ======================================
-- BUILDING THE GOLD LAYER
-- ======================================
USE data_warehouse;
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.schemas WHERE name = 'gold'
)
BEGIN
    EXEC('CREATE SCHEMA gold');
END
GO

-- ========================================
-- CREATING DIM_CUSTMERS VIEW IN GOLD LAYER
-- ========================================
CREATE VIEW gold.dim_customers AS 
SELECT 
ROW_NUMBER() OVER(ORDER BY cst_id) AS customer_key,
ci.cst_id AS customer_id,
ci.cst_key AS customer_number,
ci.cst_firstname AS first_name,
ci.cst_lastname AS last_name,
ci.cst_marital_status AS marital_status,
CASE 
    WHEN ci.cst_gndr IS NOT NULL 
         AND ci.cst_gndr NOT IN ('n/a', 'nla')
    THEN ci.cst_gndr
    ELSE COALESCE(ca.gen, 'n/a')
END AS gender,
cl.cntry AS country,
ca.bdate AS date_of_birth,
ci.cst_create_date AS create_date

FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca
ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 cl
ON ci.cst_key=cl.cid

-- ========================================
-- CREATING DIM_PRODUCTS VIEW IN GOLD LAYER
-- ========================================
CREATE VIEW gold.dim_products
AS
SELECT 
       ROW_NUMBER() OVER (ORDER BY prd_start_dt,prd_id) AS product_key,
       pn.prd_id AS product_id,
       pn.cat_id AS category_id,
       pn.prd_key AS product_number,
       pn.prd_nm AS product_name,
       pn.prd_cost AS product_cost,
       pn.prd_line AS product_line,
       pn.prd_start_dt AS start_date,
       ep.CAT AS category,
       ep.SUBCAT AS sub_category,
       ep.MAINTENANCE AS maintenance
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_px_cat_g1v2 ep
ON pn.cat_id = ep.ID

-- ========================================
-- CREATING FACT_TABLE VIEW IN GOLD LAYER
-- ========================================
CREATE VIEW gold.fact_table AS
SELECT 
    sd.sls_ord_num  AS order_number,
    dp.product_key ,
    dc.customer_key ,
    sd.sls_order_dt AS order_date  ,
    sd.sls_ship_dt AS  shipping_date,
    sd.sls_due_dt AS due_date,
    sd.sls_sales AS sales_amount,
    sd.sls_quantity  AS quantity ,
    sd.sls_price AS price
    FROM silver.crm_sales_details sd
    LEFT JOIN gold.dim_products dp
    ON sd.sls_prd_key=dp.product_number
    LEFT JOIN gold.dim_customers dc
    ON sd.sls_cust_id= dc.customer_id
