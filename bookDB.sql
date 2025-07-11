USE [master]
GO
/****** Object:  Database [bookDB]    Script Date: 6/25/2025 8:59:47 PM ******/
CREATE DATABASE [bookDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\bookDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bookDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\bookDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [bookDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bookDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bookDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bookDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bookDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bookDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bookDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [bookDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bookDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bookDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bookDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bookDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bookDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bookDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bookDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bookDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bookDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bookDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bookDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bookDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bookDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bookDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bookDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bookDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bookDB] SET RECOVERY FULL 
GO
ALTER DATABASE [bookDB] SET  MULTI_USER 
GO
ALTER DATABASE [bookDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bookDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bookDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bookDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bookDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bookDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bookDB', N'ON'
GO
ALTER DATABASE [bookDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [bookDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [bookDB]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 6/25/2025 8:59:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[catID] [char](5) NOT NULL,
	[catName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[catID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 6/25/2025 8:59:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[id] [char](5) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[price] [float] NOT NULL,
	[catID] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[image] [text] NULL,
	[author] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 6/25/2025 8:59:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([catID], [catName]) VALUES (N'1    ', N'Fantasy')
INSERT [dbo].[tblCategory] ([catID], [catName]) VALUES (N'2    ', N'Horror')
INSERT [dbo].[tblCategory] ([catID], [catName]) VALUES (N'3    ', N'Science Fiction')
GO
INSERT [dbo].[tblProducts] ([id], [name], [description], [price], [catID], [status], [image], [author]) VALUES (N'1    ', N'Fire and Blood', N'Fire and Blood offers a detailed history of House Targaryen, rich with dragons, political intrigue, and epic power struggles. Fans of Westeros will enjoy its deep lore and historical tone, making it a must-read for Game of Thrones enthusiasts.
', 211000, N'1', 1, N'https://i.postimg.cc/PrNLh4VZ/548x840.jpg', NULL)
INSERT [dbo].[tblProducts] ([id], [name], [description], [price], [catID], [status], [image], [author]) VALUES (N'2    ', N'86', N'86 -Eighty-Six- is a thrilling sci-fi light novel set in a world where a republic claims to fight with drones—yet secretly sends oppressed humans from the 86th district to the battlefield. Follow Shin, a stoic squad leader, and Lena, an idealistic officer who sees the truth. Full of emotion, action, and heart, it’s a gripping and unforgettable story.
', 145000, N'3', 1, N'https://i.postimg.cc/wv07Dpsc/OIP-2.jpg', NULL)
INSERT [dbo].[tblProducts] ([id], [name], [description], [price], [catID], [status], [image], [author]) VALUES (N'3    ', N'Harry Potter ', N'Harry Potter and the Half-Blood Prince delves deeper into the dark past of Lord Voldemort as Harry discovers a mysterious potions book marked by the "Half-Blood Prince." With danger growing and secrets unfolding, Harry and Dumbledore work to uncover the key to defeating evil. A gripping mix of magic, mystery, and emotion, this fantasy tale is unforgettable.
', 311760, N'1', 1, N'https://i.postimg.cc/pVqQRNyH/half-blood-prince-2022-pottermore-cover.jpg', NULL)
INSERT [dbo].[tblProducts] ([id], [name], [description], [price], [catID], [status], [image], [author]) VALUES (N'4    ', N'Another: Episode S/0', N'Another: Episode S/0 follows Mei Misaki during a fateful summer at her seaside vacation home. There, she meets the ghost of Teruya Sakaki and embarks on a haunting journey to recover his memories and unravel the lingering curse tied to Class 3‑3. A tense, atmospheric blend of mystery, supernatural horror, and emotional depth.', 100000, N'2', 1, N'https://i.postimg.cc/ncs12HGL/another-s0-76f7ba55511f477692f4c3a2a1da7f4a-master.jpg', NULL)
INSERT [dbo].[tblProducts] ([id], [name], [description], [price], [catID], [status], [image], [author]) VALUES (N'F-001', N'Fashion dresses', N'Fashion dresses for Summer 2025', 285, N'Adventure', 0, NULL, NULL)
INSERT [dbo].[tblProducts] ([id], [name], [description], [price], [catID], [status], [image], [author]) VALUES (N'F-002', N'Men''s shirt', N'VIET TIEN long-sleeve men''s shirt', 115, N'M', 0, NULL, NULL)
INSERT [dbo].[tblProducts] ([id], [name], [description], [price], [catID], [status], [image], [author]) VALUES (N'F-003', N'Short office skirt', N'Short skirt for women''s office wear', 307, N'S', 0, NULL, NULL)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Administrator', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'ce175533', N'Mai Thanh Quan', N'ct', N'MB', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'de175533', N'Vo Thi Hoang Oanh', N'dn', N'MB', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'he181122', N'Hoang Minh Thoa', N'hn', N'MB', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'hungnq', N'Nguyen Quang Hung', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'qe175533', N'Pham Tuan Minh', N'qn', N'MB', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'se190011', N'Tran Manh Hung', N'hcm', N'MB', 0)
GO
USE [master]
GO
ALTER DATABASE [bookDB] SET  READ_WRITE 
GO
