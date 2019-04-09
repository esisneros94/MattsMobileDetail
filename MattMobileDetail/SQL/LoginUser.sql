

CREATE PROCEDURE [dbo].[LoginUser]
	@username varchar(16),
	@password varchar(16)
AS
	
Declare 
	@cleanusername varchar(64),
	@Cleanpassword varchar(16)

Set	@cleanusername = LTRIM(RTRIM(@username));
Set @password = LTRIM(RTRIM(@password));

if (@cleanusername like '%Drop Table%')
BEGIN
	return;
END

if (@CleanPassword like '%Drop Table%')
BEGIN
	return;
END

Select 
	*
From 
	Employees 
where 
	UserName = @cleanusername
	and PassKey = @password;
GO


