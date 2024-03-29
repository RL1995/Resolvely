USE [Resolvely]
GO
/****** Object:  StoredProcedure [dbo].[ParentStudent_SelectByStudentId]    Script Date: 2/8/2024 3:07:46 PM ******/
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
-- MODIFIED DATE: 2/5/2024
-- Code Reviewer: 
-- Note: Modified under the supervision of Instructor Fischer
-- =============================================


CREATE Proc [dbo].[ParentStudent_SelectByStudentId]
						@Id int
/*
DECLARE @Id int = 3

EXECUTE [dbo].[ParentStudent_SelectByStudentId]
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
