CREATE Procedure [dbo].[UpdateInventoryBookmark]
    @UNC     varchar(60)
    ,@Name          varchar(100)
    ,@Vendor       varchar(100)
    ,@URL         varchar(1000)

AS

begin

-- Making sure data types are correct and not manipulated
BEGIN TRY
    SELECT CAST(@UNC AS varchar)
    SELECT CAST(@URL AS varchar)
END TRY
BEGIN CATCH
    Print 'Something went wrong'
    return 1000;
END CATCH

 
--Updating the record 
    BEGIN TRY
    BEGIN TRANSACTION UpdateInventoryBookmark
         Update 
            Inventory
         set 
            UNC            = @UNC
            ,Name           = @Name
            ,Vendor     = @Vendor
            ,URL       = @URL

         Where
            UNC = @UNC
    COMMIT InventoryBookmark UpdateInventoryBookmark
    END TRY
    BEGIN Catch
            Print 'Something happened when updating'
    #        Rollback InventoryBookmark UpdateInventoryBookmark
    END CATCH


END