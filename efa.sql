USE [master]
GO
/****** Object:  Database [YouTubeDatabase]    Script Date: 21.03.2022 17:49:57 ******/
CREATE DATABASE [YouTubeDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YouTubeDatabase', FILENAME = N'D:\sql\MSSQL14.LEOSQL\MSSQL\DATA\YouTubeDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YouTubeDatabase_log', FILENAME = N'D:\sql\MSSQL14.LEOSQL\MSSQL\DATA\YouTubeDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [YouTubeDatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YouTubeDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YouTubeDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YouTubeDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YouTubeDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YouTubeDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YouTubeDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YouTubeDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [YouTubeDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YouTubeDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YouTubeDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YouTubeDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YouTubeDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YouTubeDatabase] SET QUERY_STORE = OFF
GO
USE [YouTubeDatabase]
GO
/****** Object:  Table [dbo].[PlayersTopTable]    Script Date: 21.03.2022 17:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayersTopTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nick] [nvarchar](50) NOT NULL,
	[PointsData] [float] NULL,
	[BasicImp1] [int] NULL,
	[BasicImp2] [int] NULL,
	[BasicImp3] [int] NULL,
	[BasicImp4] [int] NULL,
	[BasicImp5] [int] NULL,
	[BonusImp1] [int] NULL,
	[BonusImp2] [int] NULL,
	[userIdplayer] [int] NULL,
 CONSTRAINT [PK_PlayersTopTable_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersDataTable]    Script Date: 21.03.2022 17:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersDataTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nick] [nvarchar](50) NOT NULL,
	[PasswordUser] [nvarchar](50) NULL,
 CONSTRAINT [PK_UsersDataTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PlayersTopTable] ON 

INSERT [dbo].[PlayersTopTable] ([Id], [Nick], [PointsData], [BasicImp1], [BasicImp2], [BasicImp3], [BasicImp4], [BasicImp5], [BonusImp1], [BonusImp2], [userIdplayer]) VALUES (5, N'test', 39.5, 3, 0, 0, 0, 0, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[PlayersTopTable] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersDataTable] ON 

INSERT [dbo].[UsersDataTable] ([Id], [Nick], [PasswordUser]) VALUES (1, N'test', N'test123')
SET IDENTITY_INSERT [dbo].[UsersDataTable] OFF
GO
ALTER TABLE [dbo].[PlayersTopTable]  WITH CHECK ADD  CONSTRAINT [FK_PlayersTopTable_UsersDataTable1] FOREIGN KEY([userIdplayer])
REFERENCES [dbo].[UsersDataTable] ([Id])
GO
ALTER TABLE [dbo].[PlayersTopTable] CHECK CONSTRAINT [FK_PlayersTopTable_UsersDataTable1]
GO
USE [master]
GO
ALTER DATABASE [YouTubeDatabase] SET  READ_WRITE 
GO
