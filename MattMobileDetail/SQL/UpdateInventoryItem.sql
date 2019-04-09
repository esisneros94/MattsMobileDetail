CREATE Procedure [dbo].[UpdateInventoryItem]
   @UNC     varchar(60)
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
            UNC            = @UNC
            ,Name           = @Name
            ,Description     = @Description
            ,IsForSale       = @IsForSale
            ,Quantity        = @Quantity
            ,StartDate       = @StartDate
            ,EndDate         = @EndDate
         Where
            UNC = @UNC
    COMMIT Transaction UpdateInventory
    END TRY
    BEGIN Catch
            Print 'Something happened when updating'
    #        Rollback inventory UpdateInventory
    END CATCH


END