USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[PopulatePromotionsTable]    Script Date: 4/17/2019 6:58:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[PopulatePromotionsTable]

as

Declare @Temp Table
(
	PromotionID int, 
	Name varchar(50), 
	Description varchar(max), 
	StartDate datetime, 
	EndDate datetime 

)

Insert into @Temp
Select 
	PromotionID, 
	Name, 
	Description, 
	StartDate, 
	EndDate 
From 
	Promotions 
where
	EndDate is null



Insert into @Temp
Select 
	PromotionID, 
	Name, 
	Description, 
	StartDate, 
	EndDate 
From 
	Promotions 
where
	EndDate is not null
order by 
	EndDate desc


Select
	*
From
	@Temp
GO

