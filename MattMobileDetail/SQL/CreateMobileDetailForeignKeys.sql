

CREATE Procedure [dbo].[CreateMobileDetailForeignKeys]

as


--EmployeeWage
Alter table EmployeeWage
add Constraint FK_EmployeeWage_EmployeeID 
	FOREIGN KEY (EmployeeID) References Employees(EmployeeID)


--CustomerVehicle

Alter table CustomerVehicle
add Constraint FK_CustomerVehicle_CustomerID 
	FOREIGN KEY (CustomerID) References Customers(CustomerID)

--InventoryBookmark
Alter table InventoryBookmark
add Constraint FK_InventoryBookmark_UPC 
	FOREIGN KEY (UPC) References Inventory(UPC)

Alter table InventoryBookmark
add Constraint FK_InventoryBookmark_Vendor 
	FOREIGN KEY (Vendor) References Vendors(Name)

--VendorOrders

Alter Table VendorOrders
add Constraint FK_VendorOrders_UPC 
	FOREIGN KEY (UPC) References Inventory(UPC)

Alter table VendorOrders
add Constraint FK_VendorOrders_Vendor 
	FOREIGN KEY (Vendor) References Vendors(Name)

--Appointments
Alter Table Appointments
ADD Constraint FK_Appointments_CustomerID 
	FOREIGN KEY (CustomerID) References Customers(CustomerID)

--AppointmentEmployees

Alter Table AppointmentEmployees
add Constraint FK_AppointmentEmployees_AppointmentID 
	FOREIGN KEY (AppointmentID) References Appointments(AppointmentID)

Alter Table AppointmentEmployees
add	Constraint FK_AppointmentEmployees_EmployeeID 
	FOREIGN KEY (EmployeeID) References Employees(EmployeeID);

--Transactions

ALTER TABLE Transactions
ADD Constraint FK_Transactions_AppointmentID 
	FOREIGN KEY (AppointmentID) References Appointments(AppointmentID)

ALTER TABLE Transactions
ADD Constraint FK_Transactions_PromotionID 
	FOREIGN KEY (PromotionID) References Promotions(PromotionID)

--TransactionItems
ALTER TABLE TransactionItems
ADD Constraint FK_TransactionItems_TransactionID 
	FOREIGN KEY (TransactionID) References Transactions(TransactionID)

ALTER TABLE TransactionItems
ADD Constraint FK_Transactions_ServiceID 
	FOREIGN KEY (ServiceID) References Services(ServiceID)

ALTER TABLE TransactionItems
ADD Constraint FK_Transactions_UPC 
	FOREIGN KEY (UPC) References Inventory(UPC)
GO


