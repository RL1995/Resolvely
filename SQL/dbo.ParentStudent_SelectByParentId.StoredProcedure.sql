USE [Resolvely]
GO
/****** Object:  StoredProcedure [dbo].[ParentStudent_SelectByParentId]    Script Date: 2/8/2024 3:07:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Aurel Aliy
-- Create date: 1/22/2024
-- Description:	SelectByParentId for dbo.ParentStudent
-- Code Reviewer:Jahlanda Smith 

-- MODIFIED BY: Jahlanda Smith
-- MODIFIED DATE: 
-- Code Reviewer: 2/8/2024
-- Note: Authorized to make changes by Instructor Miranda
-- =============================================


CREATE Proc [dbo].[ParentStudent_SelectByParentId]
						@Id int
/*
DECLARE @Id int = 2

EXECUTE [dbo].[ParentStudent_SelectByParentId]
				@Id
*/

as

BEGIN

	SELECT
		   U.[FirstName]
		  ,U.[LastName]
		  ,U.[Email]
		  ,U.[AvatarUrl]
		  ,R.[Name] as Role
	FROM dbo.Users as U inner join dbo.Roles as R on U.RoleId = R.Id
	WHERE U.RoleId = @Id

END
GO
