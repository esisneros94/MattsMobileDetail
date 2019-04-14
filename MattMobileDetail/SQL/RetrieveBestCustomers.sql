USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[RetrieveBestCustomers]    Script Date: 4/13/2019 10:11:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[RetrieveBestCustomers]

as


Select
	c.FirstName
	,c.LastName
	,c.Email
	,c.Phone
	,sum(GrandTotal) TotalSpent
From
	Appointments as a
join
	Customers as c on c.CustomerID = a.CustomerID
join
	Transactions as t on t.AppointmentID = a.AppointmentID
where
	a.EventStatus = 'Completed'
group by
	c.FirstName
	,c.LastName
	,c.Email
	,c.Phone

GO

