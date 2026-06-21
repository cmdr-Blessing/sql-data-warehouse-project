/*
=============================================================================
STORED PROCEDURE: Load Bronze Layer (Source --> Bronze)
=============================================================================
Script Purpose:
  This stored procedure loads data into the 'bronze' schema from external
  .csv files. It performs the following actions:
    - Truncate the 'bronze' tables before laoding.
    - Uses the 'BULK INSERT' command to load all the data from the .csv files 
      to the 'bronze' tables.

Parameters:
  None.
  This stored procedure does not accept any parameters or return any values.

Usage Example:
  EXEC bronze.load_bronze;
=============================================================================
*/

USE DataWarehouse;
GO

/*
Save frequently used SQL code in stored procedures in the database
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS

BEGIN 

	/*Empty the table first before loading it*/
	TRUNCATE TABLE bronze.crm_cust_info;
	/*Fully load all the data from the file into the table*/
	BULK INSERT bronze.crm_cust_info
	FROM '/var/opt/mssql/data/cust_info.csv '
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	
	/*Empty the table first before loading it*/
	TRUNCATE TABLE bronze.crm_prd_info;
	/*Fully load all the data from the file into the table*/
	BULK INSERT bronze.crm_prd_info
	FROM '/var/opt/mssql/data/prd_info.csv '
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	
	/*Empty the table first before loading it*/
	TRUNCATE TABLE bronze.crm_sales_details;
	/*Fully load all the data from the file into the table*/
	BULK INSERT bronze.crm_sales_details
	FROM '/var/opt/mssql/data/sales_details.csv '
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	
	/*Empty the table first before loading it*/
	TRUNCATE TABLE bronze.erp_cust_az12;
	/*Fully load all the data from the file into the table*/
	BULK INSERT bronze.erp_cust_az12
	FROM '/var/opt/mssql/data/CUST_AZ12.csv '
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	
	/*Empty the table first before loading it*/
	TRUNCATE TABLE bronze.erp_loc_a101;
	/*Fully load all the data from the file into the table*/
	BULK INSERT bronze.erp_loc_a101
	FROM '/var/opt/mssql/data/LOC_A101.csv '
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	
	/*Empty the table first before loading it*/
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	/*Fully load all the data from the file into the table*/
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM '/var/opt/mssql/data/PX_CAT_G1V2.csv '
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

END
