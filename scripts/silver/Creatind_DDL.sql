
-- Create database if it does not exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'data_warehouse')
BEGIN
    CREATE DATABASE data_warehouse;
END;
GO

USE data_warehouse;
GO

-- Create schema if it does not exist
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('CREATE SCHEMA silver');
END;
GO

-- Drop and create tables

DROP TABLE IF EXISTS silver.crm_cust_info;
CREATE TABLE silver.crm_cust_info (
    cst_id INT NULL,
    cst_key VARCHAR(30) NULL,
    cst_firstname VARCHAR(50) NULL,
    cst_lastname VARCHAR(50) NULL,
    cst_marital_status VARCHAR(30) NULL,
    cst_gndr VARCHAR(30) NULL,
    cst_create_date DATE NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

DROP TABLE IF EXISTS silver.crm_prd_info;
CREATE TABLE silver.crm_prd_info (
    prd_id INT NULL,
    cat_id VARCHAR(100),
    prd_key VARCHAR(100) NULL,
    prd_nm VARCHAR(100) NULL,
    prd_cost INT NULL,
    prd_line VARCHAR(100) NULL,
    prd_start_dt DATE NULL,
    prd_end_dt DATE NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

DROP TABLE IF EXISTS silver.crm_sales_details;
CREATE TABLE silver.crm_sales_details (
    sls_ord_num VARCHAR(100) NULL,
    sls_prd_key VARCHAR(100) NULL,
    sls_cust_id INT NULL,
    sls_order_dt DATE NULL,
    sls_ship_dt DATE NULL,
    sls_due_dt DATE NULL,
    sls_sales INT NULL,
    sls_quantity INT NULL,
    sls_price INT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

DROP TABLE IF EXISTS silver.erp_cust_az12;
CREATE TABLE silver.erp_cust_az12 (
    cid VARCHAR(100),
    bdate DATE,
    gen VARCHAR(100),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

DROP TABLE IF EXISTS silver.erp_loc_a101;
CREATE TABLE silver.erp_loc_a101 (
    cid VARCHAR(100),
    cntry VARCHAR(100),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

DROP TABLE IF EXISTS silver.erp_px_cat_g1v2;
CREATE TABLE silver.erp_px_cat_g1v2 (
    ID VARCHAR(100),
    CAT VARCHAR(100),
    SUBCAT VARCHAR(100),
    MAINTENANCE VARCHAR(100),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);


