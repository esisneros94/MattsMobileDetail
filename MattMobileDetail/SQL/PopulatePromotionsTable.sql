Create Procedure PopulatePromotionsTable

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