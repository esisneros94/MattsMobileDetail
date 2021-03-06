USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[RetrieveAppointmentsByStatus]    Script Date: 4/17/2019 6:58:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[RetrieveAppointmentsByStatus]
@Status varchar(50)

as

Select
	a.AppointmentID
	,e.UserName
	,c.LastName + ', ' + c.FirstName [CustomerName]
	,DateTime
	,AptAddress
	,AptCity
	,AptState
	,AptZIP
	,EventStatus
From
	Appointments as a
join
	AppointmentEmployees as ae on a.AppointmentID = ae.AppointmentID
join
	Employees as e on e.EmployeeID = ae.EmployeeID
join
	Customers as c on c.CustomerID = a.CustomerID
where
	EventStatus = @Status

GO

