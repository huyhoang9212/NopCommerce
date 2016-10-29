USE [nopcommerce]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- NewsCategory
/*
* ParentCategoryId: 0 is root category
*/
GO
IF OBJECT_ID('dbo.[NewsCategory]', 'U') IS NOT NULL DROP TABLE dbo.[NewsCategory];
GO
CREATE TABLE [dbo].[NewsCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[Description] [nvarchar](max) NULL,	
	[LimitedToStores] [bit] NOT NULL,	
	[MetaKeywords] [nvarchar](400) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[MetaTitle] [nvarchar](400) NULL,
	[ParentCategoryId] [int] NOT NULL,
	[PictureId] [int] NOT NULL,
	[PageSize] [int] NOT NULL,
	[AllowCustomersToSelectPageSize] [bit] NOT NULL,
	[PageSizeOptions] [nvarchar](200) NULL,
	[PriceRanges] [nvarchar](400) NULL,
	[ShowOnHomePage] [bit] NOT NULL,
	[IncludeInTopMenu] [bit] NOT NULL,
	[SubjectToAcl] [bit] NOT NULL,	
	[Published] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UpdatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- News
IF EXISTS(
    SELECT *
    FROM sys.columns 
    WHERE Name      = N'NewsCategoryId'
      AND Object_ID = Object_ID(N'News'))
BEGIN  
	ALTER TABLE [dbo].[News] DROP COLUMN NewsCategoryId		
END
	ALTER TABLE [dbo].[News]  ADD NewsCategoryId int null
GO

DELETE FROM [NewsCategory]
SET IDENTITY_INSERT [dbo].[NewsCategory] ON
INSERT [dbo].[NewsCategory] ([Id], [Name], [Description],  [MetaKeywords], [MetaDescription], [MetaTitle], [ParentCategoryId], [PictureId], [PageSize], [AllowCustomersToSelectPageSize], [PageSizeOptions], [PriceRanges], [ShowOnHomePage], [IncludeInTopMenu], [SubjectToAcl], [LimitedToStores], [Published], [Deleted], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Tây Bắc Ký Sự', NULL,  NULL, NULL, NULL, 0, 1, 6, 1, N'6, 3, 9', NULL, 0, 1, 0, 0, 1, 0, 1, CAST(0x0000A65600A47803 AS DateTime), CAST(0x0000A65600A47803 AS DateTime))
INSERT [dbo].[NewsCategory] ([Id], [Name], [Description], [MetaKeywords], [MetaDescription], [MetaTitle], [ParentCategoryId], [PictureId], [PageSize], [AllowCustomersToSelectPageSize], [PageSizeOptions], [PriceRanges], [ShowOnHomePage], [IncludeInTopMenu], [SubjectToAcl], [LimitedToStores], [Published], [Deleted], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Khám Phá Tây Bắc', NULL,  NULL, NULL, NULL, 1, 2, 6, 1, N'6, 3, 9', N'-1000;1000-1200;1200-;', 0, 1, 0, 0, 1, 0, 1, CAST(0x0000A65600A47812 AS DateTime), CAST(0x0000A65600A47812 AS DateTime))
INSERT [dbo].[NewsCategory] ([Id], [Name], [Description],  [MetaKeywords], [MetaDescription], [MetaTitle], [ParentCategoryId], [PictureId], [PageSize], [AllowCustomersToSelectPageSize], [PageSizeOptions], [PriceRanges], [ShowOnHomePage], [IncludeInTopMenu], [SubjectToAcl], [LimitedToStores], [Published], [Deleted], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Ẩm Thực Tây Bắc', NULL,  NULL, NULL, NULL, 1, 3, 6, 1, N'6, 3, 9', NULL, 0, 1, 0, 0, 1, 0, 2, CAST(0x0000A65600A4781E AS DateTime), CAST(0x0000A65600A4781E AS DateTime))
INSERT [dbo].[NewsCategory] ([Id], [Name], [Description], [MetaKeywords], [MetaDescription], [MetaTitle], [ParentCategoryId], [PictureId], [PageSize], [AllowCustomersToSelectPageSize], [PageSizeOptions], [PriceRanges], [ShowOnHomePage], [IncludeInTopMenu], [SubjectToAcl], [LimitedToStores], [Published], [Deleted], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Người Đẹp Tây Bắc', NULL,  NULL, NULL, NULL, 1, 4, 6, 1, N'6, 3, 9', NULL, 0, 1, 0, 0, 1, 0, 3, CAST(0x0000A65600A47829 AS DateTime), CAST(0x0000A65600A47829 AS DateTime))
SET IDENTITY_INSERT [dbo].[NewsCategory] OFF
GO

DELETE FROM News
SET IDENTITY_INSERT [dbo].[News] ON
INSERT [dbo].[News] ([Id], [LanguageId], [Title], [Short], [Full], [Published], [StartDateUtc], [EndDateUtc], [AllowComments], [CommentCount], [LimitedToStores], [MetaKeywords], [MetaDescription], [MetaTitle], [CreatedOnUtc], [NewsCategoryId]) VALUES (1, 1, N'1 About nopCommerce', N'It''s stable and highly usable. From downloads to documentation, www.nopCommerce.com offers a comprehensive base of information, resources, and support to the nopCommerce community.', N'<p>For full feature list go to <a href="http://www.nopCommerce.com">nopCommerce.com</a></p><p>Providing outstanding custom search engine optimization, web development services and e-commerce development solutions to our clients at a fair price in a professional manner.</p>', 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, CAST(0x0000A65600A481ED AS DateTime),1)
INSERT [dbo].[News] ([Id], [LanguageId], [Title], [Short], [Full], [Published], [StartDateUtc], [EndDateUtc], [AllowComments], [CommentCount], [LimitedToStores], [MetaKeywords], [MetaDescription], [MetaTitle], [CreatedOnUtc], [NewsCategoryId]) VALUES (2, 1, N'2 nopCommerce new release!', N'nopCommerce includes everything you need to begin your e-commerce online store. We have thought of everything and it''s all included! nopCommerce is a fully customizable shopping cart', N'<p>nopCommerce includes everything you need to begin your e-commerce online store. We have thought of everything and it''s all included!</p>', 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, CAST(0x0000A65600A48319 AS DateTime),1)
INSERT [dbo].[News] ([Id], [LanguageId], [Title], [Short], [Full], [Published], [StartDateUtc], [EndDateUtc], [AllowComments], [CommentCount], [LimitedToStores], [MetaKeywords], [MetaDescription], [MetaTitle], [CreatedOnUtc], [NewsCategoryId]) VALUES (3, 1, N'3 New online store is open!', N'The new nopCommerce store is open now! We are very excited to offer our new range of products. We will be constantly adding to our range so please register on our site.', N'<p>Our online store is officially up and running. Stock up for the holiday season! We have a great selection of items. We will be constantly adding to our range so please register on our site, this will enable you to keep up to date with any new products.</p><p>All shipping is worldwide and will leave the same day an order is placed! Happy Shopping and spread the word!!</p>', 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, CAST(0x0000A65600A48445 AS DateTime),1)
INSERT [dbo].[News] ([Id], [LanguageId], [Title], [Short], [Full], [Published], [StartDateUtc], [EndDateUtc], [AllowComments], [CommentCount], [LimitedToStores], [MetaKeywords], [MetaDescription], [MetaTitle], [CreatedOnUtc], [NewsCategoryId]) VALUES (4, 1, N'4 New online store is open!', N'The new nopCommerce store is open now! We are very excited to offer our new range of products. We will be constantly adding to our range so please register on our site.', N'<p>Our online store is officially up and running. Stock up for the holiday season! We have a great selection of items. We will be constantly adding to our range so please register on our site, this will enable you to keep up to date with any new products.</p><p>All shipping is worldwide and will leave the same day an order is placed! Happy Shopping and spread the word!!</p>', 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, CAST(0x0000A65600A48445 AS DateTime),2)
INSERT [dbo].[News] ([Id], [LanguageId], [Title], [Short], [Full], [Published], [StartDateUtc], [EndDateUtc], [AllowComments], [CommentCount], [LimitedToStores], [MetaKeywords], [MetaDescription], [MetaTitle], [CreatedOnUtc], [NewsCategoryId]) VALUES (5, 1, N'5 New online store is open!', N'The new nopCommerce store is open now! We are very excited to offer our new range of products. We will be constantly adding to our range so please register on our site.', N'<p>Our online store is officially up and running. Stock up for the holiday season! We have a great selection of items. We will be constantly adding to our range so please register on our site, this will enable you to keep up to date with any new products.</p><p>All shipping is worldwide and will leave the same day an order is placed! Happy Shopping and spread the word!!</p>', 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, CAST(0x0000A65600A48445 AS DateTime),2)
INSERT [dbo].[News] ([Id], [LanguageId], [Title], [Short], [Full], [Published], [StartDateUtc], [EndDateUtc], [AllowComments], [CommentCount], [LimitedToStores], [MetaKeywords], [MetaDescription], [MetaTitle], [CreatedOnUtc], [NewsCategoryId]) VALUES (6, 1, N'6 New online store is open!', N'The new nopCommerce store is open now! We are very excited to offer our new range of products. We will be constantly adding to our range so please register on our site.', N'<p>Our online store is officially up and running. Stock up for the holiday season! We have a great selection of items. We will be constantly adding to our range so please register on our site, this will enable you to keep up to date with any new products.</p><p>All shipping is worldwide and will leave the same day an order is placed! Happy Shopping and spread the word!!</p>', 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, CAST(0x0000A65600A48445 AS DateTime),3)
SET IDENTITY_INSERT [dbo].[News] OFF
GO

--SELECT * FROM News

--SELECT * FROM [dbo].[NewsCategory]
--SELECT * FROM Category
--select * from product


SET IDENTITY_INSERT [dbo].[NewsCategory] ON
INSERT [dbo].[NewsCategory] ([Id], [Name], [Description],  [MetaKeywords], [MetaDescription], [MetaTitle], [ParentCategoryId], [PictureId], [PageSize], [AllowCustomersToSelectPageSize], [PageSizeOptions], [PriceRanges], [ShowOnHomePage], [IncludeInTopMenu], [SubjectToAcl], [LimitedToStores], [Published], [Deleted], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Tây Bắc Ký Sự', NULL,  NULL, NULL, NULL, 0, 1, 6, 1, N'6, 3, 9', NULL, 0, 1, 0, 0, 1, 0, 1, CAST(0x0000A65600A47803 AS DateTime), CAST(0x0000A65600A47803 AS DateTime))
INSERT [dbo].[NewsCategory] ([Id], [Name], [Description], [MetaKeywords], [MetaDescription], [MetaTitle], [ParentCategoryId], [PictureId], [PageSize], [AllowCustomersToSelectPageSize], [PageSizeOptions], [PriceRanges], [ShowOnHomePage], [IncludeInTopMenu], [SubjectToAcl], [LimitedToStores], [Published], [Deleted], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Khám Phá Tây Bắc', NULL,  NULL, NULL, NULL, 1, 2, 6, 1, N'6, 3, 9', N'-1000;1000-1200;1200-;', 0, 1, 0, 0, 1, 0, 1, CAST(0x0000A65600A47812 AS DateTime), CAST(0x0000A65600A47812 AS DateTime))
INSERT [dbo].[NewsCategory] ([Id], [Name], [Description],  [MetaKeywords], [MetaDescription], [MetaTitle], [ParentCategoryId], [PictureId], [PageSize], [AllowCustomersToSelectPageSize], [PageSizeOptions], [PriceRanges], [ShowOnHomePage], [IncludeInTopMenu], [SubjectToAcl], [LimitedToStores], [Published], [Deleted], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Ẩm Thực Tây Bắc', NULL,  NULL, NULL, NULL, 1, 3, 6, 1, N'6, 3, 9', NULL, 0, 1, 0, 0, 1, 0, 2, CAST(0x0000A65600A4781E AS DateTime), CAST(0x0000A65600A4781E AS DateTime))
INSERT [dbo].[NewsCategory] ([Id], [Name], [Description], [MetaKeywords], [MetaDescription], [MetaTitle], [ParentCategoryId], [PictureId], [PageSize], [AllowCustomersToSelectPageSize], [PageSizeOptions], [PriceRanges], [ShowOnHomePage], [IncludeInTopMenu], [SubjectToAcl], [LimitedToStores], [Published], [Deleted], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Người Đẹp Tây Bắc', NULL,  NULL, NULL, NULL, 1, 4, 6, 1, N'6, 3, 9', NULL, 0, 1, 0, 0, 1, 0, 3, CAST(0x0000A65600A47829 AS DateTime), CAST(0x0000A65600A47829 AS DateTime))
SET IDENTITY_INSERT [dbo].[NewsCategory] OFF
GO

SET IDENTITY_INSERT [dbo].[News] ON
INSERT [dbo].[News] ([Id], [LanguageId], [Title], [Short], [Full], [Published], [StartDateUtc], [EndDateUtc], [AllowComments], [CommentCount], [LimitedToStores], [MetaKeywords], [MetaDescription], [MetaTitle], [CreatedOnUtc], [NewsCategoryId]) VALUES (1, 1, N'1 About nopCommerce', N'It''s stable and highly usable. From downloads to documentation, www.nopCommerce.com offers a comprehensive base of information, resources, and support to the nopCommerce community.', N'<p>For full feature list go to <a href="http://www.nopCommerce.com">nopCommerce.com</a></p><p>Providing outstanding custom search engine optimization, web development services and e-commerce development solutions to our clients at a fair price in a professional manner.</p>', 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, CAST(0x0000A65600A481ED AS DateTime),1)
INSERT [dbo].[News] ([Id], [LanguageId], [Title], [Short], [Full], [Published], [StartDateUtc], [EndDateUtc], [AllowComments], [CommentCount], [LimitedToStores], [MetaKeywords], [MetaDescription], [MetaTitle], [CreatedOnUtc], [NewsCategoryId]) VALUES (2, 1, N'2 nopCommerce new release!', N'nopCommerce includes everything you need to begin your e-commerce online store. We have thought of everything and it''s all included! nopCommerce is a fully customizable shopping cart', N'<p>nopCommerce includes everything you need to begin your e-commerce online store. We have thought of everything and it''s all included!</p>', 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, CAST(0x0000A65600A48319 AS DateTime),1)
INSERT [dbo].[News] ([Id], [LanguageId], [Title], [Short], [Full], [Published], [StartDateUtc], [EndDateUtc], [AllowComments], [CommentCount], [LimitedToStores], [MetaKeywords], [MetaDescription], [MetaTitle], [CreatedOnUtc], [NewsCategoryId]) VALUES (3, 1, N'3 New online store is open!', N'The new nopCommerce store is open now! We are very excited to offer our new range of products. We will be constantly adding to our range so please register on our site.', N'<p>Our online store is officially up and running. Stock up for the holiday season! We have a great selection of items. We will be constantly adding to our range so please register on our site, this will enable you to keep up to date with any new products.</p><p>All shipping is worldwide and will leave the same day an order is placed! Happy Shopping and spread the word!!</p>', 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, CAST(0x0000A65600A48445 AS DateTime),1)
INSERT [dbo].[News] ([Id], [LanguageId], [Title], [Short], [Full], [Published], [StartDateUtc], [EndDateUtc], [AllowComments], [CommentCount], [LimitedToStores], [MetaKeywords], [MetaDescription], [MetaTitle], [CreatedOnUtc], [NewsCategoryId]) VALUES (4, 1, N'4 New online store is open!', N'The new nopCommerce store is open now! We are very excited to offer our new range of products. We will be constantly adding to our range so please register on our site.', N'<p>Our online store is officially up and running. Stock up for the holiday season! We have a great selection of items. We will be constantly adding to our range so please register on our site, this will enable you to keep up to date with any new products.</p><p>All shipping is worldwide and will leave the same day an order is placed! Happy Shopping and spread the word!!</p>', 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, CAST(0x0000A65600A48445 AS DateTime),2)
INSERT [dbo].[News] ([Id], [LanguageId], [Title], [Short], [Full], [Published], [StartDateUtc], [EndDateUtc], [AllowComments], [CommentCount], [LimitedToStores], [MetaKeywords], [MetaDescription], [MetaTitle], [CreatedOnUtc], [NewsCategoryId]) VALUES (5, 1, N'5 New online store is open!', N'The new nopCommerce store is open now! We are very excited to offer our new range of products. We will be constantly adding to our range so please register on our site.', N'<p>Our online store is officially up and running. Stock up for the holiday season! We have a great selection of items. We will be constantly adding to our range so please register on our site, this will enable you to keep up to date with any new products.</p><p>All shipping is worldwide and will leave the same day an order is placed! Happy Shopping and spread the word!!</p>', 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, CAST(0x0000A65600A48445 AS DateTime),2)
INSERT [dbo].[News] ([Id], [LanguageId], [Title], [Short], [Full], [Published], [StartDateUtc], [EndDateUtc], [AllowComments], [CommentCount], [LimitedToStores], [MetaKeywords], [MetaDescription], [MetaTitle], [CreatedOnUtc], [NewsCategoryId]) VALUES (6, 1, N'6 New online store is open!', N'The new nopCommerce store is open now! We are very excited to offer our new range of products. We will be constantly adding to our range so please register on our site.', N'<p>Our online store is officially up and running. Stock up for the holiday season! We have a great selection of items. We will be constantly adding to our range so please register on our site, this will enable you to keep up to date with any new products.</p><p>All shipping is worldwide and will leave the same day an order is placed! Happy Shopping and spread the word!!</p>', 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, CAST(0x0000A65600A48445 AS DateTime),3)
SET IDENTITY_INSERT [dbo].[News] OFF
GO