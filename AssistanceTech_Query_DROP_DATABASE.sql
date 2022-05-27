-- Use this query to drop the AssistanceTech database itself from the SQL Server.
-- Use this to start over.
-- Close any open connections in the database and set it as single_user so that
-- only you can use it by yourself and then delete it.
USE master
GO
ALTER DATABASE AssistanceTech SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE AssistanceTech
GO