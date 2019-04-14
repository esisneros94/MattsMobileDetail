

CREATE Procedure [dbo].[ModifyAnAppointment]
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

	Insert into AppointmentEmployees(AppointmentID, EmployeeID, IsCashier)
	Values (@AppointmentID, @employeeID, 1);

Commit Transaction UpdateAppointmentRecord
END TRY

Begin Catch
	Rollback transaction UpdateAppointmentRecord
	Print 'There was an issue'
	return 2
END Catch

END





GO


