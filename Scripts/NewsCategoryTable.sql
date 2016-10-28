USE [nopcommerce]
GO

/****** Object:  Table [dbo].[News]    Script Date: 10/20/2016 15:02:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NewsCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[LimitedToStores] [bit] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[NewsCategory]  WITH CHECK ADD  CONSTRAINT [NewsCategory_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[NewsCategory] CHECK CONSTRAINT [NewsCategory_Language]
GO


select * from [dbo].[News]
ALTER TABLE [dbo].[News]  ADD NewsCategoryId int not null default(1)




ALTER TABLE [dbo].[News] 
ADD  CONSTRAINT [NewsItem_NewsCategorysss] 
FOREIGN KEY(NewsCategoryId)
REFERENCES [dbo].[NewsCategory] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[News] DROP [NewsItem_NewsCategorys]

SELECT * FROM [dbo].[Language]
SELECT * FROM [dbo].[NewsCategory]

SET IDENTITY_INSERT [dbo].[NewsCategory] ON;
INSERT INTO [dbo].[NewsCategory](Id,LanguageId,Title,LimitedToStores,CreatedOnUtc) VALUES(1,1,'Category 1',0,GETDATE())
INSERT INTO [dbo].[NewsCategory](Id,LanguageId,Title,LimitedToStores,CreatedOnUtc) VALUES(2,1,'Category 2',0,GETDATE())
INSERT INTO [dbo].[NewsCategory](Id,LanguageId,Title,LimitedToStores,CreatedOnUtc) VALUES(3,1,'Category 3',0,GETDATE())
INSERT INTO [dbo].[NewsCategory](Id,LanguageId,Title,LimitedToStores,CreatedOnUtc) VALUES(4,1,'Category 4',0,GETDATE())

SELECT * FROM News
SELECT * FROM NewsCategory

SELECT * FROm Category
SELECT * FROm UrlRecord


