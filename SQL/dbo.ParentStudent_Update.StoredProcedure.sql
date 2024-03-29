USE [Resolvely]
GO
/****** Object:  StoredProcedure [dbo].[ParentStudent_Update]    Script Date: 1/29/2024 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Aurel Aliy
-- Create date: 1/22/2024
-- Description:	ParentStudent_Insert for dbo.ParentStudent
-- Code Reviewer:Jahlanda Smith 

-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note: 
-- =============================================


CREATE PROC [dbo].[ParentStudent_Update]
				@ParentId int
			   ,@StudentId int
			   ,@isConfirmed bit
as

/*

 DECLARE 
		 @ParentId int = 1
		,@StudentId int = 16
		,@IsConfirmed bit = 0

 EXECUTE [dbo].[ParentStudent_Update]
			   @ParentId 
		      ,@StudentId 
			  ,@IsConfirmed

*/


BEGIN
	
	

	 UPDATE dbo.ParentStudent
	 SET	  [isConfirmed] = @IsConfirmed
	 WHERE [ParentId] = @ParentId AND [StudentId] = @StudentId

END
GO
