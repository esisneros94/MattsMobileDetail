USE [MobileDetail]
GO
/****** Object:  StoredProcedure [dbo].[UpdateInventoryBookmark]    Script Date: 4/11/2019 8:52:23 PM ******/

ALTER Procedure [dbo].[UpdateInventoryBookmark]
    @UPC     varchar(60)
    ,@Vendor       varchar(100)
    ,@URL         varchar(1000)

AS

begin

-- Making sure data types are correct and not manipulated
BEGIN TRY
    SELECT CAST(@UPC AS varchar)
    SELECT CAST(@URL AS varchar)
END TRY
BEGIN CATCH
    Print 'Something went wrong'
    return 1000;
END CATCH

 
--Updating the record 
    BEGIN TRY
    BEGIN TRANSACTION UpdateInventoryBookmark
			Update InventoryBookmark
			set 
				URL= @URL
			Where
				 UPC = @UPC
				 and Vendor = @Vendor
    COMMIT Transaction UpdateInventoryBookmark
    END TRY
    BEGIN Catch
            Print 'Something happened when updating'
            Rollback Transaction UpdateInventoryBookmark
    END CATCH


END