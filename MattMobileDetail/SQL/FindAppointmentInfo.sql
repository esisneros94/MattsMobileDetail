USE [MobileDetail]
GO
/****** Object:  StoredProcedure [dbo].[FindAppointmentInfo]    Script Date: 5/4/2019 12:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[FindAppointmentInfo]
	@FirstName varchar(50)
	,@LastName varchar(50)
	,@AppointmentDate varchar(20)

as

BEGIN


Declare @AppontmentLowerBound date
Set @AppontmentLowerBound = CONVERT(date, @AppointmentDate)

Declare @UpperBoundDate date
Set @UpperBoundDate = DATEADD(DD, 1, @AppontmentLowerBound)

select
	AppointmentID
	,FirstName
	,LastName
	,Phone
	,Email
From
	Appointments as a
join
	Customers as c on c.CustomerID = a.CustomerID
where
	a.EventStatus = 'Completed'
	and a.DateTime between @AppontmentLowerBound and @UpperBoundDate
	and c.FirstName = @FirstName
	and c.LastName = @LastName



END