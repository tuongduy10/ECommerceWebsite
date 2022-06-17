USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 6/18/2022 2:37:07 AM ******/
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
USE [ECommerce]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[Bank]    Script Date: 6/18/2022 2:37:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 6/18/2022 2:37:07 AM ******/
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
	[DiscountId] [int] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[Configurations]    Script Date: 6/18/2022 2:37:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 6/18/2022 2:37:07 AM ******/
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Header]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[Option]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[OptionValue]    Script Date: 6/18/2022 2:37:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionValue](
	[OptionValueId] [int] IDENTITY(1,1) NOT NULL,
	[OptionValueName] [nvarchar](50) NULL,
	[OptionId] [int] NOT NULL,
 CONSTRAINT [PK_OptionValue] PRIMARY KEY CLUSTERED 
(
	[OptionValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/18/2022 2:37:07 AM ******/
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
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 6/18/2022 2:37:07 AM ******/
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
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[ProductImage]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[ProductOptionValue]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[ProductType]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[ProductUserImage]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[Rate]    Script Date: 6/18/2022 2:37:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[RateValue] [int] NULL,
	[Comment] [ntext] NULL,
	[UserId] [int] NULL,
	[ProductId] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RatingImage]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[Shop]    Script Date: 6/18/2022 2:37:07 AM ******/
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
	[DiscountId] [int] NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShopBank]    Script Date: 6/18/2022 2:37:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShopBrand]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[Social]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[SubCategory]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[SubCategoryAttribute]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[SubCategoryOption]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 6/18/2022 2:37:07 AM ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 6/18/2022 2:37:07 AM ******/
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
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (7, N'Xuất xử')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (8, N'Thời gian ra mắt')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (9, N'Camera sau')
INSERT [dbo].[Attribute] ([AttributeId], [AttributeName]) VALUES (10, N'Camera selfie')
SET IDENTITY_INSERT [dbo].[Attribute] OFF
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([BankId], [BankAccountNumber], [BankAccountName], [BankImage], [BankName], [Status]) VALUES (2, N'0123456789', N'NGUYEN VAN A', N'bidv.png', N'BIDV', NULL)
INSERT [dbo].[Bank] ([BankId], [BankAccountNumber], [BankAccountName], [BankImage], [BankName], [Status]) VALUES (3, N'0987654321', N'NGUYEN VAN B', N'sacombank.png', N'Sacombank', NULL)
SET IDENTITY_INSERT [dbo].[Bank] OFF
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([BannerId], [BannerPath], [Status]) VALUES (44, N'2d83236a-01eb-4195-ab86-a4b12af64f79.jpg', NULL)
INSERT [dbo].[Banner] ([BannerId], [BannerPath], [Status]) VALUES (48, N'a9c4f5ca-0786-468d-b51c-68f9b856569b.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Banner] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (1, 1, N'Giới thiệu về công ty', N'<p>PHONG C&Aacute;CH C&Ugrave;NG SWAROVSKI CRYSTAL FROST<br style="list-style-type: none;"><br style="list-style-type: none;">Swarovski Crystal Frost kh&ocirc;ng chỉ sở hữu vẻ đẹp nữ t&iacute;nh m&agrave; c&ograve;n mang đến sự trẻ trung hiếm c&oacute; qua những đường n&eacute;t ph&aacute; c&aacute;ch. Tạo t&aacute;c n&agrave;y ph&ocirc; diễn n&eacute;t đẹp của vi&ecirc;n đ&aacute; pha l&ecirc; với 178 tinh thể pha l&ecirc; được sắp xếp kh&eacute;o tr&ecirc;n v&agrave;nh bezel mang đến hiệu ứng như những b&ocirc;ng tuyết nổi bật tr&ecirc;n nền kim loại v&agrave;ng hồng.<br style="list-style-type: none;"><br style="list-style-type: none;">Trẻ trung, thời thượng v&agrave; ph&aacute; c&aacute;ch với mặt số đồng hồ l&agrave; bức tranh đầy biểu cảm. Tr&ecirc;n nền mặt số đen tuyền, c&ocirc; n&agrave;ng thi&ecirc;n nga khoe sắc tại vị tr&iacute; 12h v&agrave; chữ số Ả Rập mang đến sự vui nhộn, hoạt b&aacute;t hiếm c&oacute;.<br style="list-style-type: none;"><br style="list-style-type: none;">Ho&agrave;n thiện với d&acirc;y đồng hồ bằng lụa đen, Swarovski Crystal Frost mang đến phong c&aacute;ch thời trang thanh tho&aacute;t b&iacute; ẩn nhưng rất nữ t&iacute;nh cho c&ocirc; n&agrave;ng s&agrave;nh điệu.</p>', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (2, 1, N'Quy tắc đạo đức', N'<p><video controls="controls" width="300" height="150">
<source src="//cloud.video.taobao.com/play/u/443465738/p/1/e/6/t/1/351654664488.mp4" type="video/mp4"></video></p>', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (3, 1, N'Quyền riêng tư', N'<p style="text-align: center;"><video controls="controls" width="300" height="150">
<source src="//cloud.video.taobao.com/play/u/443465738/p/1/e/6/t/1/351654664488.mp4" type="video/mp4"></video></p>
<p style="text-align: center;">S?n ph?m cao c?p</p>', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (5, 2, N'Chính sách bảo hành', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (6, 2, N'Chính sách đổi trả', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (7, 2, N'Chính sách thanh toán', N'<h1>Chính sách thanh toán</h1>', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (8, 2, N'Chính sách giao hàng', N'test', 1)
INSERT [dbo].[Blog] ([BlogId], [BlogPosition], [BlogTitle], [BlogContent], [Status]) VALUES (9, 1, N'Sản phẩm của chúng tôi', N'<p><video controls="controls" width="300" height="150">
<source src="//cloud.video.taobao.com/play/u/443465738/p/1/e/6/t/1/351654664488.mp4" type="video/mp4"></video></p>', 1)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New], [DiscountId]) VALUES (1, N'Thế giới di động', N'337d23b7-f27e-4753-9291-257e4d9ea51a.png', 1, CAST(N'2022-10-04' AS Date), 1, 0, 0, 3)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New], [DiscountId]) VALUES (2, N'Brand Demo 02', N'gc.png', 1, CAST(N'2022-11-04' AS Date), 1, 1, 1, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New], [DiscountId]) VALUES (4, N'Peacebird', N'ded591fb-d3ba-40f7-91d4-22db2c82bfd5.png', 1, CAST(N'2022-11-04' AS Date), 2, 1, 1, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New], [DiscountId]) VALUES (7, N'E Brand 01', N'f8733a67-2441-482e-8768-b54970e3743d.png', 1, CAST(N'2022-11-04' AS Date), 2, 1, 1, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New], [DiscountId]) VALUES (8, N'a Thời trang', N'd622a3ff-19ce-4abc-9557-1359cba57882.jpg', 1, CAST(N'2022-11-05' AS Date), 1, 1, 1, 3)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New], [DiscountId]) VALUES (45, N'A Gucci', N'24b15e60-b8e1-404f-9f76-a728852551ea.png', 1, CAST(N'2022-06-16' AS Date), 1, 1, NULL, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New], [DiscountId]) VALUES (46, N'Apple', N'a7fba171-702b-4c22-b829-229b6c98b75d.png', 1, CAST(N'2022-06-18' AS Date), 2, 1, NULL, NULL)
INSERT [dbo].[Brand] ([BrandId], [BrandName], [BrandImagePath], [Status], [CreatedDate], [CategoryId], [Highlights], [New], [DiscountId]) VALUES (47, N'Samsung', N'25e0e092-e993-4b43-8d8d-d5272d50c989.png', 1, CAST(N'2022-06-18' AS Date), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Thời trang')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Công nghệ')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Configurations] ON 

INSERT [dbo].[Configurations] ([Id], [WebsiteName], [FaviconPath], [LogoPath], [StartTime], [EndTime], [PhoneNumber], [Mail], [Owner], [FacebookUrl], [Address], [AddressUrl]) VALUES (1, N'HIHICHI', N'0b12106b-3b18-4eae-a3d9-ae66e00ade7f.jpg', N'0b12106b-3b18-4eae-a3d9-ae66e00ade7f.jpg', CAST(N'08:30:00' AS Time), CAST(N'17:30:00' AS Time), N'0147852369', N'nguyenvana@gmail.com', N'Nguyễn Văn A', N'facebook.com/tngduy10', N'Số 365/39A Hậu Giang, Phường 11, Quận 06, TP.Hồ Chí Minh', N'https://goo.gl/maps/tnZ1983YvzTU4j6s6')
SET IDENTITY_INSERT [dbo].[Configurations] OFF
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([DiscountId], [DiscountValue], [DiscountCode], [DiscountStock], [StartDate], [EndDate], [Status], [isPercent], [forGlobal], [forShop], [forBrand]) VALUES (1, CAST(500000 AS Decimal(18, 0)), N'KHAITRUONG', 1000, CAST(N'2022-05-19 00:00:00.000' AS DateTime), CAST(N'2022-11-11 00:00:00.000' AS DateTime), 0, 0, 1, 0, 0)
INSERT [dbo].[Discount] ([DiscountId], [DiscountValue], [DiscountCode], [DiscountStock], [StartDate], [EndDate], [Status], [isPercent], [forGlobal], [forShop], [forBrand]) VALUES (2, CAST(30 AS Decimal(18, 0)), N'SHOPMOI', 10, CAST(N'2022-05-19 00:00:00.000' AS DateTime), CAST(N'2022-11-11 00:00:00.000' AS DateTime), 1, 1, 0, 1, 0)
INSERT [dbo].[Discount] ([DiscountId], [DiscountValue], [DiscountCode], [DiscountStock], [StartDate], [EndDate], [Status], [isPercent], [forGlobal], [forShop], [forBrand]) VALUES (3, CAST(500000 AS Decimal(18, 0)), N'THUONGHIEU', 10, CAST(N'2022-05-19 00:00:00.000' AS DateTime), CAST(N'2022-11-11 00:00:00.000' AS DateTime), 1, 0, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Discount] OFF
SET IDENTITY_INSERT [dbo].[Header] ON 

INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (1, 0, N'Trang chủ', N'/Home/Index', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (2, 1, N'Hot sale', N'/Product/ProductHotSale', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (3, 2, N'Sản phẩm mới', N'/Product/ProductNewest', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (4, 3, N'Thương hiệu', N'/Brand/AllBrands', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (5, 4, N'Thanh toán', N'/Home/Payment', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (6, 5, N'Hàng có sẵn', N'/Product/ProductAvaliable', 1)
INSERT [dbo].[Header] ([HeaderId], [HeaderPosition], [HeaderName], [HeaderUrl], [Status]) VALUES (7, 6, N'Hàng đặt trước', N'/Product/ProductPreOrder', 1)
SET IDENTITY_INSERT [dbo].[Header] OFF
SET IDENTITY_INSERT [dbo].[Option] ON 

INSERT [dbo].[Option] ([OptionId], [OptionName]) VALUES (1, N'Loại dây')
INSERT [dbo].[Option] ([OptionId], [OptionName]) VALUES (2, N'Kích thước')
INSERT [dbo].[Option] ([OptionId], [OptionName]) VALUES (3, N'Giới tính')
SET IDENTITY_INSERT [dbo].[Option] OFF
SET IDENTITY_INSERT [dbo].[OptionValue] ON 

INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId]) VALUES (1, N'Dây kim loại', 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId]) VALUES (2, N'Dây da', 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId]) VALUES (3, N'Dây dù', 1)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId]) VALUES (4, N'42', 2)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId]) VALUES (5, N'43', 2)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId]) VALUES (6, N'44', 2)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId]) VALUES (1005, N'Nam', 3)
INSERT [dbo].[OptionValue] ([OptionValueId], [OptionValueName], [OptionId]) VALUES (1006, N'Nữ', 3)
SET IDENTITY_INSERT [dbo].[OptionValue] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [CreatedDate], [Amount], [Temporary], [DiscountType], [DiscountValue], [DiscountCode], [Total], [Status], [UserId], [Address], [PhoneNumber], [Recipient], [PaymentMethodId]) VALUES (3, CAST(N'2022-05-19 22:19:00.000' AS DateTime), 1, CAST(90000 AS Decimal(18, 0)), NULL, NULL, NULL, CAST(90000 AS Decimal(18, 0)), 1, 5, N'S? 1 Lê L?i', N'0397974403', N'anh A', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [VerifiedDate], [Price], [PriceOnSell], [Amount], [Total], [AttributeValue], [OptionValue], [Status], [Paid], [PayForAdmin]) VALUES (1, 3, 24, NULL, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)), 1, CAST(90000 AS Decimal(18, 0)), NULL, N'Xanh, Nhựa', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 

INSERT [dbo].[PaymentMethod] ([PaymentMethodId], [PaymentMethod]) VALUES (1, N'COD')
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (3, N'Đồng hồ thông minh 01', NULL, CAST(N'2022-04-01' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí 1 năm', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (4, N'Sản phẩm 01', NULL, CAST(N'2022-04-02' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí 1 năm', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (5, N'Sản phẩm 02', 10, CAST(N'2022-04-03' AS Date), N'Mô tả', 20, 1, 1, 0, 0, 0, 0, N'Bảo hành miễn phí 1 năm', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (6, N'Sản phẩm 03', 10, CAST(N'2022-04-04' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 0, 1, N'Bảo hành miễn phí 1 năm', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (7, N'Sản phẩm 04', 10, CAST(N'2022-04-05' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí 1 năm', 3, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (8, N'Sản phẩm 05', NULL, CAST(N'2022-04-06' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (9, N'Sản phẩm 06', NULL, CAST(N'2022-04-07' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 0, 1, N'Bảo hành miễn phí', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (10, N'Sản phẩm 07', 10, CAST(N'2022-04-08' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 3, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (11, N'Sản phẩm 08', NULL, CAST(N'2022-04-09' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (12, N'Sản phẩm 09', NULL, CAST(N'2022-04-10' AS Date), N'Mô tả', 20, 1, 1, 1, 0, 1, 0, N'Bảo hành miễn phí', 3, 4, 1, CAST(N'2022-04-18' AS Date), 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (13, N'Sản phẩm 10', 10, CAST(N'2022-04-11' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 0, N'Bảo hành miễn phí', 3, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (14, N'Sản phẩm 11', NULL, CAST(N'2022-04-11' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 1, 1, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (15, N'Sản phẩm 12', 10, CAST(N'2022-04-12' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 1, 1, N'Bảo hành miễn phí', 2, 4, 1, CAST(N'2022-04-18' AS Date), 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (16, N'Sản phẩm 13', NULL, CAST(N'2022-04-14' AS Date), N'Mô tả', 20, 1, 1, 1, 0, 0, 0, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (17, N'Sản phẩm 14', NULL, CAST(N'2022-04-15' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 2, 4, 1, CAST(N'2022-04-18' AS Date), 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (18, N'Sản phẩm 15', 10, CAST(N'2022-04-16' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 0, 1, N'Bảo hành miễn phí', 2, 4, 1, CAST(N'2022-04-18' AS Date), 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (19, N'Sản phẩm 16', NULL, CAST(N'2022-04-17' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 0, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (20, N'Sản phẩm 17', 10, CAST(N'2022-04-18' AS Date), N'Mô tả', 20, 1, 1, 0, 0, 1, 1, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (21, N'Sản phẩm 18', NULL, CAST(N'2022-04-19' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 0, 1, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (22, N'Sản phẩm 19', 10, CAST(N'2022-04-20' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 1, 1, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (23, N'Sản phẩm 20', NULL, CAST(N'2022-04-21' AS Date), N'Mô tả', 20, 1, 1, 1, 0, 1, 1, N'Bảo hành miễn phí', 2, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (24, N'Sản phẩm 21', 10, CAST(N'2022-04-22' AS Date), N'<p>PHONG C&Aacute;CH C&Ugrave;NG SWAROVSKI CRYSTAL FROST<br style="list-style-type: none;"><br style="list-style-type: none;">Swarovski Crystal Frost kh&ocirc;ng chỉ sở hữu vẻ đẹp nữ t&iacute;nh m&agrave; c&ograve;n mang đến sự trẻ trung hiếm c&oacute; qua những đường n&eacute;t ph&aacute; c&aacute;ch. Tạo t&aacute;c n&agrave;y ph&ocirc; diễn n&eacute;t đẹp của vi&ecirc;n đ&aacute; pha l&ecirc; với 178 tinh thể pha l&ecirc; được sắp xếp kh&eacute;o tr&ecirc;n v&agrave;nh bezel mang đến hiệu ứng như những b&ocirc;ng tuyết nổi bật tr&ecirc;n nền kim loại v&agrave;ng hồng.<br style="list-style-type: none;"><br style="list-style-type: none;">Trẻ trung, thời thượng v&agrave; ph&aacute; c&aacute;ch với mặt số đồng hồ l&agrave; bức tranh đầy biểu cảm. Tr&ecirc;n nền mặt số đen tuyền, c&ocirc; n&agrave;ng thi&ecirc;n nga khoe sắc tại vị tr&iacute; 12h v&agrave; chữ số Ả Rập mang đến sự vui nhộn, hoạt b&aacute;t hiếm c&oacute;.<br style="list-style-type: none;"><br style="list-style-type: none;">Ho&agrave;n thiện với d&acirc;y đồng hồ bằng lụa đen, Swarovski Crystal Frost mang đến phong c&aacute;ch thời trang thanh tho&aacute;t b&iacute; ẩn nhưng rất nữ t&iacute;nh cho c&ocirc; n&agrave;ng s&agrave;nh điệu.</p>', 20, 1, 1, 0, 0, 1, 0, N'Bảo hành miễn phí', 1, 4, 8, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (25, N'Sản phẩm 22', 10, CAST(N'2022-04-23' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 0, 1, N'Bảo hành miễn phí', 1, 4, 8, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (26, N'Sản phẩm 23', NULL, CAST(N'2022-04-24' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 1, 1, N'Bảo hành miễn phí', 1, 4, 8, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (27, N'Sản phẩm 24', 10, CAST(N'2022-04-25' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 1, 4, 8, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (28, N'Sản phẩm 25', 10, CAST(N'2022-04-26' AS Date), N'Mô tả', 20, 1, 0, 1, 0, 0, 1, N'Bảo hành miễn phí', 1, 4, 8, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (29, N'Sản phẩm 26', NULL, CAST(N'2022-04-27' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 1, 4, 8, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (30, N'Sản phẩm 27', 10, CAST(N'2022-04-28' AS Date), N'Mô tả', 20, 1, 0, 0, 0, 1, 1, N'Bảo hành miễn phí', 1, 4, 8, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (31, N'Sản phẩm 28', 10, CAST(N'2022-04-29' AS Date), N'Mô tả', 20, 1, 0, 0, 1, 0, 1, N'Bảo hành miễn phí', 1, 4, 8, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (32, N'Sản phẩm 29', NULL, CAST(N'2022-04-30' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 1, 4, 8, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (33, N'Sản phẩm 30', 10, CAST(N'2022-05-01' AS Date), N'Mô tả', 20, 1, 0, 1, 0, 1, 0, N'Bảo hành miễn phí', 1, 4, 8, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (34, N'Sản phẩm 31', 10, CAST(N'2022-05-02' AS Date), N'Mô tả', 20, 1, 1, 1, 0, 0, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (35, N'Sản phẩm 32', NULL, CAST(N'2022-05-03' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (36, N'Sản phẩm 33', 10, CAST(N'2022-05-04' AS Date), N'Mô tả', 20, 1, 1, 0, 0, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (37, N'Sản phẩm 34', NULL, CAST(N'2022-05-05' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (38, N'Sản phẩm 35', 10, CAST(N'2022-05-06' AS Date), N'Mô tả', 20, 1, 0, 1, 1, 0, 0, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (39, N'Sản phẩm 36', NULL, CAST(N'2022-05-07' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 0, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (40, N'Sản phẩm 37', 10, CAST(N'2022-05-08' AS Date), N'Mô tả', 20, 1, 1, 0, 0, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (41, N'Sản phẩm 38', NULL, CAST(N'2022-05-09' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (42, N'Sản phẩm 39', 10, CAST(N'2022-05-10' AS Date), N'Mô tả', 20, 1, 0, 0, 0, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (43, N'Sản phẩm 40', NULL, CAST(N'2022-05-11' AS Date), N'Mô tả', 20, 1, 1, 1, 0, 1, 1, N'Bảo hành miễn phí', 6, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (44, N'Sản phẩm 41', NULL, CAST(N'2022-05-12' AS Date), N'Mô tả', 20, 1, 0, 0, 1, 1, 0, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (45, N'Sản phẩm 42', NULL, CAST(N'2022-05-13' AS Date), N'Mô tả', 20, 1, 1, 1, 0, 1, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (46, N'Sản phẩm 43', NULL, CAST(N'2022-05-14' AS Date), N'Mô tả', 20, 1, 1, 0, 1, 0, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (47, N'Sản phẩm 44', NULL, CAST(N'2022-05-15' AS Date), N'Mô tả', 20, 1, 0, 1, 0, 1, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (48, N'Sản phẩm 45', NULL, CAST(N'2022-05-16' AS Date), N'Mô tả', 20, 1, 1, 1, 1, 1, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (49, N'Sản phẩm 46', 10, CAST(N'2022-05-17' AS Date), N'Mô tả', 20, 1, 0, 1, 0, 0, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (50, N'Sản phẩm 47', NULL, CAST(N'2022-05-18' AS Date), N'Mô tả', 20, 1, 0, 0, 1, 1, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (51, N'Sản phẩm 48', NULL, CAST(N'2022-05-19' AS Date), N'Mô tả', 20, 1, 0, 1, 1, 0, 0, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (52, N'Sản phẩm 49', 10, CAST(N'2022-05-20' AS Date), N'Mô tả', 20, 1, 0, 0, 1, 1, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (53, N'Sản phẩm 50', NULL, CAST(N'2022-05-21' AS Date), N'Mô tả', 20, 1, 0, 0, 1, 1, 1, N'Bảo hành miễn phí', 7, 4, 1, NULL, 4, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [DiscountPercent], [ProductAddedDate], [ProductDescription], [ProductStock], [Status], [New], [Highlights], [FreeDelivery], [FreeReturn], [Legit], [Insurance], [SubCategoryId], [ShopId], [BrandId], [ProductImportDate], [ProductRate], [Note]) VALUES (54, N'Sản phẩm SIS 1', NULL, CAST(N'2022-06-11' AS Date), N'<p>M&ocirc; tả</p>', 1, 1, 0, NULL, 1, 0, 1, N'Bảo hành 5 năm', 1, 8, 8, NULL, NULL, N'Admin''s note')
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (24, 1, N'6gb')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (24, 2, N'128gb')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (24, 3, N'6.7", Super Retina XDR, OLED, 2778 x 1284 Pixel')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (24, 4, N'Apple GPU 4 nhân')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (24, 5, N'3687 mAh')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (24, 6, N'iOS 14')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (24, 7, N'Trung Quốc')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (24, 8, N'10/2020')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (24, 9, N'12.0 MP + 12.0 MP + 12.0 MP')
INSERT [dbo].[ProductAttribute] ([ProductId], [AttributeId], [Value]) VALUES (24, 10, N'12.0 MP')
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (1, N'jacket1.jpg', 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (2, N'jacket2.jpg', 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (3, N'jacket3.jpg', 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (4, N'jacket4.jpg', 3)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (5, N'jacket1.jpg', 4)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (6, N'jacket2.jpg', 4)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (7, N'jacket3.jpg', 4)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (8, N'jacket4.jpg', 4)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (9, N'jacket1.jpg', 5)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (10, N'jacket2.jpg', 5)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (11, N'jacket3.jpg', 5)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (12, N'jacket4.jpg', 5)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (13, N'jacket1.jpg', 6)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (14, N'jacket2.jpg', 6)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (15, N'jacket3.jpg', 6)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (16, N'jacket4.jpg', 6)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (17, N'jacket1.jpg', 7)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (18, N'jacket2.jpg', 7)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (19, N'jacket3.jpg', 7)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (20, N'jacket4.jpg', 7)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (21, N'jacket1.jpg', 8)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (22, N'jacket2.jpg', 8)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (23, N'jacket3.jpg', 8)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (24, N'jacket4.jpg', 8)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (25, N'jacket1.jpg', 9)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (26, N'jacket2.jpg', 9)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (27, N'jacket3.jpg', 9)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (28, N'jacket4.jpg', 9)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (29, N'jacket1.jpg', 10)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (30, N'jacket2.jpg', 10)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (31, N'jacket3.jpg', 10)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (32, N'jacket4.jpg', 10)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (33, N'jacket1.jpg', 11)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (34, N'jacket2.jpg', 11)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (35, N'jacket3.jpg', 11)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (36, N'jacket4.jpg', 11)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (37, N'jacket1.jpg', 12)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (38, N'jacket2.jpg', 12)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (39, N'jacket3.jpg', 12)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (40, N'jacket4.jpg', 12)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (41, N'jacket1.jpg', 13)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (42, N'jacket2.jpg', 13)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (43, N'jacket3.jpg', 13)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (44, N'jacket4.jpg', 13)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (45, N'pants1.jpg', 14)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (46, N'pants2.jpg', 14)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (47, N'pants3.jpg', 14)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (48, N'pants4.jpg', 14)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (49, N'pants1.jpg', 15)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (50, N'pants2.jpg', 15)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (51, N'pants3.jpg', 15)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (52, N'pants4.jpg', 15)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (53, N'pants1.jpg', 16)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (54, N'pants2.jpg', 16)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (55, N'pants3.jpg', 16)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (56, N'pants4.jpg', 16)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (57, N'pants1.jpg', 17)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (58, N'pants2.jpg', 17)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (59, N'pants3.jpg', 17)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (60, N'pants4.jpg', 17)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (61, N'pants1.jpg', 18)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (62, N'pants2.jpg', 18)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (63, N'pants3.jpg', 18)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (64, N'pants4.jpg', 18)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (65, N'pants1.jpg', 19)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (66, N'pants2.jpg', 19)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (67, N'pants3.jpg', 19)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (68, N'pants4.jpg', 19)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (69, N'pants1.jpg', 20)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (70, N'pants2.jpg', 20)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (71, N'pants3.jpg', 20)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (72, N'pants4.jpg', 20)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (73, N'pants1.jpg', 21)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (74, N'pants2.jpg', 21)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (75, N'pants3.jpg', 21)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (76, N'pants4.jpg', 21)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (77, N'pants1.jpg', 22)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (78, N'pants2.jpg', 22)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (79, N'pants3.jpg', 22)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (80, N'pants4.jpg', 22)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (81, N'pants1.jpg', 23)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (82, N'pants2.jpg', 23)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (83, N'pants3.jpg', 23)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (84, N'pants4.jpg', 23)
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
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (125, N'giay.jpg', 34)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (126, N'watch2.jpg', 34)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (127, N'watch3.jpg', 34)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (128, N'watch4.jpg', 34)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (129, N'giay.jpg', 35)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (130, N'watch2.jpg', 35)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (131, N'watch3.jpg', 35)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (132, N'watch4.jpg', 35)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (133, N'giay.jpg', 36)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (134, N'watch2.jpg', 36)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (135, N'watch3.jpg', 36)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (136, N'watch4.jpg', 36)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (137, N'giay.jpg', 37)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (138, N'watch2.jpg', 37)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (139, N'watch3.jpg', 37)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (140, N'watch4.jpg', 37)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (141, N'giay.jpg', 38)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (142, N'watch2.jpg', 38)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (143, N'watch3.jpg', 38)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (144, N'watch4.jpg', 38)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (145, N'giay.jpg', 39)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (146, N'watch2.jpg', 39)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (147, N'watch3.jpg', 39)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (148, N'watch4.jpg', 39)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (149, N'giay.jpg', 40)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (150, N'watch2.jpg', 40)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (151, N'watch3.jpg', 40)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (152, N'watch4.jpg', 40)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (153, N'giay.jpg', 41)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (154, N'watch2.jpg', 41)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (155, N'watch3.jpg', 41)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (156, N'watch4.jpg', 41)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (157, N'giay.jpg', 42)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (158, N'watch2.jpg', 42)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (159, N'watch3.jpg', 42)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (160, N'watch4.jpg', 42)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (161, N'giay.jpg', 43)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (162, N'watch2.jpg', 43)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (163, N'watch3.jpg', 43)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (164, N'watch4.jpg', 43)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (165, N'non1.jpg', 44)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (166, N'watch2.jpg', 44)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (167, N'watch3.jpg', 44)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (168, N'watch4.jpg', 44)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (169, N'non1.jpg', 45)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (170, N'watch2.jpg', 45)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (171, N'watch3.jpg', 45)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (172, N'watch4.jpg', 45)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (173, N'non1.jpg', 46)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (174, N'watch2.jpg', 46)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (175, N'watch3.jpg', 46)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (176, N'watch4.jpg', 46)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (177, N'non1.jpg', 47)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (178, N'watch2.jpg', 47)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (179, N'watch3.jpg', 47)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (180, N'watch4.jpg', 47)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (181, N'non1.jpg', 48)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (182, N'watch2.jpg', 48)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (183, N'watch3.jpg', 48)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (184, N'watch4.jpg', 48)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (185, N'non1.jpg', 49)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (186, N'watch2.jpg', 49)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (187, N'watch3.jpg', 49)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (188, N'watch4.jpg', 49)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (189, N'non1.jpg', 50)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (190, N'watch2.jpg', 50)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (191, N'watch3.jpg', 50)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (192, N'watch4.jpg', 50)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (193, N'non1.jpg', 51)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (194, N'watch2.jpg', 51)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (195, N'watch3.jpg', 51)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (196, N'watch4.jpg', 51)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (197, N'non1.jpg', 52)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (198, N'watch2.jpg', 52)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (199, N'watch3.jpg', 52)
GO
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (200, N'watch4.jpg', 52)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (201, N'non1.jpg', 53)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (202, N'watch2.jpg', 53)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (203, N'watch3.jpg', 53)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (204, N'watch4.jpg', 53)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (205, N'non1.jpg', 53)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (206, N'29dbda91-7839-4934-81f4-cfa94f50391d.jpg', 54)
INSERT [dbo].[ProductImage] ([ProductImageId], [ProductImagePath], [ProductId]) VALUES (207, N'81b2c55b-791d-4b00-8466-cf3cd6e2d8da.jpg', 54)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (24, 1)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (24, 2)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (24, 4)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (24, 5)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (25, 3)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (25, 4)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (54, 1)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (54, 4)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (54, 1005)
INSERT [dbo].[ProductOptionValue] ([ProductId], [OptionValueId]) VALUES (54, 1006)
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
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 14, CAST(1234 AS Decimal(18, 0)), CAST(123456 AS Decimal(18, 0)))
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
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (1, 54, CAST(100000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([ProductTypeId], [ProductId], [Price], [PriceOnSell]) VALUES (2, 54, CAST(90000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (1, N'Hàng có sẵn')
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName]) VALUES (2, N'Hàng đặt trước')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
SET IDENTITY_INSERT [dbo].[ProductUserImage] ON 

INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (1, N'watch1.jpg', 24)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (2, N'watch2.jpg', 24)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (3, N'watch3.jpg', 24)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (4, N'watch4.jpg', 24)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (5, N'pants1.jpg', 24)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (6, N'pants2.jpg', 24)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (7, N'pants3.jpg', 24)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (8, N'pants4.jpg', 24)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (9, N'91cef8f2-72fb-4e55-a8eb-be8441f3b049.jpg', 54)
INSERT [dbo].[ProductUserImage] ([ProductUserImageId], [ProductUserImagePath], [ProductId]) VALUES (10, N'bc1616cb-c56d-43dc-a431-ae499ff6f0e6.jpg', 54)
SET IDENTITY_INSERT [dbo].[ProductUserImage] OFF
SET IDENTITY_INSERT [dbo].[Rate] ON 

INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [UserId], [ProductId], [CreateDate]) VALUES (2, 4, N'Sản phẩm tốt', 5, 24, CAST(N'2022-05-19 22:19:00.000' AS DateTime))
INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [UserId], [ProductId], [CreateDate]) VALUES (4, 5, N'Chất lượng và uy tính', 8, 24, CAST(N'2022-05-10 17:20:00.000' AS DateTime))
INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [UserId], [ProductId], [CreateDate]) VALUES (5, 4, N'Giao hàng nhanh', 9, 24, CAST(N'2022-05-20 09:10:00.000' AS DateTime))
INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [UserId], [ProductId], [CreateDate]) VALUES (6, 5, N'Hàng chất lượng', 10, 24, CAST(N'2022-05-22 22:19:00.000' AS DateTime))
INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [UserId], [ProductId], [CreateDate]) VALUES (8, 5, N'Mãu mã đẹp', 5, 24, CAST(N'2022-05-20 00:27:41.637' AS DateTime))
INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [UserId], [ProductId], [CreateDate]) VALUES (9, 5, N'Mẫu mã đẹp', 5, 24, CAST(N'2022-05-20 00:33:27.817' AS DateTime))
INSERT [dbo].[Rate] ([RateId], [RateValue], [Comment], [UserId], [ProductId], [CreateDate]) VALUES (10, 5, N'Đã mua sản phẩm này và rất hài lòng về chất lượng', 5, 24, CAST(N'2022-05-20 00:52:25.953' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rate] OFF
SET IDENTITY_INSERT [dbo].[RatingImage] ON 

INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (2, N'jacket1.jpg', 2)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (3, N'jacket2.jpg', 2)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (4, N'jacket3.jpg', 2)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (5, N'jacket4.jpg', 4)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (6, N'watch1.jpg', 5)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (7, N'watch2.jpg', 5)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (8, N'watch3.jpg', 6)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (9, N'watch4.jpg', 6)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (13, N'015574b6-6545-4f7b-bb01-daa22c3bd0e2.jpg', 8)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (14, N'f01ef0d4-5bdc-4f55-8815-b98f021f5f52.jpg', 8)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (15, N'04900989-6ef0-4626-8117-67a0b4de52b2.jpg', 9)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (16, N'ee85a0bd-1021-4716-9580-b2430f1abb55.jpg', 9)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (17, N'4782b3ac-dcb3-434e-9b83-0330a6e720a2.jpg', 10)
INSERT [dbo].[RatingImage] ([RatingImageId], [RatingImagePath], [RateId]) VALUES (18, N'4a2aec50-17de-4303-9782-0ebef65c0f48.jpg', 10)
SET IDENTITY_INSERT [dbo].[RatingImage] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Seller')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Buyer')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (4, N'Shop Demo 01', N'0397974403', N'mail@gmail.com', N'Số 01 Lê Lợi', N'phuong_phuc_xa', N'quan_ba_dinh', N'thanh_pho_ha_noi', CAST(N'2022-04-13' AS Date), 12, 4, 1, 2)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopPhoneNumber], [ShopMail], [ShopAddress], [ShopWardCode], [ShopDistrictCode], [ShopCityCode], [ShopJoinDate], [Tax], [UserId], [Status], [DiscountId]) VALUES (8, N'Shop Admin', N'0906035526', N'mail@gmail.com', N'Số 10 Lê Lợi', N'phuong_phuc_xa', N'quan_ba_dinh', N'thanh_pho_ha_noi', CAST(N'2000-10-10' AS Date), 0, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Shop] OFF
SET IDENTITY_INSERT [dbo].[ShopBank] ON 

INSERT [dbo].[ShopBank] ([ShopBankId], [ShopBankName], [ShopAccountName], [ShopAccountNumber], [ShopId]) VALUES (1, N'ACB', N'NGUYEN VAN A', N'852369741', 4)
SET IDENTITY_INSERT [dbo].[ShopBank] OFF
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (4, 1)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (4, 2)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (4, 4)
INSERT [dbo].[ShopBrand] ([ShopId], [BrandId]) VALUES (4, 7)
SET IDENTITY_INSERT [dbo].[Social] ON 

INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (1, 1, N'fab fa-facebook-square', N'Facebook', N'https://www.facebook.com/', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (2, 1, N'fab fa-youtube-square', N'Youtube', N'https://www.youtube.com/', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (3, 1, N'fab fa-instagram-square', N'Instagram', N'https://www.instagram.com/', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (4, 1, N'fab fa-facebook-messenger', N'Messenger', N'https://www.facebook.com/', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (5, 2, N'fas fa-mobile-alt', N'Zalo:', N'012345678', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (6, 2, N'far fa-envelope', N'Mail:', N'mail@gmail.com', 1)
INSERT [dbo].[Social] ([SocialId], [Position], [Icon], [SocialName], [SocialUrl], [Status]) VALUES (7, 2, N'fas fa-map-marker-alt', N'Số 365/39A Hậu Giang, Phường 11, Quận 06, TP.Hồ Chí Minh', N'https://goo.gl/maps/tnZ1983YvzTU4j6s6', 0)
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
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (1, 4)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (1, 5)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (2, 4)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (2, 5)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (3, 4)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (3, 5)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (4, 4)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (4, 5)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (5, 4)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (5, 5)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (6, 4)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (6, 5)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (7, 4)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (7, 5)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (8, 4)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (8, 5)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (9, 4)
INSERT [dbo].[SubCategoryAttribute] ([AttributeId], [SubCategoryId]) VALUES (9, 5)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (1, 1)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (1, 2)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (1, 3)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (4, 1)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (4, 2)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (4, 3)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (5, 1)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (5, 2)
INSERT [dbo].[SubCategoryOption] ([SubCategoryId], [OptionId]) VALUES (5, 3)
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status]) VALUES (1, N'admin@gmail.com', N'Admin', CAST(N'2022-04-13' AS Date), N'Số 01 Lê Lợi', N'phuong_phuc_tan', N'quan_hoan_kiem', N'thanh_pho_ha_noi', N'0906035526', N'admin', 1)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status]) VALUES (4, N'seller@gmail.com', N'Seller', CAST(N'2022-05-02' AS Date), N'Số 02 Lê Lợi', N'phuong_nhat_tan', N'quan_tay_ho', N'thanh_pho_ha_noi', N'0397974402', N'seller', 1)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status]) VALUES (5, N'user@gmail.com', N'New User 03', CAST(N'2022-05-02' AS Date), N'Số 03 Lê Lợi', N'phuong_da_kao', N'quan_1', N'thanh_pho_ho_chi_minh', N'0397974400', N'new', 1)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status]) VALUES (8, N'newmail@gmail.com', N'New User 04', CAST(N'2022-05-02' AS Date), N'Số 02 Lê Lợi', N'xa_nam_cao', N'huyen_bao_lam', N'tinh_cao_bang', N'0397974404', N'user', 1)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status]) VALUES (9, N'mail04@gmail.com', N'New User 05', CAST(N'2022-05-02' AS Date), N'Số 01 Lê Lợi', N'xa_tan_long', N'huyen_yen_son', N'tinh_tuyen_quang', N'0397974405', N'user', 1)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status]) VALUES (10, N'mail06@gmail.com', N'New User 06', CAST(N'2022-05-02' AS Date), N'Số 01 Lê Lợi', N'xa_lung_vai', N'huyen_muong_khuong', N'tinh_lao_cai', N'0397974406', N'user', 1)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status]) VALUES (14, N'mail07@gmail.com', N'New User 07', CAST(N'2022-05-02' AS Date), N'Số 07 Lê Lợi', N'xa_lung_vai', N'huyen_muong_khuong', N'tinh_lao_cai', N'0397974407', N'user', 1)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status]) VALUES (15, N'mail08@gmail.com', N'New User 08', CAST(N'2022-05-02' AS Date), N'Số 08 Lê Lợi', N'xa_nam_cao', N'huyen_bao_lam', N'tinh_cao_bang', N'0397974408', N'user', 1)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status]) VALUES (16, N'mail09@gmail.com', N'New User 09', CAST(N'2022-05-02' AS Date), N'Số 09 Lê Lợi', N'xa_nam_cao', N'huyen_bao_lam', N'tinh_cao_bang', N'0397974409', N'user', 1)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status]) VALUES (17, N'mail10@gmail.com', N'New User 10', CAST(N'2022-05-02' AS Date), N'Số 10 Lê Lợi', N'phuong_da_kao', N'quan_1', N'thanh_pho_ho_chi_minh', N'0397974410', N'user', 1)
INSERT [dbo].[User] ([UserId], [UserMail], [UserFullName], [UserJoinDate], [UserAddress], [UserWardCode], [UserDistrictCode], [UserCityCode], [UserPhone], [Password], [Status]) VALUES (18, N'mail11@gmail.com', N'New User 11', CAST(N'2022-05-02' AS Date), N'Số 11 Lê Lợi', N'phuong_nhat_tan', N'quan_tay_ho', N'thanh_pho_ha_noi', N'0397974411', N'user', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (4, 2)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (4, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (5, 3)
ALTER TABLE [dbo].[Brand]  WITH CHECK ADD  CONSTRAINT [FK_Brand_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Brand] CHECK CONSTRAINT [FK_Brand_Category]
GO
ALTER TABLE [dbo].[Brand]  WITH CHECK ADD  CONSTRAINT [FK_Brand_Discount] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([DiscountId])
GO
ALTER TABLE [dbo].[Brand] CHECK CONSTRAINT [FK_Brand_Discount]
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
