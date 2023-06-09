/****** Object:  Table [dbo].[UserData]    Script Date: 2022/03/04 16:59:31 ******/
DROP TABLE IF EXISTS [dbo].[UserData]
GO
/****** Object:  Table [dbo].[NewsArticles]    Script Date: 2022/03/04 16:59:31 ******/
DROP TABLE IF EXISTS [dbo].[NewsArticles]
GO
/****** Object:  Table [dbo].[ContactReasons]    Script Date: 2022/03/04 16:59:31 ******/
DROP TABLE IF EXISTS [dbo].[ContactReasons]
GO
/****** Object:  Table [dbo].[ContactMessages]    Script Date: 2022/03/04 16:59:31 ******/
DROP TABLE IF EXISTS [dbo].[ContactMessages]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 2022/03/04 16:59:31 ******/
DROP TABLE IF EXISTS [dbo].[Banners]
GO
/****** Object:  Database [HarnessPro]    Script Date: 2022/03/04 16:59:31 ******/
DROP DATABASE IF EXISTS [HarnessPro]
GO
/****** Object:  Database [HarnessPro]    Script Date: 2022/03/04 16:59:31 ******/
CREATE DATABASE [HarnessPro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HarnessPro', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HarnessPro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HarnessPro_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HarnessPro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HarnessPro] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HarnessPro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HarnessPro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HarnessPro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HarnessPro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HarnessPro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HarnessPro] SET ARITHABORT OFF 
GO
ALTER DATABASE [HarnessPro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HarnessPro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HarnessPro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HarnessPro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HarnessPro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HarnessPro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HarnessPro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HarnessPro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HarnessPro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HarnessPro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HarnessPro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HarnessPro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HarnessPro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HarnessPro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HarnessPro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HarnessPro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HarnessPro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HarnessPro] SET RECOVERY FULL 
GO
ALTER DATABASE [HarnessPro] SET  MULTI_USER 
GO
ALTER DATABASE [HarnessPro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HarnessPro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HarnessPro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HarnessPro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HarnessPro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HarnessPro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HarnessPro', N'ON'
GO
ALTER DATABASE [HarnessPro] SET QUERY_STORE = OFF
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 2022/03/04 16:59:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SiteSection] [int] NOT NULL,
	[Title] [nvarchar](350) NOT NULL,
	[Filename] [varchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[ActionType] [int] NOT NULL,
	[ActionData] [nvarchar](350) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[MetaData] [varchar](max) NULL,
 CONSTRAINT [PK_Banners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactMessages]    Script Date: 2022/03/04 16:59:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ReasonId] [int] NULL,
	[Firstname] [varchar](250) NOT NULL,
	[Surname] [varchar](250) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Mobile] [varchar](250) NOT NULL,
	[IPAddress] [varchar](50) NOT NULL,
	[DateSent] [datetime] NOT NULL,
	[DateAttended] [datetime] NULL,
	[AttendedBy] [int] NULL,
	[Status] [int] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ContactMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactReasons]    Script Date: 2022/03/04 16:59:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactReasons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](350) NOT NULL,
	[Destination] [varchar](500) NOT NULL,
	[CCAddress] [varchar](500) NULL,
	[DisplayOrder] [int] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_ContactReasons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsArticles]    Script Date: 2022/03/04 16:59:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsArticles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](300) NOT NULL,
	[Author] [varchar](300) NOT NULL,
	[ArticleDate] [datetime] NOT NULL,
	[Snippet] [nvarchar](max) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Copy] [ntext] NOT NULL,
 CONSTRAINT [PK_NewsArticles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserData]    Script Date: 2022/03/04 16:59:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](40) NOT NULL,
	[UserType] [int] NULL,
	[Salutation] [int] NOT NULL,
	[FirstName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NULL,
	[EmailAddress] [nvarchar](350) NOT NULL,
	[EmailConfirmed] [bit] NULL,
	[CurrentPassword] [nvarchar](350) NULL,
	[LastPassword] [nvarchar](350) NULL,
	[Telephone] [varchar](50) NULL,
	[Mobile] [varchar](150) NULL,
	[Status] [int] NOT NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[AddedBy] [int] NULL,
	[DateVerified] [datetime] NULL,
	[LastLogin] [datetime] NULL,
	[FailedLogins] [int] NULL,
	[LockedOut] [bit] NULL,
	[LockOutDate] [datetime] NULL,
	[ResetPassword] [bit] NULL,
	[LastIP] [varchar](30) NULL,
	[LoginCookie] [varchar](50) NULL,
 CONSTRAINT [PK_UserData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER DATABASE [HarnessPro] SET  READ_WRITE 
GO
