
CREATE Procedure [dbo].[DropMobileDetailForeignKeys]

as


ALTER TABLE TransactionItems
DROP Constraint FK_TransactionItems_TransactionID 
	
ALTER TABLE TransactionItems
DROP Constraint FK_Transactions_ServiceID 

ALTER TABLE TransactionItems
DROP Constraint FK_Transactions_UPC 
	
ALTER TABLE Transactions
DROP Constraint FK_Transactions_AppointmentID 
	
ALTER TABLE Transactions
DROP Constraint FK_Transactions_PromotionID 
	
Alter Table AppointmentEmployees
DROP Constraint FK_AppointmentEmployees_AppointmentID 
	
Alter Table AppointmentEmployees
DROP Constraint FK_AppointmentEmployees_EmployeeID 

Alter Table Appointments
DROP Constraint FK_Appointments_CustomerID 


Alter Table VendorOrders
DROP Constraint FK_VendorOrders_UPC 

Alter Table VendorOrders
DROP Constraint FK_VendorOrders_Vendor

Alter table InventoryBookmark
DROP Constraint FK_InventoryBookmark_UPC 

Alter table InventoryBookmark
DROP Constraint FK_InventoryBookmark_Vendor
	
Alter table CustomerVehicle
DROP Constraint FK_CustomerVehicle_CustomerID 
	
Alter table EmployeeWage
DROP Constraint FK_EmployeeWage_EmployeeID 
	
GO


