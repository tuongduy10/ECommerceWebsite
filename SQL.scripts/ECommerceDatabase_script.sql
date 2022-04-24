USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 4/24/2022 10:42:35 AM ******/
CREATE DATABASE [ECommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ECommerce.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ECommerce_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [ECommerce] SET AUTO_CLOSE OFF 
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
USE [ECommerce]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 4/24/2022 10:42:35 AM ******/
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
/****** Object:  Table [dbo].[Bank]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank](
	[BankId] [int] IDENTITY(1,1) NOT NULL,
	[BankAccountNumber] [decimal](20, 0) NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[BlogPosition] [tinyint] NULL,
	[BlogTitle] [nvarchar](100) NULL,
	[BlogContent] [text] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Brand]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](100) NOT NULL,
	[BrandImagePath] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Highlights] [bit] NULL,
	[New] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/24/2022 10:42:35 AM ******/
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
/****** Object:  Table [dbo].[Configurations]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configurations](
	[Id] [int] NULL,
	[WebsiteName] [nvarchar](100) NULL,
	[FaviconPath] [varchar](100) NULL,
	[LogoPath] [varchar](100) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Mail] [varchar](50) NULL,
	[Facebook] [varchar](100) NULL,
	[FacebookUrl] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountValue] [decimal](18, 0) NULL,
	[DiscountCode] [varchar](50) NULL,
	[DiscountStock] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[DiscountTypeId] [int] NULL,
 CONSTRAINT [PK_DiscountValue] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DiscountType]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DiscountType](
	[DiscountTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountType] [varchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_DiscountType] PRIMARY KEY CLUSTERED 
(
	[DiscountTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Header]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Option]    Script Date: 4/24/2022 10:42:35 AM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[DiscountId] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[VerifiedDate] [datetime] NULL,
	[Price] [decimal](18, 0) NULL,
	[PriceOnSell] [decimal](18, 0) NULL,
	[Amount] [int] NULL,
	[Total] [decimal](18, 0) NULL,
	[AttributeValue] [nvarchar](50) NULL,
	[OptionValue] [nvarchar](50) NULL,
	[Status] [tinyint] NULL,
	[Paid] [bit] NULL,
	[PayForAdmin] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC,
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 4/24/2022 10:42:35 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[DiscountPercent] [tinyint] NULL,
	[ProductAddedDate] [date] NULL,
	[ProductDescription] [ntext] NULL,
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
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 4/24/2022 10:42:35 AM ******/
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
/****** Object:  Table [dbo].[ProductImage]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductOption]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOption](
	[ProductOptionId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OptionId] [int] NOT NULL,
	[Value] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductOption] PRIMARY KEY CLUSTERED 
(
	[ProductOptionId] ASC,
	[ProductId] ASC,
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 4/24/2022 10:42:35 AM ******/
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
/****** Object:  Table [dbo].[ProductType]    Script Date: 4/24/2022 10:42:35 AM ******/
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
/****** Object:  Table [dbo].[ProductUserImage]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rate]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[RateValue] [tinyint] NULL,
	[Comment] [text] NULL,
	[UserId] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RatingImage]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleFunction]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleFunction](
	[RoleFunctionId] [int] IDENTITY(1,1) NOT NULL,
	[RoleFunctionName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RoleFunction] PRIMARY KEY CLUSTERED 
(
	[RoleFunctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[ShopJoinDate] [date] NOT NULL,
	[Tax] [tinyint] NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShopBank]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopBank](
	[ShopBankId] [int] IDENTITY(1,1) NOT NULL,
	[ShopBankName] [nvarchar](100) NOT NULL,
	[ShopAccountNumber] [decimal](20, 0) NOT NULL,
	[ShopId] [int] NOT NULL,
 CONSTRAINT [PK_ShopBank] PRIMARY KEY CLUSTERED 
(
	[ShopBankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShopBrand]    Script Date: 4/24/2022 10:42:35 AM ******/
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
/****** Object:  Table [dbo].[Social]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategoryAttribute]    Script Date: 4/24/2022 10:42:35 AM ******/
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
/****** Object:  Table [dbo].[SubCategoryOption]    Script Date: 4/24/2022 10:42:35 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserMail] [varchar](50) NULL,
	[UserFullName] [nvarchar](100) NOT NULL,
	[UserJoinDate] [date] NOT NULL,
	[UserAddress] [nvarchar](100) NULL,
	[UserWardCode] [varchar](50) NULL,
	[UserDistrictCode] [varchar](50) NULL,
	[UserCityCode] [varchar](50) NULL,
	[UserPhone] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 4/24/2022 10:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[RoleFunctionId] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC,
	[RoleFunctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([BannerId], [BannerPath], [Status]) VALUES (1, N'snidel.jpg', 1)
INSERT [dbo].[Banner] ([BannerId], [BannerPath], [Status]) VALUES (2, N'theory.jpg', 1)
SET IDENTITY_INSERT [dbo].[Banner] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (1, 1, N'Giới thiệu về công ty', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (2, 1, N'Quy tắc đạo đức', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (3, 1, N'Quyền riêng tư', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (4, 1, N'Sản phẩm của chúng tôi', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (5, 2, N'Chính sách bảo hành', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (6, 2, N'Chính sách đổi trả', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (7, 2, N'Chính sách thanh toán', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (8, 2, N'Chính sách giao hàng', N'test', 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (1, N'Thế giới di động', N'tgdd.png', 1, CAST(N'2022-10-04' AS Date), 1, 1, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (2, N'Brand Demo 02', N'gc.png', 1, CAST(N'2022-11-04' AS Date), 1, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (4, N'Z Brand', N'tgdd.png', 1, CAST(N'2022-11-04' AS Date), 2, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (7, N'E Brand 01', N'tgdd.png', 1, CAST(N'2022-11-04' AS Date), 1, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (8, N'A Brand 02', N'tgdd.png', 1, CAST(N'2022-11-05' AS Date), 1, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (9, N'B Brand 03', N'tgdd.png', 1, CAST(N'2022-11-06' AS Date), 2, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (10, N'C Brand', N'gc.png', 1, CAST(N'2022-11-08' AS Date), 1, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (11, N'D Brand 01', N'gc.png', 1, CAST(N'2022-11-08' AS Date), 1, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (12, N'E Brand 02', N'gc.png', 1, CAST(N'2022-11-09' AS Date), 1, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (13, N'F Brand 03', N'gc.png', 1, CAST(N'2022-11-09' AS Date), 2, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (14, N'G Brand ', N'tgdd.png', 1, CAST(N'2022-11-11' AS Date), 1, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (15, N'H Brand 01', N'tgdd.png', 1, CAST(N'2022-11-01' AS Date), 1, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (17, N'C Brand 02', N'tgdd.png', 1, CAST(N'2022-11-01' AS Date), 2, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (18, N'C Brand 03', N'tgdd.png', 1, CAST(N'2022-11-02' AS Date), 1, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (19, N'D Brand ', N'gc.png', 1, CAST(N'2022-11-02' AS Date), 2, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (20, N'E Brand 01', N'gc.png', 1, CAST(N'2022-11-03' AS Date), 1, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (21, N'S Brand 02', N'gc.png', 1, CAST(N'2022-11-04' AS Date), 1, 1, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (22, N'O Brand 03', N'gc.png', 1, CAST(N'2022-11-23' AS Date), 1, 0, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (23, N'C Brand 01', N'gc.png', 1, CAST(N'2022-11-12' AS Date), 1, 0, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (25, N'C Brand 02', N'gc.png', 1, CAST(N'2022-11-12' AS Date), 1, 0, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (26, N'C Brand 03', N'tgdd.png', 1, CAST(N'2022-11-12' AS Date), 1, 0, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (27, N'C Brand 04', N'gc.png', 1, CAST(N'2022-11-12' AS Date), 1, 0, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (28, N'C Brand 05', N'tgdd.png', 1, CAST(N'2022-11-11' AS Date), 1, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (29, N'C Brand 06', N'gc.png', 1, CAST(N'2022-11-12' AS Date), 1, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (30, N'C Brand 07', N'tgdd.png', 1, CAST(N'2022-12-12' AS Date), 1, 0, 1)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (31, N'C Brand 08', N'gc.png', 1, CAST(N'2022-12-12' AS Date), 2, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (32, N'Z Brand 09', N'tgdd.png', 1, CAST(N'2022-12-12' AS Date), 2, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (33, N'Z Brand 10', N'gc.png', 1, CAST(N'2022-12-12' AS Date), 2, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (34, N'Z Brand 11', N'tgdd.png', 1, CAST(N'2022-12-12' AS Date), 2, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (35, N'Z Brand 12', N'gc.png', 1, CAST(N'2022-08-08' AS Date), 2, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (36, N'Z Brand 13', N'tgdd.png', 1, CAST(N'2022-11-12' AS Date), 1, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (37, N'Z Brand 14', N'gc.png', 1, CAST(N'2022-11-12' AS Date), 1, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (38, N'Z Brand 15', N'tgdd.png', 1, CAST(N'2022-11-12' AS Date), 2, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (39, N'Z Brand 16', N'gc.png', 1, CAST(N'2022-11-11' AS Date), 2, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (40, N'Z Brand 17', N'tgdd.png', 1, CAST(N'2022-11-12' AS Date), 2, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (41, N'Z Brand 18', N'gc.png', 1, CAST(N'2022-12-11' AS Date), 1, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (42, N'Z Brand 19', N'tgdd.png', 1, CAST(N'2022-12-12' AS Date), 2, 0, 0)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New]) VALUES (43, N'Z Brand 20', N'gc.png', 1, CAST(N'2022-12-12' AS Date), 2, 0, 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Thời trang')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Công nghệ')
SET IDENTITY_INSERT [dbo].[Category] OFF
INSERT [dbo].[Configurations] ([Id], [WebsiteName], [FaviconPath], [LogoPath], [StartTime], [EndTime], [PhoneNumber], [Mail], [Facebook], [FacebookUrl]) VALUES (1, N'WebsiteName', N'swarovski.png', N'swarovski.png', CAST(N'08:00:00' AS Time), CAST(N'22:00:00' AS Time), N'0123456789', N'mail@gmail.com', N'Mr. A', N'facebook.com')
SET IDENTITY_INSERT [dbo].[Header] ON 

INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (1, 0, N'Trang chủ', N'/Home/Index', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (2, 1, N'Hot sale', N'/Home/HotSale', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (3, 2, N'Sản phẩm mới', N'/Home/Index', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (4, 3, N'Thương hiệu', N'/Home/Index', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (5, 4, N'Thanh toán', N'/Home/Index', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (6, 5, N'Hàng có sẵn', N'/Home/Index', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (7, 6, N'Hàng đặt trước', N'/Home/Index', 1)
SET IDENTITY_INSERT [dbo].[Header] OFF
SET IDENTITY_INSERT [dbo].[Option] ON 

INSERT [dbo].[Option] ([OptionId], [OptionName]) VALUES (1, N'Loại dây')
INSERT [dbo].[Option] ([OptionId], [OptionName]) VALUES (2, N'Kích thước')
INSERT [dbo].[Option] ([OptionId], [OptionName]) VALUES (3, N'Giới tính')
SET IDENTITY_INSERT [dbo].[Option] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (3, N'Đồng hồ thông minh 01', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí 1 năm', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (4, N'Sản phẩm 01', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí 1 năm', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (5, N'Sản phẩm 02', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 0, 0, 0, 0, N'Bảo hành miễn phí 1 năm', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (6, N'Sản phẩm 03', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 0, 1, N'Bảo hành miễn phí 1 năm', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (7, N'Sản phẩm 04', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí 1 năm', 3, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (8, N'Sản phẩm 05', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (9, N'Sản phẩm 06', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 0, 1, N'Bảo hành miễn phí', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (10, N'Sản phẩm 07', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 3, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (11, N'Sản phẩm 08', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (12, N'Sản phẩm 09', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 0, 1, 0, N'Bảo hành miễn phí', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (13, N'Sản phẩm 10', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 0, N'Bảo hành miễn phí', 3, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (14, N'Sản phẩm 11', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 1, 1, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (15, N'Sản phẩm 12', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 1, 1, N'Bảo hành miễn phí', 2, 4, 1, CAST(N'2022-04-18' AS Date), 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (16, N'Sản phẩm 13', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 0, 0, 0, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (17, N'Sản phẩm 14', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 2, 4, 1, CAST(N'2022-04-18' AS Date), 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (18, N'Sản phẩm 15', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 0, 1, N'Bảo hành miễn phí', 2, 4, 1, CAST(N'2022-04-18' AS Date), 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (19, N'Sản phẩm 16', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 0, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (20, N'Sản phẩm 17', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 0, 0, 1, 1, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (21, N'Sản phẩm 18', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 0, 1, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (22, N'Sản phẩm 19', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 1, 1, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (23, N'Sản phẩm 20', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 0, 1, 1, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (24, N'Sản phẩm 21', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 0, 0, 1, 0, N'Bảo hành miễn phí', 1, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (25, N'Sản phẩm 22', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 0, 1, N'Bảo hành miễn phí', 1, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (26, N'Sản phẩm 23', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 1, 1, N'Bảo hành miễn phí', 1, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (27, N'Sản phẩm 24', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 1, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (28, N'Sản phẩm 25', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 1, 0, 0, 1, N'Bảo hành miễn phí', 1, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (29, N'Sản phẩm 26', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 1, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (30, N'Sản phẩm 27', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 0, 0, 1, 1, N'Bảo hành miễn phí', 1, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (31, N'Sản phẩm 28', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 0, 1, 0, 1, N'Bảo hành miễn phí', 1, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (32, N'Sản phẩm 29', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 1, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (33, N'Sản phẩm 30', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 1, 0, 1, 0, N'Bảo hành miễn phí', 1, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (34, N'Sản phẩm 31', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 0, 0, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (35, N'Sản phẩm 32', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (36, N'Sản phẩm 33', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 0, 0, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (37, N'Sản phẩm 34', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (38, N'Sản phẩm 35', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 1, 1, 0, 0, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (39, N'Sản phẩm 36', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 0, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (40, N'Sản phẩm 37', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 0, 0, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (41, N'Sản phẩm 38', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (42, N'Sản phẩm 39', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 0, 0, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (43, N'Sản phẩm 40', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 0, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (44, N'Sản phẩm 41', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 0, 1, 1, 0, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (45, N'Sản phẩm 42', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 0, 1, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (46, N'Sản phẩm 43', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 0, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (47, N'Sản phẩm 44', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 1, 0, 1, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (48, N'Sản phẩm 45', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (49, N'Sản phẩm 46', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 1, 0, 0, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (50, N'Sản phẩm 47', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 0, 1, 1, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (51, N'Sản phẩm 48', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 1, 1, 0, 0, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (52, N'Sản phẩm 49', 10, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 0, 1, 1, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate]) VALUES (53, N'Sản phẩm 50', NULL, CAST(N'2022-04-13' AS Date), N'Mô tả', 20, 1, 0, 0, 1, 1, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (1, N'watch1.jpg', 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (2, N'watch2.jpg', 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (3, N'watch3.jpg', 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (4, N'watch4.jpg', 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (5, N'watch1.jpg', 4)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (6, N'watch2.jpg', 4)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (7, N'watch3.jpg', 4)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (8, N'watch4.jpg', 4)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (9, N'watch1.jpg', 5)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (10, N'watch2.jpg', 5)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (11, N'watch3.jpg', 5)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (12, N'watch4.jpg', 5)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (13, N'watch1.jpg', 6)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (14, N'watch2.jpg', 6)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (15, N'watch3.jpg', 6)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (16, N'watch4.jpg', 6)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (17, N'watch1.jpg', 7)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (18, N'watch2.jpg', 7)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (19, N'watch3.jpg', 7)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (20, N'watch4.jpg', 7)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (21, N'watch1.jpg', 8)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (22, N'watch2.jpg', 8)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (23, N'watch3.jpg', 8)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (24, N'watch4.jpg', 8)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (25, N'watch1.jpg', 9)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (26, N'watch2.jpg', 9)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (27, N'watch3.jpg', 9)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (28, N'watch4.jpg', 9)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (29, N'watch1.jpg', 10)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (30, N'watch2.jpg', 10)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (31, N'watch3.jpg', 10)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (32, N'watch4.jpg', 10)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (33, N'watch1.jpg', 11)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (34, N'watch2.jpg', 11)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (35, N'watch3.jpg', 11)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (36, N'watch4.jpg', 11)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (37, N'watch1.jpg', 12)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (38, N'watch2.jpg', 12)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (39, N'watch3.jpg', 12)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (40, N'watch4.jpg', 12)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (41, N'watch1.jpg', 13)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (42, N'watch2.jpg', 13)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (43, N'watch3.jpg', 13)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (44, N'watch4.jpg', 13)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (45, N'watch1.jpg', 14)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (46, N'watch2.jpg', 14)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (47, N'watch3.jpg', 14)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (48, N'watch4.jpg', 14)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (49, N'watch1.jpg', 15)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (50, N'watch2.jpg', 15)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (51, N'watch3.jpg', 15)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (52, N'watch4.jpg', 15)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (53, N'watch1.jpg', 16)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (54, N'watch2.jpg', 16)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (55, N'watch3.jpg', 16)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (56, N'watch4.jpg', 16)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (57, N'watch1.jpg', 17)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (58, N'watch2.jpg', 17)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (59, N'watch3.jpg', 17)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (60, N'watch4.jpg', 17)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (61, N'watch1.jpg', 18)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (62, N'watch2.jpg', 18)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (63, N'watch3.jpg', 18)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (64, N'watch4.jpg', 18)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (65, N'watch1.jpg', 19)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (66, N'watch2.jpg', 19)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (67, N'watch3.jpg', 19)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (68, N'watch4.jpg', 19)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (69, N'watch1.jpg', 20)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (70, N'watch2.jpg', 20)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (71, N'watch3.jpg', 20)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (72, N'watch4.jpg', 20)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (73, N'watch1.jpg', 21)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (74, N'watch2.jpg', 21)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (75, N'watch3.jpg', 21)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (76, N'watch4.jpg', 21)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (77, N'watch1.jpg', 22)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (78, N'watch2.jpg', 22)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (79, N'watch3.jpg', 22)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (80, N'watch4.jpg', 22)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (81, N'watch1.jpg', 23)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (82, N'watch2.jpg', 23)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (83, N'watch3.jpg', 23)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (84, N'watch4.jpg', 23)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (85, N'watch1.jpg', 24)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (86, N'watch2.jpg', 24)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (87, N'watch3.jpg', 24)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (88, N'watch4.jpg', 24)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (89, N'watch1.jpg', 25)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (90, N'watch2.jpg', 25)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (91, N'watch3.jpg', 25)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (92, N'watch4.jpg', 25)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (93, N'watch1.jpg', 26)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (94, N'watch2.jpg', 26)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (95, N'watch3.jpg', 26)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (96, N'watch4.jpg', 26)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (97, N'watch1.jpg', 27)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (98, N'watch2.jpg', 27)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (99, N'watch3.jpg', 27)
GO
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (100, N'watch4.jpg', 27)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (101, N'watch1.jpg', 28)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (102, N'watch2.jpg', 28)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (103, N'watch3.jpg', 28)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (104, N'watch4.jpg', 28)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (105, N'watch1.jpg', 29)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (106, N'watch2.jpg', 29)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (107, N'watch3.jpg', 29)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (108, N'watch4.jpg', 29)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (109, N'watch1.jpg', 30)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (110, N'watch2.jpg', 30)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (111, N'watch3.jpg', 30)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (112, N'watch4.jpg', 30)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (113, N'watch1.jpg', 31)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (114, N'watch2.jpg', 31)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (115, N'watch3.jpg', 31)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (116, N'watch4.jpg', 31)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (117, N'watch1.jpg', 32)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (118, N'watch2.jpg', 32)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (119, N'watch3.jpg', 32)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (120, N'watch4.jpg', 32)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (121, N'watch1.jpg', 33)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (122, N'watch2.jpg', 33)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (123, N'watch3.jpg', 33)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (124, N'watch4.jpg', 33)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (125, N'watch1.jpg', 34)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (126, N'watch2.jpg', 34)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (127, N'watch3.jpg', 34)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (128, N'watch4.jpg', 34)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (129, N'watch1.jpg', 35)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (130, N'watch2.jpg', 35)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (131, N'watch3.jpg', 35)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (132, N'watch4.jpg', 35)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (133, N'watch1.jpg', 36)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (134, N'watch2.jpg', 36)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (135, N'watch3.jpg', 36)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (136, N'watch4.jpg', 36)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (137, N'watch1.jpg', 37)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (138, N'watch2.jpg', 37)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (139, N'watch3.jpg', 37)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (140, N'watch4.jpg', 37)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (141, N'watch1.jpg', 38)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (142, N'watch2.jpg', 38)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (143, N'watch3.jpg', 38)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (144, N'watch4.jpg', 38)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (145, N'watch1.jpg', 39)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (146, N'watch2.jpg', 39)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (147, N'watch3.jpg', 39)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (148, N'watch4.jpg', 39)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (149, N'watch1.jpg', 40)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (150, N'watch2.jpg', 40)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (151, N'watch3.jpg', 40)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (152, N'watch4.jpg', 40)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (153, N'watch1.jpg', 41)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (154, N'watch2.jpg', 41)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (155, N'watch3.jpg', 41)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (156, N'watch4.jpg', 41)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (157, N'watch1.jpg', 42)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (158, N'watch2.jpg', 42)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (159, N'watch3.jpg', 42)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (160, N'watch4.jpg', 42)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (161, N'watch1.jpg', 43)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (162, N'watch2.jpg', 43)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (163, N'watch3.jpg', 43)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (164, N'watch4.jpg', 43)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (165, N'watch1.jpg', 44)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (166, N'watch2.jpg', 44)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (167, N'watch3.jpg', 44)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (168, N'watch4.jpg', 44)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (169, N'watch1.jpg', 45)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (170, N'watch2.jpg', 45)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (171, N'watch3.jpg', 45)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (172, N'watch4.jpg', 45)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (173, N'watch1.jpg', 46)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (174, N'watch2.jpg', 46)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (175, N'watch3.jpg', 46)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (176, N'watch4.jpg', 46)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (177, N'watch1.jpg', 47)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (178, N'watch2.jpg', 47)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (179, N'watch3.jpg', 47)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (180, N'watch4.jpg', 47)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (181, N'watch1.jpg', 48)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (182, N'watch2.jpg', 48)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (183, N'watch3.jpg', 48)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (184, N'watch4.jpg', 48)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (185, N'watch1.jpg', 49)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (186, N'watch2.jpg', 49)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (187, N'watch3.jpg', 49)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (188, N'watch4.jpg', 49)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (189, N'watch1.jpg', 50)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (190, N'watch2.jpg', 50)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (191, N'watch3.jpg', 50)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (192, N'watch4.jpg', 50)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (193, N'watch1.jpg', 51)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (194, N'watch2.jpg', 51)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (195, N'watch3.jpg', 51)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (196, N'watch4.jpg', 51)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (197, N'watch1.jpg', 52)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (198, N'watch2.jpg', 52)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (199, N'watch3.jpg', 52)
GO
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (200, N'watch4.jpg', 52)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (201, N'watch1.jpg', 53)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (202, N'watch2.jpg', 53)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (203, N'watch3.jpg', 53)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (204, N'watch4.jpg', 53)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 3, CAST(10000000 AS Decimal(18, 0)), CAST(9800000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 3, CAST(99000000 AS Decimal(18, 0)), CAST(9700000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 4, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 4, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 5, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 5, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 6, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 7, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 8, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 8, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 9, CAST(110000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 9, CAST(92000 AS Decimal(18, 0)), CAST(82000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 10, CAST(200000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 11, CAST(100000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 12, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 12, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 13, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 14, CAST(30000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 14, CAST(123456 AS Decimal(18, 0)), CAST(1234 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 15, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 15, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 16, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 17, CAST(60000 AS Decimal(18, 0)), CAST(21000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 17, CAST(10000 AS Decimal(18, 0)), CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 18, CAST(70000 AS Decimal(18, 0)), CAST(30000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 19, CAST(60000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 20, CAST(5000 AS Decimal(18, 0)), CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 20, CAST(1000 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 21, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 21, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 22, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 23, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 24, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 24, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 25, CAST(110000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 25, CAST(92000 AS Decimal(18, 0)), CAST(82000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 26, CAST(200000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 26, CAST(100000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 27, CAST(10000 AS Decimal(18, 0)), CAST(900 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 27, CAST(90500 AS Decimal(18, 0)), CAST(80500 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 28, CAST(100000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 29, CAST(30000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 29, CAST(123456 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 30, CAST(80000 AS Decimal(18, 0)), CAST(9000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 30, CAST(9000 AS Decimal(18, 0)), CAST(800 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 31, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 32, CAST(60000 AS Decimal(18, 0)), CAST(21000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 32, CAST(10000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 33, CAST(70000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 34, CAST(60000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 35, CAST(69900 AS Decimal(18, 0)), CAST(69000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 35, CAST(10020 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 36, CAST(1000 AS Decimal(18, 0)), CAST(900 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 37, CAST(10000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 38, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 39, CAST(10000 AS Decimal(18, 0)), CAST(9000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 39, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 40, CAST(92000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 41, CAST(200000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 42, CAST(100000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 43, CAST(10000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 44, CAST(901000 AS Decimal(18, 0)), CAST(801000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 45, CAST(20000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 46, CAST(30000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 46, CAST(111156 AS Decimal(18, 0)), CAST(11234 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 47, CAST(60000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 48, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 49, CAST(60000 AS Decimal(18, 0)), CAST(21000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 50, CAST(70000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 51, CAST(60000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 52, CAST(5000 AS Decimal(18, 0)), CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 53, CAST(100000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 53, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (1, N'Hàng có sẵn')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (2, N'Hàng đặt trước')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
SET IDENTITY_INSERT [dbo].[ProductUserImage] ON 

INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (1, N'watch1.jpg', 3)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (2, N'watch2.jpg', 3)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (3, N'watch3.jpg', 3)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (4, N'watch4.jpg', 3)
SET IDENTITY_INSERT [dbo].[ProductUserImage] OFF
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status]) VALUES (4, N'Shop Demo 01', N'0397974403', N'mail@gmail.com', N'Số 01 Lê Lợi', N'phuong_phuc_xa', N'quan_ba_dinh', N'thanh_pho_ha_noi', CAST(N'2022-04-13' AS Date), 12, 1, 1)
SET IDENTITY_INSERT [dbo].[Shop] OFF
SET IDENTITY_INSERT [dbo].[Social] ON 

INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (1, 1, N'fab fa-facebook-square', N'Facebook', N'https://www.facebook.com/', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (2, 1, N'fab fa-youtube-square', N'Youtube', N'https://www.youtube.com/', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (3, 1, N'fab fa-instagram-square', N'Instagram', N'https://www.instagram.com/', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (4, 1, N'fab fa-facebook-messenger', N'Messenger', N'', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (5, 2, N'fas fa-mobile-alt', N'Zalo: 0123456789', NULL, 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (6, 2, N'far fa-envelope', N'Mail: mail@gmail.com', NULL, 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (7, 2, N'fas fa-map-marker-alt', N'Số 365/39A Hậu Giang, Phường 11, Quận 06, TP.Hồ Chí Minh', N'https://goo.gl/maps/tnZ1983YvzTU4j6s6', 1)
SET IDENTITY_INSERT [dbo].[Social] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (1, N'Đồng hồ', 1)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (2, N'Quần', 1)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (3, N'Áo', 1)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (4, N'Điện thoại', 2)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (5, N'Laptop', 2)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (6, N'Giày', 1)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (7, N'Nón', 1)
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (8, N'Kính', 1)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (1, 1)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (1, 2)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (1, 3)
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status]) VALUES (1, N'usermail@gmail.com', N'Nguyễn Văn A', CAST(N'2022-04-13' AS Date), N'Số 02 Nguyễn Đình Chiểu', N'phuong_phuc_xa', N'quan_ba_dinh', N'thanh_pho_hanoi', N'0397974403', N'user', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Brand]  WITH CHECK ADD  CONSTRAINT [FK_Brand_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Brand] CHECK CONSTRAINT [FK_Brand_Category]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [FK_DiscountValue_DiscountType] FOREIGN KEY([DiscountTypeId])
REFERENCES [dbo].[DiscountType] ([DiscountTypeId])
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [FK_DiscountValue_DiscountType]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Discount] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([DiscountId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Discount]
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
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
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
ALTER TABLE [dbo].[ProductOption]  WITH CHECK ADD  CONSTRAINT [FK_ProductOption_Option] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Option] ([OptionId])
GO
ALTER TABLE [dbo].[ProductOption] CHECK CONSTRAINT [FK_ProductOption_Option]
GO
ALTER TABLE [dbo].[ProductOption]  WITH CHECK ADD  CONSTRAINT [FK_ProductOption_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductOption] CHECK CONSTRAINT [FK_ProductOption_Product]
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
ALTER TABLE [dbo].[RatingImage]  WITH CHECK ADD  CONSTRAINT [FK_RatingImage_Rate] FOREIGN KEY([RateId])
REFERENCES [dbo].[Rate] ([RateId])
GO
ALTER TABLE [dbo].[RatingImage] CHECK CONSTRAINT [FK_RatingImage_Rate]
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
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_RoleFunction] FOREIGN KEY([RoleFunctionId])
REFERENCES [dbo].[RoleFunction] ([RoleFunctionId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_RoleFunction]
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
