USE [MobileDetail]
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionSummary]    Script Date: 5/4/2019 12:38:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetTransactionSummary] 
	@TransactionId int
as
BEGIN
	select
		c.FirstName
		,c.LastName
		,c.Phone
		,c.Email
		,a.DateTime
		,t.GrandTotal
		,t.PaymentMethod
	From
		Transactions as t
	join
		TransactionItems as ti on ti.TransactionID = t.TransactionID
	join
		Appointments as a on a.AppointmentID = t.AppointmentID
	join
		Customers as c on c.CustomerID = a.CustomerID
	where
		t.TransactionID = @TransactionID

END
