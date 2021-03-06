USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[ModifyAnAppointment]    Script Date: 4/17/2019 6:58:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER Procedure [dbo].[ModifyAnAppointment]
	@AppointmentID int
	,@UserName varchar(50)
	,@AppointmentDatetime datetime
	,@AppointmentAddress varchar(100)
	,@AptCity varchar(50)
	,@AptState char(2)
	,@AptZIP varchar(10)
	,@eventStatus varchar(50)
	,@Notes varchar(max) = null

as

BEGIN

Declare @employeeID int
Set @employeeID = (Select employeeID from Employees where UserName = @UserName)

set @AptState = LTRIM(RTRIM(@AptState));

if LEN(@AptState) < 2
BEGIN
	Print 'invalid state'
	return 10 
END

select @employeeID

BEGIN TRY
BEGIN Transaction UpdateAppointmentRecord
	
	Update Appointments
	Set DateTime = @AppointmentDatetime
	,AptAddress = @AppointmentAddress
	,AptCity = @AptCity
	,AptState = @AptState
	,AptZIP = @AptZIP
	,EventStatus = @EventStatus
	where
		AppointmentID = @AppointmentID

	if not exists(Select * from AppointmentEmployees where EmployeeID = @employeeID and AppointmentID = @AppointmentID)
	BEGIN
		Insert into AppointmentEmployees(AppointmentID, EmployeeID, IsCashier)
		Values (@AppointmentID, @employeeID, 1);
	END

Commit Transaction UpdateAppointmentRecord
END TRY

Begin Catch
	Rollback transaction UpdateAppointmentRecord
	Print 'There was an issue'
	return 10000
END Catch

END






GO

