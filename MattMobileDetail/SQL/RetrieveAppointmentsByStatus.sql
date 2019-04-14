USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[RetrieveAppointmentsByStatus]    Script Date: 4/13/2019 10:11:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[RetrieveAppointmentsByStatus]
@Status varchar(50)

as

Select
	a.AppointmentID
	,e.UserName
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
where
	EventStatus = @Status

GO

