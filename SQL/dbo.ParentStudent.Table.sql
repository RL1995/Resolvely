USE [Resolvely]
GO
/****** Object:  Table [dbo].[ParentStudent]    Script Date: 2/8/2024 1:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParentStudent](
	[ParentId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[IsConfirmed] [bit] NOT NULL,
	[ExpirationDate] [datetime2](7) NULL,
	[Token] [nvarchar](200) NULL,
 CONSTRAINT [PK_ParentStudent] PRIMARY KEY CLUSTERED 
(
	[ParentId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ParentStudent] ADD  CONSTRAINT [DF_ParentStudent_IsConfirmed]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[ParentStudent] ADD  CONSTRAINT [DF_ParentStudent_ExpirationDate]  DEFAULT (getutcdate()+(30)) FOR [ExpirationDate]
GO
