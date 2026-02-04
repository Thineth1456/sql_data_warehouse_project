/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/


CREATE VIEW gold.dim_customer AS
select
ROW_NUMBER() OVER (ORDER BY cst_id) AS customer_key,
ci.cst_id AS customer_id,
ci.cst_key AS customer_number,
ci.cst_firstname AS first_name,
ci.cst_lastname AS last_name,
l1.cntry AS country,
ci.cst_marital_status AS marital_status,
CASE WHEN ci.cst_gndr!='n/a' THEN ci.cst_gndr
	ELSE COALESCE(ca.gen,'n/a')
END AS gender,
ca.bday AS birthdate,
ci.cst_create_date AS create_date
from silver.crm_cust_info ci
LEFT JOIN  silver.erp_cust_az12 ca
ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_101 l1
ON l1.cid = ci.cst_key;




CREATE VIEW gold.dim_customer AS
SELECT prd_id
      ,cat_id
      ,prd_key
      ,prd_nm
      ,prd_cost
      ,prd_linr
      ,prd_start_dt
      ,prd_end_dt
      ,g1v2.cat
      ,g1v2.subcat
      ,g1v2.maintenance
  FROM silver.crm_prd_info pd
  LEFT JOIN silver.erp_px_cat_g1v2 g1v2
  ON pd.cat_id = g1v2.id

