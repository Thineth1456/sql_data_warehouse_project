/*
===================================
DDL stript : create bronze tables
Purpose : This script creates tables in the 'bronze' schema. 
===================================
*/

USE DataWarehouse;
Go
CREATE TABLE bronze.crm_cust_info(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(2),
	cst_gndr NVARCHAR(2),
	cst_create_date DATE
);

CREATE TABLE bronze.crm.prd_info(
	pro_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE
);

CREATE TABLE bronze.crm.sales_details(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_sust_id INT,
	sls_order_dt DATE,
	sls_ship_dt DATE,
	sls_due_dt DATE,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);


CREATE TABLE bronze.erp.cust_az12(
	cid NVARCHAR(50),
	bday DATE,
	gen NVARCHAR(50)
);


CREATE TABLE bronze.erp.loc_101(
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);


CREATE TABLE bronze.erp.px_cat_g1v2(
	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50)
);
