USE [Resolvely]
GO
/****** Object:  StoredProcedure [dbo].[ParentStudent_ById]    Script Date: 3/1/2024 7:39:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jahlanda Smith
-- Create date: 3/1/2024
-- Description:	Grabs all students for the respected parent

-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note: 
-- =============================================
CREATE PROCEDURE [dbo].[ParentStudent_ById]
	@ParentId int


/*
Declare @ParentId int = 102


execute dbo.ParentStudent_ById
@ParentId

*/

AS
BEGIN
	
	SELECT   ps.[StudentId] as Id			
			,u.[FirstName]
			,u.[LastName]
			,u.[Mi]
			,u.[AvatarUrl]
			,ps.[ExpirationDate]
			,ps.[IsConfirmed]
	FROM
	[dbo].[ParentStudent] as ps inner join dbo.Users as u
	ON ps.StudentId = u.Id
	WHERE [ParentId] = @ParentId
  
END
GO
