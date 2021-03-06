USE [MobileDetail]
GO
/****** Object:  StoredProcedure [dbo].[AddTransactionForAppointment]    Script Date: 5/4/2019 12:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[AddTransactionForAppointment]
	@AppointmentID int
	,@PromotionID int
	,@PaymentMethod varchar(20)
	
As

BEGIN
	declare @TransactionID int

	if(@PromotionID = 0)
	BEGIN
		Set @PromotionID = null
	END

	Insert into Transactions(AppointmentID, PromotionID, GrandTotal, PaymentMethod, TransactionDateTime)
		Values(@AppointmentID, @PromotionID, 0, @PaymentMethod, getdate())

	SET @TransactionID = (Select TransactionID from Transactions where AppointmentID = @AppointmentID)

	select @TransactionID

END