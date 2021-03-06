

Create Procedure [dbo].[DestroyMobileDetailDatabase]

as

BEGIN

BEGIN TRANSACTION

BEGIN TRY
	EXEC DropMobileDetailConstraints
	Exec DropMobileDetailForeignKeys
	Exec DropMobileDetailTables
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'SOMETHING WENT WRONG'
	Return 100
END CATCH

COMMIT Transaction

PRINT 'Database Destroyed'
RETURN

END