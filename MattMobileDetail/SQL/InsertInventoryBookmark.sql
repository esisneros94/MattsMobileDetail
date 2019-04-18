USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[InsertInventoryBookmark]    Script Date: 4/17/2019 7:00:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER Procedure [dbo].[InsertInventoryBookmark]
    @UPC     varchar(60)
    ,@Vendor       varchar(100)
    ,@URL         varchar(1000)

as

--Validate All Inputs
    DECLARE
	@CleanUPC     varchar(60)
    ,@CleanVendor       varchar(100)
    ,@CleanURL         varchar(1000)


Set @CleanUPC              = LTRIM(RTRIM(@UPC));
Set @CleanVendor      = LTRIM(RTRIM(@Vendor));
Set @CleanURL       = LTRIM(RTRIM(@URL));

if(@CleanUPC like '%[%;:+@*=]%')
BEGIN
    Print 'Invalid UPC'
    Return
END
if(@CleanVendor like '%[%;:+@*=]%')
BEGIN
    Print 'Invalid Vendor'
    Return
END
if(@CleanURL like '%[%;:+@*=]%')
BEGIN
    Print 'Invalid For Sale Status'
    Return
END

-- we need to add in the if statment to check if vendor exists in DB
-- If exists (Select Vendor From Vendors where Vendor = @CleanVendor
If exists (Select IB.UPC, IB.Vendor, IB.URL From MobileDetail..InventoryBookmark as IB Where UPC = @CleanUPC AND IB.URL = @CleanURL)
    BEGIN
        Print 'Invalid request'
        return;
    END
Else
    BEGIN
        BEGIN TRY
            Insert into InventoryBookmark (UPC, Vendor, URL)
            Values (@CleanUPC, @CleanVendor, @CleanURL)
        END TRY
        BEGIN CATCH
            Print 'Something went wrong buddy'
            Return 100;
        END CATCH
    END

GO

