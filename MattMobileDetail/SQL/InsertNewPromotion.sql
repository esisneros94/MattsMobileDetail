CREATE Procedure InsertNewPromotion
	@Name varchar(50)
	,@Description varchar(max)
	,@StartDate date
	,@EndDate varchar(20) = null
as

Declare @TrueEndDate date

if @EndDate = '' or @EndDate = 'null'
BEGIN TRY
	Set @TrueEndDate = null
END TRY
BEGIN CATCH
	Print 'Something went wrong'
	return 900;
END CATCH
ELSE
BEGIN TRY
	SET @TrueEndDate = cast(@EndDate as date)
END TRY
BEGIN CATCH
	Print 'Something went wrong'
	return 800;
END CATCH

BEGIN TRY
	Insert into Promotions(Name, Description, StartDate, EndDate)
	Values (@Name, @Description, @StartDate, @TrueEndDate)
END TRY
BEGIN CATCH
	Print 'Something went wrong'
	Return 100;
END CATCH

