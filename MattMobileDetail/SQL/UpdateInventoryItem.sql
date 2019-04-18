USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[UpdateInventoryItem]    Script Date: 4/17/2019 6:57:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[UpdateInventoryItem]
   @UPC     varchar(60)
    ,@Name          varchar(100)
    ,@Description       varchar(100)
    ,@IsForSale         varchar(100)
    ,@Quantity         bit
    ,@StartDate   date
    ,@EndDate    date
AS

begin

if(@EndDate = '')
BEGIN
    SET @EndDate = null
END

-- Making sure data types are correct and not manipulated
BEGIN TRY
    SELECT CAST(@Quantity AS int)
    SELECT CAST(@StartDate AS date)
END TRY
BEGIN CATCH
    Print 'Something went wrong'
    return 1000;
END CATCH

 
--Updating the record 
    BEGIN TRY
    BEGIN TRANSACTION UpdateInventory
         Update 
            Inventory
         set 
            UPC            = @UPC
            ,Name           = @Name
            ,Description     = @Description
            ,IsForSale       = @IsForSale
            ,Quantity        = @Quantity
            ,StartDate       = @StartDate
            ,EndDate         = @EndDate
         Where
            UPC = @UPC
    COMMIT Transaction UpdateInventory
	END TRY
    BEGIN Catch
            Print 'Something happened when updating'
            Rollback Transaction UpdateInventory
    END CATCH


END
GO

