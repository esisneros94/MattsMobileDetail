
CREATE Procedure [dbo].[DropMobileDetailConstraints]

as

Alter table Appointments
DROP constraint CHK_Appointments_Status 