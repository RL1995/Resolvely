USE [Resolvely]
GO
/****** Object:  StoredProcedure [dbo].[ParentStudent_Insert]    Script Date: 2/8/2024 1:40:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Aurel Aliy
-- Create date: 1/22/2024
-- Description:	ParentStudent_Insert for dbo.ParentStudent
-- Code Reviewer:Jahlanda Smith 

-- MODIFIED BY: Aurel Aliy
-- MODIFIED DATE: 02/08/24
-- Code Reviewer: Jahlanda Smith 
-- Note: I had to make some changes to the proc to work with the email service, added tokens for identification
-- =============================================


CREATE PROC [dbo].[ParentStudent_Insert]
				@ParentId int
			   ,@StudentId int
			   ,@Token nvarchar(200)
AS

/* 

	DECLARE @ParentId int  = 91
		   ,@StudentId int = 92
		   ,@Token  nvarchar(200) = B7DE90A2-603A-4B35-BD4C-05915A4B1842

    EXECUTE DBO.ParentStudent_Insert
				@ParentId	
		       ,@StudentId
			   ,@Token
*/


BEGIN 


   INSERT INTO dbo.ParentStudent
					([ParentId]
				   ,[StudentId]
				   ,[Token]
				   )

   VALUES (@ParentId
		   ,@StudentId
		   ,@Token
		   )


END
GO
