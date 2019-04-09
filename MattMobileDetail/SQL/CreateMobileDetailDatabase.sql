

CREATE Procedure [dbo].[CreateMobileDetailDatabase]

as

BEGIN

BEGIN TRANSACTION

BEGIN TRY
	Exec CreateMobileDetailTables
	Exec CreateMobileDetailForeignKeys
	EXEC CreateMobileDetailConstraints
	EXEC InsertDataIntoMobileDetailTables
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'SOMETHING WENT WRONG'
	Return 100
END CATCH

COMMIT Transaction

PRINT 'Database Created Successfully'
RETURN

END
GO


