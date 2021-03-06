USE [master]
GO
/****** Object:  Database [card_processing]    Script Date: 24/04/2017 07:39:35 ******/
CREATE DATABASE [card_processing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'card_processing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\card_processing.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'card_processing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\card_processing_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [card_processing] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [card_processing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [card_processing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [card_processing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [card_processing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [card_processing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [card_processing] SET ARITHABORT OFF 
GO
ALTER DATABASE [card_processing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [card_processing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [card_processing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [card_processing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [card_processing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [card_processing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [card_processing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [card_processing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [card_processing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [card_processing] SET  DISABLE_BROKER 
GO
ALTER DATABASE [card_processing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [card_processing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [card_processing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [card_processing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [card_processing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [card_processing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [card_processing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [card_processing] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [card_processing] SET  MULTI_USER 
GO
ALTER DATABASE [card_processing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [card_processing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [card_processing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [card_processing] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [card_processing] SET DELAYED_DURABILITY = DISABLED 
GO
USE [card_processing]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 24/04/2017 07:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentId] [int] NOT NULL,
	[AgentName] [nvarchar](100) NOT NULL,
	[ProvinceId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Address] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[OwnerId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CardType]    Script Date: 24/04/2017 07:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CardType](
	[CardTypeCode] [int] NULL,
	[CardTypeName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Merchant]    Script Date: 24/04/2017 07:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Merchant](
	[MerchantId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](255) NULL,
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
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[Address3] [nvarchar](255) NULL,
	[Zip] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[ApprovalDate] [datetime] NULL,
	[CloseDate] [datetime] NULL,
	[BankCardDBA] [varchar](50) NULL,
 CONSTRAINT [PK_Merchant] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantManager]    Script Date: 24/04/2017 07:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantManager](
	[MasterId] [int] NOT NULL,
	[MerchantId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantType]    Script Date: 24/04/2017 07:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantType](
	[TypeId] [int] NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionDetail]    Script Date: 24/04/2017 07:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDetail](
	[TransactionCode] [int] NOT NULL,
	[MerchantNumber] [int] NOT NULL,
	[TransactionAmount] [money] NULL,
	[TransactionDate] [date] NOT NULL,
	[TransationTime] [time](7) NOT NULL,
	[Description] [nchar](10) NULL,
	[CardTypeId] [int] NOT NULL,
	[KeyedEntry] [nchar](10) NULL,
	[AuthorizationNumber] [int] NOT NULL,
	[AccountNumber] [nchar](10) NULL,
	[FirstTwelveAccountNumber] [nchar](10) NULL,
	[CountryCode] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 24/04/2017 07:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [varchar](20) NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 24/04/2017 07:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
USE [master]
GO
ALTER DATABASE [card_processing] SET  READ_WRITE 
GO
