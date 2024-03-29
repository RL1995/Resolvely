USE [Resolvely]
GO
/****** Object:  StoredProcedure [dbo].[ParentStudent_Delete]    Script Date: 1/29/2024 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Aurel Aliy
-- Create date: 1/22/2024
-- Description:	ParentStudent_Insert for dbo.Users
-- Code Reviewer: Jahlanda Smith 

-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note: 
-- =============================================




CREATE PROC [dbo].[ParentStudent_Delete]
					@ParentId int 
				   ,@StudentId int

AS

/*

    DECLARE 
			@ParentId int = 1
		   ,@StudentId int = 4 

	EXECUTE [dbo].[ParentStudent_Delete]
						@ParentId
		               ,@StudentId

*/

BEGIN

	DELETE FROM dbo.ParentStudent
	WHERE  ([ParentId] = @ParentId 
	AND [StudentId] = @StudentId)

END
GO
