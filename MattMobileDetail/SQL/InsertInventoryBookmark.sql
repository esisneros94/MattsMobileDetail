CREATE Procedure [dbo].[InsertInventoryBookmark]
    @UNC     varchar(60)
    ,@Name          varchar(100)
    ,@Vendor       varchar(100)
    ,@URL         varchar(1000)

as


--Validate All Inputs
    @CleanUNC     varchar(60)
    ,@CleanName          varchar(100)
    ,@CleanVendor       varchar(100)
    ,@CleanURL         varchar(1000)


Set @CleanUNC              = LTRIM(RTRIM(@UNC));
Set @CleanName             = LTRIM(RTRIM(@Name));
Set @CleanVendor      = LTRIM(RTRIM(@Vendor));
Set @CleanURL       = trim(REPLACE(@URL));

if(@CleanUNC like '%[%;:+@*]%')
BEGIN
    Print 'Invalid UNC'
    Return
END
if(@CleanName like '%[%;:+@*]%')
BEGIN
    Print 'Invalid Item Name'
    Return
END
if(@CleanVendor like '%[%;:+@*]%')
BEGIN
    Print 'Invalid Vendor'
    Return
END
if(@CleanURL like '%[%;:+@*]%')
BEGIN
    Print 'Invalid For Sale Status'
    Return
END


If exists (Select Inventory.UPC, Inventory.Name, InventoryBookmark.Vendor, InventoryBookmark.URL From Inventory, InventoryBookmark Where Inventory.UPC = InventoryBookmark.UPC)
    BEGIN
        Print 'Item is already listed in the inventory bookmark database'
        return;
    END
Else
    BEGIN
        BEGIN TRY
            Insert into Inventory (UPC, Name, Vendor, URL)
            Values (@CleanUPC, @CleanName, @CleanVendor, @CleanURL)
        END TRY
        BEGIN CATCH
            Print 'Something went wrong buddy'
            Return 100;
        END CATCH
    END
