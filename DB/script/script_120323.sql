USE [master]
GO
/****** Object:  Database [hihichi_com_ecommerceweb_120323]    Script Date: 3/12/2023 3:55:14 PM ******/
CREATE DATABASE [hihichi_com_ecommerceweb_120323]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\hihichi_com_ecommerceweb_120323_ab3e671fd8e1419e937e6269527d69d3.mdf' , SIZE = 5120KB , MAXSIZE = 10485760KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\hihichi_com_ecommerceweb_120323_c93ab0fe9eab4894a24f6f8f6936d4be.ldf' , SIZE = 2048KB , MAXSIZE = 10485760KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hihichi_com_ecommerceweb_120323].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET ARITHABORT OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET  MULTI_USER 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET QUERY_STORE = OFF
GO
USE [hihichi_com_ecommerceweb_120323]
GO
/****** Object:  User [tuongduy10]    Script Date: 3/12/2023 3:55:15 PM ******/
CREATE USER [tuongduy10] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[tuongduy10]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [tuongduy10]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [tuongduy10]
GO
ALTER ROLE [db_datareader] ADD MEMBER [tuongduy10]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [tuongduy10]
GO
/****** Object:  Schema [tuongduy10]    Script Date: 3/12/2023 3:55:15 PM ******/
CREATE SCHEMA [tuongduy10]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute](
	[AttributeId] [int] IDENTITY(1,1) NOT NULL,
	[AttributeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
(
	[AttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[BankId] [int] IDENTITY(1,1) NOT NULL,
	[BankAccountNumber] [varchar](20) NULL,
	[BankAccountName] [varchar](50) NULL,
	[BankImage] [text] NULL,
	[BankName] [nvarchar](100) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[BannerPath] [varchar](100) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[BlogPosition] [tinyint] NULL,
	[BlogTitle] [nvarchar](100) NULL,
	[BlogContent] [ntext] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](100) NOT NULL,
	[BrandImagePath] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[Highlights] [bit] NULL,
	[New] [bit] NULL,
	[DiscountId] [int] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BrandCategory]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrandCategory](
	[BrandId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_BrandCategory] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configurations]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configurations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WebsiteName] [nvarchar](100) NULL,
	[FaviconPath] [varchar](100) NULL,
	[LogoPath] [varchar](100) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Mail] [varchar](50) NULL,
	[Owner] [nvarchar](100) NULL,
	[FacebookUrl] [varchar](100) NULL,
	[Address] [nvarchar](500) NULL,
	[AddressUrl] [varchar](500) NULL,
 CONSTRAINT [PK_Configurations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountValue] [decimal](18, 0) NULL,
	[DiscountCode] [varchar](50) NULL,
	[DiscountStock] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[isPercent] [bit] NULL,
	[forGlobal] [bit] NULL,
	[forShop] [bit] NULL,
	[forBrand] [bit] NULL,
 CONSTRAINT [PK_DiscountValue] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupInfo]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupInfo](
	[Id] [int] NOT NULL,
	[UserId] [int] NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_GroupInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMessageHistory]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMessageHistory](
	[Id] [int] NOT NULL,
	[Message] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[FromUserId] [int] NULL,
 CONSTRAINT [PK_GroupMessageHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Header]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Header](
	[HeaderId] [int] IDENTITY(1,1) NOT NULL,
	[HeaderPosition] [tinyint] NULL,
	[HeaderName] [nvarchar](50) NULL,
	[HeaderUrl] [varchar](50) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Header] PRIMARY KEY CLUSTERED 
(
	[HeaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interest]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interest](
	[RateId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Liked] [bit] NULL,
 CONSTRAINT [PK_Interest] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageHistory]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](500) NULL,
	[Attachment] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[ToPhoneNumber] [varchar](50) NULL,
	[FromName] [nvarchar](100) NULL,
	[FromPhoneNumber] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_MessageHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsRead] [bit] NULL,
	[TextContent] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[JsLink] [ntext] NULL,
	[TypeId] [int] NULL,
	[ReceiverId] [int] NULL,
	[SenderId] [int] NULL,
	[InfoId] [int] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationType]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](256) NULL,
	[TypeCode] [varchar](256) NULL,
 CONSTRAINT [PK_NotificationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnlineHistory]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccessDate] [datetime] NULL,
	[UserId] [int] NULL,
	[Duration] [int] NULL,
 CONSTRAINT [PK_OnlineHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Option]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Option](
	[OptionId] [int] IDENTITY(1,1) NOT NULL,
	[OptionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Option] PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OptionValue]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionValue](
	[OptionValueId] [int] IDENTITY(1,1) NOT NULL,
	[OptionValueName] [nvarchar](50) NULL,
	[OptionId] [int] NOT NULL,
	[isBaseValue] [bit] NULL,
 CONSTRAINT [PK_OptionValue] PRIMARY KEY CLUSTERED 
(
	[OptionValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[Amount] [tinyint] NULL,
	[Temporary] [decimal](18, 0) NULL,
	[DiscountType] [varchar](50) NULL,
	[DiscountValue] [decimal](18, 0) NULL,
	[DiscountCode] [varchar](50) NULL,
	[Total] [decimal](18, 0) NULL,
	[Status] [tinyint] NULL,
	[UserId] [int] NULL,
	[Address] [text] NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Recipient] [nvarchar](100) NULL,
	[PaymentMethodId] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ShopId] [int] NOT NULL,
	[ShopName] [nvarchar](100) NULL,
	[VerifiedDate] [datetime] NULL,
	[ProductId] [int] NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[AttributeValue] [nvarchar](50) NULL,
	[OptionValue] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[PriceOnSell] [decimal](18, 0) NULL,
	[Amount] [int] NULL,
	[Total] [decimal](18, 0) NULL,
	[Status] [tinyint] NULL,
	[Paid] [bit] NULL,
	[PayForAdmin] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC,
	[OrderId] ASC,
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[PaymentMethodId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethod] [nvarchar](50) NULL,
 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[PPC] [varchar](8) NULL,
	[ProductCode] [nvarchar](50) NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[DiscountPercent] [tinyint] NULL,
	[ProductAddedDate] [datetime] NULL,
	[ProductDescription] [ntext] NULL,
	[ProductDescriptionMobile] [ntext] NULL,
	[ProductStock] [int] NULL,
	[Status] [tinyint] NULL,
	[New] [bit] NULL,
	[Highlights] [bit] NULL,
	[FreeDelivery] [bit] NULL,
	[FreeReturn] [bit] NULL,
	[Legit] [bit] NULL,
	[Insurance] [nvarchar](30) NULL,
	[SubCategoryId] [int] NOT NULL,
	[ShopId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[ProductImportDate] [date] NULL,
	[ProductRate] [tinyint] NULL,
	[Note] [nvarchar](500) NULL,
	[SizeGuide] [ntext] NULL,
	[Link] [ntext] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttribute](
	[ProductId] [int] NOT NULL,
	[AttributeId] [int] NOT NULL,
	[Value] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[AttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[ProductImagePath] [varchar](100) NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOptionValue]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOptionValue](
	[ProductId] [int] NOT NULL,
	[OptionValueId] [int] NOT NULL,
 CONSTRAINT [PK_ProductOptionValue] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[OptionValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPrice](
	[ProductTypeId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[PriceOnSell] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ProductPrice] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductUserImage]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductUserImage](
	[ProductUserImageId] [int] IDENTITY(1,1) NOT NULL,
	[ProductUserImagePath] [varchar](100) NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_ProductUserImage] PRIMARY KEY CLUSTERED 
(
	[ProductUserImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rate]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[RateValue] [int] NULL,
	[Comment] [ntext] NULL,
	[ProductId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[RepliedId] [int] NULL,
	[ParentId] [int] NULL,
	[HtmlPosition] [varchar](50) NULL,
	[UserId] [int] NULL,
	[UserRepliedId] [int] NULL,
	[IdsToDelete] [varchar](256) NULL,
 CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RatingImage]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingImage](
	[RatingImageId] [int] IDENTITY(1,1) NOT NULL,
	[RatingImagePath] [varchar](100) NULL,
	[RateId] [int] NULL,
 CONSTRAINT [PK_RatingImage] PRIMARY KEY CLUSTERED 
(
	[RatingImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ShopId] [int] IDENTITY(1,1) NOT NULL,
	[ShopName] [nvarchar](100) NOT NULL,
	[ShopPhoneNumber] [varchar](50) NOT NULL,
	[ShopMail] [varchar](50) NULL,
	[ShopAddress] [nvarchar](100) NULL,
	[ShopWardCode] [varchar](50) NULL,
	[ShopDistrictCode] [varchar](50) NULL,
	[ShopCityCode] [varchar](50) NULL,
	[ShopJoinDate] [datetime] NULL,
	[Tax] [tinyint] NULL,
	[UserId] [int] NULL,
	[Status] [tinyint] NULL,
	[DiscountId] [int] NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopBank]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopBank](
	[ShopBankId] [int] IDENTITY(1,1) NOT NULL,
	[ShopBankName] [nvarchar](100) NOT NULL,
	[ShopAccountName] [varchar](50) NULL,
	[ShopAccountNumber] [varchar](20) NOT NULL,
	[ShopId] [int] NOT NULL,
 CONSTRAINT [PK_ShopBank] PRIMARY KEY CLUSTERED 
(
	[ShopBankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopBrand]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopBrand](
	[ShopId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_ShopBrand] PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC,
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SizeGuide]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SizeGuide](
	[SizeGuideId] [int] IDENTITY(1,1) NOT NULL,
	[SizeContent] [ntext] NULL,
	[isBaseSizeGuide] [bit] NULL,
 CONSTRAINT [PK_SizeGuide] PRIMARY KEY CLUSTERED 
(
	[SizeGuideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Social]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Social](
	[SocialId] [int] IDENTITY(1,1) NOT NULL,
	[Position] [tinyint] NULL,
	[Icon] [varchar](100) NULL,
	[SocialName] [nvarchar](100) NULL,
	[SocialUrl] [varchar](100) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Social] PRIMARY KEY CLUSTERED 
(
	[SocialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SizeGuideId] [int] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategoryAttribute]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategoryAttribute](
	[AttributeId] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_SubCategoryAttribute] PRIMARY KEY CLUSTERED 
(
	[AttributeId] ASC,
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategoryOption]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategoryOption](
	[SubCategoryId] [int] NOT NULL,
	[OptionId] [int] NOT NULL,
 CONSTRAINT [PK_SubCategoryOption] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC,
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserMail] [varchar](50) NULL,
	[UserFullName] [nvarchar](100) NULL,
	[UserJoinDate] [datetime] NULL,
	[UserAddress] [nvarchar](100) NULL,
	[UserWardCode] [varchar](50) NULL,
	[UserDistrictCode] [varchar](50) NULL,
	[UserCityCode] [varchar](50) NULL,
	[UserPhone] [varchar](50) NULL,
	[Password] [varchar](100) NOT NULL,
	[Status] [bit] NULL,
	[isSystemAccount] [bit] NULL,
	[IsOnline] [bit] NULL,
	[LastOnline] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 3/12/2023 3:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Attribute] ON 

INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (1, N'RAM')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (2, N'Bộ nhớ trong')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (3, N'Màn hình')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (4, N'GPU')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (5, N'Dung lượng pin')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (6, N'Hệ điều hành')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (7, N'Xuất xứ')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (8, N'Thời gian ra mắt')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (9, N'Camera sau')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (10, N'Camera selfie')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (11, N'ROM')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (13, N'Độ chịu nước')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (14, N'Chất liệu')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (15, N'Khối lượng')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (16, N'Dòng sản phẩm')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (17, N'Bảo hành')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (18, N'Đường kính')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (19, N'Độ dày')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (20, N'Giới tính')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (21, N'Màu sắc')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (22, N'Loại dây')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (23, N'Chống thấm nước')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (24, N'Loại mặt đồng hồ')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (25, N'Loại đồng hồ')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (26, N'Hiển thị ngày tháng')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (27, N'A')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (28, N'Quy cách')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (29, N'Tình trạng')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (30, N'Hạn sử dụng')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (31, N'Bảo quản')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (32, N'Loại thực phẩm')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (33, N'Trọng lượng')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (34, N'Chế độ ăn uống')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (35, N'Gửi từ')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (36, N'Chế độ ăn uống tiết kiệm')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (37, N'chế độ tiết kiệm tiền ăn uống')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (38, N'Tiết kiệm ăn uống từ xh')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (39, N'Giá theo size')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (40, N'Hãng')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (41, N'Model')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (42, N'Dung tích')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (43, N'Công suất')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (44, N'Điện áp')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (45, N'Kích thước')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (46, N'Phiên bản')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (47, N'Hướng dẫn sử dụng')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (48, N'Màn hình hiển thị')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (49, N'Đi kèm')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (50, N'Chân cắm điện')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (51, N'Tào lao')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (52, N'23')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (53, N'Tần số định mức')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (54, N'Tốc độ động cơ')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (55, N'Độ ồn')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (56, N'Kích thước tổng thể')
SET IDENTITY_INSERT [dbo].[Attribute] OFF
GO
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([BankId], [BankAccountNumber], [BankAccountName], [BankImage], [BankName], [Status]) VALUES (2, N'0123456789', N'NGUYEN VAN A', N'bidv.png', N'BIDV', NULL)
INSERT [dbo].[Bank] ([BankId], [BankAccountNumber], [BankAccountName], [BankImage], [BankName], [Status]) VALUES (3, N'0987654321', N'NGUYEN VAN B', N'sacombank.png', N'Sacombank', NULL)
SET IDENTITY_INSERT [dbo].[Bank] OFF
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([BannerId], [BannerPath], [Status]) VALUES (44, N'2d83236a-01eb-4195-ab86-a4b12af64f79.jpg', NULL)
INSERT [dbo].[Banner] ([BannerId], [BannerPath], [Status]) VALUES (48, N'a9c4f5ca-0786-468d-b51c-68f9b856569b.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (1, 1, N'Giới thiệu về công ty', N'<p class="MsoNormal" style="text-align: left;"><span style="color: rgb(0, 0, 0);"><strong><span lang="EN-US" style="font-size: 16.0pt; line-height: 107%; mso-ansi-language: EN-US;"><img style="display: block; margin-left: auto; margin-right: auto;" src="data:image/png;base64,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" alt="" width="151" height="43"></span></strong></span></p>
<p class="MsoNormal" style="text-align: left;"><span style="color: rgb(0, 0, 0);"><strong><span lang="EN-US" style="font-size: 16.0pt; line-height: 107%; mso-ansi-language: EN-US;">HihiCh</span></strong><strong><span lang="EN-US" style="font-size: 16.0pt; line-height: 107%; mso-ansi-language: EN-US;">i ?</span></strong></span><strong><span lang="EN-US" style="font-size: 16.0pt; line-height: 107%; mso-ansi-language: EN-US;"><img src="https://files.fm/u/aebje4w4w?ak=cc075" alt=""></span></strong></p>
<p class="MsoNormal" style="text-align: left;"><!-- [if !supportLists]--><span style="color: rgb(0, 0, 0);"><span lang="EN-US" style="font-size: 13.0pt; line-height: 107%; mso-ansi-language: EN-US;">&nbsp; &nbsp;-</span></span><span lang="EN-US" style="font-family: Wingdings; mso-fareast-font-family: Wingdings; mso-bidi-font-family: Wingdings; mso-ansi-language: EN-US;"><span style="mso-list: Ignore;"><span style="font: 7.0pt ''Times New Roman'';">&nbsp;&nbsp;</span></span></span><!--[endif]--><span style="color: rgb(0, 0, 0);"><span lang="EN-US" style="font-size: 13.0pt; line-height: 107%; mso-ansi-language: EN-US;">L&agrave; s&agrave;n thương mại điện tử chuy&ecirc;n cung cấp c&aacute;c tất cả c&aacute;c sản phẩm h&agrave;ng hiệu cao cấp của những thương hiệu nổi tiếng trong v&agrave; ngo&agrave;i nước.<br>Tại đ&acirc;y bạn c&oacute; thể dễ d&agrave;ng t&igrave;m kiếm, mua c&aacute;c sản phẩm h&agrave;ng c&oacute; thương hiệu, đảm bảo về chất lượng, với gi&aacute; th&agrave;nh tốt nhất một c&aacute;ch dễ d&agrave;ng v&agrave; nhanh ch&oacute;ng. Ch&uacute;ng t&ocirc;i sẽ li&ecirc;n tục cập nhật c&aacute;c mẫu mới nhất, chất lượng nhất, một c&aacute;ch nhanh ch&oacute;ng nhất tr&ecirc;n s&agrave;n thương mại điện tử HiHiChi.</span></span></p>
<p class="MsoNormal" style="text-align: left;"><span style="color: rgb(0, 0, 0);"><span lang="EN-US" style="font-size: 13.0pt; line-height: 107%; mso-ansi-language: EN-US;">&nbsp;<strong><span style="color: rgb(0, 0, 0);">Sứ mệnh:<br></span></strong></span></span><span style="color: rgb(0, 0, 0);"><span lang="EN-US" style="font-size: 13.0pt; line-height: 107%; mso-ansi-language: EN-US;"><strong><span style="color: rgb(0, 0, 0);">&nbsp;- </span></strong><span style="color: rgb(0, 0, 0);">Hihichi với sứ mệnh trở th&agrave;nh s&agrave;n thương mại điện tử h&agrave;ng đầu Việt Nam trong lĩnh vực mua sắm c&ugrave;ng c&aacute;c thương hiệu nổi tiếng được chọn lựa kỹ lưỡng về chất lượng nhất v&agrave; l&agrave; cầu nối thương mại tin cậy giữa nh&agrave; cung cấp, kh&aacute;ch h&agrave;ng v&agrave; c&aacute;c th&agrave;nh vi&ecirc;n đăng k&yacute; t&agrave;i khoản.</span></span></span></p>
<p class="MsoNormal" style="text-align: left;"><strong><span style="color: rgb(0, 0, 0);"><span lang="EN-US" style="font-size: 13.0pt; line-height: 107%; mso-ansi-language: EN-US;"><span style="color: rgb(0, 0, 0);">Mục ti&ecirc;u:<br></span></span></span></strong><span style="color: rgb(0, 0, 0);"><span lang="EN-US" style="font-size: 13.0pt; line-height: 107%; mso-ansi-language: EN-US;"><span style="color: rgb(0, 0, 0);">&nbsp;- HihiChi với phương ch&acirc;m mang tới c&aacute;c sản phẩm cao cấp, chất lượng, được chọn lọc, trong c&aacute;c thương hiệu c&oacute; danh tiếng đến với mọi đối tượng kh&aacute;ch h&agrave;ng, từ những đối tượng &iacute;t quan t&acirc;m đến c&aacute;c t&iacute;n đồ đam m&ecirc; h&agrave;ng hiệu.<br>&nbsp;- Ch&uacute;ng t&ocirc;i tin rằng với sức mạnh của chuyển đổi c&ocirc;ng nghệ v&agrave; muốn thay đổi th&oacute;i quen mua sắm bằng c&aacute;ch cung cấp nền tảng để kết nối giữa người mua v&agrave; người b&aacute;n, khi mua sắm online th&ocirc;ng qua c&aacute;c thiết bị điện tử như m&aacute;y t&iacute;nh, điện thoại th&ocirc;ng minh, trở th&agrave;nh một h&agrave;nh vi th&ocirc;ng thường.<br>&nbsp;- HihiChi với mục ti&ecirc;u li&ecirc;n tục n&acirc;ng cao n&ecirc;n tảng của bản chất s&agrave;n thương mại điện tử để mang lại những trải nghiệm mua sắm liền mạch, th&uacute; vị cho tất cả kh&aacute;ch h&agrave;ng v&agrave; trở th&agrave;nh nền tảng thương mại điện tử chuy&ecirc;n về c&aacute;c sản phẩm c&oacute; thương hiệu uy t&iacute;n trong v&agrave; ngo&agrave;i nước.<br></span></span></span></p>
<p class="MsoNormal" style="text-align: left;"><span style="color: rgb(0, 0, 0);"><span lang="EN-US" style="font-size: 13.0pt; line-height: 107%; mso-ansi-language: EN-US;"><span style="color: rgb(0, 0, 0);"><strong>Gi&aacute; trị của ch&uacute;ng t&ocirc;i:<br></strong>- HihiChi tạo ra c&aacute;c cơ hội kinh doanh cho c&aacute;c nh&agrave; b&aacute;n h&agrave;ng, nh&agrave; sản xuất nội địa mở rộng thị trường, c&oacute; được một m&ocirc;i trường ph&aacute;t triển l&agrave;nh mạnh.<br>- C&ugrave;ng tr&ecirc;n hệ thống n&agrave;y, HihiChi mang đến cho người ti&ecirc;u d&ugrave;ng những sản phẩm, dịch vụ chất lượng cao, th&uacute;c đẩy sự ph&aacute;t triển của lĩnh vực thương mại điện tử cũng như ng&agrave;nh b&aacute;n lẻ tại thị trường Việt Nam. Đ&acirc;y l&agrave; một phần quan trọng tạo ra động lực mạnh mẻ để ph&aacute;t triển nền kinh tế, từ đ&oacute; g&oacute;p phần thịnh vượng của đất nước.<br>&nbsp;- Hệ thống mua sắm dễ d&agrave;ng chỉ với một c&aacute;i nhấp chuột, d&ugrave; bạn l&agrave; nh&agrave; quản l&yacute; bận rộn hay người nội trợ tất bật với việc chăm s&oacute;c gia đ&igrave;nh v&agrave; con c&aacute;i th&igrave; chắc chắn rằng sẽ đều y&ecirc;u th&iacute;ch trải nghiệm mua b&aacute;n tại đ&acirc;y của ch&uacute;ng t&ocirc;i khi mọi thao t&aacute;c đều trở n&ecirc;n dễ d&agrave;ng, thuận tiện, v&agrave; tiết kiệm thời gian hơn bao giờ hết.<br><br><img style="display: block; margin-left: auto; margin-right: auto;" src="https://blog.dktcdn.net/files/san-giao-dich-thuong-mai-dien-tu.png" alt="" width="800" height="600"></span></span></span></p>
<p class="MsoNormal" style="text-align: center;"><span style="color: rgb(0, 0, 0);"><span lang="EN-US" style="font-size: 13.0pt; line-height: 107%; mso-ansi-language: EN-US;"><span style="color: rgb(0, 0, 0);"><strong><em>Mua sắm tiện lợi, dễ d&agrave;ng t&igrave;m kiếm thương hiệu y&ecirc;u th&iacute;ch, uy t&iacute;n tr&ecirc;n s&agrave;n thương mại điện tử HihiChi</em></strong></span></span></span></p>
<p class="MsoNormal" style="text-align: left;"><strong>D<span style="color: rgb(0, 0, 0);">uyệt web dễ d&agrave;ng:</span><br></strong><span style="color: rgb(0, 0, 0);">&nbsp;- Giao diện website được thiết kế thuận tiện, dễ d&agrave;n t&igrave;m kiếm sản phẩm, thương hiệu chất lượng, uy t&iacute;n v&agrave; y&ecirc;u th&iacute;ch, cũng như c&aacute;ch thức đặt h&agrave;ng, mua h&agrave;ng, li&ecirc;n hệ... việc mua sắm chưa bao giờ chưa n&ecirc;n đơn giản hơn thế.</span></p>
<p class="MsoNormal" style="text-align: left;"><span style="color: rgb(0, 0, 0);"><strong>Thanh to&aacute;n đơn giản v&agrave; nhanh ch&oacute;ng:<br>&nbsp;</strong>- Sau khi đ&atilde; lựa chọn sản phẩm ưng &yacute; qu&yacute; kh&aacute;ch c&oacute; thể lựa chọn trong nhiều phương thức thanh to&aacute;n kh&aacute;c nhau. Việc thanh to&aacute;n c&oacute; thể thực hiện đơn giản bằng tiền mặt, chuyển khoản. Sau khi đặt h&agrave;ng th&agrave;nh c&ocirc;ng qu&yacute; kh&aacute;ch sẽ được th&ocirc;ng b&aacute;o về t&igrave;nh trạng đơn h&agrave;ng.</span></p>
<p class="MsoNormal" style="text-align: left;"><span style="color: rgb(0, 0, 0);"><strong>Dịch vụ chăm s&oacute;c kh&aacute;ch h&agrave;ng chu đ&aacute;o v&agrave; chuy&ecirc;n nghiệp:<br>&nbsp;</strong>- Qu&yacute; kh&aacute;ch c&oacute; thể sử dụng đường d&acirc;y n&oacute;ng trao đổi với những chuy&ecirc;n vi&ecirc;n ở bộ phận chăm s&oacute;c kh&aacute;ch h&agrave;ng để tư vấn về những vấn đề c&aacute; nh&acirc;n c&oacute; li&ecirc;n quan đến như đơn h&agrave;ng, sản phẩm, thương hiệu, cửa h&agrave;ng, hoặc bất cứ vấn đề g&igrave; đều sẽ được hỗ trợ một c&aacute;ch tốt nhất, chuy&ecirc;n nghiệp, nhanh ch&oacute;ng v&agrave; chu đ&aacute;o nhất bằng nhiều loại dịch vụ chăm s&oacute;c kh&aacute;ch h&agrave;ng kh&aacute;c nhau.</span></p>
<p class="MsoNormal" style="text-align: left;"><strong><span style="color: rgb(0, 0, 0);">Sản phẩm c&oacute; thương hiệu uy t&iacute;n, ch&iacute;nh h&atilde;ng, đa dạng:<br></span></strong><span style="color: rgb(0, 0, 0);">- Ở HihiChi, qu&yacute; kh&aacute;ch sẽ t&igrave;m được những thương hiệu c&oacute; danh tiếng trong nước v&agrave; tr&ecirc;n thế giới, đ&atilde; được HihiChi chọn lọc kỹ lưỡng, đảm bảo về chất lượng, cũng như gi&aacute; th&agrave;nh tốt nhất để mang đến cho qu&yacute; kh&aacute;ch h&agrave;ng. Đặc biệt, HihiChi lu&ocirc;n cập nhật v&agrave; mang về những sản phẩm mới theo kịp tr&agrave;o lưu quốc tế.&nbsp;</span></p>
<p class="MsoNormal" style="text-align: left;"><span style="color: rgb(0, 0, 0);"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://xuongmaysi.com/wp-content/uploads/2022/01/100-thuong-hieu-thoi-trang-noi-tieng-the-gioi.jpg" alt="Top 100 Thương hiệu thời trang nổi tiếng nhất thế giới" width="1202" height="677"><br></span></p>
<p class="MsoNormal" style="text-align: left;">&nbsp;</p>', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (2, 1, N'Quy tắc đạo đức', N'<p><video controls="controls" width="300" height="150">
<source src="//cloud.video.taobao.com/play/u/443465738/p/1/e/6/t/1/351654664488.mp4" type="video/mp4"></video></p>', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (3, 1, N'Quyền riêng tư', N'<p style="text-align: center;"><video controls="controls" width="300" height="150">
<source src="//cloud.video.taobao.com/play/u/443465738/p/1/e/6/t/1/351654664488.mp4" type="video/mp4"></video></p>
<p style="text-align: center;">Sản phẩm cao cấp</p>', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (5, 2, N'Chính sách bảo hành', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (6, 2, N'Chính sách đổi trả', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (7, 2, N'Chính sách thanh toán', N'<h1>Chính sách thanh toán</h1>', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (8, 2, N'Chính sách giao hàng', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (9, 1, N'Sản phẩm của chúng tôi', N'<p><video controls="controls" width="300" height="150">
<source src="//cloud.video.taobao.com/play/u/443465738/p/1/e/6/t/1/351654664488.mp4" type="video/mp4"></video></p>', 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [Highlights], [New], [DiscountId]) VALUES (64, N'Nissi Seafoods', N'brand_feee0ad8-64f6-47dc-aeb0-1e8e3b6be4e8.png', 1, CAST(N'2023-02-11' AS Date), 1, NULL, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [Highlights], [New], [DiscountId]) VALUES (65, N'SMEG', N'brand_0ed89aa6-5555-46b4-a980-46eb5e49825b.png', 1, CAST(N'2023-02-19' AS Date), 1, NULL, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [Highlights], [New], [DiscountId]) VALUES (66, N'Bear', N'brand_d5d8fb28-c399-4259-8a60-3deb4511a810.png', 1, CAST(N'2023-02-19' AS Date), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (64, 9)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (65, 11)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (66, 11)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (9, N'Thực phẩm')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (10, N'Test')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (11, N'Đồ gia dụng')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Configurations] ON 

INSERT [dbo].[Configurations] ([Id], [WebsiteName], [FaviconPath], [LogoPath], [StartTime], [EndTime], [PhoneNumber], [Mail], [Owner], [FacebookUrl], [Address], [AddressUrl]) VALUES (1, N'HiHiChi', N'favicon_f31fb1e8-d495-4b29-8a3d-ebf12fb69910.png', N'logo_0052e058-a76f-46c6-ab29-0eaec8a3fc6c.png', CAST(N'08:30:00' AS Time), CAST(N'17:30:00' AS Time), N'0906035526', N'vantuanitc1989@gmail.com', N'Trần Văn Tuấn', N'facebook.com/tngduy10', N'Số 365/39A Hậu Giang, Phường 11, Quận 06, TP.Hồ Chí Minh', N'https://goo.gl/maps/tnZ1983YvzTU4j6s6')
SET IDENTITY_INSERT [dbo].[Configurations] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([DiscountId], [DiscountValue], [DiscountCode], [DiscountStock], [StartDate], [EndDate], [Status], [isPercent], [forGlobal], [forShop], [forBrand]) VALUES (1, CAST(500000 AS Decimal(18, 0)), N'KHAITRUONG', 1000, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-11-11T00:00:00.000' AS DateTime), 0, 0, 1, 0, 0)
INSERT [dbo].[Discount] ([DiscountId], [DiscountValue], [DiscountCode], [DiscountStock], [StartDate], [EndDate], [Status], [isPercent], [forGlobal], [forShop], [forBrand]) VALUES (2, CAST(30 AS Decimal(18, 0)), N'SHOPMOI', 10, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-11-11T00:00:00.000' AS DateTime), 0, 1, 0, 1, 0)
INSERT [dbo].[Discount] ([DiscountId], [DiscountValue], [DiscountCode], [DiscountStock], [StartDate], [EndDate], [Status], [isPercent], [forGlobal], [forShop], [forBrand]) VALUES (3, CAST(500000 AS Decimal(18, 0)), N'THUONGHIEU', 10, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-11-11T00:00:00.000' AS DateTime), 0, 0, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Header] ON 

INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (1, 0, N'Trang Chủ', N'/Home/Index', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (2, 1, N'Hot sale', N'/Product/ProductHotSale', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (3, 2, N'Sản phẩm mới', N'/Product/ProductNewest', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (4, 3, N'Thương hiệu', N'/Brand/AllBrands', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (5, 4, N'Thanh toán', N'/Home/Payment', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (6, 5, N'Hàng có sẵn', N'/Product/ProductAvaliable', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (7, 6, N'Hàng đặt trước', N'/Product/ProductPreOrder', 1)
SET IDENTITY_INSERT [dbo].[Header] OFF
GO
SET IDENTITY_INSERT [dbo].[MessageHistory] ON 

INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (179, N'test', NULL, CAST(N'2023-01-29T14:19:36.590' AS DateTime), NULL, N'Root', N'0397974403', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (180, N'test2', NULL, CAST(N'2023-01-29T14:20:34.483' AS DateTime), NULL, N'Root', N'0397974403', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (181, N'test3', NULL, CAST(N'2023-01-29T14:22:39.773' AS DateTime), NULL, N'Root', N'0397974403', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (182, N'qwdqwd', NULL, CAST(N'2023-01-29T14:22:47.180' AS DateTime), NULL, N'Root', N'0397974403', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (183, N'qwdqwd', NULL, CAST(N'2023-01-29T14:22:49.507' AS DateTime), NULL, N'Root', N'0397974403', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (184, N'buyer test', NULL, CAST(N'2023-01-29T14:23:15.297' AS DateTime), NULL, N'Buyer', N'buyer', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (187, N'admin rep', NULL, CAST(N'2023-01-29T14:50:30.350' AS DateTime), N'0397974403', N'sa', N'admin', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (188, N'admin rep buyer', NULL, CAST(N'2023-01-29T14:52:41.540' AS DateTime), N'buyer', N'sa', N'admin', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (189, N'test', NULL, CAST(N'2023-01-29T14:53:47.897' AS DateTime), NULL, N'Root', N'0397974403', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (190, N'realtime', NULL, CAST(N'2023-01-29T14:53:56.720' AS DateTime), NULL, N'Root', N'0397974403', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (191, N'admin rep rt', NULL, CAST(N'2023-01-29T14:54:05.083' AS DateTime), N'0397974403', N'sa', N'admin', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (192, N'asd', NULL, CAST(N'2023-01-29T14:55:14.217' AS DateTime), N'0397974403', N'sa', N'admin', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (193, N'teasd', NULL, CAST(N'2023-01-29T14:57:43.617' AS DateTime), NULL, N'Root', N'0397974403', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (194, N'treerv', NULL, CAST(N'2023-01-29T14:57:48.383' AS DateTime), N'0397974403', N'sa', N'admin', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (195, N'qwdqwdqwd', NULL, CAST(N'2023-01-29T14:58:54.330' AS DateTime), NULL, N'Root', N'0397974403', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (196, N'qwdqwd', NULL, CAST(N'2023-01-29T14:58:58.537' AS DateTime), N'0397974403', N'sa', N'admin', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (197, N'dsdas', NULL, CAST(N'2023-01-29T14:59:05.730' AS DateTime), NULL, N'Root', N'0397974403', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (198, N'admin 02', NULL, CAST(N'2023-01-29T15:01:13.380' AS DateTime), N'0397974403', N'Admin', N'0906035526', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (199, N'test', NULL, CAST(N'2023-01-29T15:16:37.413' AS DateTime), NULL, N'User01', N'0397974400', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (200, N'test', NULL, CAST(N'2023-01-29T15:16:49.953' AS DateTime), N'0397974400', N'sa', N'admin', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (201, N'asd', NULL, CAST(N'2023-01-29T15:26:00.480' AS DateTime), NULL, N'User01', N'0397974400', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (202, N'asdasda', NULL, CAST(N'2023-01-29T15:35:28.877' AS DateTime), N'0397974400', N'sa', N'admin', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (203, N'alo', NULL, CAST(N'2023-01-29T16:06:26.330' AS DateTime), NULL, N'Tuan Tuan', N'0908070605', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (204, N'alo', NULL, CAST(N'2023-01-29T16:06:55.567' AS DateTime), NULL, N'Tuan Tu', N'0123456789', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (205, N'alo', NULL, CAST(N'2023-01-29T16:07:36.290' AS DateTime), NULL, N'Tuan Tu', N'0123456789', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (206, N'Test', NULL, CAST(N'2023-01-29T16:07:46.543' AS DateTime), NULL, N'Root 02', N'0397974444', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (207, N'test', NULL, CAST(N'2023-01-29T16:07:56.237' AS DateTime), NULL, N'Root 02', N'0397974444', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (208, N'reply từ admin', NULL, CAST(N'2023-01-29T16:08:05.290' AS DateTime), N'0397974444', N'sa', N'admin', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (209, N'alo', NULL, CAST(N'2023-01-29T16:09:01.713' AS DateTime), NULL, N'Tuan Tu', N'0123456789', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (210, N'hi', NULL, CAST(N'2023-01-29T16:09:05.370' AS DateTime), NULL, N'Tuan Tu', N'0123456789', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (211, N'hello', NULL, CAST(N'2023-01-29T16:09:25.753' AS DateTime), N'0123456789', N'Admin', N'0906035526', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (212, N'alo', NULL, CAST(N'2023-01-29T16:09:44.940' AS DateTime), NULL, N'Tuan Tu', N'0123456789', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (213, N'alo', NULL, CAST(N'2023-01-29T16:09:46.197' AS DateTime), NULL, N'Tuan Tu', N'0123456789', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (214, N'alo', NULL, CAST(N'2023-01-29T16:10:24.137' AS DateTime), NULL, N'Root 02', N'0397974444', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (215, N'rep', NULL, CAST(N'2023-01-29T16:10:32.087' AS DateTime), N'0397974444', N'sa', N'admin', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (216, N'😕', NULL, CAST(N'2023-01-29T16:10:38.180' AS DateTime), NULL, N'Root 02', N'0397974444', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (217, N'hi', NULL, CAST(N'2023-01-29T16:13:08.910' AS DateTime), N'0397974444', N'Admin', N'0906035526', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (218, N'ad', NULL, CAST(N'2023-01-29T16:25:33.013' AS DateTime), NULL, N'tuan', N'090909090', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (219, N'alo', NULL, CAST(N'2023-01-30T09:04:04.660' AS DateTime), NULL, N'Trần Văn Tuấn', N'0909090909', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (220, N'12', NULL, CAST(N'2023-01-30T09:04:36.620' AS DateTime), NULL, N'123', N'123456789', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (221, N'alo', NULL, CAST(N'2023-01-30T09:05:17.617' AS DateTime), NULL, N'Root 02', N'0397974444', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (222, N'2', NULL, CAST(N'2023-01-31T13:21:15.570' AS DateTime), NULL, N'123', N'123456789', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (223, N'22323321', NULL, CAST(N'2023-01-31T13:21:27.447' AS DateTime), NULL, N'123', N'123456789', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (224, N'212', NULL, CAST(N'2023-01-31T13:21:28.780' AS DateTime), NULL, N'123', N'123456789', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (225, N'0', NULL, CAST(N'2023-02-01T09:41:10.490' AS DateTime), NULL, N'0', N'0', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (226, N'alo', NULL, CAST(N'2023-02-01T09:42:16.387' AS DateTime), NULL, N'sa', N'admin', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (227, N'alo', NULL, CAST(N'2023-02-04T23:43:56.477' AS DateTime), NULL, N'Tuan Tuan', N'0908070605', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (228, N'hihi', NULL, CAST(N'2023-02-04T23:44:12.943' AS DateTime), NULL, N'Tuan Tuan', N'0908070605', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (229, N'alo', NULL, CAST(N'2023-02-04T23:44:18.133' AS DateTime), N'0908070605', N'Admin', N'0906035526', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (230, N'alo', NULL, CAST(N'2023-02-04T23:44:26.540' AS DateTime), NULL, N'Tuan Tuan', N'0908070605', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (231, N'ki', NULL, CAST(N'2023-02-04T23:44:41.050' AS DateTime), NULL, N'Tuan Tuan', N'0908070605', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (232, N'alo', NULL, CAST(N'2023-02-28T17:17:10.817' AS DateTime), NULL, N'TUan', N'09090909', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (233, N'hi', NULL, CAST(N'2023-02-28T17:17:43.027' AS DateTime), N'09090909', N'Admin', N'0906035526', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (234, N'chat chơi thôi', NULL, CAST(N'2023-02-28T17:17:50.887' AS DateTime), NULL, N'TUan', N'09090909', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (235, N'ok', NULL, CAST(N'2023-02-28T17:17:54.827' AS DateTime), N'09090909', N'Admin', N'0906035526', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (236, N'alo', NULL, CAST(N'2023-02-28T17:18:23.020' AS DateTime), NULL, N'Long con', N'12345678', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (237, N'hi', NULL, CAST(N'2023-02-28T17:18:42.037' AS DateTime), N'12345678', N'Admin', N'0906035526', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (238, N'okokok', NULL, CAST(N'2023-02-28T17:18:48.100' AS DateTime), N'09090909', N'Admin', N'0906035526', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (239, N'chào bãn', NULL, CAST(N'2023-02-28T17:18:57.427' AS DateTime), N'12345678', N'Admin', N'0906035526', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (240, N'chào bạn', NULL, CAST(N'2023-02-28T17:19:03.637' AS DateTime), NULL, N'Long con', N'12345678', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (241, N'tôi có thể hổ trợ gì cho bạn', NULL, CAST(N'2023-02-28T17:19:11.663' AS DateTime), NULL, N'Long con', N'12345678', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (242, N'ok', NULL, CAST(N'2023-02-28T17:19:14.567' AS DateTime), N'12345678', N'Admin', N'0906035526', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (243, N'chào bạn', NULL, CAST(N'2023-02-28T17:19:19.297' AS DateTime), N'09090909', N'Admin', N'0906035526', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (244, N'chào', NULL, CAST(N'2023-02-28T17:19:25.183' AS DateTime), NULL, N'TUan', N'09090909', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (245, N'chat chơi nhé', NULL, CAST(N'2023-02-28T17:19:36.910' AS DateTime), N'09090909', N'Admin', N'0906035526', N'FROM_ADMIN_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (246, N'ok', NULL, CAST(N'2023-02-28T17:19:40.067' AS DateTime), NULL, N'TUan', N'09090909', N'FROM_CLIENT_MSG', N'READ')
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (247, N'okoko', NULL, CAST(N'2023-02-28T17:19:47.803' AS DateTime), NULL, N'TUan', N'09090909', N'FROM_CLIENT_MSG', N'READ')
SET IDENTITY_INSERT [dbo].[MessageHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[NotificationType] ON 

INSERT [dbo].[NotificationType] ([Id], [TypeName], [TypeCode]) VALUES (1, N'Other', N'OTHER')
INSERT [dbo].[NotificationType] ([Id], [TypeName], [TypeCode]) VALUES (2, N'Order Status ', N'ORDER_STATUS')
INSERT [dbo].[NotificationType] ([Id], [TypeName], [TypeCode]) VALUES (3, N'Comment', N'COMMENT')
INSERT [dbo].[NotificationType] ([Id], [TypeName], [TypeCode]) VALUES (4, N'Coupon', N'COUPON')
INSERT [dbo].[NotificationType] ([Id], [TypeName], [TypeCode]) VALUES (5, N'Discount From Shop', N'DISCOUNT_FROM_SHOP')
INSERT [dbo].[NotificationType] ([Id], [TypeName], [TypeCode]) VALUES (6, N'New Product', N'NEW_PRODUCT')
INSERT [dbo].[NotificationType] ([Id], [TypeName], [TypeCode]) VALUES (7, N'Like', N'LIKE')
INSERT [dbo].[NotificationType] ([Id], [TypeName], [TypeCode]) VALUES (8, N'Update Comment', N'UPDATE_COMMENT')
INSERT [dbo].[NotificationType] ([Id], [TypeName], [TypeCode]) VALUES (9, N'New Message', N'NEW_MESSAGE')
SET IDENTITY_INSERT [dbo].[NotificationType] OFF
GO
SET IDENTITY_INSERT [dbo].[OnlineHistory] ON 

INSERT [dbo].[OnlineHistory] ([Id], [AccessDate], [UserId], [Duration]) VALUES (10, CAST(N'2022-12-17T12:02:21.947' AS DateTime), 36, 0)
SET IDENTITY_INSERT [dbo].[OnlineHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Option] ON 

INSERT [dbo].[Option] ([OptionId], [OptionName]) VALUES (16, N'Màu sắc')
INSERT [dbo].[Option] ([OptionId], [OptionName]) VALUES (17, N'Màu sắc')
SET IDENTITY_INSERT [dbo].[Option] OFF
GO
SET IDENTITY_INSERT [dbo].[OptionValue] ON 

INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1045, N'Hồng', 16, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1046, N'Hồng', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1047, N'Hồng', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1048, N'Hồng', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1049, N'Hồng', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1050, N'Hồng', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1051, N'Nâu', 16, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1052, N'Nâu', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1053, N'Nâu', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1054, N'Nâu', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1055, N'Nâu', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1056, N'Nâu', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1057, N'Nâu', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1061, N'Trắng Xanh', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1062, N'Vàng', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1063, N'Màu đất tử sa', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1064, N'Trắng Kem', 16, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1065, N'Đen', 17, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1066, N'Xanh nhạt', 17, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1067, N'Trắng kem', 16, 0)
SET IDENTITY_INSERT [dbo].[OptionValue] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 

INSERT [dbo].[PaymentMethod] ([PaymentMethodId], [PaymentMethod]) VALUES (1, N'COD')
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [PPC], [ProductCode], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductDescriptionMobile], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note], [SizeGuide], [Link]) VALUES (118, N'40655102', N'Bào Ngư Frozen Abalone', N'Bào Ngư Frozen Abalone', NULL, CAST(N'2023-02-11T01:42:55.127' AS DateTime), N'<p style="text-align: center;"><iframe src="https://www.youtube.com/embed/160fVMHbkss" width="800" height="449" allowfullscreen="allowfullscreen"></iframe><br><br></p>
<p style="text-align: left;">B&agrave;o Ngư H&agrave;n Quốc NISSI Nhập Khẩu<br>✔️ B&agrave;o ngư: C&ugrave;ng với yến s&agrave;o v&agrave; vi c&aacute; mập, b&agrave;o ngư được xem l&agrave; m&oacute;n ăn qu&yacute; trong c&aacute;c bữa tiệc sang trọng.&nbsp;<br>- T&aacute;c dụng của b&agrave;o ngư với sức khỏe:&nbsp; Bổ thận, tang cường sinh lực nam giới.<br>- Ngăn ngừa bệnh ung thư - Giảm nguy cơ mắc bệnh về tim mạch, tăng cường hệ miễn dịch.<br>- Ngăn ngừa đau khớp v&agrave; gi&uacute;p chắc khỏe xương.<br>- Tăng cường thị lực.<br>- Đặc biệt b&agrave;o ngư rất tốt cho t&oacute;c, răng, m&oacute;ng, ngăn ngừa rụng t&oacute;c.<br>👉 Th&agrave;nh phần dinh dưỡng của b&agrave;o ngư: Do c&oacute; h&igrave;nh dạng giống c&aacute;i tai, b&agrave;o ngư c&ograve;n được gọi l&agrave; hải nhĩ. Tuy c&oacute; lượng cholesterol kh&aacute; cao, song b&agrave;o ngư lại kh&ocirc;ng g&acirc;y ảnh hưởng cho người bị chứng cholesterol cao, do c&oacute; sự c&acirc;n bằng trong th&agrave;nh phần. <br>👉Trong 100g b&agrave;o ngư chứa: - chất đạm 17,05g; - đường (carbonhydrat) 5,89g; - chất b&eacute;o 0,75g; - cholesterol 84,7mg; - c&aacute;c loại vitamin B1, B2, kho&aacute;ng chất v&agrave; nguy&ecirc;n tố vi lượng. Trong chất đạm cũng c&oacute; đủ 19 loại axit amin thiết yếu cho cơ thể ở lượng mức tương đối cao như Threonin 0,73mg; Isoleucin 0,75mg; Valin0,7mg; axit glutamic 2,31mg.&nbsp;<br>👉 Theo quan niệm của y học cổ truyền, thịt b&agrave;o ngư c&oacute; vị mặn, t&iacute;nh &ocirc;n, c&oacute; t&aacute;c dụng bổ hư, tư &acirc;m, nhuận phế thanh nhiệt&hellip;Người th&iacute;ch hợp d&ugrave;ng b&agrave;o ngư: người trong giai đoạn m&atilde;n kinh, m&atilde;n dục, cường tuyến gi&aacute;p trạng, khả năng tập trung k&eacute;m. Người kh&ocirc;ng ph&ugrave; hợp: bệnh g&uacute;t, cảm mạo ph&aacute;t sốt, hầu họng sưng đau. <br>✔️ C&aacute;ch chế biến: B&agrave;o ngư rửa sạch nhẹ nh&agrave;ng to&agrave;n bộ, sau đ&oacute; c&oacute; thể hầm trước, ch&uacute; &yacute; khi nấu: phải nấu b&agrave;o ngư thật ch&iacute;n nhừ, kh&ocirc;ng được nửa sống nửa ch&iacute;n. Người cao huyết &aacute;p ăn b&agrave;o ngư tươi c&oacute; thể th&uacute;c đẩy qu&aacute; tr&igrave;nh chuyển h&oacute;a trao đổi chất v&agrave; tuần ho&agrave;n huyết dịch; người tiểu đường ăn b&agrave;o ngư tươi c&oacute; thể th&uacute;c đẩy qu&aacute; tr&igrave;nh tiết insulin của tuyến tụy. c&aacute;c m&oacute;n c&oacute; thể chế biến : - B&agrave;o ngư sốt dầu h&agrave;o - S&uacute;p b&agrave;o ngư - M&igrave; x&agrave;o b&agrave;o ngư - Ch&aacute;o, cơm b&agrave;o ngư - Ăn k&egrave;m với lẩu - Nướng mỡ h&agrave;nh - Hấp.<br>✔️Xuất sứ : H&agrave;n Quốc <br>✔️Đ&oacute;ng g&oacute;i : H&uacute;t ch&acirc;n kh&ocirc;ng 1 t&uacute;i 500g (10-11 con/t&uacute;i) <br>✔️ Bảo quản: Nếu chưa sử dụng ngay ch&uacute;ng ta c&oacute; thể bọc k&iacute;n bằng nilon v&agrave; bỏ v&agrave;o ngăn tủ đ&ocirc;ng để bảo quản l&acirc;u hơn <br>✔️HSD: 6 Th&aacute;ng trong m&ocirc;i trường đ&ocirc;ng lạnh (ngăn đ&ocirc;ng của tủ lạnh) <br><br>🚀 Giao h&agrave;ng: B&agrave;o ngư tươi n&ecirc;n shop chỉ nhận giao h&agrave;ng HỎA TỐC 45&rsquo; tại TP.HCM. Sau khi kh&aacute;ch đặt h&agrave;ng Hỏa tốc sẽ giao ngay!</p>', N'<p style="text-align: center;"><video style="width: 614px; height: 307px;" controls="controls" width="614" height="307"> <source src="https://fb.watch/iChBCTi2jH/" data-mce-fragment="1"></video><br><br></p>
<p style="text-align: left;">B&agrave;o Ngư H&agrave;n Quốc NISSI Nhập Khẩu<br>✔️ B&agrave;o ngư: C&ugrave;ng với yến s&agrave;o v&agrave; vi c&aacute; mập, b&agrave;o ngư được xem l&agrave; m&oacute;n ăn qu&yacute; trong c&aacute;c bữa tiệc sang trọng.&nbsp;<br>- T&aacute;c dụng của b&agrave;o ngư với sức khỏe:&nbsp; Bổ thận, tang cường sinh lực nam giới.<br>- Ngăn ngừa bệnh ung thư - Giảm nguy cơ mắc bệnh về tim mạch, tăng cường hệ miễn dịch.<br>- Ngăn ngừa đau khớp v&agrave; gi&uacute;p chắc khỏe xương.<br>- Tăng cường thị lực.<br>- Đặc biệt b&agrave;o ngư rất tốt cho t&oacute;c, răng, m&oacute;ng, ngăn ngừa rụng t&oacute;c.<br>👉 Th&agrave;nh phần dinh dưỡng của b&agrave;o ngư: Do c&oacute; h&igrave;nh dạng giống c&aacute;i tai, b&agrave;o ngư c&ograve;n được gọi l&agrave; hải nhĩ. Tuy c&oacute; lượng cholesterol kh&aacute; cao, song b&agrave;o ngư lại kh&ocirc;ng g&acirc;y ảnh hưởng cho người bị chứng cholesterol cao, do c&oacute; sự c&acirc;n bằng trong th&agrave;nh phần. <br>👉Trong 100g b&agrave;o ngư chứa: - chất đạm 17,05g; - đường (carbonhydrat) 5,89g; - chất b&eacute;o 0,75g; - cholesterol 84,7mg; - c&aacute;c loại vitamin B1, B2, kho&aacute;ng chất v&agrave; nguy&ecirc;n tố vi lượng. Trong chất đạm cũng c&oacute; đủ 19 loại axit amin thiết yếu cho cơ thể ở lượng mức tương đối cao như Threonin 0,73mg; Isoleucin 0,75mg; Valin0,7mg; axit glutamic 2,31mg.&nbsp;<br>👉 Theo quan niệm của y học cổ truyền, thịt b&agrave;o ngư c&oacute; vị mặn, t&iacute;nh &ocirc;n, c&oacute; t&aacute;c dụng bổ hư, tư &acirc;m, nhuận phế thanh nhiệt&hellip;Người th&iacute;ch hợp d&ugrave;ng b&agrave;o ngư: người trong giai đoạn m&atilde;n kinh, m&atilde;n dục, cường tuyến gi&aacute;p trạng, khả năng tập trung k&eacute;m. Người kh&ocirc;ng ph&ugrave; hợp: bệnh g&uacute;t, cảm mạo ph&aacute;t sốt, hầu họng sưng đau. <br>✔️ C&aacute;ch chế biến: B&agrave;o ngư rửa sạch nhẹ nh&agrave;ng to&agrave;n bộ, sau đ&oacute; c&oacute; thể hầm trước, ch&uacute; &yacute; khi nấu: phải nấu b&agrave;o ngư thật ch&iacute;n nhừ, kh&ocirc;ng được nửa sống nửa ch&iacute;n. Người cao huyết &aacute;p ăn b&agrave;o ngư tươi c&oacute; thể th&uacute;c đẩy qu&aacute; tr&igrave;nh chuyển h&oacute;a trao đổi chất v&agrave; tuần ho&agrave;n huyết dịch; người tiểu đường ăn b&agrave;o ngư tươi c&oacute; thể th&uacute;c đẩy qu&aacute; tr&igrave;nh tiết insulin của tuyến tụy. c&aacute;c m&oacute;n c&oacute; thể chế biến : - B&agrave;o ngư sốt dầu h&agrave;o - S&uacute;p b&agrave;o ngư - M&igrave; x&agrave;o b&agrave;o ngư - Ch&aacute;o, cơm b&agrave;o ngư - Ăn k&egrave;m với lẩu - Nướng mỡ h&agrave;nh - Hấp.<br>✔️Xuất sứ : H&agrave;n Quốc <br>✔️Đ&oacute;ng g&oacute;i : H&uacute;t ch&acirc;n kh&ocirc;ng 1 t&uacute;i 500g (10-11 con/t&uacute;i) <br>✔️ Bảo quản: Nếu chưa sử dụng ngay ch&uacute;ng ta c&oacute; thể bọc k&iacute;n bằng nilon v&agrave; bỏ v&agrave;o ngăn tủ đ&ocirc;ng để bảo quản l&acirc;u hơn <br>✔️HSD: 6 Th&aacute;ng trong m&ocirc;i trường đ&ocirc;ng lạnh (ngăn đ&ocirc;ng của tủ lạnh) <br><br>🚀 Giao h&agrave;ng: B&agrave;o ngư tươi n&ecirc;n shop chỉ nhận giao h&agrave;ng HỎA TỐC 45&rsquo; tại TP.HCM. Sau khi kh&aacute;ch đặt h&agrave;ng Hỏa tốc sẽ giao ngay!<br><br></p>', 0, 1, 1, 1, 1, 1, 1, N'', 20, 19, 64, NULL, NULL, N'', NULL, N'')
INSERT [dbo].[Product] ([ProductId], [PPC], [ProductCode], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductDescriptionMobile], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note], [SizeGuide], [Link]) VALUES (120, N'14509119', N'SUBE001', N'Nồi nấu chậm 0,8L Bear - Bản Quốc Tế', NULL, CAST(N'2023-02-19T16:47:29.700' AS DateTime), N'<p>Bạn muốn &ldquo;tối giản&rdquo; quy tr&igrave;nh nấu nướng? Bạn muốn cho b&eacute; được trải nghiệm nhiều kiểu ăn dặm kh&aacute;c nhau, (ăn dặm kiểu nhật, ăn dặm cho b&eacute;,&hellip;) v&agrave; cần t&igrave;m một sản phẩm c&oacute; thể đảm nhiệm tốt vai tr&ograve; ấy? Với khả năng t&iacute;ch hợp nhiều chức năng nấu, hấp, hầm v&agrave; giữ trọn h&agrave;m lượng dinh dưỡng của thực phẩm, nồi nấu ch&aacute;o chậm &ndash; Nồi nấu chậm Bear l&agrave; sự lựa chọn ho&agrave;n hảo d&agrave;nh cho bạn.</p>
<h2>C&ocirc;ng dụng của Nồi nấu chậm Bear 0,8L SUBE001</h2>
<ul>
<li>6 T&iacute;nh Năng : Hấp, Hầm canh, Nấu ch&aacute;o, Chưng yến, S&uacute;p ch&egrave;, Giữ ấm, Nấu c&aacute;c m&oacute;n ăn dặm</li>
<li>Chế độ giữ ấm k&eacute;p: Nhấn bằng tay hoặc tự động giữ cho m&oacute;n ăn của b&eacute; ấm n&oacute;ng l&acirc;u hơn. C&aacute;c mẹ c&oacute; thể nấu cho con 1 lần v&agrave;o buổi s&aacute;ng v&agrave; cho con ăn cả ng&agrave;y, nồi chống tr&agrave;o n&ecirc;n cứ cắm để đ&oacute; v&agrave; đi l&agrave;m việc kh&aacute;c.</li>
<li>Đun nấu c&aacute;ch thủy: C&aacute;ch thuỷ hầm chậm giữ được chất dinh dưỡng trong thức ăn. Nấu bằng nồi n&agrave;y ch&aacute;o s&aacute;nh v&agrave; nhừ, m&agrave; kh&ocirc;ng bị vỡ hạt n&ecirc;n dưỡng chất v&agrave; vị ngọt của gạo vẫn b&ecirc;n trong hạt</li>
<li>Chế độ ninh hầm: được y&ecirc;u th&iacute;ch v&igrave; độ thơm &ndash; đậm &ndash; ngọt khi nấu.</li>
<li>T&iacute;nh năng hẹn giờ: kh&acirc;u chuẩn bị cho bữa cơm đ&atilde; được thảnh thơi hơn rất nhiều. Đ&ecirc;m đặt s&aacute;ng ăn, hay s&aacute;ng đặt tối ăn. C&oacute; chế độ bảo quản giữ ấm trong 8 tiếng, rất tiện dụng.</li>
<li>C&oacute; nồi nấu chậm Bear, Mẹ vừa nấu ch&aacute;o cho con, vừa nấu được c&aacute;c m&oacute;n ngon, bổ dưỡng cho cả gia đ&igrave;nh.</li>
</ul>
<p><img class="aligncenter size-full wp-image-8428" style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-1.jpg" sizes="(max-width: 624px) 100vw, 624px" srcset="https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-1.jpg 624w, https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-1-600x600.jpg 600w, https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-1-100x100.jpg 100w" alt="Nồi nấu chậm Bear 0,8L SUBE001 | H&agrave;ng Quốc Tế | Bảo h&agrave;nh 18 th&aacute;ng" width="624" height="624"></p>
<div id="more">
<h2>Bộ phụ kiện của nồi nấu ch&aacute;o chậm Bear 0,8L SUBE001</h2>
<ul>
<li>1 Th&acirc;n m&aacute;y t&iacute;ch hợp bảng điều khiển m&agrave;n h&igrave;nh Led tiện lợi</li>
<li>1 Nắp nhựa</li>
<li>1 Nồi l&otilde;i sứ</li>
<li>1 Nắp nồi sứ</li>
<li>1 Lồng hấp</li>
<li>Gi&aacute; tay cầm chống bỏng</li>
<li>S&aacute;ch hướng dẫn sử dụng Tiếng Việt.</li>
</ul>
<figure id="attachment_8429" class="wp-caption aligncenter" aria-describedby="caption-attachment-8429"><img class="size-full wp-image-8429" style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-2.jpg" sizes="(max-width: 1430px) 100vw, 1430px" srcset="https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-2.jpg 1430w, https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-2-768x768.jpg 768w, https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-2-600x600.jpg 600w, https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-2-800x800.jpg 800w, https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-2-100x100.jpg 100w" alt="Bộ phụ kiện của nồi nấu ch&aacute;o chậm Bear 0,8L SUBE001" width="1430" height="1430">
<figcaption id="caption-attachment-8429" class="wp-caption-text">Bộ phụ kiện của nồi nấu ch&aacute;o chậm Bear 0,8L SUBE001</figcaption>
</figure>
<p>Nhỏ gọn, tiện lợi v&agrave; th&ocirc;ng minh, nồi nấu chậm Bear cung cấp cho người d&ugrave;ng thao t&aacute;c sử dụng đơn giản với 3 bước:</p>
<ul>
<li>Bước 1: Cho nước sạch v&agrave;o th&acirc;n nồi nấu chậm Bear, lưu &yacute; kh&ocirc;ng đổ nước qu&aacute; vạch max.</li>
<li>Bước 2: Cho thực phẩm v&agrave; gia vị v&agrave;o l&otilde;i sứ, n&ecirc;m nếm vừa ăn rồi đặt v&agrave;o nồi.</li>
<li>Bước 3: Ấn chọn chế độ nấu v&agrave; thời gian nấu, sau 5 gi&acirc;y, nồi sẽ tự động chuyển sang chế độ nấu m&agrave; bạn lựa chọn. Sau đ&oacute;, chỉ cần theo d&otilde;i khi thời gian nấu tr&ecirc;n nồi kết th&uacute;c l&agrave; l&uacute;c m&oacute;n ăn được ho&agrave;n th&agrave;nh.</li>
</ul>
<figure id="attachment_8430" class="wp-caption aligncenter" aria-describedby="caption-attachment-8430"><img class="size-full wp-image-8430" src="https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-3.jpg" sizes="(max-width: 1430px) 100vw, 1430px" srcset="https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-3.jpg 1430w, https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-3-768x512.jpg 768w, https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-3-800x533.jpg 800w" alt="Hướng dẫn sử dụng nồi nấu chậm Bear 0,8L SUBE001" width="1430" height="953">
<figcaption id="caption-attachment-8430" class="wp-caption-text">Hướng dẫn sử dụng nồi nấu chậm Bear 0,8L SUBE001</figcaption>
</figure>
<h2>Lưu &yacute; khi sử dụng Nồi nấu chậm Bear 0,8L &ndash; SUBE001</h2>
<ul>
<li>Sau mỗi lần sử dụng nồi Bear 0.8L, vui l&ograve;ng tắt c&ocirc;ng tắc v&agrave; r&uacute;t ph&iacute;ch cắm điện, đợi nồi nấu ch&aacute;o chậm Bear 0.8L nguội hẳn sau đ&oacute; mới tiến h&agrave;nh lau ch&ugrave;i.</li>
<li>Nghi&ecirc;m cấm ng&acirc;m nồi Bear 0.8L v&agrave;o bất kỳ dung dịch n&agrave;o để tiến h&agrave;nh vệ sinh. Chỉ n&ecirc;n sử dụng khăn ẩm để lau nồi nấu chậm Bear 0.8L.</li>
<li>Đối với c&aacute;c loại thực phẩm dễ biến chất khi hầm l&acirc;u hoặc trong điều kiện thời tiết n&oacute;ng nực, vui l&ograve;ng đặt thời gian hẹn trước ở nồi nấu ch&aacute;o chậm Bear 0.8L kh&ocirc;ng qu&aacute; d&agrave;i, tr&aacute;nh g&acirc;y biến chất cho thực phẩm.</li>
</ul>
<figure id="attachment_8431" class="wp-caption aligncenter" aria-describedby="caption-attachment-8431"><img class="size-full wp-image-8431" src="https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-4.jpg" sizes="(max-width: 1430px) 100vw, 1430px" srcset="https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-4.jpg 1430w, https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-4-768x515.jpg 768w, https://bearvietnam.vn/wp-content/uploads/noi-nau-cham-bear-08l-sube001-hang-quoc-te-bao-hanh-18-thang-4-800x537.jpg 800w" alt="Lưu &yacute; khi sử dụng Nồi nấu chậm Bear 0,8L - SUBE001" width="1430" height="959"></figure>
</div>', NULL, 0, 1, 1, 1, 0, 1, 1, N'Bảo hành 18 tháng', 22, 19, 66, NULL, NULL, N'', NULL, N'')
INSERT [dbo].[Product] ([ProductId], [PPC], [ProductCode], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductDescriptionMobile], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note], [SizeGuide], [Link]) VALUES (127, N'28981121', N'SUBE002', N'Nồi nấu chậm 1.6L Bear - Hàng Quốc Tế', NULL, CAST(N'2023-02-19T17:07:48.197' AS DateTime), N'<div class="text show-more-height" style="text-align: center;"><strong>Nồi nấu chậm k&egrave;m lồng hấp Bear DDZ-D16J3 (SUBE002) được t&iacute;ch hợp nhiều t&iacute;nh năng nấu v&agrave; hầm tiện lợi, gi&uacute;p bạn l&agrave;m nhiều m&oacute;n ăn kh&aacute;c nhau như: hấp, hầm, chưng yến, nấu ch&aacute;o,... Đặc biệt sản phẩm c&ograve;n được trang bị t&iacute;nh năng hẹn giờ nấu v&agrave; giữ nhiệt th&ocirc;ng minh, kh&ocirc;ng cần dậy sớm m&agrave; vẫn c&oacute; thể nấu ch&aacute;o thơm ngon v&agrave;o mỗi s&aacute;ng c&ugrave;ng nồi nấu chậm&nbsp;Bear DDZ-D16J3 (SUBE002) - phi&ecirc;n bản quốc tế.<br>&nbsp;<br></strong><strong><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_JLMm8C.jpeg"></strong><strong><img src="https://sube.vn/assets/media/images/uploads/20210111/dsc0598_1610352118_1CZBif.jpeg" width="898" height="598"></strong><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_6IIz10.jpeg"><strong><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_kZSEgT.jpeg"></strong><strong><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_EEuUMI.jpeg"></strong><strong><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_54E4dn.jpeg"></strong><strong><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_mVOal7.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_XUuLDu.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_5MYEZk.jpeg"></strong><strong><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_BfZqEn.jpeg"></strong><strong><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_oJHLdT.jpeg"></strong><strong><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_9vJQ4h.jpeg"></strong><strong><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_GrypbS.jpeg"></strong><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-16_1615799372_Uptxdz.jpeg"><strong><br></strong></div>', NULL, 0, 1, 1, 1, 0, 1, 1, N'Bảo hành 18 tháng', 22, 19, 66, NULL, NULL, N'', NULL, N'')
INSERT [dbo].[Product] ([ProductId], [PPC], [ProductCode], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductDescriptionMobile], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note], [SizeGuide], [Link]) VALUES (128, N'26121128', N'SUBE003', N'Nồi Nấu Chậm 2.5L Bear - Hàng quốc tế', NULL, CAST(N'2023-02-19T18:34:45.750' AS DateTime), N'<p style="text-align: center;">Nồi Nấu Chậm 2.5L Bear DDZ-C25E1 (SUBE003) phi&ecirc;n bản quốc tế&nbsp;với thiết kế th&ocirc;ng minh, t&iacute;ch hợp 5 l&otilde;i sứ&nbsp;th&ocirc;ng minh cho ph&eacute;p bạn chế biến nhiều m&oacute;n ăn c&ugrave;ng l&uacute;c. C&ugrave;ng Bear trải nghiệm ngay phi&ecirc;n bản nồi nấu chậm&nbsp;2.5L&nbsp;DDZ-C25E1 (SUBE003) ch&iacute;nh h&atilde;ng.<br><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_aHVBVk.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_5KJRK3.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210111/dsc0596_1610351294_25wQjz.jpeg" width="899" height="599"><img src="https://sube.vn/assets/media/images/uploads/20210111/dsc0595_1610351292_7wNF6u.jpeg" width="900" height="600"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_QprmXO.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_hbQf2z.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_I3SafI.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_r7FbnJ.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_dG5wli.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_dBiM4Y.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_oe5lPm.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_LXItDQ.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_3hKK3e.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_osNkTq.jpeg"><img src="https://sube.vn/assets/media/images/uploads/20210315/noi-nau-cham-bear-25_1615796357_G0hHhk.jpeg"></p>', NULL, 0, 1, 1, 1, 1, 1, 1, N'Bảo hành 18 tháng', 22, 19, 66, NULL, NULL, N'', NULL, N'')
INSERT [dbo].[Product] ([ProductId], [PPC], [ProductCode], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductDescriptionMobile], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note], [SizeGuide], [Link]) VALUES (132, N'17039131', N'KFJ-A15L1 (CF-B15V1)', N'Máy pha cà phê Bear', NULL, CAST(N'2023-02-26T14:49:28.673' AS DateTime), N'<div class="text">
<h1 class="style-scope ytd-watch-metadata"><span style="font-size: 14pt; font-family: arial, helvetica, sans-serif;"><strong>C&aacute;ch L&agrave;m Cafe Bạc Xỉu Với M&aacute;y Pha Cafe Bear CF-B15V1</strong></span><br><span style="font-size: 14pt; font-family: arial, helvetica, sans-serif;"><strong>👉 Với t&iacute;nh năng pha c&ugrave;ng l&uacute;c 2 ly, mỗi lần pha chỉ mấy 30s - 1p th&ocirc;i đ&oacute;! </strong></span><br><span style="font-size: 14pt; font-family: arial, helvetica, sans-serif;"><strong>👉 Pha chế đa dạng loại đồ uống: Espresso, Americano, Cappuccino, Mocha, Latte </strong></span><br><span style="font-size: 14pt; font-family: arial, helvetica, sans-serif;"><strong>👉 B&igrave;nh chứa nước 1.5L, gi&uacute;p thoải m&aacute;i pha nhiều lần</strong></span><br><br><iframe style="width: 1124px; height: 630px; display: table; margin-left: auto; margin-right: auto;" src="https://www.youtube.com/embed/cG18ow0hNQs" width="1124" height="630" allowfullscreen="allowfullscreen"></iframe></h1>
<br><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210626/may-pha-ca-phe-bear-_1624682108_efusz1.png"><br><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210626/may-pha-ca-phe-bear-_1624682108_0omJJO.png"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210626/may-pha-ca-phe-bear-_1624682108_viUtVL.png"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210626/may-pha-ca-phe-bear-_1624682108_Wz8Bki.png"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210626/may-pha-ca-phe-bear-_1624682108_ARdFtY.png"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210626/may-pha-ca-phe-bear-_1624682108_sMK4qU.png"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210626/may-pha-ca-phe-bear-_1624682108_gNKjnN.png"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210626/may-pha-ca-phe-bear-_1624682109_1JOXLu.png"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210626/may-pha-ca-phe-bear-_1624682109_gD6u2C.png"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210626/may-pha-ca-phe-bear-_1624682108_9WkA14.png"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210626/may-pha-ca-phe-bear-_1624682109_vRO4gO.png"></div>', NULL, 0, 1, 1, 1, 0, 1, 1, N'Bảo hành 18 tháng', 23, 19, 66, NULL, NULL, N'', NULL, N'')
INSERT [dbo].[Product] ([ProductId], [PPC], [ProductCode], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductDescriptionMobile], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note], [SizeGuide], [Link]) VALUES (133, N'15027133', N'C25R6', N'Nồi nấu cháo chậm Bear 2,5l', NULL, CAST(N'2023-03-05T12:15:41.020' AS DateTime), N'<p style="text-align: left;">✔️ Nấu, hấp, hầm c&aacute;ch thủy, giữ 100% gi&aacute; trị dinh dưỡng. Hẹn giờ nấu th&ocirc;ng minh</p>
<p style="text-align: left;">✔️ Chất hưu cơ c&oacute; trong nguy&ecirc;n liệu, thực phẩm l&agrave; yếu tố ch&iacute;nh tạo n&ecirc;n hương vị cho m&oacute;n ăn.</p>
<p style="text-align: left;">✔️ An to&agrave;n: Ruột nồi bằng sứ cao cấp</p>
<p style="text-align: left;">✔️ An t&acirc;m: Vỏ nồi c&aacute;ch nhiệt, c&aacute;ch nhiệt, tự động ngắt điện khi cạn nước</p>
<p style="text-align: left;">✔️ Bộ 5 thố sử dụng linh hoạt c&aacute;c m&oacute;n ăn đ&aacute;p ứng nhu cầu cho cả gia đ&igrave;nh</p>
<div style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.com.vn/uploaded/seo/noi%20tu%20sa%202%2C5h/fef1f0ac7a0eba50e31f4.jpg" alt=""></div>
<p class="hrQhmh" style="text-align: left;"><br>Phụ kiện đi k&egrave;m:</p>
<ul style="text-align: left;">
<li class="hrQhmh">1 th&acirc;n m&aacute;y t&iacute;ch hợp bảng điều khiển m&agrave;n h&igrave;nh Led tiện lợi</li>
<li class="hrQhmh">1 nắp nồi thủy tinh dễ d&agrave;ng quan s&aacute;t với tay cầm chống nhiệt</li>
<li class="hrQhmh">1 thố tử sa lớn 2.5L k&egrave;m nắp tử sa</li>
<li>4 thố tử sa nhỏ, mỗi thố 0.4L k&egrave;m 4 nắp tử sa</li>
<li>1 xửng hấp</li>
</ul>
<div style="text-align: left;">&nbsp;</div>
<div style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.com.vn/uploaded/seo/noi%20tu%20sa%202%2C5h/1e2ad7725dd09d8ec4c11.jpg" alt=""></div>
<p class="hrQhmh" style="text-align: left;">C&ocirc;ng dụng của sản phẩm:</p>
<ul style="text-align: left;">
<li class="hrQhmh">8 chế độ: Canh dinh dưỡng, ch&aacute;o dinh dưỡng, ch&aacute;o, đồ ngọt, tổ yến, bong b&oacute;ng c&aacute;, nhựa đ&agrave;o, giữ ấm</li>
<li class="hrQhmh">Chế độ giữ ấm k&eacute;p : nhấn bằng tay hoặc tự động giữ cho m&oacute;n ăn của b&eacute; ấm n&oacute;ng l&acirc;u hơn. C&aacute;c mẹ c&oacute; thể nấu cho con 1 lần v&agrave;o buổi s&aacute;ng v&agrave; cho con ăn cả ng&agrave;y, nồi chống tr&agrave;o n&ecirc;n cứ cắm để đ&oacute; v&agrave; đi l&agrave;m việc kh&aacute;c.</li>
<li class="hrQhmh">C&aacute;ch thuỷ hầm chậm giữ được chất dinh dưỡng trong thức ăn. Nấu bằng nồi n&agrave;y ch&aacute;o s&aacute;nh v&agrave; nhừ,m&agrave; kh&ocirc;ng bị vỡ hạt n&ecirc;n dưỡng chất v&agrave; vị ngọt của gạo vẫn b&ecirc;n trong hạt</li>
<li class="hrQhmh">Nồi ninh hầm được y&ecirc;u th&iacute;ch v&igrave; độ thơm &ndash; đậm &ndash; ngọt khi nấu.</li>
<li class="hrQhmh">Với t&iacute;nh năng hẹn giờ, kh&acirc;u chuẩn bị cho bữa cơm đ&atilde; được thảnh thơi hơn rất nhiều. Đ&ecirc;m đặt s&aacute;ng ăn, hay s&aacute;ng đặt tối ăn. C&oacute; chế độ bảo quản giữ ấm trong 8 tiếng, rất tiện dụng.</li>
</ul>
<p class="hrQhmh" style="text-align: left;">Hướng dẫn sử dụng:&nbsp;</p>
<ul style="text-align: left;">
<li class="hrQhmh">Bước 1: Cho nước sạch v&agrave;o th&acirc;n nồi nấu chậm Bear, lưu &yacute; kh&ocirc;ng đổ nước qu&aacute; vạch max.</li>
<li class="hrQhmh">Bước 2: Cho thực phẩm v&agrave; gia vị v&agrave;o l&otilde;i sứ, n&ecirc;m nếm vừa ăn rồi đặt v&agrave;o nồi.</li>
<li class="hrQhmh">Bước 3: Ấn chọn chế độ nấu v&agrave; thời gian nấu, sau 5 gi&acirc;y, nồi sẽ tự động chuyển sang chế độ nấu m&agrave; bạn lựa chọn. Sau đ&oacute;, chỉ cần theo d&otilde;i khi thời gian nấu tr&ecirc;n nồi kết th&uacute;c l&agrave; l&uacute;c m&oacute;n ăn được ho&agrave;n th&agrave;nh.</li>
</ul>
<p class="hrQhmh" style="text-align: left;">&ndash; Sau mỗi lần sử dụng, cần tắt c&ocirc;ng tắc v&agrave; r&uacute;t ph&iacute;ch điện. Sau đ&oacute;, đợi m&aacute;y nguội hẳn mới tiến h&agrave;nh lau ch&ugrave;i.</p>
<p class="hrQhmh" style="text-align: left;">&ndash; Nghi&ecirc;m cấm ng&acirc;m sản phẩm v&agrave;o bất kỳ dung dịch n&agrave;o để vệ sinh. Chỉ n&ecirc;n sử dụng khăn ẩm để lau.</p>
<p class="hrQhmh" style="text-align: left;">&ndash; Đối với những loại thực phẩm dễ biến chất khi hầm l&acirc;u hoặc trong điều kiện thời tiết n&oacute;ng nực, vui l&ograve;ng đặt thời gian hẹn trước kh&ocirc;ng qu&aacute; d&agrave;i.</p>
<div style="text-align: left;">&nbsp;</div>
<div style="text-align: left;"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.com.vn/uploaded/seo/noi%20tu%20sa%202%2C5h/03686e34e49624c87d872.jpg" alt=""></div>
<p style="text-align: left;">&nbsp;</p>', NULL, 0, 1, 1, 1, 0, 1, 1, N'Bảo hành 18 tháng', 22, 19, 66, NULL, NULL, N'', NULL, N'')
INSERT [dbo].[Product] ([ProductId], [PPC], [ProductCode], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductDescriptionMobile], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note], [SizeGuide], [Link]) VALUES (134, N'22026134', N'CF-B02V1 (KFJ-A02N1)', N'Máy pha cà phê Espresso Bear', NULL, CAST(N'2023-03-05T13:48:35.173' AS DateTime), N'<p><span style="font-size: 18pt;"><sub>M&aacute;y pha c&agrave; ph&ecirc; <strong>Espresso Bear:</strong></sub></span></p>
<p>✔️ M&aacute;y pha c&agrave; ph&ecirc; tự động bằng &aacute;p lực<br>✔️ Tay cầm inox chắc chắn, sang trọng<br>✔️ B&igrave;nh nước dung t&iacute;ch 240ml<br>✔️ Hệ thống v&ograve;i hơi: đ&aacute;nh sữa, tạo hơi v&agrave; kh&ocirc;ng kh&iacute; gi&uacute;p pha cappuccino, latte<br>✔️ K&iacute;ch thước nhỏ gọn, thanh lịch<br><br></p>
<p><iframe style="display: table; margin-left: auto; margin-right: auto; width: 1166px; height: 656px;" src="https://www.youtube.com/embed/MKS8QsPTu00" width="1166" height="656" allowfullscreen="allowfullscreen"></iframe></p>
<div class="text"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613172_va0xpq.jpeg"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613172_5etgSf.jpeg"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613172_xopX77.jpeg"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613171_Jbjoxg.jpeg"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613171_QJ7D4l.jpeg"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613171_7TqzfQ.jpeg"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613171_aGg2ZS.jpeg"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613171_vgUhL6.jpeg"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613171_dyofxs.jpeg"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613172_aquYFW.jpeg"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613172_N9ERhB.jpeg"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613172_zMjeVC.jpeg"><img style="display: block; margin-left: auto; margin-right: auto;" src="https://sube.vn/assets/media/images/uploads/20210625/may-pha-ca-phe-bear-_1624613172_WJynf1.jpeg"></div>', NULL, 0, 1, 1, 1, 0, 1, 1, N'Bảo hành 18 tháng', 23, 19, 66, NULL, NULL, N'', NULL, N'')
INSERT [dbo].[Product] ([ProductId], [PPC], [ProductCode], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductDescriptionMobile], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note], [SizeGuide], [Link]) VALUES (135, N'22589135', N'C40M1', N'Nồi lẩu điện Bear đa năng 7in1', NULL, CAST(N'2023-03-05T16:13:52.347' AS DateTime), N'<p>Gian bếp style H&agrave;n thường c&oacute; tổng thể n&eacute;t trang nh&atilde;, gần gũi, ấm c&uacute;ng. Theo đ&oacute;, mỗi m&oacute;n đồ được sử dụng trong bếp nh&igrave;n chung đều dễ cưng, hết sức hiện đại, tiện dụng v&agrave; tiết kiệm kh&ocirc;ng gian. Chiếc Nồi lẩu điện đa năng 7 in 1 của nh&agrave; Bear chắc chắn đ&aacute;p ứng được t&iacute;nh thẩm mỹ v&agrave; đa dạng về chức năng để c&aacute;c gia chủ decor căn bếp kiểu H&agrave;n!</p>
<h2><span style="color: rgb(0, 0, 0);">C&ocirc;ng dụng của Nồi điện đa năng 7 IN 1 Bear C40M1<br></span></h2>
<figure id="attachment_8617" class="wp-caption aligncenter" style="text-align: center;" aria-describedby="caption-attachment-8617"><img class="size-full wp-image-8617" style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.vn/wp-content/uploads/noi-dien-da-nang-7-in-1-bear-c40m1-1.png" alt="C&ocirc;ng dụng của Nồi điện đa năng 7 IN 1 Bear C40M1" width="590" height="396">
<figcaption id="caption-attachment-8617" class="wp-caption-text">C&ocirc;ng dụng của Nồi điện đa năng 7 IN 1 Bear C40M1</figcaption>
</figure>
<ul>
<li>Nồi lẩu điện đa năng Bear 4 l&iacute;t DHG-C40M1, l&ograve;ng nồi th&aacute;o rời dễ d&agrave;ng vệ sinh</li>
<li>Nhiều chức năng trong 1 gi&uacute;p người d&ugrave;ng c&oacute; thể R&aacute;n, nấu, hầm, lẩu, nướng&hellip;</li>
<li>Thiết kế vừa sang trọng vừa đ&aacute;ng y&ecirc;u cho những bạn y&ecirc;u bếp y&ecirc;u nấu ăn.</li>
<li>Chống d&iacute;nh tốt với lớp chống d&iacute;nh k&eacute;p, l&ograve;ng nồi s&acirc;u dễ cho việc nấu nhiều m&oacute;n ngon</li>
<li>C&ocirc;ng suất 1500W cho bạn trải nghiệm x&agrave;o nấu ngon hơn với những m&oacute;n ăn cần nhiệt độ cao</li>
</ul>
<div id="more">
<h2><span style="color: rgb(0, 0, 0);"><br>Bộ phụ kiện của Nồi lẩu điện đa năng 4L Bear DHG-C40M1 bao gồm</span></h2>
<figure id="attachment_8618" class="wp-caption aligncenter" style="text-align: center;" aria-describedby="caption-attachment-8618"><img class="size-full wp-image-8618" style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.vn/wp-content/uploads/noi-dien-da-nang-7-in-1-bear-c40m1-2.png" alt="Bộ phụ kiện của Nồi lẩu điện đa năng 4L Bear DHG-C40M1" width="747" height="501">
<figcaption id="caption-attachment-8618" class="wp-caption-text">Bộ phụ kiện của Nồi lẩu điện đa năng 4L Bear DHG-C40M1</figcaption>
</figure>
<h2><span style="color: rgb(0, 0, 0);">Hướng dẫn sử dụng Nồi điện đa năng 7 IN 1 Bear C40M1<br></span></h2>
<figure id="attachment_8619" class="wp-caption aligncenter" style="text-align: center;" aria-describedby="caption-attachment-8619"><img class="size-full wp-image-8619" style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.vn/wp-content/uploads/noi-dien-da-nang-7-in-1-bear-c40m1-3.png" alt="Hướng dẫn sử dụng Nồi điện đa năng 7 IN 1 Bear C40M1" width="725" height="487">
<figcaption id="caption-attachment-8619" class="wp-caption-text">Hướng dẫn sử dụng Nồi điện đa năng 7 IN 1 Bear C40M1</figcaption>
</figure>
<p><strong>Bước 1:&nbsp;</strong>Trước khi vệ sinh v&agrave; bảo dưỡng lu&ocirc;n r&uacute;t ph&iacute;ch cắm điện v&agrave; l&agrave;m m&aacute;t th&acirc;n m&aacute;y trước khi vệ sinh.</p>
<p><strong>Bước 2:&nbsp;</strong>Kh&ocirc;ng sử dụng xăng, bột tẩy, b&agrave;n chải cứng hoặc d&acirc;y th&eacute;p kh&ocirc;ng gỉ để lau, để kh&ocirc;ng l&agrave;m hỏng bề mặt.</p>
<p><strong>Bước 3:</strong>&nbsp;Cho 1 &iacute;t nước v&agrave; chất tẩy rửa v&agrave;o nồi, d&ugrave;ng khăn mềm hoặc miếng bọt biển cọ rửa bề mặt b&ecirc;n trong của nồi, loại bỏ nước rửa. Sau đ&oacute; d&ugrave;ng nước rửa mặt trong của nồi cho sạch, đổ hết nước v&agrave;o trong nồi bằng vải vắt, kh&ocirc;ng l&agrave;m sạch trực tiếp bề mặt b&ecirc;n ngo&agrave;i của sản phẩm bằng nước.</p>
<p><strong>Bước 4:</strong>&nbsp;Thiết bị kh&ocirc;ng được ng&acirc;m trong nước để l&agrave;m sạch. C&oacute; thể lau mặt ngo&agrave;i của m&aacute;y bằng khăn ướt, kh&ocirc;ng được rửa bằng nước để tr&aacute;nh r&ograve; gỉ, hỏng h&oacute;c.</p>
<p><strong>Bước 5:</strong>&nbsp;Sau khi l&agrave;m n&oacute;ng, c&aacute;c vết trắng dưới đ&aacute;y l&agrave; hiện tượng đun n&oacute;ng b&igrave;nh thường. H&atilde;y y&ecirc;n t&acirc;m sử dụng đ&uacute;ng lượng giấm để l&agrave;m sạch c&aacute;c vết n&agrave;y.</p>
<p><strong>Bước 6:</strong>&nbsp;Khi sản phẩm l&acirc;u ng&agrave;y kh&ocirc;ng sử dụng, vui l&ograve;ng vệ sinh sạch sẽ. Cho v&agrave;o hộp đ&oacute;ng g&oacute;i, để nơi kh&ocirc; tho&aacute;ng tr&aacute;nh ẩm ướt tr&aacute;nh ảnh hưởng đến qu&aacute; tr&igrave;nh sử dụng.</p>
<h2><span style="color: rgb(0, 0, 0);">Lưu &yacute; khi sử dụng Nồi lẩu điện đa năng 4L Bear DHG-C40M1</span></h2>
<figure id="attachment_8620" class="wp-caption aligncenter" style="text-align: center;" aria-describedby="caption-attachment-8620"><img class="size-full wp-image-8620" style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.vn/wp-content/uploads/noi-dien-da-nang-7-in-1-bear-c40m1-4.png" alt="Lưu &yacute; khi sử dụng Nồi lẩu điện đa năng 4L Bear DHG-C40M1" width="724" height="486">
<figcaption id="caption-attachment-8620" class="wp-caption-text">Lưu &yacute; khi sử dụng Nồi lẩu điện đa năng 4L Bear DHG-C40M1</figcaption>
</figure>
<ul>
<li>Để ph&ograve;ng tr&aacute;nh điện giật, hỏa hoạn, bỏng nước v&agrave; c&aacute;c tai nạn kh&aacute;c, vui l&ograve;ng đọc kỹ v&agrave; tu&acirc;n thủ c&aacute;c vấn đề an to&agrave;n sau đ&acirc;y trước khi sử dụng;</li>
<li>Sản phẩm n&agrave;y thuộc về thiết bị cấp 1. Vui l&ograve;ng chỉ sử dụng ổ cắm 10A trở l&ecirc;n.</li>
<li>Vui l&ograve;ng đảm bảo rằng việc tiếp đất từ ổ cắm được điều chỉnh đ&uacute;ng trước khi sử dụng. Ngo&agrave;i ra h&atilde;y x&aacute;c nhận rằng nguồn điện đầu v&agrave;o l&agrave; 220W-50V.</li>
<li>Đảm bảo ngắt nguồn điện trước khi th&aacute;o, lắp hoặc di chuyển bất kỳ bộ phận n&agrave;o của sản phẩm.</li>
<li>Sản phẩm n&agrave;y chỉ th&iacute;ch hợp để sử dụng tại nh&agrave;.</li>
<li>Nếu d&acirc;y nguồn bị hư hỏng, phải được thay thế bởi bộ phận sửa chữa của nh&agrave; sản xuất hoặc bộ phận tương tự để tr&aacute;nh nguy hiểm.</li>
<li>Khi sử dụng, vui l&ograve;ng r&uacute;t ph&iacute;ch cắm ra khỏi ổ cắm, cấm d&ugrave;ng tay ướt k&eacute;o v&agrave; cắm để tr&aacute;nh bị điện giật.</li>
<li>Trước khi vệ sinh, h&atilde;y r&uacute;t ph&iacute;ch cắm ra khỏi ổ điện để m&aacute;y nguội tự nhi&ecirc;n.</li>
<li>Để tr&aacute;nh r&ograve; gỉ, kh&ocirc;ng ng&acirc;m ph&iacute;ch cắm hoặc m&aacute;y trong chất lỏng hoặc nước.</li>
</ul>
</div>', NULL, 0, 1, 1, 1, 0, 1, 1, N'Bảo hành 18 tháng', 22, 19, 66, NULL, NULL, N'', NULL, N'')
INSERT [dbo].[Product] ([ProductId], [PPC], [ProductCode], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductDescriptionMobile], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note], [SizeGuide], [Link]) VALUES (136, N'39620136', N'PBJ-B06S2', N'Máy nấu sữa hạt Bear đa năng 7in1', NULL, CAST(N'2023-03-06T17:29:11.370' AS DateTime), N'<h1 class="product-title product_title entry-title"><span style="color: rgb(0, 0, 0);">M&aacute;y nấu sữa hạt Bear đa năng 7in1</span></h1>
<p>- 9 chức năng trong 1 đ&aacute;p ứng đa số nhu cầu sử dụng</p>
<p>- &Acirc;m thanh khi xay chỉ 72dB kh&ocirc;ng ảnh hưởng tới m&ocirc;i trường xung quanh</p>
<p>- Lưỡi dao Inox 304 chống gỉ với 4 c&aacute;nh sắc b&eacute;n</p>
<p>- Động cơ 800W xay nhuyễn, đun nhanh</p>
<p>- Cối xay thủy tinh Borosilicat chống chịu va đập, v&agrave; nhiệt độ cao</p>
<p>- Hẹn giờ l&ecirc;n tới 9 tiếng</p>
<p><br>Với 9 t&iacute;nh năng t&iacute;ch hợp trong 1 sản phẩm, m&aacute;y xay nấu đa năng c&aacute;ch &acirc;m PBJ &ndash; B06S2 gi&uacute;p bạn nấu sữa hạt, xay sinh tố v&agrave; l&agrave;m c&aacute;c m&oacute;n ch&aacute;o, nước xốt, m&oacute;n s&uacute;p thơm ngon, n&oacute;ng hổi. Với m&aacute;y l&agrave;m sữa hạt &ndash; M&aacute;y xay nấu đa năng c&aacute;ch &acirc;m 7 in 1 Bear, bạn c&oacute; thể cải thiện sức khỏe gia đ&igrave;nh mỗi ng&agrave;y với những m&oacute;n ăn, thức uống bổ dưỡng, ngon miệng.</p>
<h2><span style="color: rgb(0, 0, 0);">C&ocirc;ng dụng của May nấu sữa hạt Bear đa năng 7in1 PBJ-B06S2</span></h2>
<figure id="attachment_8803" class="wp-caption aligncenter" style="text-align: center;" aria-describedby="caption-attachment-8803"><img class="size-full wp-image-8803" style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.vn/wp-content/uploads/may-xay-nau-da-nang-cach-am-7-in-1-bear-1.jpg" sizes="(max-width: 468px) 100vw, 468px" srcset="https://bearvietnam.vn/wp-content/uploads/may-xay-nau-da-nang-cach-am-7-in-1-bear-1.jpg 468w, https://bearvietnam.vn/wp-content/uploads/may-xay-nau-da-nang-cach-am-7-in-1-bear-1-100x100.jpg 100w" alt="C&ocirc;ng dụng của May nấu sữa hạt Bear đa năng 7in1 PBJ-B06S2" width="573" height="573">
<figcaption id="caption-attachment-8803" class="wp-caption-text">C&ocirc;ng dụng của May nấu sữa hạt Bear đa năng 7in1 PBJ-B06S2</figcaption>
</figure>
<ul>
<li>Sữa đậu n&agrave;nh: L&agrave;m sữa đậu n&agrave;nh nguy&ecirc;n chất, năm loại sữa đậu n&agrave;nh (đặt trước)</li>
<li>Bột nh&atilde;o gạo: Được sử dụng để l&agrave;m bột m&egrave; đen, bột gạo mười loại hạt v&agrave; c&aacute;c loại bột gạo kh&aacute;c (đặt trước)</li>
<li>Ch&aacute;o: Nấu ch&aacute;o (theo giờ hẹn)</li>
<li>Nước ng&ocirc;: L&agrave;m nước ng&ocirc; (theo giờ hẹn)</li>
<li>S&uacute;p: Được sử dụng để l&agrave;m c&aacute;c m&oacute;n s&uacute;p kh&aacute;c nhau như s&uacute;p c&aacute; v&agrave; s&uacute;p b&iacute; ng&ocirc; (theo lịch hẹn)</li>
<li>Nước &eacute;p hoa quả: Được sử dụng để l&agrave;m c&aacute;c loại nước &eacute;p tr&aacute;i c&acirc;y kh&aacute;c nhau.</li>
<li>Nước sốt: Được sử dụng để l&agrave;m sốt m&egrave;, bơ đậu phộng v&agrave; c&aacute;c loại sốt kh&aacute;c.</li>
<li>L&agrave;m sạch: L&agrave;m sạch cốc (chức năng n&agrave;y c&ograve;n c&oacute; thể được sử dụng để l&agrave;m sinh tố)</li>
<li>C&agrave;i đặt hẹn giờ: Được sử dụng để c&agrave;i đặt trước thời gian l&agrave;m việc của sản phẩm, v&agrave; tự động bắt đầu chức năng chế biến nguy&ecirc;n liệu thực phẩm khi thời gian được thiết lập theo hẹn giờ.</li>
</ul>
<div id="more">
<h2><span style="color: rgb(0, 0, 0);"><br>Bộ phụ kiện của M&aacute;y xay nấu đa năng Bear PBJ &ndash; B06S2</span></h2>
<figure id="attachment_8804" class="wp-caption aligncenter" style="text-align: center;" aria-describedby="caption-attachment-8804"><img class="size-full wp-image-8804" style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.vn/wp-content/uploads/may-xay-nau-da-nang-cach-am-7-in-1-bear-2.jpg" sizes="(max-width: 468px) 100vw, 468px" srcset="https://bearvietnam.vn/wp-content/uploads/may-xay-nau-da-nang-cach-am-7-in-1-bear-2.jpg 468w, https://bearvietnam.vn/wp-content/uploads/may-xay-nau-da-nang-cach-am-7-in-1-bear-2-100x100.jpg 100w" alt="Bộ phụ kiện của M&aacute;y xay nấu đa năng Bear PBJ &ndash; B06S2" width="468" height="468">
<figcaption id="caption-attachment-8804" class="wp-caption-text">Bộ phụ kiện của M&aacute;y xay nấu đa năng Bear PBJ &ndash; B06S2</figcaption>
</figure>
<p>- Th&acirc;n ch&iacute;nh của m&aacute;y</p>
<p>- Miếng c&aacute;ch &acirc;m</p>
<p>- Nắp phụ</p>
<p>- Nắp</p>
<p>- Cốc xay thủy tinh (hoặc cốc n&oacute;ng)</p>
<p>- Bảng hiển thị</p>
<p>- Điều khiển n&uacute;m v&agrave; n&uacute;t nhấn</p>
<p>- S&aacute;ch hướng dẫn sử dụng</p>
<h2><span style="color: rgb(0, 0, 0);">Hướng dẫn sử dụng May nấu sữa hạt Bear đa năng 7in1 PBJ-B06S2</span></h2>
<figure id="attachment_8805" class="wp-caption aligncenter" style="text-align: center;" aria-describedby="caption-attachment-8805"><img class="size-full wp-image-8805" style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.vn/wp-content/uploads/may-xay-nau-da-nang-cach-am-7-in-1-bear-3.jpg" sizes="(max-width: 468px) 100vw, 468px" srcset="https://bearvietnam.vn/wp-content/uploads/may-xay-nau-da-nang-cach-am-7-in-1-bear-3.jpg 468w, https://bearvietnam.vn/wp-content/uploads/may-xay-nau-da-nang-cach-am-7-in-1-bear-3-100x100.jpg 100w" alt="Hướng dẫn sử dụng May nấu sữa hạt Bear đa năng 7in1 PBJ-B06S2" width="468" height="468">
<figcaption id="caption-attachment-8805" class="wp-caption-text">Hướng dẫn sử dụng May nấu sữa hạt Bear đa năng 7in1 PBJ-B06S2</figcaption>
</figure>
<p><strong>Bước1:</strong>&nbsp;Cho nguy&ecirc;n liệu cần chế biến v&agrave;o cốc xay, đậy nắp v&agrave; nắp phụ, đảm bảo xoay đ&uacute;ng vị tr&iacute;.</p>
<p><em><strong>Ch&uacute; &yacute;:</strong></em></p>
<p>- Đảm b&agrave;o v&ograve;ng đệm của nắp được đ&oacute;ng chặt</p>
<p>- Lượng nguy&ecirc;n liệu bổ sung kh&ocirc;ng được vượt qu&aacute; y&ecirc;u cầu của hướng dẫn v&agrave; c&ocirc;ng thức nấu ăn</p>
<p>- Khi pha đồ uống n&oacute;ng, tổng lượng nguy&ecirc;n liệu v&agrave; chất lỏng kh&ocirc;ng được vượt qu&aacute; 1200mL; Đối với đồ uống lạnh, tổng lượng nguy&ecirc;n liệu v&agrave; chất lỏng kh&ocirc;ng được vượt 1500mL.<br><br></p>
<p><strong>Bước 2:</strong>&nbsp;Sau khi nguy&ecirc;n liệu được th&ecirc;m v&agrave;o, lắp r&aacute;p nắp v&agrave; c&aacute;c bộ phận của cốc xay v&agrave;o phần th&acirc;n ch&iacute;nh của m&aacute;y. Sau đ&oacute; đậy miếng c&aacute;ch &acirc;m.</p>
<p><strong>Bước 3:</strong>&nbsp;Bật nguồn điện.</p>
<p><strong>Bước 4:</strong>&nbsp;Xoay n&uacute;m để chọn chức năng tương ứng với c&ocirc;ng thức, v&iacute; dụ như &ldquo;sữa đậu n&agrave;nh&rdquo;.</p>
<p><strong>Bước 5:</strong>&nbsp;Nhấn v&agrave;o &ldquo;Button&rdquo; để m&aacute;y bắt đầu hoạt động.</p>
<p><strong>Bước 6:</strong>&nbsp;Sau qu&aacute; tr&igrave;nh xử l&yacute; nguy&ecirc;n liệu thực phẩm, sản phẩm sẽ tự động ngừng chạy v&agrave; dừng lại.</p>
<p><strong>Bước 7:</strong>&nbsp;&Acirc;m thanh &ldquo;Di&rdquo; cho thấy m&aacute;y đ&atilde; ho&agrave;n th&agrave;nh việc chế biến thực phẩm.</p>
<p><em><strong>Ghi ch&uacute;:&nbsp;</strong></em>Nhấn v&agrave; giữ &ldquo;Button&rdquo; trong 2 gi&acirc;y trong qu&aacute; tr&igrave;nh sản phẩm l&agrave;m việc, m&aacute;y sẽ ngừng hoạt động</p>
<h2><span style="color: rgb(0, 0, 0);">Lưu &yacute; khi sử dụng M&aacute;y xay nấu đa năng Bear PBJ &ndash; B06S2</span></h2>
<figure id="attachment_8806" class="wp-caption aligncenter" style="text-align: center;" aria-describedby="caption-attachment-8806"><img class="size-full wp-image-8806" style="display: block; margin-left: auto; margin-right: auto;" src="https://bearvietnam.vn/wp-content/uploads/may-xay-nau-da-nang-cach-am-7-in-1-bear-4.jpg" sizes="(max-width: 468px) 100vw, 468px" srcset="https://bearvietnam.vn/wp-content/uploads/may-xay-nau-da-nang-cach-am-7-in-1-bear-4.jpg 468w, https://bearvietnam.vn/wp-content/uploads/may-xay-nau-da-nang-cach-am-7-in-1-bear-4-100x100.jpg 100w" alt="Lưu &yacute; khi sử dụng M&aacute;y xay nấu đa năng Bear PBJ &ndash; B06S2" width="468" height="468">
<figcaption id="caption-attachment-8806" class="wp-caption-text">Lưu &yacute; khi sử dụng M&aacute;y xay nấu đa năng Bear PBJ &ndash; B06S2</figcaption>
</figure>
<p>- Nghi&ecirc;m cấm nhấc th&acirc;n cốc v&agrave; mở nắp trong qu&aacute; tr&igrave;nh sản phẩm đang l&agrave;m việc để kh&ocirc;ng l&agrave;m gi&aacute;n đoạn hoạt động.</p>
<p>- Khi sản phẩm được bật hoặc đang hoạt động, kh&ocirc;ng chạm v&agrave;o lưỡi dao, động cơ v&agrave; c&aacute;c bộ phận chuyển động kh&aacute;c để tr&aacute;nh chấn thương hoặc hư hỏng cho sản phẩm.</p>
<p>- Trong qu&aacute; tr&igrave;nh sản phẩm l&agrave;m việc, nghi&ecirc;m cấm mở nắp để th&ecirc;m thực phẩm, nếu kh&ocirc;ng, c&oacute; thể dễ d&agrave;ng g&acirc;y ra tai nạn thương t&iacute;ch hoặc tổn thất t&agrave;i sản. Phương ph&aacute;p đ&uacute;ng: mở nắp phụ ở giữa nắp k&iacute;nh khi m&aacute;y dừng. C&aacute;c th&agrave;nh phần sẽ được đưa qua lỗ tr&ecirc;n nắp.</p>
<p>- Kh&ocirc;ng sử dụng c&aacute;c phụ kiện hoặc bộ phận kh&aacute;c ngo&agrave;i sản phẩm n&agrave;y để tr&aacute;nh hỏa hoạn v&agrave; thương t&iacute;ch c&aacute; nh&acirc;n.</p>
<p>- Kh&ocirc;ng để cốc rỗng (kh&ocirc;ng c&oacute; thức ăn trong cốc) hoặc để cốc qu&aacute; tải.</p>
<p>- Sau khi xử l&yacute; nguy&ecirc;n liệu thực phẩm, sản phẩm sẽ ph&aacute;t ra 5 tiếng k&ecirc;u &ldquo;beep&rdquo;.</p>
<p>- Vui l&ograve;ng th&aacute;o cốc xay, nắp v&agrave; c&aacute;c bộ phận c&oacute; thể th&aacute;o rời kh&aacute;c để tr&aacute;nh nguy hiểm sau khi lưỡi dao ngừng quay ho&agrave;n to&agrave;n v&agrave; nguồn điện bị ngắt kết nối.</p>
<p>- Nghi&ecirc;m cấm th&aacute;o rời hoặc thay đổi sản phẩm.</p>
<p>- Vui l&ograve;ng th&ecirc;m nguy&ecirc;n liệu đủ với số lượng theo hướng dẫn hoặc c&ocirc;ng thức nấu ăn (1200mL cho đồ uống n&oacute;ng v&agrave; 1500mL cho đồ uống lạnh). C&aacute;c th&agrave;nh phần được th&ecirc;m v&agrave;o qu&aacute; nhiều c&oacute; thể l&agrave;m hỏng động cơ, dẫn đến bắn tung to&eacute; hoặc nấu chưa ch&iacute;n.</p>
<p>- Khi l&agrave;m đồ uống n&oacute;ng, kh&ocirc;ng chạm v&agrave;o ly v&agrave; nắp phụ để tr&aacute;nh thiệt hại do đồ uống n&oacute;ng tr&agrave;n hoặc c&aacute;c th&agrave;nh phần qu&aacute; n&oacute;ng.</p>
</div>', NULL, 0, 1, 1, 1, 0, 1, 1, N'Bảo hành 18 tháng', 24, 19, 66, NULL, NULL, N'', NULL, N'')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (120, 14, N'Lõi sứ, lồng hấp PP')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (120, 33, N'1.45 kg')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (120, 40, N'Bear')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (120, 42, N'0.8 Lít')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (120, 43, N'200W')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (120, 44, N'220V ~ 50Hz')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (120, 45, N'175×175×270mm')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (120, 46, N'Quốc tế')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (120, 47, N'Tiếng việt & Tiếng anh')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (120, 48, N'Tiếng anh')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (120, 49, N'Lồng hấp')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (120, 50, N'2 chấu phù hợp với nguồn điện VN')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (127, 14, N'Lõi sứ, lồng hấp PP')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (127, 33, N'3,6 kg')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (127, 40, N'Bear')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (127, 42, N'Nồi ứ lớn 1,6L và 02 (hai) Nồi sứ nhỏ 0,5L')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (127, 43, N'200W')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (127, 44, N'220V ~ 50Hz')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (127, 45, N'273x210x312mm')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (127, 46, N'Quốc tế')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (127, 47, N'Tiếng việt & Tiếng anh')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (127, 48, N'Tiếng anh')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (127, 49, N'Lồng hấp')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (127, 50, N'2 chấu phù hợp với nguồn điện VN')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (128, 14, N'Lõi sứ, lồng hấp PP')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (128, 33, N'4 Kg')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (128, 40, N'Bear')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (128, 42, N'Bộ nồi gồm 5 thố (1 thố lớn 2.5L & 4 thố nhỏ 0,4L)')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (128, 43, N'380W')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (128, 44, N'220V ~ 50Hz')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (128, 45, N'348×264×235mm')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (128, 46, N'Quốc tế')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (128, 47, N'Tiếng việt & Tiếng anh')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (128, 48, N'Tiếng Anh')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (128, 49, N'Lồng hấp')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (128, 50, N'2 chấu phù hợp với nguồn điện VN')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (132, 14, N'Inox 304, ABS, Hợp kim nhôm')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (132, 40, N'Bear')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (132, 42, N'1500ml')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (132, 43, N'950W')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (132, 44, N'220V ~ 50Hz')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (132, 45, N'288x271x244mm')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (132, 46, N'Quốc tế')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (133, 14, N'Tử sa Và Nhựa PP')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (133, 33, N'4 kg')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (133, 40, N'Bear')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (133, 42, N'2.5 Lít')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (133, 43, N'380W')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (133, 44, N'220V ~ 50Hz')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (133, 45, N'348*264*235')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (133, 46, N'Quốc tế')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (133, 47, N'Tiếng việt & Tiếng anh')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (133, 48, N'Tiếng anh')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (133, 49, N'Một bộ gồm 1 thố 2.5 L và 4 thố nhỏ 0.4 L thuận tiện cho các mẹ hầm các món canh bổ dưỡng cho cả nhà')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (133, 50, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (134, 14, N'Inox 304, ABS, Hợp kim nhôm')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (134, 40, N'Bear')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (134, 42, N'240ml')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (134, 43, N'800W')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (134, 44, N'220V ~ 50Hz')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (134, 45, N'259x148x309mm')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (134, 46, N'Quốc tế')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (134, 47, N'Tiếng việt & Tiếng anh')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (135, 14, N'Hợp kim chống dính ba chiều tổ ong Tỳ Hưu')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (135, 33, N'2.72 KG')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (135, 40, N'Bear')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (135, 42, N'4L')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (135, 43, N'1500W')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (135, 44, N'220V ~ 50Hz')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (135, 45, N'33.7×27.4×23.6cm')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (135, 46, N'Quốc tế')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (135, 47, N'Tiếng Việt & Tiếng Anh')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (135, 48, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (135, 49, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (135, 50, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (136, 42, N'1,5L')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (136, 43, N'800W')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (136, 44, N'220V')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (136, 46, N'Quốc tế')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (136, 53, N'50 Hz')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (136, 54, N'20000 R/M – 30000 R/M')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (136, 55, N'72 dB')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (136, 56, N'232X192X422 (mm)')
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (328, N'product_c6a233ef-f04f-483a-aaff-8afcc2c836b5.jpeg', 118)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (332, N'product_581a16fb-cd4a-43fc-9b27-285dd41f916a.jpg', 118)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (393, N'product_59db57d2-5fbc-446a-a546-480b5067e825.jpg', 120)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (403, N'product_48f331ea-55f7-4d92-b278-3b7eaa3ce9c9.jpg', 120)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (406, N'product_35f910e7-c532-4a01-abf1-25a9cad96155.jpg', 120)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (407, N'product_9d91a6a6-45bb-43bd-82ba-b43068e0adc9.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (413, N'product_4ac5f027-5c65-4d26-9667-ce44437ba040.jpg', 128)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (414, N'product_806cc4fb-84ad-494c-b42d-e8d8b610294f.jpg', 128)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (415, N'product_2ad7e120-933f-45c4-84cd-8cd33d161575.jpg', 128)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (416, N'product_58f8be50-fab3-4300-9d99-5c3c6031b25c.jpg', 128)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (417, N'product_af42253f-a892-4975-bc20-015bc5be0154.jpg', 128)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (418, N'product_abedc428-4eae-4ac1-a8cf-a80e9f529c21.jpg', 128)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (419, N'product_2fc396d3-46e0-406a-bb5a-c88b26b4b2d9.jpg', 128)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (420, N'product_d25acf79-c634-4383-bfcf-77639b2114f9.jpeg', 120)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (421, N'product_e9c37683-eca4-4a90-891a-556637242084.jpeg', 120)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (422, N'product_1b9dc492-7632-46f9-bb4d-3810b5e64e81.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (423, N'product_b6749dcf-8d59-41a8-8ea1-28456169db5e.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (424, N'product_c015800a-0a61-4b48-84f7-eede806f0e08.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (425, N'product_5e1b293e-539a-4b49-8cde-c500dbf9ad50.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (426, N'product_98e64706-c564-419c-a1ce-50f04eb2747a.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (427, N'product_b507810f-9484-4125-aab4-f475cd7678e7.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (428, N'product_4881ff48-2e72-4660-b481-93f27603258b.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (429, N'product_5635e55c-3912-41cb-9de9-25bfa4646dd2.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (430, N'product_90e47d23-22c2-400f-a643-2244cbe20343.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (431, N'product_4637afcc-ea3d-4b6d-8f8b-ad335bbe2669.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (432, N'product_a033da39-8b02-4a2d-9706-2470dd6488be.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (433, N'product_2c2a5632-2401-4d90-861a-2f89b8e3af2e.jpg', 127)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (460, N'product_b26a92d4-d3e3-4ecf-81c2-97f7e65bc163.png', 132)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (461, N'product_a77ccad8-4d22-4e3e-a0cf-d6e3b64b92e6.png', 132)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (462, N'product_395980ab-fbeb-4850-bcbe-402883b70079.png', 132)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (463, N'product_06a76470-2431-4d50-a4ce-b7360c39c84e.png', 132)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (464, N'product_4e336d0f-2542-4925-afb8-3b650c401089.png', 132)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (466, N'product_225d616f-52a9-4b16-a72a-8189385d5406.png', 132)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (467, N'product_55a13e7d-2c01-46e8-8da2-a1f819d4929a.png', 132)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (468, N'product_bb1180d6-2541-43dd-97e8-b718e5e74a69.png', 132)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (469, N'product_1fdd1543-f034-4d23-90fa-5899fab13fe9.png', 132)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (470, N'product_7427916b-c842-45d3-ad29-d48ff23c1132.png', 133)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (471, N'product_905663b4-6793-4c25-8bd2-cfe0512b1b70.jpeg', 133)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (472, N'product_60d68fc4-3b88-4cad-9b6a-fae609be4c97.jpeg', 133)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (473, N'product_c7b9b3da-e8fb-44e0-8f63-f2e2e25cc69a.jpeg', 133)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (474, N'product_418dc45c-293d-4bc8-898d-0147283b0661.png', 134)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (475, N'product_bfc247c7-83d9-45c9-a4bf-d17119e77a6e.png', 134)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (476, N'product_8f1b0d7c-4b81-4cff-b97a-9e28e46bd083.jpeg', 134)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (477, N'product_429f9b29-dcde-46d3-8d6c-a6b8ac81962b.jpeg', 134)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (478, N'product_b934caa9-4e0e-4042-8378-f1a4c2178f5f.jpeg', 134)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (479, N'product_67ab6c07-15b9-46be-aff6-a31e2e309018.jpeg', 134)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (481, N'product_83f22817-3ca2-44f5-a0d3-f6f8a36a4d69.png', 135)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (482, N'product_85471988-736d-4c8e-abd5-55e3c39278ab.png', 135)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (483, N'product_8bf46ef8-b339-4e85-bb81-920b70b7c960.png', 135)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (484, N'product_e1889a2a-b78d-46a6-88c4-d8475fa36dd9.png', 135)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (485, N'product_7dbcb51d-eacd-4013-8cb6-995cd1758fdb.png', 136)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (486, N'product_9805445e-13a5-43d9-bced-0c7a23ee0b52.jpg', 136)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (487, N'product_f1459088-65a0-4e8b-ba5d-839f3b46e0a7.jpg', 136)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (488, N'product_8ea09de1-13d7-4622-8325-1cbadeeef02b.jpg', 136)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (489, N'product_e570c218-e7d4-45c1-a7fa-20bd227bf20f.jpg', 136)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (490, N'product_d3770283-66c5-4584-88e9-f30bb6cd9660.jpg', 136)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (491, N'product_afdbb539-4b31-48a2-8d1e-745a13688831.jpg', 136)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (120, 1045)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (120, 1051)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (120, 1062)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (127, 1045)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (127, 1051)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (128, 1061)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (132, 1066)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (133, 1051)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (135, 1067)
GO
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 118, CAST(550000 AS Decimal(18, 0)), CAST(480000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 118, NULL, NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 120, CAST(620000 AS Decimal(18, 0)), CAST(479000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 120, NULL, NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 127, CAST(1090000 AS Decimal(18, 0)), CAST(879000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 127, NULL, NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 128, CAST(1590000 AS Decimal(18, 0)), CAST(1249000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 128, NULL, NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 132, CAST(3390000 AS Decimal(18, 0)), CAST(2770000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 132, NULL, NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 133, CAST(1590000 AS Decimal(18, 0)), CAST(1249000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 133, NULL, NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 134, CAST(1590000 AS Decimal(18, 0)), CAST(1150000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 134, NULL, NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 135, CAST(1490000 AS Decimal(18, 0)), CAST(1109000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 135, NULL, NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 136, CAST(3290000 AS Decimal(18, 0)), CAST(2690000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 136, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (1, N'Hàng có sẵn')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (2, N'Hàng đặt trước')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductUserImage] ON 

INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (35, N'product_795256d5-e03c-44c3-a560-e9d3addb23a1.jpg', 118)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (36, N'product_4dfd0b4d-d5e0-423c-a9b2-fdf827e4869e.jpeg', 118)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (42, N'product_8c925f41-8e4d-4a31-85f5-29fe404ac5f9.jfif', 134)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (43, N'product_75f19530-3832-4528-a66c-9181abbd1b02.jfif', 134)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (44, N'product_772220f1-6bb2-41b6-98a2-cd767aa4816d.jfif', 134)
SET IDENTITY_INSERT [dbo].[ProductUserImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Rate] ON 

INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [ProductId], [CreateDate], [RepliedId], [ParentId], [HtmlPosition], [UserId], [UserRepliedId], [IdsToDelete]) VALUES (220, 4, N'test2', NULL, CAST(N'2023-02-22T23:07:53.363' AS DateTime), NULL, NULL, NULL, 34, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Rate] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Seller')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Buyer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (4, N'Shop Demo 01', N'0397974403', N'maildemo01@gmail.com', N'Số 01 Lê Lợi', N'phuong_phuc_xa', N'quan_ba_dinh', N'thanh_pho_ha_noi', CAST(N'2022-04-13T00:00:00.000' AS DateTime), 12, NULL, 1, 2)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (8, N'Shop Admin', N'0906035526', N'mail@gmail.com', N'Số 10 Lê Lợi', N'phuong_phuc_xa', N'quan_ba_dinh', N'thanh_pho_ha_noi', CAST(N'2000-10-10T00:00:00.000' AS DateTime), 0, 1, 1, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (16, N'Shop UAT Updated 03', N'0397974405', N'mailuat03@gmail.com', N'Số 10 Lê Lợi', N'phuong_phuc_xa', N'quan_ba_dinh', N'thanh_pho_ha_noi', CAST(N'2022-06-25T10:15:22.000' AS DateTime), 13, NULL, 1, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (17, N'SHOP UAT 04', N'039797974000', N'new1mail@gmail.com', N'Số 10 Lê Lợi', N'xa_duc_hanh', N'huyen_bao_lam', N'tinh_cao_bang', CAST(N'2022-06-25T12:23:16.000' AS DateTime), 12, NULL, 1, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (18, N'Của hàng SIT 0001', N'0123456789', N'mailshopsit@gmail.com', N'So 10 Le Loi', N'xa_can_ty', N'huyen_quan_ba', N'tinh_ha_giang', CAST(N'2022-07-31T17:24:37.517' AS DateTime), 20, NULL, 1, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (19, N'HihiChi', N'0339909646', N'vantuanitc1989@gmail,com', N'365/39a, Hậu Giang, P.11, Q.6', N'phuong_11', N'quan_6', N'thanh_pho_ho_chi_minh', CAST(N'2023-02-11T01:41:44.610' AS DateTime), 0, 47, 1, NULL)
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopBank] ON 

INSERT [dbo].[ShopBank] ([ShopBankId], [ShopBankName], [ShopAccountName], [ShopAccountNumber], [ShopId]) VALUES (1, N'ACB', N'NGUYEN VAN A', N'852369741', 4)
INSERT [dbo].[ShopBank] ([ShopBankId], [ShopBankName], [ShopAccountName], [ShopAccountNumber], [ShopId]) VALUES (7, N'BIDV', N'NGUYEN VAN B', N'123456789', 16)
INSERT [dbo].[ShopBank] ([ShopBankId], [ShopBankName], [ShopAccountName], [ShopAccountNumber], [ShopId]) VALUES (14, N'ACB', N'NGUYEN VAN A', N'123456789', 17)
INSERT [dbo].[ShopBank] ([ShopBankId], [ShopBankName], [ShopAccountName], [ShopAccountNumber], [ShopId]) VALUES (32, N'', N'', N'', 18)
INSERT [dbo].[ShopBank] ([ShopBankId], [ShopBankName], [ShopAccountName], [ShopAccountNumber], [ShopId]) VALUES (33, N'', N'', N'', 19)
SET IDENTITY_INSERT [dbo].[ShopBank] OFF
GO
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (19, 64)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (19, 65)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (19, 66)
GO
SET IDENTITY_INSERT [dbo].[SizeGuide] ON 

INSERT [dbo].[SizeGuide] ([SizeGuideId], [SizeContent], [isBaseSizeGuide]) VALUES (1, N'<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://ananas.vn/wp-content/uploads/Size-chart-1-e1559209680920.jpg" width="913" height="654"></p>', 1)
SET IDENTITY_INSERT [dbo].[SizeGuide] OFF
GO
SET IDENTITY_INSERT [dbo].[Social] ON 

INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (1, 1, N'fab fa-facebook-square', N'Facebook', N'https://www.facebook.com/', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (2, 1, N'fab fa-youtube-square', N'Youtube', N'https://www.youtube.com/', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (3, 1, N'fab fa-instagram-square', N'Instagram', N'https://www.instagram.com/', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (4, 1, N'fab fa-facebook-messenger', N'Messenger', N'https://www.facebook.com/', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (5, 2, N'fas fa-mobile-alt', N'Zalo:', N'0906035526', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (6, 2, N'far fa-envelope', N'Mail:', N'contact.hihichi@gmail.com', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (7, 2, N'fas fa-map-marker-alt', N'Số 365/39A Hậu Giang, Phường 11, Quận 06, TP.Hồ Chí Minh', N'https://goo.gl/maps/tnZ1983YvzTU4j6s6', 0)
SET IDENTITY_INSERT [dbo].[Social] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (20, N'Bào Ngư Frozen Abalone', 9, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (21, N'Test', 10, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (22, N'Nồi Điện', 11, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (23, N'Máy Pha Cà Phê', 11, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (24, N'Máy Xay Đa Năng', 11, NULL)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (7, 20)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (14, 22)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (14, 23)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (30, 20)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (32, 20)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (33, 20)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (33, 22)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (34, 20)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (35, 20)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (40, 22)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (40, 23)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (42, 22)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (42, 23)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (42, 24)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (43, 22)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (43, 23)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (43, 24)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (44, 22)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (44, 23)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (44, 24)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (45, 22)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (45, 23)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (46, 22)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (46, 23)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (46, 24)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (47, 22)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (48, 22)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (49, 22)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (50, 22)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (53, 24)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (54, 24)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (55, 24)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (56, 24)
GO
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (22, 16)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (23, 17)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (1, N'admin@gmail.com', N'Admin', CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'Số 01 Lê Lợi', N'phuong_phuc_tan', N'quan_hoan_kiem', N'thanh_pho_ha_noi', N'0906035526', N'admin', 1, 0, 0, CAST(N'2023-02-18T13:19:35.960' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (34, N'sa@gmail.com', N'sa', CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'Số 01 Lê Lợi', N'phuong_phuc_tan', N'quan_hoan_kiem', N'thanh_pho_ha_noi', N'admin', N'admin', 1, 0, 0, CAST(N'2023-03-05T16:18:40.023' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (36, N'buyer@gmail.com', N'Buyer', CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'Số 01 Lê Lợi', N'phuong_phuc_tan', N'quan_hoan_kiem', N'thanh_pho_ha_noi', N'buyer', N'buyer', 1, 0, 0, CAST(N'2023-01-29T15:37:50.377' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (40, N'user1@gmail.com', N'User01', CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'Số 01 Lê Lợi', N'phuong_phuc_tan', N'quan_hoan_kiem', N'thanh_pho_ha_noi', N'0397974400', N'admin', 1, 0, 0, NULL)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (41, N'seller02@gmail.com', N'Seller02', CAST(N'2022-10-08T10:06:21.220' AS DateTime), N'so 10 le loi', N'xa_dinh_xuyen', N'huyen_gia_lam', N'thanh_pho_ha_noi', N'seller02', N'seller', 1, 1, 0, NULL)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (46, NULL, N'Võ tất thành', CAST(N'2023-02-11T12:09:54.733' AS DateTime), N'Số 10 Lê lợi', N'phuong_4', N'thanh_pho_cao_lanh', N'tinh_dong_thap', N'0935918260', N'thaiphongvo', 1, 0, 0, CAST(N'2023-02-11T12:13:54.740' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (47, N'Nhung@gmail.com', N'Nhung Chó', CAST(N'2023-02-20T14:55:51.033' AS DateTime), NULL, NULL, NULL, N'thanh_pho_ha_noi', N'0949246827', N'nhungcho', 1, 1, 0, CAST(N'2023-02-21T13:25:36.347' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (34, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (36, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (40, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (41, 2)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (46, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (47, 2)
GO
ALTER TABLE [dbo].[Brand]  WITH CHECK ADD  CONSTRAINT [FK_Brand_Discount] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([DiscountId])
GO
ALTER TABLE [dbo].[Brand] CHECK CONSTRAINT [FK_Brand_Discount]
GO
ALTER TABLE [dbo].[BrandCategory]  WITH CHECK ADD  CONSTRAINT [FK_BrandCategory_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[BrandCategory] CHECK CONSTRAINT [FK_BrandCategory_Brand]
GO
ALTER TABLE [dbo].[BrandCategory]  WITH CHECK ADD  CONSTRAINT [FK_BrandCategory_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[BrandCategory] CHECK CONSTRAINT [FK_BrandCategory_Category]
GO
ALTER TABLE [dbo].[Interest]  WITH CHECK ADD  CONSTRAINT [FK_Interest_Rate] FOREIGN KEY([RateId])
REFERENCES [dbo].[Rate] ([RateId])
GO
ALTER TABLE [dbo].[Interest] CHECK CONSTRAINT [FK_Interest_Rate]
GO
ALTER TABLE [dbo].[Interest]  WITH CHECK ADD  CONSTRAINT [FK_Interest_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Interest] CHECK CONSTRAINT [FK_Interest_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_NotificationType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[NotificationType] ([Id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_NotificationType]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User1] FOREIGN KEY([SenderId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User1]
GO
ALTER TABLE [dbo].[OptionValue]  WITH CHECK ADD  CONSTRAINT [FK_OptionValue_Option] FOREIGN KEY([OptionId])
REFERENCES [dbo].[Option] ([OptionId])
GO
ALTER TABLE [dbo].[OptionValue] CHECK CONSTRAINT [FK_OptionValue_Option]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentMethod] FOREIGN KEY([PaymentMethodId])
REFERENCES [dbo].[PaymentMethod] ([PaymentMethodId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PaymentMethod]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Shop] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shop] ([ShopId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Shop]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Attribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[Attribute] ([AttributeId])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Attribute]
GO
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product]
GO
ALTER TABLE [dbo].[ProductOptionValue]  WITH CHECK ADD  CONSTRAINT [FK_ProductOptionValue_OptionValue] FOREIGN KEY([OptionValueId])
REFERENCES [dbo].[OptionValue] ([OptionValueId])
GO
ALTER TABLE [dbo].[ProductOptionValue] CHECK CONSTRAINT [FK_ProductOptionValue_OptionValue]
GO
ALTER TABLE [dbo].[ProductOptionValue]  WITH CHECK ADD  CONSTRAINT [FK_ProductOptionValue_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductOptionValue] CHECK CONSTRAINT [FK_ProductOptionValue_Product]
GO
ALTER TABLE [dbo].[ProductPrice]  WITH CHECK ADD  CONSTRAINT [FK_ProductPrice_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductPrice] CHECK CONSTRAINT [FK_ProductPrice_Product]
GO
ALTER TABLE [dbo].[ProductPrice]  WITH CHECK ADD  CONSTRAINT [FK_ProductPrice_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([ProductTypeId])
GO
ALTER TABLE [dbo].[ProductPrice] CHECK CONSTRAINT [FK_ProductPrice_ProductType]
GO
ALTER TABLE [dbo].[ProductUserImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductUserImage_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductUserImage] CHECK CONSTRAINT [FK_ProductUserImage_Product]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD  CONSTRAINT [FK_Rate_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Rate] CHECK CONSTRAINT [FK_Rate_Product]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD  CONSTRAINT [FK_Rate_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Rate] CHECK CONSTRAINT [FK_Rate_User]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD  CONSTRAINT [FK_Rate_UserReplied] FOREIGN KEY([UserRepliedId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Rate] CHECK CONSTRAINT [FK_Rate_UserReplied]
GO
ALTER TABLE [dbo].[RatingImage]  WITH CHECK ADD  CONSTRAINT [FK_RatingImage_Rate] FOREIGN KEY([RateId])
REFERENCES [dbo].[Rate] ([RateId])
GO
ALTER TABLE [dbo].[RatingImage] CHECK CONSTRAINT [FK_RatingImage_Rate]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Discount] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([DiscountId])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Discount]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_User]
GO
ALTER TABLE [dbo].[ShopBank]  WITH CHECK ADD  CONSTRAINT [FK_ShopBank_Shop] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shop] ([ShopId])
GO
ALTER TABLE [dbo].[ShopBank] CHECK CONSTRAINT [FK_ShopBank_Shop]
GO
ALTER TABLE [dbo].[ShopBrand]  WITH CHECK ADD  CONSTRAINT [FK_ShopBrand_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[ShopBrand] CHECK CONSTRAINT [FK_ShopBrand_Brand]
GO
ALTER TABLE [dbo].[ShopBrand]  WITH CHECK ADD  CONSTRAINT [FK_ShopBrand_Shop] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shop] ([ShopId])
GO
ALTER TABLE [dbo].[ShopBrand] CHECK CONSTRAINT [FK_ShopBrand_Shop]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_SizeGuide] FOREIGN KEY([SizeGuideId])
REFERENCES [dbo].[SizeGuide] ([SizeGuideId])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_SizeGuide]
GO
ALTER TABLE [dbo].[SubCategoryAttribute]  WITH CHECK ADD  CONSTRAINT [FK_SubCategoryAttribute_Attribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[Attribute] ([AttributeId])
GO
ALTER TABLE [dbo].[SubCategoryAttribute] CHECK CONSTRAINT [FK_SubCategoryAttribute_Attribute]
GO
ALTER TABLE [dbo].[SubCategoryAttribute]  WITH CHECK ADD  CONSTRAINT [FK_SubCategoryAttribute_SubCategory] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[SubCategoryAttribute] CHECK CONSTRAINT [FK_SubCategoryAttribute_SubCategory]
GO
ALTER TABLE [dbo].[SubCategoryOption]  WITH CHECK ADD  CONSTRAINT [FK_SubCategoryOption_Option] FOREIGN KEY([OptionId])
REFERENCES [dbo].[Option] ([OptionId])
GO
ALTER TABLE [dbo].[SubCategoryOption] CHECK CONSTRAINT [FK_SubCategoryOption_Option]
GO
ALTER TABLE [dbo].[SubCategoryOption]  WITH CHECK ADD  CONSTRAINT [FK_SubCategoryOption_SubCategory] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[SubCategoryOption] CHECK CONSTRAINT [FK_SubCategoryOption_SubCategory]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
USE [master]
GO
ALTER DATABASE [hihichi_com_ecommerceweb_120323] SET  READ_WRITE 
GO
