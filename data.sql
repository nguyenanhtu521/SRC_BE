USE [master]
GO
/****** Object:  Database [SRC_Travel]    Script Date: 12/3/2023 8:59:36 AM ******/
CREATE DATABASE [SRC_Travel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SRC_Travel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SRC_Travel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SRC_Travel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SRC_Travel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SRC_Travel] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SRC_Travel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SRC_Travel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SRC_Travel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SRC_Travel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SRC_Travel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SRC_Travel] SET ARITHABORT OFF 
GO
ALTER DATABASE [SRC_Travel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SRC_Travel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SRC_Travel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SRC_Travel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SRC_Travel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SRC_Travel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SRC_Travel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SRC_Travel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SRC_Travel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SRC_Travel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SRC_Travel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SRC_Travel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SRC_Travel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SRC_Travel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SRC_Travel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SRC_Travel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SRC_Travel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SRC_Travel] SET RECOVERY FULL 
GO
ALTER DATABASE [SRC_Travel] SET  MULTI_USER 
GO
ALTER DATABASE [SRC_Travel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SRC_Travel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SRC_Travel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SRC_Travel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SRC_Travel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SRC_Travel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SRC_Travel', N'ON'
GO
ALTER DATABASE [SRC_Travel] SET QUERY_STORE = ON
GO
ALTER DATABASE [SRC_Travel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SRC_Travel]
GO
/****** Object:  User [src]    Script Date: 12/3/2023 8:59:40 AM ******/
CREATE USER [src] FOR LOGIN [src] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/3/2023 8:59:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgeRanges]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgeRanges](
	[AgeRangeID] [int] IDENTITY(1,1) NOT NULL,
	[AgeRangeStart] [int] NOT NULL,
	[AgeRangeEnd] [int] NOT NULL,
	[ChargePercent] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_AgeRanges] PRIMARY KEY CLUSTERED 
(
	[AgeRangeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[EmployeeCode] [nvarchar](max) NULL,
	[TicketCounterID] [int] NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Age] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[Qualification] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[StartStopID] [int] NOT NULL,
	[EndStopID] [int] NOT NULL,
	[BusID] [int] NOT NULL,
	[SeatNumber] [nvarchar](max) NOT NULL,
	[BookingDateTime] [datetime2](7) NOT NULL,
	[DepartureTime] [datetime2](7) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [nvarchar](450) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingsHistories]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingsHistories](
	[BookingHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[CancelDateTime] [datetime2](7) NOT NULL,
	[CancellationReason] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_BookingsHistories] PRIMARY KEY CLUSTERED 
(
	[BookingHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[BusID] [int] IDENTITY(1,1) NOT NULL,
	[BusNumber] [nvarchar](max) NOT NULL,
	[BusTypeID] [int] NOT NULL,
	[RouteID] [int] NOT NULL,
	[IntendTime] [nvarchar](max) NOT NULL,
	[SeatCount] [int] NOT NULL,
	[AvailableSeats] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DepartureTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Buses] PRIMARY KEY CLUSTERED 
(
	[BusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusStops]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusStops](
	[BusStopID] [int] IDENTITY(1,1) NOT NULL,
	[BusStopName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_BusStops] PRIMARY KEY CLUSTERED 
(
	[BusStopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusTypes]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusTypes](
	[BusTypeID] [int] IDENTITY(1,1) NOT NULL,
	[BusTypeName] [nvarchar](max) NOT NULL,
	[BasePrice] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_BusTypes] PRIMARY KEY CLUSTERED 
(
	[BusTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[AgeRangeID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceLists]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceLists](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[BusTypeID] [int] NOT NULL,
	[Distance] [int] NOT NULL,
	[AgeRangeID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_PriceLists] PRIMARY KEY CLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[RouteName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteStops]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteStops](
	[RouteStopID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[BusStopID] [int] NOT NULL,
	[StopOrder] [int] NOT NULL,
	[Distance] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_RouteStops] PRIMARY KEY CLUSTERED 
(
	[RouteStopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketCounters]    Script Date: 12/3/2023 8:59:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketCounters](
	[TicketCounterID] [int] IDENTITY(1,1) NOT NULL,
	[TicketCounterName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_TicketCounters] PRIMARY KEY CLUSTERED 
(
	[TicketCounterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231124093221_initial', N'7.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231130000109_V1', N'7.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231130001525_V2', N'7.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231201033924_V3', N'7.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231201041038_V4', N'7.0.10')
GO
SET IDENTITY_INSERT [dbo].[AgeRanges] ON 

INSERT [dbo].[AgeRanges] ([AgeRangeID], [AgeRangeStart], [AgeRangeEnd], [ChargePercent], [Description], [CreatedAt], [ModifiedAt]) VALUES (1, 0, 5, CAST(0.00 AS Decimal(18, 2)), N'Free for ages 0 -6', CAST(N'2023-11-25T11:15:30.2119929' AS DateTime2), CAST(N'2023-11-25T11:15:30.2218858' AS DateTime2))
INSERT [dbo].[AgeRanges] ([AgeRangeID], [AgeRangeStart], [AgeRangeEnd], [ChargePercent], [Description], [CreatedAt], [ModifiedAt]) VALUES (2, 6, 12, CAST(0.50 AS Decimal(18, 2)), N'50% discount for ages 7 - 12', CAST(N'2023-11-25T11:16:44.8231097' AS DateTime2), CAST(N'2023-11-25T11:16:44.8231618' AS DateTime2))
INSERT [dbo].[AgeRanges] ([AgeRangeID], [AgeRangeStart], [AgeRangeEnd], [ChargePercent], [Description], [CreatedAt], [ModifiedAt]) VALUES (3, 13, 50, CAST(1.00 AS Decimal(18, 2)), N'Listed price', CAST(N'2023-11-25T11:17:19.9487940' AS DateTime2), NULL)
INSERT [dbo].[AgeRanges] ([AgeRangeID], [AgeRangeStart], [AgeRangeEnd], [ChargePercent], [Description], [CreatedAt], [ModifiedAt]) VALUES (4, 51, 150, CAST(0.70 AS Decimal(18, 2)), N'30% discount for ages over 50 ', CAST(N'2023-11-25T11:18:42.7059899' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[AgeRanges] OFF
GO
SET IDENTITY_INSERT [dbo].[Buses] ON 

INSERT [dbo].[Buses] ([BusID], [BusNumber], [BusTypeID], [RouteID], [IntendTime], [SeatCount], [AvailableSeats], [Description], [CreatedAt], [ModifiedAt], [DepartureTime]) VALUES (3, N'E01', 1, 1, N'2', 30, 30, NULL, CAST(N'2023-12-01T11:15:29.6063608' AS DateTime2), NULL, CAST(N'08:30:00' AS Time))
INSERT [dbo].[Buses] ([BusID], [BusNumber], [BusTypeID], [RouteID], [IntendTime], [SeatCount], [AvailableSeats], [Description], [CreatedAt], [ModifiedAt], [DepartureTime]) VALUES (7, N'E02', 1, 1, N'2', 16, 16, N'', CAST(N'2023-12-01T12:29:57.6307281' AS DateTime2), NULL, CAST(N'22:00:00' AS Time))
INSERT [dbo].[Buses] ([BusID], [BusNumber], [BusTypeID], [RouteID], [IntendTime], [SeatCount], [AvailableSeats], [Description], [CreatedAt], [ModifiedAt], [DepartureTime]) VALUES (8, N'E03', 2, 4, N'6', 48, 44, N'', CAST(N'2023-12-02T02:27:59.0574983' AS DateTime2), NULL, CAST(N'21:00:00' AS Time))
INSERT [dbo].[Buses] ([BusID], [BusNumber], [BusTypeID], [RouteID], [IntendTime], [SeatCount], [AvailableSeats], [Description], [CreatedAt], [ModifiedAt], [DepartureTime]) VALUES (9, N'E04', 3, 5, N'4', 24, 24, N'', CAST(N'2023-12-02T08:43:30.3075128' AS DateTime2), NULL, CAST(N'14:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Buses] OFF
GO
SET IDENTITY_INSERT [dbo].[BusStops] ON 

INSERT [dbo].[BusStops] ([BusStopID], [BusStopName], [Description], [CreatedAt], [ModifiedAt]) VALUES (1, N'Ha Noi', N'', CAST(N'2023-11-26T10:28:44.8237618' AS DateTime2), NULL)
INSERT [dbo].[BusStops] ([BusStopID], [BusStopName], [Description], [CreatedAt], [ModifiedAt]) VALUES (2, N'Hung Yen', N'', CAST(N'2023-11-26T10:32:45.7170892' AS DateTime2), CAST(N'2023-11-26T10:32:45.7645248' AS DateTime2))
INSERT [dbo].[BusStops] ([BusStopID], [BusStopName], [Description], [CreatedAt], [ModifiedAt]) VALUES (3, N'Hai Duong', N'', CAST(N'2023-11-26T10:32:53.1562888' AS DateTime2), CAST(N'2023-11-26T10:32:53.1564550' AS DateTime2))
INSERT [dbo].[BusStops] ([BusStopID], [BusStopName], [Description], [CreatedAt], [ModifiedAt]) VALUES (4, N'Hai Phong', N'', CAST(N'2023-11-26T10:32:38.5636705' AS DateTime2), NULL)
INSERT [dbo].[BusStops] ([BusStopID], [BusStopName], [Description], [CreatedAt], [ModifiedAt]) VALUES (5, N'Nghe An', N'', CAST(N'2023-11-30T00:16:05.6749058' AS DateTime2), NULL)
INSERT [dbo].[BusStops] ([BusStopID], [BusStopName], [Description], [CreatedAt], [ModifiedAt]) VALUES (6, N'Ha Tinh', N'def', CAST(N'2023-11-30T12:30:46.4500160' AS DateTime2), CAST(N'2023-11-30T12:30:46.4845102' AS DateTime2))
INSERT [dbo].[BusStops] ([BusStopID], [BusStopName], [Description], [CreatedAt], [ModifiedAt]) VALUES (7, N'Nam Dinh', N'', CAST(N'2023-12-02T02:31:56.1181274' AS DateTime2), NULL)
INSERT [dbo].[BusStops] ([BusStopID], [BusStopName], [Description], [CreatedAt], [ModifiedAt]) VALUES (8, N'Ninh Binh', N'', CAST(N'2023-12-02T02:32:05.3828039' AS DateTime2), NULL)
INSERT [dbo].[BusStops] ([BusStopID], [BusStopName], [Description], [CreatedAt], [ModifiedAt]) VALUES (9, N'Thanh Hoa', N'', CAST(N'2023-12-02T02:32:13.9944203' AS DateTime2), NULL)
INSERT [dbo].[BusStops] ([BusStopID], [BusStopName], [Description], [CreatedAt], [ModifiedAt]) VALUES (10, N'Liem Tuyen', N'', CAST(N'2023-12-02T11:01:53.1233787' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[BusStops] OFF
GO
SET IDENTITY_INSERT [dbo].[BusTypes] ON 

INSERT [dbo].[BusTypes] ([BusTypeID], [BusTypeName], [BasePrice], [Description], [CreatedAt], [ModifiedAt]) VALUES (1, N'Express', CAST(10000.00 AS Decimal(18, 2)), N'Popular bus type', CAST(N'2023-11-30T00:14:13.8156312' AS DateTime2), CAST(N'2023-11-30T00:14:13.8221441' AS DateTime2))
INSERT [dbo].[BusTypes] ([BusTypeID], [BusTypeName], [BasePrice], [Description], [CreatedAt], [ModifiedAt]) VALUES (2, N'Luxury', CAST(15000.00 AS Decimal(18, 2)), N'', CAST(N'2023-12-02T00:41:26.7263084' AS DateTime2), NULL)
INSERT [dbo].[BusTypes] ([BusTypeID], [BusTypeName], [BasePrice], [Description], [CreatedAt], [ModifiedAt]) VALUES (3, N' Volvo (Non A/C)', CAST(20000.00 AS Decimal(18, 2)), N'', CAST(N'2023-12-02T00:42:04.7805721' AS DateTime2), NULL)
INSERT [dbo].[BusTypes] ([BusTypeID], [BusTypeName], [BasePrice], [Description], [CreatedAt], [ModifiedAt]) VALUES (4, N' Volvo (A/C)', CAST(25000.00 AS Decimal(18, 2)), N'', CAST(N'2023-12-02T00:42:21.8465984' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[BusTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [AgeRangeID], [Description], [CreatedAt], [ModifiedAt]) VALUES (1, N'Nguyen', N'Tu', N'nguyenanhtupt521@gmail.com', N'0862999622', 1, NULL, CAST(N'2023-11-25T00:31:07.6993651' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Routes] ON 

INSERT [dbo].[Routes] ([RouteID], [RouteName], [Description], [CreatedAt], [ModifiedAt]) VALUES (1, N'Ha Noi - Hai Phong', NULL, CAST(N'2023-11-25T11:22:28.3434344' AS DateTime2), NULL)
INSERT [dbo].[Routes] ([RouteID], [RouteName], [Description], [CreatedAt], [ModifiedAt]) VALUES (2, N'Ha Noi - Ho Chi Minh', N'', CAST(N'2023-11-26T10:48:29.1404712' AS DateTime2), CAST(N'2023-11-26T10:48:29.1447198' AS DateTime2))
INSERT [dbo].[Routes] ([RouteID], [RouteName], [Description], [CreatedAt], [ModifiedAt]) VALUES (3, N'Ha Noi - Lao Cai', N'', CAST(N'2023-11-26T10:42:52.2398314' AS DateTime2), CAST(N'2023-11-26T10:42:52.2424273' AS DateTime2))
INSERT [dbo].[Routes] ([RouteID], [RouteName], [Description], [CreatedAt], [ModifiedAt]) VALUES (4, N'Ha Noi - Nghe An', N'', CAST(N'2023-11-26T11:10:40.2083434' AS DateTime2), CAST(N'2023-11-26T11:10:40.2088223' AS DateTime2))
INSERT [dbo].[Routes] ([RouteID], [RouteName], [Description], [CreatedAt], [ModifiedAt]) VALUES (5, N'Hai Phong - Nghe An', N'', CAST(N'2023-12-02T08:40:36.8855987' AS DateTime2), CAST(N'2023-12-02T08:40:36.8994303' AS DateTime2))
INSERT [dbo].[Routes] ([RouteID], [RouteName], [Description], [CreatedAt], [ModifiedAt]) VALUES (6, N'Ha Noi - Ninh Binh', N'', CAST(N'2023-12-02T11:01:20.9162097' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Routes] OFF
GO
SET IDENTITY_INSERT [dbo].[RouteStops] ON 

INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (2, 1, 1, 1, 0, N'Starting point', CAST(N'2023-11-29T23:21:59.6241799' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (3, 1, 2, 2, 30, N'', CAST(N'2023-11-29T23:53:47.7312170' AS DateTime2), CAST(N'2023-11-29T23:53:47.7692886' AS DateTime2))
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (4, 1, 3, 3, 20, N'', CAST(N'2023-11-29T23:54:49.6354745' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (5, 1, 4, 4, 25, N'Final point', CAST(N'2023-11-29T23:57:43.7570662' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (6, 4, 1, 1, 0, N'', CAST(N'2023-12-02T02:29:37.1755245' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (7, 4, 7, 2, 85, N'', CAST(N'2023-12-02T02:33:17.5330557' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (8, 4, 8, 3, 32, N'', CAST(N'2023-12-02T02:34:14.6453802' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (9, 4, 9, 4, 72, N'', CAST(N'2023-12-02T02:35:02.7786811' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (10, 4, 5, 5, 175, N'', CAST(N'2023-12-02T02:37:07.2097906' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (11, 5, 4, 1, 0, N'', CAST(N'2023-12-02T08:41:48.3106228' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (12, 5, 7, 2, 100, N'', CAST(N'2023-12-02T08:42:13.7380431' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (13, 5, 5, 3, 120, N'', CAST(N'2023-12-02T08:42:46.2311042' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (14, 3, 1, 1, 0, N'', CAST(N'2023-12-02T10:59:53.0106892' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (15, 6, 1, 1, 0, N'', CAST(N'2023-12-02T11:02:11.7652278' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (16, 6, 10, 2, 100, N'', CAST(N'2023-12-02T11:02:23.7221230' AS DateTime2), NULL)
INSERT [dbo].[RouteStops] ([RouteStopID], [RouteID], [BusStopID], [StopOrder], [Distance], [Description], [CreatedAt], [ModifiedAt]) VALUES (17, 6, 8, 3, 20, N'', CAST(N'2023-12-02T11:02:34.5942165' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[RouteStops] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketCounters] ON 

INSERT [dbo].[TicketCounters] ([TicketCounterID], [TicketCounterName], [Address], [Description], [CreatedAt], [ModifiedAt]) VALUES (1, N'Counter 1', N'Ha Noi', N'Central ticket counter', CAST(N'2023-11-30T00:08:00.5812264' AS DateTime2), CAST(N'2023-11-30T00:08:00.5959447' AS DateTime2))
INSERT [dbo].[TicketCounters] ([TicketCounterID], [TicketCounterName], [Address], [Description], [CreatedAt], [ModifiedAt]) VALUES (2, N'Counter 2', N'Hai Phong', N'abcde', CAST(N'2023-11-30T00:54:35.1700144' AS DateTime2), CAST(N'2023-11-30T00:54:35.1761856' AS DateTime2))
SET IDENTITY_INSERT [dbo].[TicketCounters] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_TicketCounterID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_TicketCounterID] ON [dbo].[AspNetUsers]
(
	[TicketCounterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_BusID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_BusID] ON [dbo].[Bookings]
(
	[BusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_CustomerID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_CustomerID] ON [dbo].[Bookings]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Bookings_EmployeeID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_EmployeeID] ON [dbo].[Bookings]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_EndStopID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_EndStopID] ON [dbo].[Bookings]
(
	[EndStopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_StartStopID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_StartStopID] ON [dbo].[Bookings]
(
	[StartStopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingsHistories_BookingID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_BookingsHistories_BookingID] ON [dbo].[BookingsHistories]
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Buses_BusTypeID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Buses_BusTypeID] ON [dbo].[Buses]
(
	[BusTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Buses_RouteID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Buses_RouteID] ON [dbo].[Buses]
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Customers_AgeRangeID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Customers_AgeRangeID] ON [dbo].[Customers]
(
	[AgeRangeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PriceLists_AgeRangeID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_PriceLists_AgeRangeID] ON [dbo].[PriceLists]
(
	[AgeRangeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PriceLists_BusTypeID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_PriceLists_BusTypeID] ON [dbo].[PriceLists]
(
	[BusTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PriceLists_RouteID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_PriceLists_RouteID] ON [dbo].[PriceLists]
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RouteStops_BusStopID]    Script Date: 12/3/2023 9:00:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_RouteStops_BusStopID] ON [dbo].[RouteStops]
(
	[BusStopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RouteStops_RouteID]    Script Date: 12/3/2023 9:00:08 AM ******/
CREATE NONCLUSTERED INDEX [IX_RouteStops_RouteID] ON [dbo].[RouteStops]
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_TicketCounters_TicketCounterID] FOREIGN KEY([TicketCounterID])
REFERENCES [dbo].[TicketCounters] ([TicketCounterID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_TicketCounters_TicketCounterID]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_AspNetUsers_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_AspNetUsers_EmployeeID]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Buses_BusID] FOREIGN KEY([BusID])
REFERENCES [dbo].[Buses] ([BusID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Buses_BusID]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_BusStops_EndStopID] FOREIGN KEY([EndStopID])
REFERENCES [dbo].[BusStops] ([BusStopID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_BusStops_EndStopID]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_BusStops_StartStopID] FOREIGN KEY([StartStopID])
REFERENCES [dbo].[BusStops] ([BusStopID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_BusStops_StartStopID]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Customers_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Customers_CustomerID]
GO
ALTER TABLE [dbo].[BookingsHistories]  WITH CHECK ADD  CONSTRAINT [FK_BookingsHistories_Bookings_BookingID] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingsHistories] CHECK CONSTRAINT [FK_BookingsHistories_Bookings_BookingID]
GO
ALTER TABLE [dbo].[Buses]  WITH CHECK ADD  CONSTRAINT [FK_Buses_BusTypes_BusTypeID] FOREIGN KEY([BusTypeID])
REFERENCES [dbo].[BusTypes] ([BusTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Buses] CHECK CONSTRAINT [FK_Buses_BusTypes_BusTypeID]
GO
ALTER TABLE [dbo].[Buses]  WITH CHECK ADD  CONSTRAINT [FK_Buses_Routes_RouteID] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([RouteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Buses] CHECK CONSTRAINT [FK_Buses_Routes_RouteID]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_AgeRanges_AgeRangeID] FOREIGN KEY([AgeRangeID])
REFERENCES [dbo].[AgeRanges] ([AgeRangeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_AgeRanges_AgeRangeID]
GO
ALTER TABLE [dbo].[PriceLists]  WITH CHECK ADD  CONSTRAINT [FK_PriceLists_AgeRanges_AgeRangeID] FOREIGN KEY([AgeRangeID])
REFERENCES [dbo].[AgeRanges] ([AgeRangeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PriceLists] CHECK CONSTRAINT [FK_PriceLists_AgeRanges_AgeRangeID]
GO
ALTER TABLE [dbo].[PriceLists]  WITH CHECK ADD  CONSTRAINT [FK_PriceLists_BusTypes_BusTypeID] FOREIGN KEY([BusTypeID])
REFERENCES [dbo].[BusTypes] ([BusTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PriceLists] CHECK CONSTRAINT [FK_PriceLists_BusTypes_BusTypeID]
GO
ALTER TABLE [dbo].[PriceLists]  WITH CHECK ADD  CONSTRAINT [FK_PriceLists_Routes_RouteID] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([RouteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PriceLists] CHECK CONSTRAINT [FK_PriceLists_Routes_RouteID]
GO
ALTER TABLE [dbo].[RouteStops]  WITH CHECK ADD  CONSTRAINT [FK_RouteStops_BusStops_BusStopID] FOREIGN KEY([BusStopID])
REFERENCES [dbo].[BusStops] ([BusStopID])
GO
ALTER TABLE [dbo].[RouteStops] CHECK CONSTRAINT [FK_RouteStops_BusStops_BusStopID]
GO
ALTER TABLE [dbo].[RouteStops]  WITH CHECK ADD  CONSTRAINT [FK_RouteStops_Routes_RouteID] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([RouteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RouteStops] CHECK CONSTRAINT [FK_RouteStops_Routes_RouteID]
GO
USE [master]
GO
ALTER DATABASE [SRC_Travel] SET  READ_WRITE 
GO
