USE [MobileDetail]
GO
/****** Object:  StoredProcedure [dbo].[AddItemToTransaction]    Script Date: 5/4/2019 12:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[AddItemToTransaction]
	@TransactionID		 int
	,@ItemId			 varchar(10)
	,@Name				 varchar(30)
	,@ItemType			 varchar(20)
	,@Quantity			 tinyint

as


BEGIN
	
	IF EXISTS(Select * from Transactions where TransactionID = @TransactionID)
	BEGIN
		If @ItemType = 'Service'
		BEGIN

			declare @ServiceUnitPrice money
			declare @ServiceItemCosts money
			set @ServiceUnitPrice = (select s.Cost from Services as s where ServiceID = @ItemId)
			set @ServiceItemCosts = sum(@ServiceUnitPrice * @Quantity)

			Insert into TransactionItems(TransactionID, ServiceID, UPC, Quantity)
			Values(@TransactionID, @ItemId, null, @Quantity)

			Declare @GrandTotalService Money
			set @GrandTotalService = (Select GrandTotal From Transactions where TransactionID = @TransactionID)

			declare @GrandTotalForService money
			set @GrandTotalForService =  Sum(@GrandTotalService + @ServiceItemCosts)

			Update Transactions
			Set GrandTotal = @GrandTotalForService
			where TransactionID = @TransactionID


		END
		If @ItemType = 'Product'
		BEGIN
			
			declare @ProductUnitPrice money
			declare @ProductItemCosts money
			set @ProductUnitPrice = (select 0 from Inventory as i where UPC = @ItemId)
			set @ProductItemCosts = sum(@ProductUnitPrice * @Quantity)

			Insert into TransactionItems(TransactionID, ServiceID, UPC, Quantity)
			Values(@TransactionID, null, @ItemId, @Quantity)

			Declare @GrandTotalProduct Money
			set @GrandTotalProduct = (Select GrandTotal From Transactions where TransactionID = @TransactionID)

			declare @GrandTotalForProduct money
			set @GrandTotalForProduct =  Sum(@GrandTotalProduct + @ProductItemCosts)

			Update Transactions
			Set GrandTotal = @GrandTotalForProduct
			where TransactionID = @TransactionID



		END
	END

END