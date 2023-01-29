USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 1/29/2023 4:50:27 PM ******/
CREATE DATABASE [ECommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ECommerce_7bdbffc03ddf4aea9fa0dd93bc1bb40c.mdf' , SIZE = 5120KB , MAXSIZE = 10485760KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ECommerce_cec8a64af18d466ba200cfdc66726005.ldf' , SIZE = 2048KB , MAXSIZE = 10485760KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ECommerce] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ECommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ECommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECommerce] SET QUERY_STORE = OFF
GO
USE [ECommerce]
GO
/****** Object:  User [tuongduy10]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Schema [tuongduy10]    Script Date: 1/29/2023 4:50:27 PM ******/
CREATE SCHEMA [tuongduy10]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Bank]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Banner]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[BrandCategory]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Configurations]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Discount]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[GroupInfo]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[GroupMessageHistory]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Header]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Interest]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[MessageHistory]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[NotificationType]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[OnlineHistory]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Option]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[OptionValue]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 1/29/2023 4:50:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttribute](
	[ProductId] [int] NOT NULL,
	[AttributeId] [int] NOT NULL,
	[Value] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[AttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[ProductOptionValue]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[ProductType]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[ProductUserImage]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Rate]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[RatingImage]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Shop]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[ShopBank]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[ShopBrand]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[SizeGuide]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Social]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[SubCategory]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[SubCategoryAttribute]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[SubCategoryOption]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 1/29/2023 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 1/29/2023 4:50:27 PM ******/
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

INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (1, 1, N'Giới thiệu về công ty', N'<p>PHONG C&Aacute;CH C&Ugrave;NG SWAROVSKI CRYSTAL FROST<br style="list-style-type: none;"><br style="list-style-type: none;">Swarovski Crystal Frost kh&ocirc;ng chỉ sở hữu vẻ đẹp nữ t&iacute;nh m&agrave; c&ograve;n mang đến sự trẻ trung hiếm c&oacute; qua những đường n&eacute;t ph&aacute; c&aacute;ch. Tạo t&aacute;c n&agrave;y ph&ocirc; diễn n&eacute;t đẹp của vi&ecirc;n đ&aacute; pha l&ecirc; với 178 tinh thể pha l&ecirc; được sắp xếp kh&eacute;o tr&ecirc;n v&agrave;nh bezel mang đến hiệu ứng như những b&ocirc;ng tuyết nổi bật tr&ecirc;n nền kim loại v&agrave;ng hồng.<br style="list-style-type: none;"><br style="list-style-type: none;">Trẻ trung, thời thượng v&agrave; ph&aacute; c&aacute;ch với mặt số đồng hồ l&agrave; bức tranh đầy biểu cảm. Tr&ecirc;n nền mặt số đen tuyền, c&ocirc; n&agrave;ng thi&ecirc;n nga khoe sắc tại vị tr&iacute; 12h v&agrave; chữ số Ả Rập mang đến sự vui nhộn, hoạt b&aacute;t hiếm c&oacute;.<br style="list-style-type: none;"><br style="list-style-type: none;">Ho&agrave;n thiện với d&acirc;y đồng hồ bằng lụa đen, Swarovski Crystal Frost mang đến phong c&aacute;ch thời trang thanh tho&aacute;t b&iacute; ẩn nhưng rất nữ t&iacute;nh cho c&ocirc; n&agrave;ng s&agrave;nh điệu.</p>', 1)
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

INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [Highlights], [New], [DiscountId]) VALUES (1, N'Calvin Klein', N'brand_3b63d688-dfbb-4687-b235-786afe7b6d8b.jpg', 1, CAST(N'2022-10-04' AS Date), 1, 0, 3)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [Highlights], [New], [DiscountId]) VALUES (2, N'Gongcha', N'gc.png', 1, CAST(N'2022-11-04' AS Date), 1, 1, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [Highlights], [New], [DiscountId]) VALUES (4, N'Peacebird', N'ded591fb-d3ba-40f7-91d4-22db2c82bfd5.png', 0, CAST(N'2022-11-04' AS Date), 1, 1, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [Highlights], [New], [DiscountId]) VALUES (7, N'Chanel', N'f8733a67-2441-482e-8768-b54970e3743d.png', 0, CAST(N'2022-11-04' AS Date), 1, 1, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [Highlights], [New], [DiscountId]) VALUES (8, N'VinaQuick', N'd622a3ff-19ce-4abc-9557-1359cba57882.jpg', 0, CAST(N'2022-11-05' AS Date), 1, 1, 3)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [Highlights], [New], [DiscountId]) VALUES (45, N'Gucci', N'24b15e60-b8e1-404f-9f76-a728852551ea.png', 0, CAST(N'2022-06-16' AS Date), 1, NULL, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [Highlights], [New], [DiscountId]) VALUES (46, N'Apple', N'a7fba171-702b-4c22-b829-229b6c98b75d.png', 1, CAST(N'2022-06-18' AS Date), 1, NULL, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [Highlights], [New], [DiscountId]) VALUES (55, N'Xiaomi', N'brand_cab69458-4803-4fb9-aff1-77195283a32d.png', 0, CAST(N'2022-07-31' AS Date), 1, NULL, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [Highlights], [New], [DiscountId]) VALUES (56, N'BB', N'brand_f3639a91-eba8-4609-8f1b-075c4997af7d.png', 1, CAST(N'2022-08-13' AS Date), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (1, 1)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (1, 2)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (1, 3)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (2, 1)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (2, 2)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (4, 1)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (7, 1)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (8, 1)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (8, 2)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (8, 3)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (45, 2)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (46, 2)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (55, 1)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (55, 2)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (55, 3)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (55, 7)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (56, 1)
INSERT [dbo].[BrandCategory] ([BrandId], [CategoryId]) VALUES (56, 2)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Thời trang')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Công nghệ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Mỹ phẩm')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (7, N'Thể thao')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Configurations] ON 

INSERT [dbo].[Configurations] ([Id], [WebsiteName], [FaviconPath], [LogoPath], [StartTime], [EndTime], [PhoneNumber], [Mail], [Owner], [FacebookUrl], [Address], [AddressUrl]) VALUES (1, N'HIHICHI', N'favicon_f31fb1e8-d495-4b29-8a3d-ebf12fb69910.png', N'logo_0052e058-a76f-46c6-ab29-0eaec8a3fc6c.png', CAST(N'08:30:00' AS Time), CAST(N'17:30:00' AS Time), N'0906035526', N'nguyenvana@gmail.com', N'Nguyễn Văn A', N'facebook.com/tngduy10', N'Số 365/39A Hậu Giang, Phường 11, Quận 06, TP.Hồ Chí Minh', N'https://goo.gl/maps/tnZ1983YvzTU4j6s6')
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
INSERT [dbo].[Interest] ([RateId], [UserId], [Liked]) VALUES (136, 1, 1)
INSERT [dbo].[Interest] ([RateId], [UserId], [Liked]) VALUES (136, 4, 1)
INSERT [dbo].[Interest] ([RateId], [UserId], [Liked]) VALUES (136, 34, NULL)
INSERT [dbo].[Interest] ([RateId], [UserId], [Liked]) VALUES (136, 36, 1)
INSERT [dbo].[Interest] ([RateId], [UserId], [Liked]) VALUES (136, 41, 1)
INSERT [dbo].[Interest] ([RateId], [UserId], [Liked]) VALUES (205, 4, NULL)
INSERT [dbo].[Interest] ([RateId], [UserId], [Liked]) VALUES (205, 36, NULL)
INSERT [dbo].[Interest] ([RateId], [UserId], [Liked]) VALUES (206, 4, NULL)
INSERT [dbo].[Interest] ([RateId], [UserId], [Liked]) VALUES (206, 36, NULL)
INSERT [dbo].[Interest] ([RateId], [UserId], [Liked]) VALUES (214, 34, NULL)
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
INSERT [dbo].[MessageHistory] ([Id], [Message], [Attachment], [CreateDate], [ToPhoneNumber], [FromName], [FromPhoneNumber], [Type], [Status]) VALUES (202, N'asdasda', NULL, CAST(N'2023-01-29T15:35:28.877' AS DateTime), N'0397974400', N'sa', N'admin', N'FROM_ADMIN_MSG', N'UN_READ')
SET IDENTITY_INSERT [dbo].[MessageHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([Id], [IsRead], [TextContent], [CreateDate], [JsLink], [TypeId], [ReceiverId], [SenderId], [InfoId]) VALUES (92, 0, N'Admin01, Seller01, Buyer01 và Seller02 đã thích bình luận của bạn', CAST(N'2022-11-05T09:50:28.550' AS DateTime), N'/Product/ProductDetail?ProductId=101&isScrolledTo=true&commentId=136', 7, 34, NULL, 136)
INSERT [dbo].[Notification] ([Id], [IsRead], [TextContent], [CreateDate], [JsLink], [TypeId], [ReceiverId], [SenderId], [InfoId]) VALUES (99, 1, N'reply after', CAST(N'2022-11-05T09:50:50.957' AS DateTime), N'/Product/ProductDetail?ProductId=101&isScrolledTo=true&commentId=214', 8, 34, 34, 214)
INSERT [dbo].[Notification] ([Id], [IsRead], [TextContent], [CreateDate], [JsLink], [TypeId], [ReceiverId], [SenderId], [InfoId]) VALUES (100, 0, N'reply 26999999', CAST(N'2022-11-03T22:31:37.953' AS DateTime), N'/Product/ProductDetail?ProductId=101&isScrolledTo=true&commentId=215', 8, 34, 34, 215)
SET IDENTITY_INSERT [dbo].[Notification] OFF
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

INSERT [dbo].[Option] ([OptionId], [OptionName]) VALUES (1, N'Loại dây')
INSERT [dbo].[Option] ([OptionId], [OptionName]) VALUES (2, N'Kích thước')
INSERT [dbo].[Option] ([OptionId], [OptionName]) VALUES (3, N'Giới tính')
INSERT [dbo].[Option] ([OptionId], [OptionName]) VALUES (6, N'Màu sắc')
SET IDENTITY_INSERT [dbo].[Option] OFF
GO
SET IDENTITY_INSERT [dbo].[OptionValue] ON 

INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1, N'Dây kim loại', 1, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (2, N'Dây da', 1, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (3, N'Dây dù', 1, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (4, N'42', 2, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (5, N'43', 2, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (6, N'44', 2, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1005, N'Nam', 3, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1007, N'Dây nhựa', 1, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1012, N'Nữ   ', 3, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1016, N'Tím', 6, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1017, N'Đỏ', 6, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1019, N'Đen', 6, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1020, N'Hồng', 6, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1021, N'Xám', 6, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1022, N'Chàm', 6, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1023, N'Xẫm', 6, 0)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1025, N'45', 2, 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId], [isBaseValue]) VALUES (1030, N'Trắng', 6, 0)
SET IDENTITY_INSERT [dbo].[OptionValue] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 

INSERT [dbo].[PaymentMethod] ([PaymentMethodId], [PaymentMethod]) VALUES (1, N'COD')
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [PPC], [ProductCode], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductDescriptionMobile], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note], [SizeGuide], [Link]) VALUES (101, N'23906101', N'A1B2C3', N'Sản phẩm Test', NULL, CAST(N'2022-08-20T15:49:53.363' AS DateTime), N'<p style="text-align: center;"><iframe src="https://www.youtube.com/embed/Wg92RrNhB8s?list=RDWg92RrNhB8s&amp;start_radio=1" width="700" height="393" allowfullscreen="allowfullscreen"></iframe></p>', N'<p style="text-align: center;"><iframe src="https://www.youtube.com/embed/Wg92RrNhB8s?list=RDWg92RrNhB8s&amp;start_radio=1" width="300" height="168" allowfullscreen="allowfullscreen"></iframe></p>', 0, 1, 1, 1, 0, 1, 1, N'test ne', 13, 16, 46, NULL, NULL, N'', N'<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://ananas.vn/wp-content/uploads/Size-chart-1-e1559209680920.jpg" width="913" height="654"></p>', N'')
INSERT [dbo].[Product] ([ProductId], [PPC], [ProductCode], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductDescriptionMobile], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note], [SizeGuide], [Link]) VALUES (116, N'29625102', N'S1S2S3', N'Sản phẩm test', NULL, CAST(N'2022-11-19T11:37:20.780' AS DateTime), NULL, NULL, 0, 1, 1, 0, 0, 0, 1, N'Đổi trả tự do', 1, 4, 2, NULL, NULL, N'', NULL, N'')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (101, 1, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (101, 2, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (101, 3, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (101, 4, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (101, 5, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (101, 6, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (101, 7, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (101, 8, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (101, 9, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (101, 10, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (101, 11, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (116, 1, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (116, 2, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (116, 3, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (116, 4, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (116, 5, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (116, 6, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (116, 7, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (116, 8, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (116, 9, N'')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (116, 10, N'')
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (298, N'product_d09babec-4712-4829-a80b-4b9f51c34143.jpg', 101)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (299, N'product_7696f87c-9ab4-4f97-a1c0-d4d96b0c37e9.jpg', 101)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (300, N'product_0dca1da5-9d29-4fd7-af68-925de77d53aa.jpg', 101)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (301, N'product_33f8ebe1-f43a-44a4-bf0b-c03b8f13e38b.jpg', 101)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (325, N'product_79d1811a-6cfe-478d-9efa-c6160b7df2d7.jpg', 116)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (326, N'product_ba1f5ff6-e5d4-4a33-b89e-31538e505820.jpg', 116)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (101, 1016)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (101, 1017)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (101, 1019)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (116, 1)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (116, 2)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (116, 3)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (116, 4)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (116, 5)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (116, 6)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (116, 1005)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (116, 1012)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (116, 1016)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (116, 1017)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (116, 1019)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (116, 1025)
GO
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 101, CAST(100000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 101, NULL, NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 116, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 116, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (1, N'Hàng có sẵn')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (2, N'Hàng đặt trước')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductUserImage] ON 

INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (31, N'product_fea53850-df91-4704-a32b-51c6bae1ac3f.jpg', 116)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (32, N'product_667398ac-2076-4de8-9a65-3175c516b32a.jpg', 116)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (33, N'product_ff374e6e-5a22-48c4-a179-0c00ef602b47.jpg', 116)
SET IDENTITY_INSERT [dbo].[ProductUserImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Rate] ON 

INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [ProductId], [CreateDate], [RepliedId], [ParentId], [HtmlPosition], [UserId], [UserRepliedId], [IdsToDelete]) VALUES (136, 5, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum 12', 101, CAST(N'2022-10-15T17:42:53.110' AS DateTime), NULL, NULL, NULL, 34, NULL, NULL)
INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [ProductId], [CreateDate], [RepliedId], [ParentId], [HtmlPosition], [UserId], [UserRepliedId], [IdsToDelete]) VALUES (205, 0, N'test update 9999', 101, CAST(N'2022-10-31T21:31:54.010' AS DateTime), 136, 136, NULL, 34, 34, N'136')
INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [ProductId], [CreateDate], [RepliedId], [ParentId], [HtmlPosition], [UserId], [UserRepliedId], [IdsToDelete]) VALUES (206, 0, N'test update reply', 101, CAST(N'2022-10-31T21:33:29.627' AS DateTime), 136, 136, NULL, 34, 34, N'136')
INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [ProductId], [CreateDate], [RepliedId], [ParentId], [HtmlPosition], [UserId], [UserRepliedId], [IdsToDelete]) VALUES (214, 0, N'reply after', 101, CAST(N'2022-11-03T22:05:06.380' AS DateTime), 136, 136, NULL, 34, 34, N'136')
INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [ProductId], [CreateDate], [RepliedId], [ParentId], [HtmlPosition], [UserId], [UserRepliedId], [IdsToDelete]) VALUES (215, 0, N'reply 26999999', 101, CAST(N'2022-11-03T22:08:35.610' AS DateTime), 214, 136, NULL, 34, 34, N'136,214')
SET IDENTITY_INSERT [dbo].[Rate] OFF
GO
SET IDENTITY_INSERT [dbo].[RatingImage] ON 

INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (118, N'rate_c3c76f53-44d7-405f-a03e-77eb79465580.jpg', 136)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (119, N'rate_a88ea60d-9102-48e8-b1fb-1b83561eff2e.jpg', 136)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (120, N'rate_a0679e9b-3c98-4a34-8002-9434e94183a0.jpg', 136)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (128, N'rate_e314bb1c-fc80-4557-9b65-d1f483b90c01.png', 205)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (129, N'rate_50f0aee5-c71a-400f-816b-be05dc8545c8.jpg', 205)
SET IDENTITY_INSERT [dbo].[RatingImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Seller')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Buyer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (4, N'Shop Demo 01', N'0397974403', N'mail@gmail.com', N'Số 01 Lê Lợi', N'phuong_phuc_xa', N'quan_ba_dinh', N'thanh_pho_ha_noi', CAST(N'2022-04-13T00:00:00.000' AS DateTime), 12, NULL, 1, 2)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (8, N'Shop Admin', N'0906035526', N'mail@gmail.com', N'Số 10 Lê Lợi', N'phuong_phuc_xa', N'quan_ba_dinh', N'thanh_pho_ha_noi', CAST(N'2000-10-10T00:00:00.000' AS DateTime), 0, 1, 1, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (16, N'Shop UAT Updated 03', N'0397974405', N'mailuat03@gmail.com', N'Số 10 Lê Lợi', N'phuong_phuc_xa', N'quan_ba_dinh', N'thanh_pho_ha_noi', CAST(N'2022-06-25T10:15:22.000' AS DateTime), 13, 4, 1, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (17, N'SHOP UAT 04', N'039797974000', N'new1mail@gmail.com', N'Số 10 Lê Lợi', N'xa_duc_hanh', N'huyen_bao_lam', N'tinh_cao_bang', CAST(N'2022-06-25T12:23:16.000' AS DateTime), 12, NULL, 1, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (18, N'Của hàng SIT 0001', N'0123456789', N'mailshopsit@gmail.com', N'So 10 Le Loi', N'xa_can_ty', N'huyen_quan_ba', N'tinh_ha_giang', CAST(N'2022-07-31T17:24:37.517' AS DateTime), 20, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopBank] ON 

INSERT [dbo].[ShopBank] ([ShopBankId], [ShopBankName], [ShopAccountName], [ShopAccountNumber], [ShopId]) VALUES (1, N'ACB', N'NGUYEN VAN A', N'852369741', 4)
INSERT [dbo].[ShopBank] ([ShopBankId], [ShopBankName], [ShopAccountName], [ShopAccountNumber], [ShopId]) VALUES (7, N'BIDV', N'NGUYEN VAN B', N'123456789', 16)
INSERT [dbo].[ShopBank] ([ShopBankId], [ShopBankName], [ShopAccountName], [ShopAccountNumber], [ShopId]) VALUES (14, N'ACB', N'NGUYEN VAN A', N'123456789', 17)
INSERT [dbo].[ShopBank] ([ShopBankId], [ShopBankName], [ShopAccountName], [ShopAccountNumber], [ShopId]) VALUES (32, N'', N'', N'', 18)
SET IDENTITY_INSERT [dbo].[ShopBank] OFF
GO
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (4, 1)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (4, 2)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (4, 4)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (4, 7)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (4, 8)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (16, 1)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (16, 4)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (16, 45)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (16, 46)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (17, 1)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (17, 8)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (18, 1)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (18, 46)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (18, 55)
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
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (5, 2, N'fas fa-mobile-alt', N'Zalo:', N'012345678', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (6, 2, N'far fa-envelope', N'Mail:', N'mail@gmail.com', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (7, 2, N'fas fa-map-marker-alt', N'Số 365/39A Hậu Giang, Phường 11, Quận 06, TP.Hồ Chí Minh', N'https://goo.gl/maps/tnZ1983YvzTU4j6s6', 0)
SET IDENTITY_INSERT [dbo].[Social] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (1, N'Đồng hồ', 1, 1)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (2, N'Quần', 1, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (3, N'Áo', 1, 1)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (6, N'Giày', 1, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (7, N'Nón', 1, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (8, N'Kính', 1, 1)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (13, N'Điện thoại', 2, 1)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (17, N'Nước hoa', 3, 1)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [SizeGuideId]) VALUES (18, N'Máy tập thể dục', 7, NULL)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (1, 1)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (1, 13)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (2, 1)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (2, 13)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (3, 1)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (3, 13)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (4, 1)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (4, 13)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (5, 1)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (5, 13)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (6, 1)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (6, 13)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (7, 1)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (7, 2)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (7, 3)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (7, 6)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (7, 7)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (7, 8)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (7, 13)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (7, 18)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (8, 1)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (8, 13)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (9, 1)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (9, 13)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (10, 1)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (10, 13)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (11, 13)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (14, 18)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (15, 18)
GO
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (1, 1)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (1, 2)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (1, 3)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (1, 6)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (2, 1)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (2, 6)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (3, 6)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (13, 6)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (18, 6)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (1, N'admin@gmail.com', N'Admin', CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'Số 01 Lê Lợi', N'phuong_phuc_tan', N'quan_hoan_kiem', N'thanh_pho_ha_noi', N'0906035526', N'admin', 1, 0, 0, NULL)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (4, N'seller@gmail.com', N'Seller', CAST(N'2022-05-02T00:00:00.000' AS DateTime), N'Số 02 Lê Lợi', N'phuong_nhat_tan', N'quan_tay_ho', N'thanh_pho_ha_noi', N'seller', N'seller', 1, 0, 0, CAST(N'2022-12-08T22:23:28.697' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (34, N'sa@gmail.com', N'sa', CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'Số 01 Lê Lợi', N'phuong_phuc_tan', N'quan_hoan_kiem', N'thanh_pho_ha_noi', N'admin', N'admin', 1, 0, 0, CAST(N'2023-01-12T00:27:47.467' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (36, N'buyer@gmail.com', N'Buyer', CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'Số 01 Lê Lợi', N'phuong_phuc_tan', N'quan_hoan_kiem', N'thanh_pho_ha_noi', N'buyer', N'buyer', 1, 0, 1, CAST(N'2023-01-29T15:41:50.347' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (40, N'user1@gmail.com', N'User01', CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'Số 01 Lê Lợi', N'phuong_phuc_tan', N'quan_hoan_kiem', N'thanh_pho_ha_noi', N'0397974400', N'admin', 1, 0, 0, NULL)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status], [isSystemAccount], [IsOnline], [LastOnline]) VALUES (41, N'seller02@gmail.com', N'Seller02', CAST(N'2022-10-08T10:06:21.220' AS DateTime), N'so 10 le loi', N'xa_dinh_xuyen', N'huyen_gia_lam', N'thanh_pho_ha_noi', N'seller02', N'seller', 1, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (4, 2)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (34, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (36, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (40, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (41, 2)
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
ALTER DATABASE [ECommerce] SET  READ_WRITE 
GO
