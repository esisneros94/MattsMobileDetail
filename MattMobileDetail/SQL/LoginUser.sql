USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 4/17/2019 6:59:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[LoginUser]
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

