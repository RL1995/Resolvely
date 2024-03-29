USE [Resolvely]
GO
/****** Object:  StoredProcedure [dbo].[ParentStudentUpdateByToken]    Script Date: 2/15/2024 10:30:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Aurel Aliy
-- Create date: 2/10/2024
-- Description:	Checks if token is valid and updates relationship for dbo.ParentStudent table
-- Code Reviewer: Luis Gomez

-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer: 
-- Note:



CREATE PROC [dbo].[ParentStudentUpdateByToken]
				@Token nvarchar(200)

as


/*

		DECLARE @Token nvarchar(200) = '669171C4-A1DF-4837-B8B7-7D7591B1530D'
		EXECUTE  [dbo].[ParentStudentUpdateByToken]
				            @Token

*/



BEGIN 


  UPDATE dbo.ParentStudent
	SET [IsConfirmed] = 1
	WHERE Token = @Token AND ExpirationDate >= GETUTCDATE()


END

GO
