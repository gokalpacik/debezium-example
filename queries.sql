-- Create a database
CREATE DATABASE CargoJet
GO

-- Create Shipment table
USE CargoJet
CREATE TABLE shipment
(
    shipment_id                   INT PRIMARY KEY IDENTITY,
    order_id                      int not null,
	courier_id                    int not null,
    expected_delivery_date        datetime2,
    status_id                     varchar(60),
	created_date                  datetime2  DEFAULT GETDATE(),  
    last_updated_date             datetime2
);
GO

-- Enable Database for CDC template   
EXEC sys.sp_cdc_enable_db  
GO

-- Check that CDC is enabled on the database
SELECT name, is_cdc_enabled
FROM sys.databases WHERE database_id = DB_ID();

-- Enable a Table Specifying Filegroup Option Template  
GO  
  
EXEC sys.sp_cdc_enable_table  
@source_schema = N'dbo',  
@source_name   = N'Shipment',  
@role_name     = N'sa',  
@filegroup_name = N'PRIMARY',  
@supports_net_changes = 1  
GO  

EXEC sys.sp_cdc_help_change_data_capture
GO

INSERT INTO [dbo].[shipment]
           ([order_id]
           ,[courier_id]
           ,[expected_delivery_date]
           ,[status_id]
           )
     VALUES
           (1907
           ,1
           ,DATEADD(DAY, 3, GETDATE())
           ,'shipped'
           )
GO

select * from [dbo].[shipment]
GO

-- Query the results of the changes captured from the shipment table
SELECT * FROM [cdc].[dbo_Shipment_CT]
GO

