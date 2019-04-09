

CREATE Procedure [dbo].[InsertCustomerRecord]
	@FirstName varchar(50)
	,@LastName varchar(50)
	,@City	   varchar(50)
	,@State    char(2)
	,@ZIP      varchar(10)
	,@Phone    varchar(20)
	,@Email    varchar(40)
as


--Validate All Inputs
Declare @CleanFirstName varchar(50)
Declare @CleanLastName	varchar(50)
Declare @CleanCity		varchar(50)
Declare @CleanState		char(2)
Declare @CleanZIP		varchar(10)
Declare @CleanPhone		varchar(20)
Declare @CleanEmail		varchar(40)


Set	@CleanFirstName = LTRIM(RTRIM(@FirstName));
Set @CleanLastName =  trim(REPLACE(@LastName,' ',''));
Set @CleanCity =      LTRIM(RTRIM(@City));
Set @CleanState =     LTRIM(RTRIM(@State));
Set @CleanZIP =       trim(REPLACE(@ZIP,' ',''));
Set @CleanPhone =     LTRIM(RTRIM(@Phone));
Set @CleanEmail =     trim(REPLACE(@Email,' ',''));


if(@CleanFirstName like '%[%;:+@]%')
BEGIN
	Print 'Invalid first name'
	Return
END
if(@CleanLastName like '%[%;:+]%')
BEGIN
	Return
END
if(@CleanCity like '%[%;:+@]%')
BEGIN
	Print 'Invalid first name'
	Return
END
if(@CleanPhone like '%[%;:+@]%')
BEGIN
	Print 'Invalid Phone'
	Return
END



If exists (Select CustomerID From Customers where FirstName = @CleanFirstName and LastName = @CleanLastName and Email = @CleanEmail)
	BEGIN
		Select CustomerID From Customers where FirstName = @CleanFirstName and LastName = @CleanLastName and Email = @CleanEmail;
		return;
	END
Else
	BEGIN
		BEGIN TRY
			Insert into Customers(FirstName, LastName, City, State, ZIP, Phone, Email)
			Values(@CleanFirstName, @CleanLastName, @CleanCity, @CleanState, @CleanZIP, @CleanPhone, @CleanEmail)
			Select CustomerID From Customers where FirstName = @CleanFirstName and LastName = @CleanLastName and Email = @CleanEmail;
		END TRY
		BEGIN CATCH
			Print 'Something went wrong'
			Return 100;
		END CATCH
	END




GO


