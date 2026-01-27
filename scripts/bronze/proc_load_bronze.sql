/*
=================================================
stored procedure : load bronze Layer
Purpose : This stored procedure loads data into the 'bronze' schema from external CSV files
==================================================
*/
USE DataWarehouse;
GO 
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	PRINT '============================================'
	PRINT 'LOADING BRONZE LAYER' 	
	PRINT '============================================'

	PRINT '--------------------------------------------'
	PRINT 'crm_cust_info '
	PRINT '--------------------------------------------'
	
	DECLARE @start_time DATETIME,@end_time DATETIME
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.crm_cust_info;/*If there any previous records delete them first*/
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\thine\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE();
	PRINT 'Duration: '+ CAST(DATEDIFF(second, @start_time,@end_time)AS NVARCHAR) + 'seconds';
	select COUNT(*) FROM bronze.crm_cust_info;


	PRINT '--------------------------------------------'
	PRINT 'crm_prd_info '
	PRINT '--------------------------------------------'
	TRUNCATE TABLE bronze.crm_prd_info;
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\thine\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	select COUNT(*) FROM bronze.crm_prd_info;


	PRINT '--------------------------------------------'
	PRINT 'crm_sales_details'
	PRINT '--------------------------------------------'
	TRUNCATE TABLE bronze.crm_sales_details;
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\thine\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	select COUNT(*) FROM bronze.crm_sales_details;


	PRINT '--------------------------------------------'
	PRINT 'erp_cust_az12'
	PRINT '--------------------------------------------'

	TRUNCATE TABLE bronze.erp_cust_az12;
	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\thine\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	select COUNT(*) FROM bronze.erp_cust_az12;


	PRINT '--------------------------------------------'
	PRINT 'erp_loc_101'
	PRINT '--------------------------------------------'



	TRUNCATE TABLE bronze.erp_loc_101;
	BULK INSERT bronze.erp_loc_101
	FROM 'C:\Users\thine\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	select COUNT(*) FROM bronze.erp_loc_101;

	PRINT '--------------------------------------------'
	PRINT 'erp_px_cat_g1v2'
	PRINT '--------------------------------------------'


	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\thine\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	select COUNT(*) FROM bronze.erp_px_cat_g1v2;
END
