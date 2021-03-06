USE [DBCardProcess﻿]
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckChangePassword]    Script Date: 5/28/2017 12:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [sp_CheckChangePassword] '4AE771A0-791F-4AC9-957B-FA4C0676F016','e10adc3949ba59abbe56e057f20f883e','e10adc3949ba59abbe56e057f20f883e'
CREATE proc [dbo].[sp_CheckChangePassword] 

@Token varchar(100),
@password_old varchar(255),
@password_new varchar(255)
as
begin
	SET NOCOUNT ON
	BEGIN TRY
		IF EXISTS (select TOP 1 1 from [User] where TokenStr = @Token  and Password = @password_old)-- kiem tra 
		BEGIN		
			-- update mat khau
			update [User] set Password = @password_new  where TokenStr = @Token
			select 1 RES
		END	
		ELSE
			select 0 RES
	END TRY
	BEGIN CATCH
		insert into LogRecord (StoreName, DateError, MsgError) values (N'sp_CheckChangePassword', GETDATE(), ERROR_MESSAGE())
	END CATCH
end

GO
/****** Object:  StoredProcedure [dbo].[sp_CheckLogin]    Script Date: 5/28/2017 12:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_CheckLogin]
@username varchar(100),
@password varchar(100)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		IF EXISTS (select TOP 1 1 from [User] where UserName = @username AND Password = @password AND IsActive > 0)
		BEGIN
			DECLARE @token VARCHAR(200) = CONVERT(varchar(255), NEWID())
			
			Update [User]
			set TokenStr = @token
			where UserName = @username AND Password = @password
			
			select UserId, FullName, TokenStr, RoleId, 1 RES from [User] where UserName = @username AND Password = @password
		END	
		ELSE
			select 0 UserId, '' FullName, '' TokenStr, 0 RoleId, 0 RES
	END TRY
	BEGIN CATCH
		insert into LogRecord (StoreName, DateError, MsgError) values (N'sp_CheckLogin', GETDATE(), ERROR_MESSAGE())
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[sp_CheckLogout]    Script Date: 5/28/2017 12:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_CheckLogout]
@token varchar(200)
AS
BEGIN
	BEGIN TRY
	
		Update [User]
		set TokenStr = NULL
		where TokenStr = @token
		
	END TRY
	BEGIN CATCH
		insert into LogRecord (StoreName, DateError, MsgError) values (N'sp_CheckLogout', GETDATE(), ERROR_MESSAGE())
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[sp_CheckSessionLogin]    Script Date: 5/28/2017 12:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_CheckSessionLogin]
@Token varchar(100)
as
begin
	SET NOCOUNT ON
	BEGIN TRY
		IF EXISTS (select TOP 1 1 from [User] where TokenStr = @Token)
		BEGIN		
			select FullName, RoleId, 1 RES from [User] where TokenStr = @Token
		END	
		ELSE
			select 0 RES
	END TRY
	BEGIN CATCH
		insert into LogRecord (StoreName, DateError, MsgError) values (N'sp_CheckSessionLogin', GETDATE(), ERROR_MESSAGE())
	END CATCH
end

GO
/****** Object:  Table [dbo].[Agent]    Script Date: 5/28/2017 12:04:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentId] [int] IDENTITY(1,1) NOT NULL,
	[AgentName] [nvarchar](100) NOT NULL,
	[ProvinceId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Address] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[OwnerId] [int] NULL,
	[Phone] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Zip] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CardType]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CardType](
	[CardTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CardTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_CardType] PRIMARY KEY CLUSTERED 
(
	[CardTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuration](
	[ConfigurationName] [varchar](50) NOT NULL,
	[ConfigurationValue] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Configuration] PRIMARY KEY CLUSTERED 
(
	[ConfigurationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[District]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogRecord]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](100) NULL,
	[DateError] [datetime] NULL,
	[MsgError] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Merchant]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Merchant](
	[MerchantId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantType] [int] NOT NULL,
	[ProvinceId] [int] NOT NULL,
	[DistrictId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[Phone] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[AgentId] [int] NULL,
	[OwnerId] [int] NULL,
	[FirstActiveDate] [datetime] NULL,
	[LastActiveDate] [datetime] NULL,
	[MerchantName] [nvarchar](100) NOT NULL,
	[Status] [nchar](10) NULL,
	[Owner] [varchar](50) NULL,
	[Address1] [nvarchar](255) NOT NULL,
	[Address2] [nvarchar](255) NULL,
	[Address3] [nvarchar](255) NULL,
	[Zip] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[ApprovalDate] [datetime] NULL,
	[CloseDate] [datetime] NULL,
	[BankCardDBA] [varchar](50) NULL,
	[BackendProcessor] [varchar](100) NULL,
 CONSTRAINT [PK_Merchant] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantInvitation]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantInvitation](
	[FromMerchantId] [int] NOT NULL,
	[NewMerchantName] [nvarchar](100) NOT NULL,
	[InvitationDescription] [nvarchar](max) NOT NULL,
	[InvitationDate] [datetime] NOT NULL,
	[IsResolved] [bit] NOT NULL,
 CONSTRAINT [PK_MerchantInvitation] PRIMARY KEY CLUSTERED 
(
	[FromMerchantId] ASC,
	[InvitationDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantType]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MerchantType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationTime] [datetime] NOT NULL,
	[FromMerchant] [int] NULL,
	[FromAgent] [int] NULL,
	[FromMaster] [int] NULL,
	[ToMerchant] [varchar](255) NULL,
	[ToAgent] [varchar](255) NULL,
	[ToMaster] [varchar](255) NULL,
	[Message] [nvarchar](max) NOT NULL,
	[IsSeen] [bit] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Province]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[ProvinceId] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Region]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionId] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegionMapping]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegionMapping](
	[RegionId] [int] NOT NULL,
	[ProvinceId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_RegionMapping] PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC,
	[ProvinceId] ASC,
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionDetail]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDetail](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantId] [int] NOT NULL,
	[TransactionAmount] [money] NOT NULL,
	[TransactionDate] [date] NOT NULL,
	[TransationTime] [time](7) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CardTypeId] [int] NOT NULL,
	[KeyedEntry] [nchar](10) NULL,
	[AuthorizationNumber] [int] NULL,
	[AccountNumber] [nchar](10) NULL,
	[FirstTwelveAccountNumber] [nchar](12) NULL,
	[CountryCode] [nchar](10) NULL,
	[FileSource] [nvarchar](255) NULL,
	[ExpirationDate] [datetime] NULL,
	[TransactionTypeId] [int] NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductAmount] [int] NOT NULL,
 CONSTRAINT [PK_TransactionDetail] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[TransactionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [varchar](20) NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[TokenStr] [varchar](200) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 5/28/2017 12:04:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([AgentId], [AgentName], [ProvinceId], [DistrictId], [Address], [IsActive], [OwnerId], [Phone], [Fax], [Zip], [Email]) VALUES (3, N'CN ViettinBank TPHCM', 1, 1, N'221 Nguyễn Thị Minh Khai', 1, 9, N'3334325431', N'224553667', N'70000', N'vtb01@gmail.com')
INSERT [dbo].[Agent] ([AgentId], [AgentName], [ProvinceId], [DistrictId], [Address], [IsActive], [OwnerId], [Phone], [Fax], [Zip], [Email]) VALUES (4, N'CN ViettinBank TPHCM Quận 12', 1, 12, N'132 Phan Văn Hớn', 1, 10, N'2454674377', N'145667990', N'70000', N'vtb02@email.com')
SET IDENTITY_INSERT [dbo].[Agent] OFF
SET IDENTITY_INSERT [dbo].[CardType] ON 

INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (1, N'Visa Card')
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (2, N'Master Card')
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (3, N'Debit Card')
INSERT [dbo].[CardType] ([CardTypeId], [CardTypeName]) VALUES (4, N'Foreign key Card')
SET IDENTITY_INSERT [dbo].[CardType] OFF
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (1, N'Quận 1')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (2, N'Quận 2')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (3, N'Quận 3')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (4, N'Quận 4')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (5, N'Quận 5')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (6, N'Quận 6')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (7, N'Quận 7')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (8, N'Quận 8')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (9, N'Quận 9')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (10, N'Quận 10')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (11, N'Quận 11')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (12, N'Quận 12')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (13, N'Quận Tân Bình')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (14, N'Quận Tân Phú')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (15, N'Quận Gò Vấp')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (16, N'Huyện Củ Chi')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (17, N'Huyện Bình Chánh')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (18, N'Huyện Nhà Bè')
INSERT [dbo].[District] ([DistrictId], [DistrictName]) VALUES (19, N'Quận Thủ Đức')
SET IDENTITY_INSERT [dbo].[District] OFF
SET IDENTITY_INSERT [dbo].[Merchant] ON 

INSERT [dbo].[Merchant] ([MerchantId], [MerchantType], [ProvinceId], [DistrictId], [IsActive], [Phone], [Fax], [AgentId], [OwnerId], [FirstActiveDate], [LastActiveDate], [MerchantName], [Status], [Owner], [Address1], [Address2], [Address3], [Zip], [Email], [ApprovalDate], [CloseDate], [BankCardDBA], [BackendProcessor]) VALUES (10, 1, 1, 2, 1, N'352675980', N'22345672', 3, 2, CAST(0x0000A77100000000 AS DateTime), CAST(0x0000A77100000000 AS DateTime), N'Siêu thị sách Nguyễn Văn Cừ', N'A         ', NULL, N'205 Nguyễn Văn Cừ', NULL, NULL, N'70000', N'sieuthinvc@gmail.com', CAST(0x0000A77100000000 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Merchant] ([MerchantId], [MerchantType], [ProvinceId], [DistrictId], [IsActive], [Phone], [Fax], [AgentId], [OwnerId], [FirstActiveDate], [LastActiveDate], [MerchantName], [Status], [Owner], [Address1], [Address2], [Address3], [Zip], [Email], [ApprovalDate], [CloseDate], [BankCardDBA], [BackendProcessor]) VALUES (12, 1, 1, 10, 1, N'556749890', N'345245226', 3, 4, CAST(0x0000A77100000000 AS DateTime), CAST(0x0000A77100000000 AS DateTime), N'Big C Miền Đông', N'A         ', NULL, N'332 Tô Hiến Thành', NULL, NULL, N'70000', N'bigctht@gmail.com', CAST(0x0000A77100000000 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Merchant] ([MerchantId], [MerchantType], [ProvinceId], [DistrictId], [IsActive], [Phone], [Fax], [AgentId], [OwnerId], [FirstActiveDate], [LastActiveDate], [MerchantName], [Status], [Owner], [Address1], [Address2], [Address3], [Zip], [Email], [ApprovalDate], [CloseDate], [BankCardDBA], [BackendProcessor]) VALUES (16, 1, 1, 5, 1, N'305408091', N'443567445', 4, 5, CAST(0x0000A77100000000 AS DateTime), CAST(0x0000A77100000000 AS DateTime), N'Siêu thị Co.OpMart Cống Quỳnh', N'A         ', NULL, N'189C Cống Quỳnh', NULL, NULL, N'70000', N'coopcq@gmail.com', CAST(0x0000A77100000000 AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Merchant] OFF
SET IDENTITY_INSERT [dbo].[MerchantType] ON 

INSERT [dbo].[MerchantType] ([TypeId], [TypeName]) VALUES (1, N'Cửa hàng quần áo')
INSERT [dbo].[MerchantType] ([TypeId], [TypeName]) VALUES (2, N'Quán ăn')
INSERT [dbo].[MerchantType] ([TypeId], [TypeName]) VALUES (3, N'Siêu thị')
INSERT [dbo].[MerchantType] ([TypeId], [TypeName]) VALUES (4, N'Dịch vụ nhà hàng')
INSERT [dbo].[MerchantType] ([TypeId], [TypeName]) VALUES (5, N'Dịch vu khách sạn')
SET IDENTITY_INSERT [dbo].[MerchantType] OFF
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([ProvinceId], [ProvinceName]) VALUES (1, N'TP Hồ Chí Minh')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName]) VALUES (2, N'Hà Nội')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName]) VALUES (3, N'Đà Nẵng')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName]) VALUES (4, N'Cần Thơ')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName]) VALUES (5, N'Tây Nguyên')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName]) VALUES (6, N'Lâm Đồng')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName]) VALUES (7, N'Bình Dương')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName]) VALUES (8, N'Cà Mau')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName]) VALUES (9, N'Hài Phòng')
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName]) VALUES (10, N'Bắc Giang')
SET IDENTITY_INSERT [dbo].[Province] OFF
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([RegionId], [RegionName]) VALUES (1, N'Miền Nam')
INSERT [dbo].[Region] ([RegionId], [RegionName]) VALUES (2, N'Miền Trung')
INSERT [dbo].[Region] ([RegionId], [RegionName]) VALUES (3, N'Miền Bắc 1')
INSERT [dbo].[Region] ([RegionId], [RegionName]) VALUES (4, N'Miền Bắc 2')
SET IDENTITY_INSERT [dbo].[Region] OFF
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 2, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 3, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 4, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 5, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 6, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 7, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 8, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 9, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 10, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 11, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 12, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 13, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 14, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 15, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 16, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 17, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 18, NULL)
INSERT [dbo].[RegionMapping] ([RegionId], [ProvinceId], [DistrictId], [Description]) VALUES (1, 1, 19, NULL)
SET IDENTITY_INSERT [dbo].[TransactionType] ON 

INSERT [dbo].[TransactionType] ([TransactionTypeId], [TransactionTypeName]) VALUES (1, N'Sale ')
INSERT [dbo].[TransactionType] ([TransactionTypeId], [TransactionTypeName]) VALUES (2, N'Return')
INSERT [dbo].[TransactionType] ([TransactionTypeId], [TransactionTypeName]) VALUES (3, N'Retrival')
SET IDENTITY_INSERT [dbo].[TransactionType] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Phone], [RoleId], [IsActive], [TokenStr]) VALUES (2, N'demo01', N'7815696ecbf1c96e6894b779456d330e', N'Lý Thanh Nam', N'0123452345', 1, 1, N'446D7B6A-CA9F-478D-B111-91D1CD563E4F')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Phone], [RoleId], [IsActive], [TokenStr]) VALUES (4, N'demo02', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Vĩnh Nam', N'090345678', 1, 1, NULL)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Phone], [RoleId], [IsActive], [TokenStr]) VALUES (5, N'demo03', N'e10adc3949ba59abbe56e057f20f883e', N'Huỳnh Chánh Kiệt', N'012244553', 1, 1, NULL)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Phone], [RoleId], [IsActive], [TokenStr]) VALUES (6, N'demo04', N'fcea920f7412b5da7be0cf42b8c93759', N'Ngô Hoàng Ngọc Bảo', N'0122435567', 1, 1, NULL)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Phone], [RoleId], [IsActive], [TokenStr]) VALUES (7, N'demo05', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Trung Tín', N'0909233445', 1, 1, N'D7D7F14A-AF37-4769-A808-DBA9F9DF243F')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Phone], [RoleId], [IsActive], [TokenStr]) VALUES (9, N'agent01', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Thị Hương', N'0163567990', 2, 1, NULL)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Phone], [RoleId], [IsActive], [TokenStr]) VALUES (10, N'agent02', N'e10adc3949ba59abbe56e057f20f883e', N'Bảo Liên Đăng', N'0123446712', 2, 1, N'268C2160-7A3D-4DA1-A7CA-FA1C64B3F3C5')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [Phone], [RoleId], [IsActive], [TokenStr]) VALUES (11, N'master', N'e10adc3949ba59abbe56e057f20f883e', N'Tài khoàn Master', N'01212455767', 3, 1, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([RoleId], [RoleName]) VALUES (1, N'Merchant')
INSERT [dbo].[UserRole] ([RoleId], [RoleName]) VALUES (2, N'Agent')
INSERT [dbo].[UserRole] ([RoleId], [RoleName]) VALUES (3, N'Master')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_District] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_District]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Province] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Province] ([ProvinceId])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_Province]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_User] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_User]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Agent] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_Agent]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_District] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_District]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_MerchantType] FOREIGN KEY([MerchantType])
REFERENCES [dbo].[MerchantType] ([TypeId])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_MerchantType]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_Province] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Province] ([ProvinceId])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_Province]
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD  CONSTRAINT [FK_Merchant_User] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Merchant] CHECK CONSTRAINT [FK_Merchant_User]
GO
ALTER TABLE [dbo].[MerchantInvitation]  WITH CHECK ADD  CONSTRAINT [FK_MerchantInvitation_Merchant] FOREIGN KEY([FromMerchantId])
REFERENCES [dbo].[Merchant] ([MerchantId])
GO
ALTER TABLE [dbo].[MerchantInvitation] CHECK CONSTRAINT [FK_MerchantInvitation_Merchant]
GO
ALTER TABLE [dbo].[RegionMapping]  WITH CHECK ADD  CONSTRAINT [FK_RegionMapping_District] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[RegionMapping] CHECK CONSTRAINT [FK_RegionMapping_District]
GO
ALTER TABLE [dbo].[RegionMapping]  WITH CHECK ADD  CONSTRAINT [FK_RegionMapping_Province] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Province] ([ProvinceId])
GO
ALTER TABLE [dbo].[RegionMapping] CHECK CONSTRAINT [FK_RegionMapping_Province]
GO
ALTER TABLE [dbo].[TransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_TransactionDetail_CardType] FOREIGN KEY([CardTypeId])
REFERENCES [dbo].[CardType] ([CardTypeId])
GO
ALTER TABLE [dbo].[TransactionDetail] CHECK CONSTRAINT [FK_TransactionDetail_CardType]
GO
ALTER TABLE [dbo].[TransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_TransactionDetail_Merchant] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchant] ([MerchantId])
GO
ALTER TABLE [dbo].[TransactionDetail] CHECK CONSTRAINT [FK_TransactionDetail_Merchant]
GO
ALTER TABLE [dbo].[TransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_TransactionDetail_TransactionType] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[TransactionType] ([TransactionTypeId])
GO
ALTER TABLE [dbo].[TransactionDetail] CHECK CONSTRAINT [FK_TransactionDetail_TransactionType]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRole] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserRole]
GO
