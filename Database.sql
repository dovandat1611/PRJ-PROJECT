USE [master]
GO
/****** Object:  Database [ProjectPRJ291]    Script Date: 8/1/2023 1:35:30 AM ******/
CREATE DATABASE [ProjectPRJ291]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectPRJ291', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectPRJ291.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectPRJ291_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectPRJ291_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectPRJ291] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectPRJ291].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectPRJ291] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjectPRJ291] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectPRJ291] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectPRJ291] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectPRJ291] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectPRJ291] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectPRJ291] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectPRJ291] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectPRJ291] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectPRJ291] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectPRJ291] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectPRJ291] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectPRJ291] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProjectPRJ291] SET QUERY_STORE = OFF
GO
USE [ProjectPRJ291]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 8/1/2023 1:35:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[phone] [varchar](25) NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 8/1/2023 1:35:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[bill_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[image] [varchar](200) NOT NULL,
	[list_price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 8/1/2023 1:35:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[name_receiver] [nvarchar](255) NOT NULL,
	[phone_receiver] [char](20) NOT NULL,
	[address_receiver] [nvarchar](500) NOT NULL,
	[total_price] [float] NOT NULL,
	[date] [date] NOT NULL,
	[status] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 8/1/2023 1:35:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] NOT NULL,
	[product_name] [varchar](255) NULL,
	[description] [varchar](255) NOT NULL,
	[image] [varchar](200) NOT NULL,
	[list_price] [float] NOT NULL,
	[discount] [float] NOT NULL,
	[category_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 8/1/2023 1:35:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] NOT NULL,
	[first_name] [nvarchar](255) NOT NULL,
	[last_name] [nvarchar](255) NOT NULL,
	[phone] [varchar](25) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[admin] ([admin_id], [first_name], [last_name], [phone], [username], [password]) VALUES (1, N'Đỗ Văn', N'Đạt', N'0968519615', N'dovandat', N'123')
INSERT [dbo].[admin] ([admin_id], [first_name], [last_name], [phone], [username], [password]) VALUES (2, N'Đỗ Văn', N'Hiếu', N'0902121881', N'dovanhieu', N'123')
INSERT [dbo].[admin] ([admin_id], [first_name], [last_name], [phone], [username], [password]) VALUES (3, N'Đỗ Thu', N'Trang', N'091234556', N'dothutrang', N'123')
INSERT [dbo].[admin] ([admin_id], [first_name], [last_name], [phone], [username], [password]) VALUES (4, N'Nguyễn Thị', N'Mai', N'0947934515', N'nguyenthimai', N'123')
GO
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (1, 1, 12, 19, N'Headphone Bose Black', N'image/HEADPHONESBoseblack.png', 200, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (2, 1, 12, 2, N'Hoodie Nike', N'image/Hoodienike.png', 96, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (3, 1, 12, 3, N'Jacket', N'image/jacket.png', 40, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (4, 1, 12, 4, N'Polo Ralph Lauren', N'image/Polo.png', 56, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (5, 1, 12, 5, N'Shirt Length Ralph Lauren', N'image/shirtlength.png', 112, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (6, 1, 12, 22, N'Laptop Mini Apple', N'image/laptopminiapple.png', 3200, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (7, 1, 12, 23, N'Macbook Pro 2021', N'image/macbookpro2021.png', 3199.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (8, 1, 12, 14, N'HAT P', N'image/hat4.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (9, 1, 12, 17, N'Converse White (Low and High)', N'image/shoesconversewhite.png', 160, 2, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (10, 1, 12, 7, N'Jean', N'image/jean.png', 114.4, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (11, 1, 12, 19, N'Headphone Bose Black', N'image/HEADPHONESBoseblack.png', 799.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (12, 1, 12, 9, N'Pants Form Korea', N'image/PantsformKorea.png', 25.6, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (13, 1, 12, 20, N'Headphone Bose White', N'image/HEADPHONESBosewhite.png', 799.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (14, 1, 12, 19, N'Headphone Bose Black', N'image/HEADPHONESBoseblack.png', 799.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (15, 1, 19, 12, N'HAT Combo LOS ANGELESS', N'image/hat2.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (16, 1, 19, 27, N'Logitech G102 Black', N'image/mouseLogitechG102black.png', 160, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (17, 1, 19, 20, N'Headphone Bose White', N'image/HEADPHONESBosewhite.png', 799.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (18, 1, 19, 2, N'Hoodie Nike', N'image/Hoodienike.png', 96, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (19, 1, 19, 4, N'Polo Ralph Lauren', N'image/Polo.png', 56, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (20, 1, 19, 14, N'HAT P', N'image/hat4.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (21, 1, 19, 17, N'Converse White (Low and High)', N'image/shoesconversewhite.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (22, 1, 19, 19, N'Headphone Bose Black', N'image/HEADPHONESBoseblack.png', 799.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (23, 1, 19, 1, N'Hoodie Boxy', N'image/Hoodieboxy.png', 96, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (24, 1, 19, 6, N'Shirt Length Nike', N'image/shirtnice.png', 176, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (25, 1, 19, 7, N'Jean', N'image/jean.png', 114.4, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (26, 1, 19, 12, N'HAT Combo LOS ANGELESS', N'image/hat2.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (27, 1, 19, 18, N'Nike Stussy', N'image/shoesnikestussy.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (28, 1, 19, 29, N'Mouse Rapoo', N'image/mouserapoo.png', 63.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (29, 1, 19, 8, N'Pants Adidas', N'image/Pantsadidas.png', 72, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (30, 1, 12, 4, N'Polo Ralph Lauren', N'image/Polo.png', 56, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (31, 1, 12, 5, N'Shirt Length Ralph Lauren', N'image/shirtlength.png', 112, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (32, 1, 12, 4, N'Polo Ralph Lauren', N'image/Polo.png', 56, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (33, 1, 12, 5, N'Shirt Length Ralph Lauren', N'image/shirtlength.png', 112, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (34, 1, 12, 3, N'Jacket', N'image/jacket.png', 40, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (35, 1, 12, 4, N'Polo Ralph Lauren', N'image/Polo.png', 56, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (36, 2, 12, 3, N'Jacket', N'image/jacket.png', 40, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (37, 3, 12, 15, N'HAT Ralph Lauren', N'image/hat5.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (38, 3, 12, 5, N'Shirt Length Ralph Lauren', N'image/shirtlength.png', 112, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (39, 4, 12, 17, N'Converse White (Low and High)', N'image/shoesconversewhite.png', 160, 2, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (40, 4, 12, 18, N'Nike Stussy', N'image/shoesnikestussy.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (41, 4, 12, 19, N'Headphone Bose Black', N'image/HEADPHONESBoseblack.png', 799.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (42, 5, 12, 27, N'Logitech G102 Black', N'image/mouseLogitechG102black.png', 160, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (43, 6, 12, 13, N'HAT R', N'image/hat3.png', 160, 2, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (44, 6, 12, 6, N'Shirt Length Nike', N'image/shirtnice.png', 176, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (45, 6, 12, 7, N'Jean', N'image/jean.png', 114.4, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (46, 6, 12, 8, N'Pants Adidas', N'image/Pantsadidas.png', 72, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (47, 7, 12, 14, N'HAT P', N'image/hat4.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (48, 7, 12, 27, N'Logitech G102 Black', N'image/mouseLogitechG102black.png', 160, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (49, 7, 12, 29, N'Mouse Rapoo', N'image/mouserapoo.png', 63.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (50, 8, 12, 6, N'Shirt Length Nike', N'image/shirtnice.png', 176, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (51, 10, 19, 3, N'Jacket', N'image/jacket.png', 40, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (52, 10, 19, 4, N'Polo Ralph Lauren', N'image/Polo.png', 56, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (53, 10, 19, 5, N'Shirt Length Ralph Lauren', N'image/shirtlength.png', 112, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (54, 10, 19, 19, N'Headphone Bose Black', N'image/HEADPHONESBoseblack.png', 799.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (55, 11, 19, 1, N'Hoodie Boxy', N'image/Hoodieboxy.png', 96, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (56, 11, 19, 2, N'Hoodie Nike', N'image/Hoodienike.png', 96, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (57, 11, 19, 3, N'Jacket', N'image/jacket.png', 40, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (58, 12, 19, 16, N'Converse All Star', N'image/shoesconverse.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (59, 12, 19, 17, N'Converse White (Low and High)', N'image/shoesconversewhite.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (60, 13, 12, 3, N'Jacket', N'image/jacket.png', 40, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (61, 13, 12, 5, N'Shirt Length Ralph Lauren', N'image/shirtlength.png', 112, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (62, 14, 12, 19, N'Headphone Bose Black', N'image/HEADPHONESBoseblack.png', 799.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (63, 14, 12, 19, N'Headphone Bose Black', N'image/HEADPHONESBoseblack.png', 15984, 20, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (64, 15, 12, 18, N'Nike Stussy', N'image/shoesnikestussy.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (65, 16, 12, 19, N'Headphone Bose Black', N'image/HEADPHONESBoseblack.png', 15984, 20, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (66, 16, 12, 9, N'Pants Form Korea', N'image/PantsformKorea.png', 25.6, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (67, 18, 19, 19, N'Headphone Bose Black', N'image/HEADPHONESBoseblack.png', 799.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (68, 18, 19, 19, N'Headphone Bose Black', N'image/HEADPHONESBoseblack.png', 15984, 20, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (69, 19, 19, 18, N'Nike Stussy', N'image/shoesnikestussy.png', 1600, 20, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (70, 20, 12, 3, N'Jacket', N'image/jacket.png', 40, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (71, 22, 12, 22, N'Laptop Mini Apple', N'image/laptopminiapple.png', 3200, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (72, 22, 12, 23, N'Macbook Pro 2021', N'image/macbookpro2021.png', 3199.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (73, 22, 12, 24, N'Macbook Pro 2023', N'image/macbookpro2023.png', 3999.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (74, 22, 12, 25, N'Mouse Dareu', N'image/mousedareu.png', 40, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (75, 22, 12, 26, N'Logitech G102 White', N'image/mouseLogitechG102.png', 160, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (76, 22, 12, 27, N'Logitech G102 Black', N'image/mouseLogitechG102black.png', 160, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (77, 22, 12, 16, N'Converse All Star', N'image/shoesconverse.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (78, 22, 12, 28, N'Logitech G304 Black', N'image/mouseLogitechG304_1.png', 168, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (79, 22, 12, 17, N'Converse White (Low and High)', N'image/shoesconversewhite.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (80, 22, 12, 18, N'Nike Stussy', N'image/shoesnikestussy.png', 80, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (81, 22, 12, 19, N'Headphone Bose Black', N'image/HEADPHONESBoseblack.png', 799.2, 1, N'Wait')
INSERT [dbo].[bill] ([bill_id], [order_id], [user_id], [product_id], [product_name], [image], [list_price], [quantity], [status]) VALUES (82, 23, 12, 4, N'Polo Ralph Lauren', N'image/Polo.png', 56, 1, N'Wait')
GO
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (1, 12, N'Do Van Dat', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 96, CAST(N'2023-02-20' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (2, 12, N'Do Thu Trang', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 200, CAST(N'2023-01-20' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (3, 12, N'Do Thu Trang', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 192, CAST(N'2023-04-20' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (4, 12, N'Do Van Dat', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 1039.2, CAST(N'2023-03-20' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (5, 12, N'Do Van Dat', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 160, CAST(N'2023-05-20' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (6, 12, N'Bui Ngan Ha', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 682.4, CAST(N'2023-06-20' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (7, 12, N'Do Van Dat', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 303.2, CAST(N'2023-12-20' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (8, 12, N'Do Van Dat', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 176, CAST(N'2023-09-20' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (9, 3, N'Do Van Dat', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 3200, CAST(N'2023-10-20' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (10, 19, N'Do Van Dat', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 1007.2, CAST(N'2023-11-20' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (11, 19, N'Do Thu Trang', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 232, CAST(N'2023-08-20' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (12, 19, N'Bui Ngan Ha', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 160, CAST(N'2023-07-20' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (13, 12, N'Le Thanh Tung', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 152, CAST(N'2023-07-21' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (14, 12, N'Do Van Dat', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 15984, CAST(N'2023-07-21' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (15, 12, N'Nguyen Thi Mai', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 80, CAST(N'2023-07-21' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (16, 12, N'Do Van Dat', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 16009.6, CAST(N'2023-12-21' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (17, 12, N'Do Van Dat', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 4800, CAST(N'2023-12-21' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (18, 19, N'Nguyen Thi Mai', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 15984, CAST(N'2023-12-21' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (19, 19, N'Le Thanh Tung', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 1600, CAST(N'2023-05-21' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (20, 12, N'Do Van Dat', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 40, CAST(N'2023-05-21' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (21, 12, N'Do Van Dat', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 56, CAST(N'2023-09-21' AS Date), N'Done')
INSERT [dbo].[orders] ([order_id], [user_id], [name_receiver], [phone_receiver], [address_receiver], [total_price], [date], [status]) VALUES (22, 12, N'Do Thu Trang', N'0123456             ', N'Tân Lập - Đan Phượng - Hà Nội', 13725.6, CAST(N'2023-03-21' AS Date), N'Done')
GO
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (1, N'Hoodie Boxy', N'Made by Nike', N'image/Hoodieboxy.png', 120, 0.2, N'Garment')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (2, N'Hoodie Nike', N'made by nike in 2019', N'image/Hoodienike.png', 120, 0.2, N'Garment')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (3, N'Jacket', N'made by TQ in 2023', N'image/jacket.png', 50, 0.2, N'Garment')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (4, N'Polo Ralph Lauren', N'made by Ralph Lauren', N'image/Polo.png', 70, 0.2, N'Garment')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (5, N'Shirt Length Ralph Lauren', N'made by Ralph Lauren', N'image/shirtlength.png', 140, 0.2, N'Garment')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (6, N'Shirt Length Nike', N'made by nike', N'image/shirtnice.png', 220, 0.2, N'Garment')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (7, N'Jean', N'made in VN', N'image/jean.png', 143, 0.2, N'Garment')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (8, N'Pants Adidas', N'made by Adidas', N'image/Pantsadidas.png', 90, 0.2, N'Garment')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (9, N'Pants Form Korea', N'made in VN', N'image/PantsformKorea.png', 32, 0.2, N'Garment')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (10, N'GAP Shoes ', N'Made by GAP', N'image/GAPShoes.png', 200, 0.2, N'Accessories')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (11, N'HAT CCDE&MSON', N'Made by CCDE&MSON', N'image/hat1.png', 100, 0.2, N'Accessories')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (12, N'HAT Combo LOS ANGELESS', N'Made by VN', N'image/hat2.png', 100, 0.2, N'Accessories')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (13, N'HAT R', N'Made by R', N'image/hat3.png', 100, 0.2, N'Garment')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (14, N'HAT P', N'Made by P', N'image/hat4.png', 100, 0.2, N'Garment')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (15, N'HAT Ralph Lauren', N'Made by Ralph Lauren', N'image/hat5.png', 100, 0.2, N'Accessories')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (16, N'Converse All Star', N'Made by Converse ', N'image/shoesconverse.png', 100, 0.2, N'Accessories')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (17, N'Converse White (Low and High)', N'Made by Converse ', N'image/shoesconversewhite.png', 100, 0.2, N'Accessories')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (18, N'Nike Stussy', N'Made by Nike and Stussy collab ', N'image/shoesnikestussy.png', 100, 0.2, N'Accessories')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (19, N'Headphone Bose Black', N'Made by Bose', N'image/HEADPHONESBoseblack.png', 999, 0.2, N'Technology')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (20, N'Headphone Bose White', N'Made by Bose', N'image/HEADPHONESBosewhite.png', 999, 0.2, N'Technology')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (21, N'Ipad Pro 2021', N'Made by Apple', N'image/ipadpro.png', 2000, 0.2, N'Technology')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (22, N'Laptop Mini Apple', N'Made by Apple', N'image/laptopminiapple.png', 4000, 0.2, N'Technology')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (23, N'Macbook Pro 2021', N'Made by Apple', N'image/macbookpro2021.png', 3999, 0.2, N'Technology')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (24, N'Macbook Pro 2023', N'Made by Apple', N'image/macbookpro2023.png', 4999, 0.2, N'Technology')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (25, N'Mouse Dareu', N'Made by Dareu', N'image/mousedareu.png', 50, 0.2, N'Technology')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (26, N'Logitech G102 White', N'Made by Logitech', N'image/mouseLogitechG102.png', 200, 0.2, N'Technology')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (27, N'Logitech G102 Black', N'Made by Logitech', N'image/mouseLogitechG102black.png', 200, 0.2, N'Technology')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (28, N'Logitech G304 Black', N'Made by Logitech', N'image/mouseLogitechG304_1.png', 210, 0.2, N'Technology')
INSERT [dbo].[products] ([product_id], [product_name], [description], [image], [list_price], [discount], [category_name]) VALUES (29, N'Mouse Rapoo', N'Made by Rapoo', N'image/mouserapoo.png', 79, 0.2, N'Technology')
GO
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (1, N'Nguyễn Ngọc', N'Tuấn', N'0123456', N'Số 24 - Xã Tân Hội - Huyện Đan Phượng - TP Hà Nội', N'nguyenngoctuan', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (2, N'Trần Quốc', N'Cường', N'140974', N'Số 11 - Cổng Làng Kim Bông - Xã Tân Xã - Huyện Thạch Thất - Tp Hà Nội', N'HE140974', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (3, N'Nguyễn Hải', N'An', N'160200', N'Số 12 - Xã Thạc Hòa - Huyện Thạch Thất - Tp Hà Nội', N'HE160200', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (4, N'Vũ Hải', N'Nguyên', N'160231', N'Số 56 - Xã Tân Xã - Huyện Thạch Thất - Tp Hà Nội', N'HE160231', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (5, N'Vũ Minh', N'Quân', N'160594', N'Số 14 - Xã Thạc Hòa - Huyện Thạch Thất - Tp Hà Nội', N'HE160594', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (6, N'Đinh Quang', N'Công', N'160659', N'Số 19 - Xã Tân Xã - Huyện Thạch Thất - Tp Hà Nội', N'HE160659', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (7, N'Trần Lê Thành', N'Trung', N'160660', N'Số 10 - Xã Thạc Hòa - Huyện Thạch Thất - Tp Hà Nội', N'HE160660', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (8, N'Lê Đức', N'Hải', N'150280', N'Số 01 - Xã Tân Xã - Huyện Thạch Thất - Tp Hà Nội', N'HE150280', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (9, N'Đoàn Ngọc', N'Minh', N'161535', N'Số  04 - Xã Tân Xã - Huyện Thạch Thất - Tp Hà Nội', N'HE161535', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (10, N'Nguyễn Huy', N'Tùng', N'161576', N'Số 12 - Xã Thạc Hòa - Huyện Thạch Thất - Tp Hà Nội', N'HE161576', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (11, N'Phạm Minh', N'Tuấn', N'161621', N'Số 69 - Xã Tân Xã - Huyện Thạch Thất - Tp Hà Nộii', N'HE161621', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (12, N'Đỗ Văn ', N'Đạt', N'161664', N'Số 115 - Xã Tân Hội - Huyện Đan Phượng - TP Hà Nội', N'dovandat1611', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (13, N'Nguyễn Thanh', N'Tùng', N'161695', N'Số 114 - Xã Tân Xã - Huyện Thạch Thất - Tp Hà Nộii', N'HE161695', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (14, N'Phan Trung', N'Kiên', N'161863', N'Số 39 - Xã Tân Hội - Huyện Đan Phượng - TP Hà Nội', N'HE161863', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (15, N'Dương Thế', N'Toàn', N'163175', N'Số 12 - Xã Thạc Hòa - Huyện Thạch Thất - Tp Hà Nội', N'HE163175', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (16, N'Nguyễn Giang', N'Huy', N'163499', N'Số 102 - Huyện Thạch Thất - Tp Hà Nội', N'HE163499', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (17, N'Lê Thị Minh', N'Anh', N'163502', N'Số 112 - Xã Tân Xã - Huyện Thạch Thất - Tp Hà Nội', N'HE163502', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (18, N'Mai Đức', N'Anh', N'163618', N'Số 12 - Xã Thạc Hòa - Huyện Thạch Thất - Tp Hà Nội', N'HE163618', N'123')
INSERT [dbo].[users] ([user_id], [first_name], [last_name], [phone], [address], [username], [password]) VALUES (19, N'Bùi Ngân', N'Hà', N'0123456', N'Tân Lập - Đan Phượng - Hà Nội', N'buinganha', N'123')
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
USE [master]
GO
ALTER DATABASE [ProjectPRJ291] SET  READ_WRITE 
GO
