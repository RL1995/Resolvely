USE [Resolvely]
GO
/****** Object:  StoredProcedure [dbo].[ParentStudent_SelectByIsConfirmed]    Script Date: 1/29/2024 7:07:02 PM ******/
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



CREATE Proc [dbo].[ParentStudent_SelectByIsConfirmed]	
							@IsConfirmed bit



/*							
DECLARE @IsConfirmed bit = 0 --flip the bit to check

EXECUTE [dbo].[ParentStudent_SelectByIsConfirmed]
						@isConfirmed
*/

as

BEGIN

	SELECT Parent = dbo.fn_GetUserJSON(ParentId)
		  ,Student = dbo.fn_GetUserJSON(StudentId)
		  ,[IsConfirmed]
		  ,TotalCount = COUNT(1)OVER()
	FROM [dbo].ParentStudent
	WHERE IsConfirmed = @IsConfirmed

END
GO
