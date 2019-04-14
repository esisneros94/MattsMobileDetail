USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[RetrieveBestCustomers]    Script Date: 4/14/2019 2:30:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER Procedure [dbo].[RetrieveBestCustomers]

as


Select Top 20
	c.FirstName
	,c.LastName
	,c.Email
	,c.Phone
	,cast(sum(GrandTotal)as decimal(10, 2)) TotalSpent
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


