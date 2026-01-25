/*
Create databae and Schema
=============================================
Sript purpose:
  This script creates a database name DataWarehouse 
  and Under this database prepare three schemas named 
  'bronze','silver' and 'gold'. 
*/  

USE master;

CREATE DATABASE DataWarehouse;

USE DataWarehouse;
Go
CREATE SCHEMA bronze;
Go
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
