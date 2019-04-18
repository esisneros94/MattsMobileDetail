USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[ListInventoryOnHand]    Script Date: 4/17/2019 6:59:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[ListInventoryOnHand]

as

select
	UPC
	,Name
	,IsForSale
	,Quantity
From
	Inventory as i
Order by
	Quantity asc
GO

