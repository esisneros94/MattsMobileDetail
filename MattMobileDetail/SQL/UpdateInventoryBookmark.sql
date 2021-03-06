USE [MobileDetail]
GO
/****** Object:  StoredProcedure [dbo].[UpdateInventoryBookmark]    Script Date: 5/6/2019 7:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
         Update 
            InventoryBookmark
         set 
            UPC            = @UPC
            ,Vendor     = @Vendor
            ,URL       = @URL

         Where
            UPC = @UPC
    COMMIT  Transaction UpdateInventoryBookmark
    END TRY
    BEGIN Catch
            Print 'Something happened when updating'
            Rollback Transaction UpdateInventoryBookmark
    END CATCH


END