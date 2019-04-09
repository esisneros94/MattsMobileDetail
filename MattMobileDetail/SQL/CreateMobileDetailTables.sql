
CREATE Procedure [dbo].[CreateMobileDetailTables]

as

Create Table Employees(
	EmployeeID		int				not null identity(1,1)
	,FirstName		varchar(50)		not null
	,LastName		varchar(50)		not null
	,Phone			varchar(20)		null
	,JobTitle		varchar(40)		not null
	,UserName		varchar(20)		null
	,PassKey		varchar(30)		null

	Primary Key (EmployeeID)
)

Create Table Vendors(
	Name			varchar(100) not null
	,StartDate		datetime not null
	,EndDate		datetime null
	
	Primary Key (Name)

)

Create Table Customers(
	CustomerID		int				not null Identity(1,1)
	,FirstName		varchar(50)		not null
	,LastName		varchar(50)		not null
	,City			varchar(50)		not null
	,State			char(2)			not null
	,ZIP			varchar(10)		not null
	,Phone			varchar(20)		null
	,Email			varchar(40)		null

	Primary Key (CustomerID)
)


Create Table Inventory(
	UPC				varchar(60)		not null
	,Name			varchar(100)	not null
	,Description	varchar(100)	not null
	,IsForSale		bit				not null
	,Quantity		int				not null
	,StartDate		Date			not null
	,EndDate		Date			null

	Primary Key (UPC)
)

Create table Services(
	ServiceID			int				not null identity(1,1)
	,Name				varchar(100)	not null
	,Description		varchar(100)	not null
	,Cost				Money			null
	,EstimatedTime		DECIMAL(4,2)	not null
	,StartDate			date			not null
	,EndDate			Date			null

	Primary Key (ServiceID)
)

Create table Promotions(
	PromotionID				int				not null identity(1,1)
	,Name					varchar(100)	not null
	,Description			varchar(100)	not null
	,StartDate				Date			not null
	,EndDate				Date			null

	Primary Key (PromotionID)
)

Create table EmployeeWage(
	EmployeeID			int				not null
	,EffectiveDate		DateTime		not null
	,Wage				money			not null
	,EndDate			datetime		null
	
	Primary Key (EmployeeID	, EffectiveDate)
	

)

Create table CustomerVehicle(
	CustomerID			int				not null
	,Year				int				not null
	,Make				varchar(50)		not null
	,Model				varchar(100)	not null
	,LicensePlateNumber varchar(10)		not null
	,LicensePlateState	char(2) not		null
	,Color				varchar(20)		null

	Primary Key (CustomerID, Year, Make, Model)
	
)

Create Table InventoryBookmark(
	UPC				varchar(60)		not null
	,Vendor			varchar(100)	not null
	,URL			varchar(1000)	not null
	
	Primary Key (UPC, Vendor)
	
)

Create Table VendorOrders(
	InvoiceNumber		varchar(20)		not null
	,Vendor				varchar(100)	not null
	,UPC				varchar(60)		not null
	,OrderDate			DateTime		not null
	,Quantity			int				not null
	,DatePaid			DateTime		not null
	,DateReceived		Date			null
	,CostPerUnit		money			null

	Primary Key (InvoiceNumber, Vendor)
	
)

Create Table Appointments(
	AppointmentID			int				not null identity(1,1)
	,CustomerID				int				not null
	,DateTime				datetime		not null
	,AptAddress				varchar(100)	not null
	,AptCity				varchar(50)		not null
	,AptState				char(2)			not null
	,AptZIP					varchar(10)		not null
	,EventStatus			varchar(50)		not null	
	,Notes					varchar(max)	null

	Primary Key (AppointmentID)
	
) 

Create table AppointmentEmployees(
	AppointmentID			int		not null
	,EmployeeID				int		not null
	,IsCashier				bit		not null

	Primary key (AppointmentID, EmployeeID)

)

Create table Transactions(
	TransactionID			int			not null identity(1,1)
	,AppointmentID			int			not null
	,PromotionID			int			null
	,GrandTotal				money		not null
	,PaymentMethod			varchar(20) not null
	,TransactionDateTime	datetime	not null
	
	Primary Key (TransactionID)

)

Create table TransactionItems(
	TransactionItemID		int		not null identity(1,1)
	,TransactionID			int		not null
	,ServiceID				int		null
	,UPC					varchar(60)		null
	,Quantity				int		not null

	Primary Key (TransactionItemID)


)
GO


