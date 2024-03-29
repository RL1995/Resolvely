USE [Resolvely]
GO
/****** Object:  StoredProcedure [dbo].[ParentStudent_SelectAllPaginate]    Script Date: 1/29/2024 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aurel Aliy
-- Create date: 1/23/2024
-- Description:	ParentStudent_Insert for dbo.ParentStudent
-- Code Reviewer:Jahlanda Smith 

-- MODIFIED BY: 
-- MODIFIED DATE: 
-- Code Reviewer: 
-- Note: 
-- =============================================


CREATE PROC [dbo].[ParentStudent_SelectAllPaginate]
						@PageIndex int
					   ,@PageSize int
as

/*

	execute [dbo].[ParentStudent_SelectAllPaginate] 0, 10

*/

BEGIN
	  
	Declare @Offset int = @PageIndex * @PageSize

	SELECT Parent = dbo.fn_GetUserJSON(ParentId)
		  ,Student = dbo.fn_GetUserJSON(StudentId)
		  ,[IsConfirmed]
		  ,TotalCount = COUNT(1)OVER()
	FROM [dbo].ParentStudent
	
	ORDER BY [IsConfirmed]


	OFFSET @offset Rows
	Fetch Next @PageSize Rows ONLY 

END
GO
