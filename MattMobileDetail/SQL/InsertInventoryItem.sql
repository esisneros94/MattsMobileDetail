USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[InsertInventoryItem]    Script Date: 4/17/2019 7:00:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[InsertInventoryItem]
    @UPC     varchar(60)
    ,@Name          varchar(100)
    ,@Description       varchar(100)
    ,@IsForSale         varchar(100)
    ,@Quantity         bit
    ,@StartDate   date
    ,@EndDate    date
as


--Validate All Inputs
DECLARE
    @CleanUPC     varchar(60)
    ,@CleanName          varchar(100)
    ,@CleanDescription       varchar(100)
    ,@CleanIsForSale         varchar(100)
    ,@CleanQuantity         bit
    ,@CleanStartDate   date
    ,@CleanEndDate    date


Set @CleanUPC              = LTRIM(RTRIM(@UPC));
Set @CleanName             = LTRIM(RTRIM(@Name));
Set @CleanDescription      = LTRIM(RTRIM(@Description));
Set @CleanIsForSale       = LTRIM(RTRIM(@IsForSale));
Set @CleanQuantity        = LTRIM(RTRIM(@Quantity));
Set @CleanStartDate         =LTRIM(RTRIM(@StartDate));
Set @CleanEndDate           =LTRIM(RTRIM(@EndDate));

if(@CleanUPC like '%[%;:+@*=]%')
BEGIN
    Print 'Invalid UNC'
    Return
END
if(@CleanName like '%[%;:+@*=]%')
BEGIN
    Print 'Invalid Item Name'
    Return
END
if(@CleanDescription like '%[%;:+@*=]%')
BEGIN
    Print 'Invalid Description'
    Return
END
if(@CleanIsForSale like '%[%;:+@*=]%')
BEGIN
    Print 'Invalid For Sale Status'
    Return
END
if(@CleanQuantity like '%[%;:+@*=]%')
BEGIN
    Print 'Invalid Quantity'
    Return
END
if(@CleanStartDate like '%[%;:+@*=]%')
BEGIN
    Print 'Invalid Start Date'
    Return
END
if(@CleanEndDate like '%[%;:+@*=]%')
BEGIN
    Print 'Invalid End Date'
    Return
END

If exists (Select UPC, Name, Description, IsForSale, Quantity, StartDate, EndDate From Inventory Where UPC = @CleanUPC)
    BEGIN
        Print 'Item is already listed in the inventory database'
        return;
    END
Else
    BEGIN
        BEGIN TRY
            Insert into Inventory (UPC, Name, Description, IsForSale, Quantity, StartDate, EndDate)
            Values (@CleanUPC, @CleanName, @CleanDescription, @CleanIsForSale, @CleanQuantity, @CleanStartDate, @CleanEndDate)
        END TRY
        BEGIN CATCH
            Print 'Something went wrong buddy'
            Return 100;
        END CATCH
    END

GO

