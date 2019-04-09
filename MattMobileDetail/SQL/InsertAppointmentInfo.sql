
CREATE Procedure [dbo].[InsertAppointmentInfo]
	@CustomerID int
	,@AppointmentDateTime datetime
	,@AppointmentAddress varchar(50)
	,@AptCity varchar(50)
	,@AptState char(2)
	,@AptZIP varchar(10)
	,@EventNotes varchar(max) = null
as


--Validate All Inputs
Declare @CleanAppointmentAddress		varchar(50)
Declare @CleanAptCity					varchar(50)
Declare @CleanAptZIP					varchar(10)
Declare @CleanEventNotes				varchar(max)

Set	@CleanAppointmentAddress	= LTRIM(RTRIM(@AppointmentAddress));
Set @CleanAptCity				=  LTRIM(RTRIM(@AptCity));
Set @CleanAptZIP				=  LTRIM(REPLACE(@AptZIP, ' ',''));

if(@CleanAppointmentAddress like '%[%;:+@]%')
BEGIN
	Print 'Invalid first name'
	Return
END
if(@CleanAptCity like '%[%;:+]%')
BEGIN
	print 'invalid city'
	Return
END
if(@CleanAptZIP like '%[%;:+@]%')
BEGIN
	Print 'Invalid first name'
	Return
END
if(@CleanEventNotes like '%Drop Table%')
BEGIN
	Print 'Invalid notes'
	Return
END


If exists (Select AppointmentID From Appointments where CustomerID = @CustomerID and DateTime = @AppointmentDateTime)
	BEGIN
		Print 'There is already an appointment for this customer at this time'
		return;
	END
Else
	BEGIN
		--BEGIN TRY
			Insert into Appointments(CustomerID, DateTime, AptAddress, AptCity, AptState, AptZIP, EventStatus, Notes)
			Values(@CustomerID, @AppointmentDateTime, @AppointmentAddress, @AptCity, @AptState, @AptZIP, 'Pending', @EventNotes)
			Select AppointmentID From Appointments where CustomerID = @CustomerID and DateTime = @AppointmentDateTime;
		--END TRY
		--BEGIN CATCH
		--	Print 'Something went wrong'
		--	Return 100;
		--END CATCH
	END
GO


