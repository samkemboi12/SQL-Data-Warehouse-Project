--USE data_warehouse
-- GO
--IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
 --EXEC('CREATE SCHEMA bronze');
--GO


CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
 BEGIN
      DECLARE @start_time DATETIME , @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
          BEGIN TRY
                 
                SET @batch_start_time = GETDATE();
                SET NOCOUNT OFF;

                -- =======================
                -- CRM CUSTOMER INFO
                -- =======================
               
                PRINT 'LOADING CRM TABLES >>>>>>>>>>>>>.....';
           

                PRINT '==============================';
                PRINT '>>>>>TRUNCATING bronze.crm_cust_info'
                PRINT '==============================';


                SET @start_time = GETDATE()
                TRUNCATE TABLE bronze.crm_cust_info;

                

                PRINT '===========================================';
                PRINT '>>>>>>INSERTING DATA INTO bronze.crm_cust_info';
                PRINT '===========================================';

                BULK INSERT bronze.crm_cust_info
                FROM 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\source_crm\cust_info.csv'
                WITH (
                    FIRSTROW = 2,
                    FIELDTERMINATOR = ',',
                    ROWTERMINATOR = '\n',
                    FORMAT = 'CSV',
                    TABLOCK
                );

                SET @end_time = GETDATE()
                PRINT '>>lOAD DURATION ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'Seconds'
                PRINT '----------------'


                SET @start_time = GETDATE()
                PRINT '==============================';
                PRINT '>>>>>>TRUNCATING bronze.crm_prd_info';
                PRINT '==============================';

                TRUNCATE TABLE bronze.crm_prd_info;

                PRINT '===========================================';
                PRINT '>>>>>>>INSERTING DATA INTO bronze.crm_prd_info';
                PRINT '===========================================';

                BULK INSERT bronze.crm_prd_info
                FROM 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\source_crm\prd_info.csv'
                WITH (
                    FIRSTROW = 2,
                    FIELDTERMINATOR = ',',
                    ROWTERMINATOR = '\n',
                    FORMAT = 'CSV',
                    TABLOCK
                );
                SET @end_time = GETDATE()
                PRINT '>>lOAD DURATION ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'Seconds'
                PRINT'-------------------------'


                PRINT 'LOADING ERP TABLES>>>>>>>>>>>.....';
                

                PRINT '==============================================';
                PRINT 'TRUNCATING TABLE bronze.crm_sales_detais';  
                PRINT '==============================================';

                SET @start_time = GETDATE()
    
                TRUNCATE TABLE bronze.crm_sales_details;


                PRINT '================================================';
                PRINT 'INSERTING INTO TABLE bronze.crm_sales_details ';
                PRINT '=================================================';

                BULK INSERT bronze.crm_sales_details
                FROM 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\source_crm\sales_details.csv'
                WITH (
                    FIRSTROW = 2,
                    FIELDTERMINATOR = ',',
                    ROWTERMINATOR = '\n',
                    FORMAT = 'CSV',
                    TABLOCK
                );
                SET @end_time = GETDATE();
                PRINT '>>lOAD DURATION ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'Seconds';
                PRINT'-----------------------'


                PRINT '=========================================';
                PRINT 'TRUNCATING TABLE bronze.erp_cust_az12';  
                PRINT '==========================================';
    

                SET @start_time = GETDATE()
    
                TRUNCATE TABLE bronze.erp_cust_az12;

                PRINT '============================================';
                PRINT 'INSERTING INTO TABLE bronze.erp_cust_az12 ';
                PRINT '=============================================';

                BULK INSERT bronze.erp_cust_az12
                FROM 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\source_erp\CUST_AZ12.csv'
                WITH (
                    FIRSTROW = 2,
                    FIELDTERMINATOR = ',',
                    ROWTERMINATOR = '\n',
                    FORMAT = 'CSV',
                    TABLOCK
                );

                SET @end_time = GETDATE();
                PRINT '>>lOAD DURATION ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'Seconds';
                PRINT'-----------------------'
                -- =======================
                -- ERP LOCATION A101
                -- =======================
                 PRINT '=======================================';
                 PRINT 'TRUNCATING TABLE bronze.erp_loc_a101';  
                 PRINT '=======================================';

                SET @start_time = GETDATE()
    
                TRUNCATE TABLE bronze.erp_loc_a101;

                PRINT '===========================================';
                PRINT 'INSERTING INTO TABLE bronze.erp_loc_a101 ';
                PRINT '============================================';

                BULK INSERT bronze.erp_loc_a101
                FROM 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\source_erp\LOC_A101.csv'
                WITH (
                    FIRSTROW = 2,
                    FIELDTERMINATOR = ',',
                    ROWTERMINATOR = '\n',
                    FORMAT = 'CSV',
                    TABLOCK
                );
                SET @end_time = GETDATE();
                PRINT '>>lOAD DURATION' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'Seconds';
                PRINT'-----------------------'
          
                 PRINT '============================================';
                 PRINT 'TRUNCATING TABLE bronze.erp_px_cat_g1v2';  
                 PRINT '============================================';
                
                SET @start_time = GETDATE()
                TRUNCATE TABLE bronze.erp_px_cat_g1v2;

                PRINT '================================================';
                PRINT 'INSERTING INTO TABLE bronze.erp_px_cat_g1v2 ';
                PRINT '=================================================';

                BULK INSERT bronze.erp_px_cat_g1v2
                FROM 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\source_erp\PX_CAT_G1V2.csv'
                WITH (
                    FIRSTROW = 2,
                    FIELDTERMINATOR = ',',
                    ROWTERMINATOR = '\n',
                    FORMAT = 'CSV',
                    TABLOCK
                );
                SET @end_time = GETDATE();
                PRINT '>>lOAD DURATION ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'Seconds';
                PRINT'-----------------------'
                SET @batch_end_time = GETDATE();
                PRINT 'WHOLE DURATION '+  CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS NVARCHAR) + 'Seconds'
        END TRY
        BEGIN CATCH
        PRINT '=================================';
        PRINT 'ERROR OCCURRED WHILR LOADING BRONZE DATA';
        PRINT 'ERROR MESSAGE'+ ERROR_MESSAGE();
        PRINT 'ERROR STATE'+ CAST(ERROR_STATE() AS NVARCHAR);
         PRINT 'ERROR NUMBER'+ CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT '=================================';

        END CATCH
END

