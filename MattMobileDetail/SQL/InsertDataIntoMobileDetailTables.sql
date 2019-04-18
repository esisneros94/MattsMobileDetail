USE [MobileDetail]
GO

/****** Object:  StoredProcedure [dbo].[InsertDataIntoMobileDetailTables]    Script Date: 4/17/2019 7:01:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER Procedure [dbo].[InsertDataIntoMobileDetailTables]

as


Insert into Employees (FirstName, LastName, Phone, JobTitle, UserName, PassKey)
	Values('Jimmy','Neutron','(505)888-5959', 'Owner', 'jneutron', 'asdf4321!!'),
			('Tommy','Pickles','(575)515-3212', 'Manager', 'tpickles', 'asdf4321!!'),
			('Barnacle','Boy','(312)450-9962', 'Employee', 'barnboy', 'asdf4321!!'),
			('Danny','Phantom','(915)212-5502', 'Employee', 'dphantom', 'asdf4321!!'),
			('Invader','Zim','(210)112-5602', 'Employee', 'invaderz', 'asdf4321!!')


Insert into Customers (FirstName, LastName, City, State, ZIP, Phone, Email)
	VALUES ('Mermaid','Man','Albuquerque','NM','87120','(505)915-3656','mermaidm@gmail.com'),
			('Otto','Rocket','Albuquerque','NM','87113','(505)210-1425','ottorock@hotmail.com'),
			('Sandy','Cheeks','Rio Rancho','NM','87114','(210)976-5415','sandyc@yahoomail.com')


Insert into Inventory (UPC, Name, Description, IsForSale, Quantity, StartDate, EndDate)
	VALUES('212-ABCD', 'Car Soap', 'Standard soap for all car washes', 0, 60, Cast(Getdate() as date), null),
			('212-54DC', 'Black Ice Air Freshener', 'Basic Air freshener for cars', 1, 100, Cast(Getdate() as date), null),
			('212-45TH', 'Dashboard Wipes', 'Wipes to protect dashboard from dust and grime', 1, 20, Cast(Getdate() as date), null),
			('212-JK7', 'Car Wax', 'Car wax for premium cars', 0, 30, Cast(Getdate() as date), null)

Insert into Vendors(Name, StartDate, EndDate)
	VALUES ('Target', '02/01/2018', null),
			('AutoZone', '02/01/2018', null),
			('Walmart', '02/01/2018', null),
			('LittleTrees', '02/01/2018', null),
			('Amazon', '02/01/2018', null)


Insert into Promotions (Name, Description, StartDate, EndDate)
	VALUES ('Half off premium wash','Getting half off 1 premium wash per transaction','1/1/2019',null),
			('Free tire cleaning service','Free tire service for each car on the transaction','1/1/2019',null),
			('BOGO Free','Buying one wash will get you another one free','1/1/2019',null)

Insert into Services (Name, Description, Cost, EstimatedTime, StartDate, EndDate)
	VALUES('Standard Wash','The Standard Wash',40.00, 1.00 , '1/18/2018', null),
			('Medium Wash','The Medium Wash', 70.00, 1.50 , '1/18/2018', null),
			('Platnum Wash','The Best of the Best Wash', 120.00, 2.00 , '1/18/2018', null),
			('Tire Wax','Standard wax of four tires', 20.00, .5 , '1/18/2018', null)

Insert into EmployeeWage (EmployeeID, EffectiveDate, Wage, EndDate)
	VALUES (1, cast(getdate() as date), 20.00, null),
			(2, cast(getdate() as date), 10.00, null),
			(3, cast(getdate() as date), 8.50, null),
			(4, cast(getdate() as date), 8.50, null),
			(5, cast(getdate() as date), 8.50, null)


Insert into CustomerVehicle (CustomerID, Year, Make, Model, LicensePlateNumber, LicensePlateState, Color)
	VALUES (1, 2017, 'Nissan', 'GTR', 'ABC-567', 'NM', 'Black'),
			(2, 2018, 'Ford', 'Shelby GT-350', '989-KLK', 'NM', 'Blue'),
			(3, 2016, 'Subaru', 'WRX STI', '765-ADC', 'NM', 'White'), 
			(3, 2019, 'Mitsubishi', 'Lancer Evo', '112-PLM', 'NM', 'Black')


Insert into InventoryBookmark (UPC, Vendor, URL)
	VALUES('212-ABCD','Amazon','https://www.amazon.com/Turtle-Wax-50597-Power-Wash/dp/B07G62869S/ref=asc_df_B07G62869S/?tag=hyprod-20&linkCode=df0&hvadid=312105316935&hvpos=1o4&hvnetw=g&hvrand=18020631778255457895&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9030460&hvtargid=aud-836408683912:pla-569679816671&psc=1'),
		('212-ABCD','Walmart','https://www.walmart.com/ip/Turtle-Wax-Max-Power-Car-Wash-100-oz/49692798?wmlspartner=wlpa&selectedSellerId=0&wl13=2924&adid=22222222227037816273&wl0=&wl1=g&wl2=c&wl3=80425906609&wl4=aud-482018033502:pla-177657373249&wl5=9030460&wl6=&wl7=&wl8=&wl9=pla&wl10=8175035&wl11=local&wl12=49692798&wl13=2924&veh=sem&gclid=CjwKCAiAqt7jBRAcEiwAof2uK6OwBqpXnrWgHgcCHxuGHfGEWluK3Ry7qKJnq_PSkbRgXKE3b9JFAxoC0y8QAvD_BwE'),
		('212-ABCD','AutoZone','https://www.autozone.com/wash-cleaners-and-exterior-care-products/wash/turtle-wax-max-power-car-wash-100-oz/813288_0_0'),
		
		('212-54DC','AutoZone','https://www.autozone.com/interior-detailing-and-car-care-products/air-freshener/auto-expressions-paper-air-freshener/183421_0_0?cmpid=PLA:US:EN:AD:NL:1000000:PAC:1700000870&gclid=CjwKCAiAqt7jBRAcEiwAof2uK-hfUu_4UcQOgAHId6tMJn8flU3XU-zUguTGuOoIKlDGzT86BA3QwRoCMbAQAvD_BwE&gclsrc=aw.ds'),
		('212-54DC','Target','https://www.target.com/p/little-trees-174-black-ice-air-freshener-3pk/-/A-13780901?ref=tgt_adv_XS000000&AFID=google_pla_df&fndsrc=tgtao&CPNG=PLA_Home%2BImprovement%2BShopping_Local&adgroup=SC_Home%2BImprovement&LID=700000001170770pgs&network=g&device=c&location=9030460&ds_rl=1246978&ds_rl=1247068&ds_rl=1246978&gclid=CjwKCAiAqt7jBRAcEiwAof2uK5MZ3O3ZJPRIqt4fxg7VYWWWJz-p1n0Dr4gNAWPo1xMGmX1LzITARxoCDNoQAvD_BwE&gclsrc=aw.ds'),
		('212-54DC','LittleTrees','https://www.littletrees.com/product/Black-Ice-Hanging-Little-Tree-Air-Freshner'),

		('212-45TH','Target','https://www.target.com/p/armor-all-auto-surface-cleaning-wipes-50-ct/-/A-13507475?ref=tgt_adv_XS000000&AFID=google_pla_df&fndsrc=tgtao&CPNG=PLA_Home%2BImprovement%2BShopping_Local&adgroup=SC_Home%2BImprovement&LID=700000001170770pgs&network=g&device=c&location=9030460&ds_rl=1246978&ds_rl=1247068&ds_rl=1246978&gclid=CjwKCAiAqt7jBRAcEiwAof2uKxEGN2BRm00rom1J-DIov2WedikM3m-d2se2lvPCEjy9ZGLCpFTDghoCO9AQAvD_BwE&gclsrc=aw.ds'),
		('212-45TH','Walmart','https://www.walmart.com/ip/Armor-All-Cleaning-Wipes-50-Count-Car-Cleaning-Auto-Detailing/16641219?wmlspartner=wlpa&selectedSellerId=0&wl13=2924&adid=22222222227023667259&wl0=&wl1=g&wl2=c&wl3=62007707328&wl4=aud-482018033502:pla-88446588768&wl5=9030460&wl6=&wl7=&wl8=&wl9=pla&wl10=8175035&wl11=local&wl12=16641219&wl13=2924&veh=sem&gclid=CjwKCAiAqt7jBRAcEiwAof2uKzsQp-CNkPsiViI-ZBQk8Rg9D7PdkI3D5EDojONk4LHNuTvmN2h97xoCnwYQAvD_BwE'),
		('212-45TH','AutoZone','https://www.autozone.com/interior-detailing-and-car-care-products/wipes/armor-all-15-ct-clean-up-wipes/348340_0_0?source=pepperjam&affiliate_id=61806&click_id=2620937188&ppjmid=61806&cmpid=AFF:US:EN:AZ:NL:1000000:GEN:ppjmid61806-8-11065')


Insert into VendorOrders (InvoiceNumber, Vendor, UPC, OrderDate, Quantity, DatePaid, DateReceived, CostPerUnit)
	VALUES ('101', 'Target', '212-54DC', '10/01/2018', 50, '10/01/2018', '10/08/2018', 3.20),
			('521', 'Target', '212-54DC', '11/13/2018', 50, '11/13/2018', '11/20/2018', 3.30),
			('621', 'Target', '212-54DC', '01/22/2019', 50, '01/22/2019', '01/28/2019', 3.31),

			('212', 'AutoZone', '212-45TH', '11/12/2018', 100, '11/12/2018', '11/20/2018', 3.31),
			('1023', 'Walmart', '212-45TH', '01/03/2019', 100, '01/03/2019', '01/10/2019', 3.31),
			('2511', 'Walmart', '212-45TH', '01/19/2019', 100, '01/19/2019', '01/26/2019', 3.31),

			('4023', 'AutoZone', '212-ABCD', '12/16/2018', 20, '12/16/2018', '12/26/2018', 16.20),
			('5020', 'AutoZone', '212-ABCD', '01/03/2019', 20, '01/03/2019', '01/12/2019', 16.20),
			('5132', 'AutoZone', '212-ABCD', '02/01/2019', 20, '02/01/2019', '02/11/2019', 16.20)
	
	
			
Insert into Appointments (CustomerID, DateTime, AptAddress, AptCity, AptState, AptZIP, Notes, EventStatus)
	Values (1, '02/01/2019 13:00:00', '800 Palomas Dr', 'Albuquerque', 'NM', '87106', null, 'Completed'),
			(2, '02/12/2019 15:30:00', '900 Steven Segal Road', 'Albuquerque', 'NM', '87110', null, 'Completed'),
			(2, '02/14/2019 12:00:00', '1000 Rodando Blvd', 'Albuquerque', 'NM', '87112', null, 'Completed'),
			(3, '02/20/2019 14:00:00', '1100 Griegos Drive', 'Albuquerque', 'NM', '87112', null, 'Completed')


Insert into AppointmentEmployees (AppointmentID, EmployeeID, isCashier)
VALUES (1,1,1),
		(2,1,1),
		(2,2,0),
		(3,1,0),
		(3,2,1),
		(4,1,1)


Insert into Transactions(AppointmentID, PromotionID, GrandTotal, PaymentMethod, TransactionDateTime)
Values (1, null, 140.00, 'Cash','02/01/2019 15:04:00' ),
		 (2, null, 40.00, 'Credit Card','02/12/2019 16:45:00' ),
		 (3, null, 70.00, 'Credit Card','02/14/2019 14:10:00' ),
		 (4, null, 70.00, 'Credit Card','02/20/2019 16:00:00' )



Insert into TransactionItems (TransactionID, ServiceID, UPC, Quantity)
VALUES (1, 3, null, 1),
		(1, 4, null, 1),
		(2, 1, null, 1),
		(3, 2, null, 1),
		(4, 2, null, 1)

GO

