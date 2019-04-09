

CREATE procedure [dbo].[DropMobileDetailTables]

as

BEGIN

Drop Table dbo.Employees
DROP table dbo.Vendors
DROP Table dbo.Customers
DROP TABLE dbo.Inventory
DROP TABLE dbo.Promotions
DROP TABLE dbo.Services
DROP Table dbo.EmployeeWage
DROP TABLE dbo.CustomerVehicle
DROP TABLE dbo.InventoryBookmark
DROP TABLE dbo.VendorOrders
Drop Table dbo.Appointments
DROP TABLE dbo.AppointmentEmployees
DROP TABLE dbo.Transactions
DROP TABLE dbo.TransactionItems

END
GO


