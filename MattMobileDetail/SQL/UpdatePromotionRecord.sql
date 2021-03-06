
CREATE Procedure [dbo].[UpdatePromotionRecord]
	@PromotionID			varchar(5)
	,@Name					varchar(100)
	,@Description			varchar(max)
	,@StartDate				datetime
	,@EndDate				datetime
AS

begin

if(@EndDate = '')
BEGIN
	SET @EndDate = null
END

-- Making sure data types are correct and not manipulated
BEGIN TRY
	SELECT CAST(@PromotionID AS int)
	SELECT CAST(@StartDate AS date)
END TRY
BEGIN CATCH
	Print 'Something went wrong'
	return 1000;
END CATCH

 
--Updating the record 
	BEGIN TRY
	BEGIN TRANSACTION UpdatePromo
		 Update 
			Promotions
		 set 
			Name			= @Name
			,Description	= @Description
			,StartDate		= @StartDate  
			,EndDate		= @EndDate
		 Where
			PromotionID = @PromotionID
	COMMIT Transaction UpdatePromo
	END TRY
	BEGIN Catch
			Print 'Something happened when updating'
			Rollback transaction UpdatePromo
	END CATCH


END






