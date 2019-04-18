USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[InsertVehicleRecord]    Script Date: 4/17/2019 6:59:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER Procedure [dbo].[InsertVehicleRecord]
	@CustomerID		int
	,@Year			int
	,@Make			varchar(50)
	,@Model			varchar(100)
	,@Color			varchar(20)
	,@PlateNumber	varchar(10)
	,@PlateState	char(2)
as


--Validate All Inputs
Declare @CleanMake			varchar(50)
Declare @CleanModel			varchar(50)
Declare @CleanColor			varchar(50)
Declare @CleanPlateNumber	varchar(10)
Declare @CleanPlateState	CHAR(2)


Set	@CleanMake				= LTRIM(RTRIM(@Make));
Set @CleanModel				= LTRIM(RTRIM(@Model));
Set @CleanColor				= LTRIM(RTRIM(@Color));
Set @CleanPlateNumber		= LTRIM(RTRIM(@PlateNumber));
Set @CleanPlateState		= LTRIM(RTRIM(@PlateState));

if(@CleanMake like '%[%;:+@*]%')
BEGIN
	Print 'Invalid Make name'
	Return
END
if(@CleanModel like '%[%;:+@*]%')
BEGIN
	Print 'Invalid Model Name'
	Return
END
if(@CleanColor like '%[%;:+@*]%')
BEGIN
	Print 'Invalid Color'
	Return
END
if(@CleanPlateNumber like '%[%;:+@*]%')
BEGIN
	Print 'Invalid PLate Number'
	Return
END
if(@CleanPlateState like '%[%;:+@*]%')
BEGIN
	Print 'Invalid State'
	Return
END

If exists (Select CustomerID, Year, Make, Model From CustomerVehicle where CustomerID = @CustomerID and Make = @CleanMake and Model = @Model and Year = @Year)
	BEGIN
		Print 'Car is already in database for this customer'
		return;
	END
Else
	BEGIN
		BEGIN TRY
			Insert into CustomerVehicle (CustomerID, Year, Make, Model, LicensePlateNumber, LicensePlateState, Color)
			Values (@CustomerID, @Year, @CleanMake, @CleanModel, @CleanPlateNumber, @CleanPlateState, @CleanColor)
		END TRY
		BEGIN CATCH
			Print 'Something went wrong buddy'
			Return 100;
		END CATCH
	END






GO

