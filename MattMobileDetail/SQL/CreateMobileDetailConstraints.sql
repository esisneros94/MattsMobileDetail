
Create Procedure [dbo].[CreateMobileDetailConstraints]

as

Alter table Appointments
Add constraint CHK_Appointments_Status CHECK (EventStatus in ('Pending','Approved','Cancelled','Completed'))



