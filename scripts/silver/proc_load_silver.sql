


INSERT INTO silver.crm_sales_details(
    sls_ord_num,
        sls_prd_key,
        sls_cust_id,
        sls_order_dt,
        sls_ship_dt,
        sls_due_date,
        sls_sales,
        sls_quantity,
        sls_price
  )
   SELECT
      sls_ord_num,
      sls_prd_key,
      sls_sust_id,
      CASE  WHEN sls_order_dt = 0 OR LEN(sls_order_dt)<8 THEN NULL
            ELSE CAST(CAST(sls_order_dt AS VARCHAR)AS DATE)
      END AS sls_order_dt,

      CASE WHEN sls_ship_dt=NULL OR LEN(sls_ship_dt)<8 THEN NULL
            ELSE CAST(CAST(sls_ship_dt AS VARCHAR)AS DATE)
       END AS sls_ship_dt,

       CASE WHEN sls_due_dt=NULL OR LEN(sls_due_dt)<8 THEN NULL
            ELSE CAST(CAST(sls_due_dt AS VARCHAR)AS DATE)
       END AS sls_due_dt,
      CASE WHEN sls_sales IS NULL OR sls_sales<=0 OR sls_sales!=sls_quantity*ABS(sls_price)
                then sls_quantity*ABS(sls_price)
            ELSE sls_sales
      END AS sls_sales,
      CASE WHEN sls_quantity IS NULL OR sls_sales<=0
                then sls_sales/ABS(sls_price)
            ELSE sls_quantity
      END AS sls_quantity,
      CASE WHEN sls_price IS NULL OR sls_price<=0
                then sls_sales/ABS(sls_quantity)
            ELSE sls_price
      END AS sls_price    
  FROM bronze.crm_sales_details;


  INSERT INTO silver.erp_loc_101(
    cid,
    cntry
  )
  SELECT
  REPLACE(cid,'-','') as cid,
  CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
        WHEN TRIM(cntry) IN ('US','USA') THEN 'United States'
        WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
        ELSE TRIM(cntry)
   END AS cntry
   from bronze.erp_loc_101;


   INSERT INTO bronze.erp_cust_az12(
	cid,
	bday,
	gen
)
SELECT
	SUBSTRING(cid,4,LEN(cid)),
	CASE WHEN bday > GETDATE() THEN NULL
		ELSE bday
	END AS bdate,
	CASE WHEN gen = 'Female' or gen = 'F' THEN 'Female'
		WHEN gen = 'Male' or gen = 'M' Then 'Male'
		else 'n/a'
	end AS gen
	FROM bronze.erp_cust_az12;

	SELECT DISTINCT gen
	FROM bronze.erp_cust_az12;


    INSERT INTO silver.erp_px_cat_g1v2(
    id,
    cat,
    subcat,
    maintenance
)select
    id,
    cat,
    subcat,
    maintenance
 from bronze.erp_px_cat_g1v2;
