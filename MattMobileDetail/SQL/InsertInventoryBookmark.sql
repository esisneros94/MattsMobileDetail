

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


Set @CleanUPC              = trim(REPLACE(@UPC, ' ', ''));
Set @CleanVendor      = LTRIM(RTRIM(@Vendor));
Set @CleanURL       = trim(REPLACE(@URL, ' ', ''));

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

If not exists (Select * from Vendors where Name = @CleanVendor)
    BEGIN
        Insert into Vendors
            Values (@CleanVendor, cast(getdate() as date), null)
    END
Else


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
