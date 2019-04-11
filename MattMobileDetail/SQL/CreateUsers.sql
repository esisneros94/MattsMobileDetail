--MobileDetailOwner
--w@z3St0T!iMe

--Admin_DataB
--00sAy$_n0oBR

--Dev_One
--Palp+033L%?

--Dev_Two
--Palp+033L%)(

--MobileDetailVisitor

-------------------------------------
USE [master]

CREATE LOGIN MobileDetailOwner WITH PASSWORD = 'w@z3St0T!iMe'
CREATE LOGIN Admin_DataB WITH PASSWORD = '00sAy$_n0oBR'
CREATE LOGIN Dev_One WITH PASSWORD = 'Palp+033L%?'
CREATE LOGIN Dev_Two WITH PASSWORD = 'Palp+033L%)('
CREATE LOGIN MobileDetailVisitor WITH PASSWORD = ''

--------------------------------------
USE [MobileDetail]

CREATE USER [MobileDetailOwner] FOR LOGIN [MobileDetailOwner]
EXEC sp_addrolemember N'db_reader', N'MobileDetailOwner'
GO
--------------------------------------
USE [MobileDetail]

CREATE USER [] FOR LOGIN [Admin_DataB]
EXEC sp_addrolemember N'db_owner', N'Admin_DataB'
GO
--------------------------------------
USE [MobileDetail]

CREATE USER [] FOR LOGIN [Dev_One]
EXEC sp_addrolemember N'db_datawriter', N'Dev_One'
GO
--------------------------------------
USE [MobileDetail]

CREATE USER [] FOR LOGIN [Dev_Two]
EXEC sp_addrolemember N'db_datawriter', N'Dev_Two'
GO
--------------------------------------
USE [MobileDetail]

CREATE USER [] FOR LOGIN [MobileDetailVisitor]
EXEC sp_addrolemember N'public', N'MobileDetailVisitor'
GO
