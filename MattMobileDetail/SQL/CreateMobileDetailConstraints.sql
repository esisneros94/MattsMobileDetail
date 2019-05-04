USE [MobileDetail]
GO
/****** Object:  StoredProcedure [dbo].[CreateMobileDetailConstraints]    Script Date: 5/4/2019 12:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter Procedure [dbo].[CreateMobileDetailConstraints]

as

Alter table Appointments
Add constraint CHK_Appointments_Status CHECK (EventStatus in ('Pending','Approved','Cancelled','Completed','Scheduled'))