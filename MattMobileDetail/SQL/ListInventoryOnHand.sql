USE [MobileDetail]
GO
/****** Object:  StoredProcedure [dbo].[ListInventoryOnHand]    Script Date: 4/14/2019 2:08:58 PM ******/
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