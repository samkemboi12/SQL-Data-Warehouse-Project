-- ==========================================
-- DATA QUALITY CHECKS IN bronze.crm_cust_info
-- ==========================================

-- CHECK WE HAVE THE CORRECT DATA TYPES

SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.columns
WHERE TABLE_NAME ='crm_prd_info'
	AND TABLE_SCHEMA ='bronze'

-- Now that date should be in correct datatype, we eed to do a quality check before changing
SELECT *
FROM bronze.crm_cust_info
WHERE TRY_CONVERT(date, cst_create_date) IS NULL
  AND cst_create_date IS NOT NULL;


-- CHECK FOR NULL VALUES OR DUPLICAATES
USE data_warehouse
SELECT cst_id
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

-- CHECK FOR UNWANTED SPACES
SELECT cst_lastname,cst_firstname
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname) 
   OR cst_firstname !=TRIM(cst_firstname);

-- CHECK FOR DATA CONSISTENCY IN LOW CARDINALITY COLUMNS, CHANGE ABBREVIATIONS TO FULL MEANING
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info

SELECT DISTINCT cst_marital_status
FROM bronze.crm_cust_info

-- ==========================================
-- DATA QUALITY CHECKS IN bronze.crm_prd_info
-- ==========================================

 SELECT COLUMN_NAME, DATA_TYPE
 FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_NAME = 'crm_prd_info'
  AND TABLE_SCHEMA = 'bronze';

ALTER TABLE bronze.crm_prd_info
ALTER COLUMN prd_end_dt DATE

-- CHECK FOR NULL OR DUPLICATES IN THE PRIMARY KEY
SELECT prd_id
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- SPLIT THE STRINGS IN prd_key since they are combined cat_idn(category id)
-- CHECK IN THE TRANSFORMATION QUERY


-- CHECK FOR UNWANTED SPACES IN prd_nm
SELECT prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)


-- CHECK FOR NULL OR NEGATIVE NUMBERS IN prd_cost
SELECT prd_cost, COUNT(*) AS CNT
FROM bronze.crm_prd_info
WHERE prd_cost IS NULL OR  prd_cost < 0
GROUP BY prd_cost

-- VALIDATE AND STANDARDIZE prd_line VALUES
-- CONSULT THE SOURCE TEAM TO UNDERSTAND MEANING
SELECT DISTINCT (prd_line)
FROM bronze.crm_prd_info

-- CHECK FOR INVALID DATE ORDERS
SELECT * FROM 
bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- DERIVE END DATE FROM START DATE


-- ===============================================
-- DATA QUALITY CHECKS IN bronze.crm_sales_details
-- ===============================================

SELECT * FROM bronze.crm_sales_details
-- CHECK FOR UNWANTED SPACES SINCE sls_ord_num is TEXT
SELECT sls_ord_num
FROM bronze.crm_sales_details
WHERE sls_ord_num != TRIM(sls_ord_num)

-- CHECK DATA TYPES FOR DATES
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'bronze'
  AND TABLE_NAME = 'crm_sales_details'
  AND COLUMN_NAME IN ('sls_ship_dt','sls_order_dt','sls_due_dt')-- Dates are in INT form

-- CHECK FOR INVALID DATES FIRST like 0
SELECT sls_ship_dt,sls_order_dt,sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_ship_dt <=0 OR sls_order_dt <=0 OR sls_due_dt <=0

SELECT NULLIF(sls_order_dt,0) sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <=0 OR LEN(sls_order_dt) != 8

-- BUSINESS RULE: SALES = QUANITY * PRICE
-- CHECK IF THE RULE IS CORRECT IN THE DATA

-- IF SALES IS NEGATIVE,0 OR NULL, DERIVE IT USING QUANTITY AND PRICE
-- IF PRICE IS O,OR NULL, CALCULATE IT USING QUANTITY AND PRICE
-- IF PRICE IS NEGATIVE, CONVERT IT TO POSITIVE


SELECT DISTINCT sls_sales,sls_quantity,sls_price

FROM bronze.crm_sales_details
WHERE sls_sales <=0 OR sls_price <=0 OR sls_quantity <=0
   OR sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
   ORDER BY sls_sales, sls_quantity, sls_price


-- ===============================================
-- DATA QUALITY CHECKS IN bronze.erp_cust_az12
-- ===============================================
SELECT * FROM bronze.erp_cust_az12
-- REMOVE UMWANTED CHARACTERS FROM cid column
SELECT cid,
	CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid,4,LEN(cid))
	ELSE cid
	END AS cid
	FROM bronze.erp_cust_az12

-- CHECK BIRTHDAY IF SOME DATES ARE IN THE FUTURE
SELECT bdate FROM bronze.erp_cust_az12
WHERE bdate > GETDATE()
 
-- CHECK FOR DATA CONSISTENCY IN  gender column
SELECT DISTINCT gen
FROM bronze.erp_cust_az12


-- ===============================================
-- DATA QUALITY CHECKS IN bronze.erp_loc_a101
-- ===============================================
-- CHECK FOR '-' IN THE CID COLUMN
SELECT cid
FROM bronze.erp_loc_a101
-- DATA STANDARDIZATION AND CONSISTENCY
SELECT DISTINCT cntry FROM bronze.erp_loc_a101


-- ===============================================
-- DATA QUALITY CHECKS IN bronze.erp_px_cat_g1v2
-- ===============================================
SELECT * FROM bronze.erp_px_cat_g1v2
-- CHECK FOR DATA CONSISTENCY AND STANDARDIZATION
SELECT DISTINCT SUBCAT FROM bronze.erp_px_cat_g1v2
SELECT DISTINCT CAT FROM bronze.erp_px_cat_g1v2
-- CHECK FOR UNWANTED SPACES
SELECT CAT FROM bronze.erp_px_cat_g1v2
WHERE CAT != TRIM(CAT);
