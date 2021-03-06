USE [GdeDaJedem]
GO
ALTER TABLE [dbo].[TipoviRestorana] DROP CONSTRAINT [FK_TipoviRestorana_Restoran]
GO
ALTER TABLE [dbo].[Restoran] DROP CONSTRAINT [FK_Restoran_Opstine]
GO
ALTER TABLE [dbo].[OceneKomentari] DROP CONSTRAINT [FK_OceneKomentari_Restoran]
GO
ALTER TABLE [dbo].[OceneKomentari] DROP CONSTRAINT [FK_OceneKomentari_Korisnik]
GO
ALTER TABLE [dbo].[KorisnikRola] DROP CONSTRAINT [FK_KorisnikRola_Rola]
GO
ALTER TABLE [dbo].[KorisnikRola] DROP CONSTRAINT [FK_KorisnikRola_Korisnik]
GO
/****** Object:  Table [dbo].[TipoviRestorana]    Script Date: 26-May-21 13:32:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoviRestorana]') AND type in (N'U'))
DROP TABLE [dbo].[TipoviRestorana]
GO
/****** Object:  Table [dbo].[Rola]    Script Date: 26-May-21 13:32:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rola]') AND type in (N'U'))
DROP TABLE [dbo].[Rola]
GO
/****** Object:  Table [dbo].[Restoran]    Script Date: 26-May-21 13:32:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Restoran]') AND type in (N'U'))
DROP TABLE [dbo].[Restoran]
GO
/****** Object:  Table [dbo].[Opstine]    Script Date: 26-May-21 13:32:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Opstine]') AND type in (N'U'))
DROP TABLE [dbo].[Opstine]
GO
/****** Object:  Table [dbo].[OceneKomentari]    Script Date: 26-May-21 13:32:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OceneKomentari]') AND type in (N'U'))
DROP TABLE [dbo].[OceneKomentari]
GO
/****** Object:  Table [dbo].[KorisnikRola]    Script Date: 26-May-21 13:32:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KorisnikRola]') AND type in (N'U'))
DROP TABLE [dbo].[KorisnikRola]
GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 26-May-21 13:32:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Korisnik]') AND type in (N'U'))
DROP TABLE [dbo].[Korisnik]
GO
USE [master]
GO
/****** Object:  Database [GdeDaJedem]    Script Date: 26-May-21 13:32:30 ******/
DROP DATABASE [GdeDaJedem]
GO
/****** Object:  Database [GdeDaJedem]    Script Date: 26-May-21 13:32:30 ******/
CREATE DATABASE [GdeDaJedem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GdeDaJedem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GdeDaJedem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GdeDaJedem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GdeDaJedem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GdeDaJedem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GdeDaJedem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GdeDaJedem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GdeDaJedem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GdeDaJedem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GdeDaJedem] SET ARITHABORT OFF 
GO
ALTER DATABASE [GdeDaJedem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GdeDaJedem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GdeDaJedem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GdeDaJedem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GdeDaJedem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GdeDaJedem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GdeDaJedem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GdeDaJedem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GdeDaJedem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GdeDaJedem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GdeDaJedem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GdeDaJedem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GdeDaJedem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GdeDaJedem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GdeDaJedem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GdeDaJedem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GdeDaJedem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GdeDaJedem] SET RECOVERY FULL 
GO
ALTER DATABASE [GdeDaJedem] SET  MULTI_USER 
GO
ALTER DATABASE [GdeDaJedem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GdeDaJedem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GdeDaJedem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GdeDaJedem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GdeDaJedem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GdeDaJedem', N'ON'
GO
ALTER DATABASE [GdeDaJedem] SET QUERY_STORE = OFF
GO
USE [GdeDaJedem]
GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 26-May-21 13:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnik](
	[KorisnikID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DatumUclanjenja] [date] NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[DatumRodj] [date] NOT NULL,
 CONSTRAINT [PK_Korisnik] PRIMARY KEY CLUSTERED 
(
	[KorisnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KorisnikRola]    Script Date: 26-May-21 13:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KorisnikRola](
	[KorisnikRolaID] [int] IDENTITY(1,1) NOT NULL,
	[KorisnikID] [int] NULL,
	[RolaID] [int] NULL,
 CONSTRAINT [PK_KorisnikRola] PRIMARY KEY CLUSTERED 
(
	[KorisnikRolaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OceneKomentari]    Script Date: 26-May-21 13:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OceneKomentari](
	[KomentarID] [int] IDENTITY(1,1) NOT NULL,
	[Ocena] [float] NULL,
	[Opis] [nvarchar](100) NOT NULL,
	[RestoranID] [int] NOT NULL,
	[KorisnikID] [int] NOT NULL,
 CONSTRAINT [PK_OceneKomentari] PRIMARY KEY CLUSTERED 
(
	[KomentarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opstine]    Script Date: 26-May-21 13:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opstine](
	[opstinaID] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [nvarchar](50) NULL,
 CONSTRAINT [PK_Opstine] PRIMARY KEY CLUSTERED 
(
	[opstinaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restoran]    Script Date: 26-May-21 13:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restoran](
	[RestoranID] [int] IDENTITY(1,1) NOT NULL,
	[PIB] [nvarchar](10) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[Adresa] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Opis] [nvarchar](200) NULL,
	[Slika] [nvarchar](50) NULL,
	[Mapa] [nvarchar](max) NULL,
	[Opstina] [int] NULL,
 CONSTRAINT [PK_Restoran] PRIMARY KEY CLUSTERED 
(
	[RestoranID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rola]    Script Date: 26-May-21 13:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rola](
	[RolaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rola] PRIMARY KEY CLUSTERED 
(
	[RolaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoviRestorana]    Script Date: 26-May-21 13:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoviRestorana](
	[TipId] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[RestoranID] [int] NOT NULL,
 CONSTRAINT [PK_TipoviRestorana] PRIMARY KEY CLUSTERED 
(
	[TipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Korisnik] ON 

INSERT [dbo].[Korisnik] ([KorisnikID], [Username], [Password], [Email], [DatumUclanjenja], [Ime], [Prezime], [Telefon], [DatumRodj]) VALUES (1, N'misa', N'misa', N'misa@misa.com', CAST(N'2020-01-01' AS Date), N'Milos', N'Milosavljevic', N'123123123', CAST(N'1999-08-17' AS Date))
INSERT [dbo].[Korisnik] ([KorisnikID], [Username], [Password], [Email], [DatumUclanjenja], [Ime], [Prezime], [Telefon], [DatumRodj]) VALUES (4, N'zeka', N'zeka', N'zeka@zeka.com', CAST(N'2020-01-01' AS Date), N'Marko', N'Zecar', N'321321321', CAST(N'1999-09-09' AS Date))
INSERT [dbo].[Korisnik] ([KorisnikID], [Username], [Password], [Email], [DatumUclanjenja], [Ime], [Prezime], [Telefon], [DatumRodj]) VALUES (5, N'kocke', N'kocke', N'kocke@korisnik.com', CAST(N'2020-01-02' AS Date), N'Bogdan ', N'Kocic', N'432422343', CAST(N'1999-06-12' AS Date))
INSERT [dbo].[Korisnik] ([KorisnikID], [Username], [Password], [Email], [DatumUclanjenja], [Ime], [Prezime], [Telefon], [DatumRodj]) VALUES (14, N'asd', N'asd', N'asd', CAST(N'0001-01-01' AS Date), N'asd', N'asd', N'123', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Korisnik] ([KorisnikID], [Username], [Password], [Email], [DatumUclanjenja], [Ime], [Prezime], [Telefon], [DatumRodj]) VALUES (15, N'kurac', N'kurac', N'kurac', CAST(N'0001-01-01' AS Date), N'kurac', N'kurac', N'123', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Korisnik] ([KorisnikID], [Username], [Password], [Email], [DatumUclanjenja], [Ime], [Prezime], [Telefon], [DatumRodj]) VALUES (16, N'kurcina', N'kurcina', N'kurcina', CAST(N'0001-01-01' AS Date), N'kuria', N'123', N'das', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Korisnik] ([KorisnikID], [Username], [Password], [Email], [DatumUclanjenja], [Ime], [Prezime], [Telefon], [DatumRodj]) VALUES (17, N'asd', N'asd', N'asd', CAST(N'0001-01-01' AS Date), N'asd', N'asd', N'123', CAST(N'0001-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Korisnik] OFF
GO
SET IDENTITY_INSERT [dbo].[KorisnikRola] ON 

INSERT [dbo].[KorisnikRola] ([KorisnikRolaID], [KorisnikID], [RolaID]) VALUES (1, 1, 1)
INSERT [dbo].[KorisnikRola] ([KorisnikRolaID], [KorisnikID], [RolaID]) VALUES (3, 4, 1)
INSERT [dbo].[KorisnikRola] ([KorisnikRolaID], [KorisnikID], [RolaID]) VALUES (4, 5, 2)
INSERT [dbo].[KorisnikRola] ([KorisnikRolaID], [KorisnikID], [RolaID]) VALUES (7, 17, 2)
SET IDENTITY_INSERT [dbo].[KorisnikRola] OFF
GO
SET IDENTITY_INSERT [dbo].[OceneKomentari] ON 

INSERT [dbo].[OceneKomentari] ([KomentarID], [Ocena], [Opis], [RestoranID], [KorisnikID]) VALUES (4, 3, N'Nije nesto', 2, 5)
INSERT [dbo].[OceneKomentari] ([KomentarID], [Ocena], [Opis], [RestoranID], [KorisnikID]) VALUES (14, 5, N'Mnogo dobra hrana1', 1, 1)
INSERT [dbo].[OceneKomentari] ([KomentarID], [Ocena], [Opis], [RestoranID], [KorisnikID]) VALUES (15, 4, N'Nije lose', 1, 1)
SET IDENTITY_INSERT [dbo].[OceneKomentari] OFF
GO
SET IDENTITY_INSERT [dbo].[Opstine] ON 

INSERT [dbo].[Opstine] ([opstinaID], [naziv]) VALUES (1, N'Novi Beograd')
INSERT [dbo].[Opstine] ([opstinaID], [naziv]) VALUES (2, N'Stari grad')
INSERT [dbo].[Opstine] ([opstinaID], [naziv]) VALUES (3, N'Palilula')
INSERT [dbo].[Opstine] ([opstinaID], [naziv]) VALUES (4, N'Rakovica')
INSERT [dbo].[Opstine] ([opstinaID], [naziv]) VALUES (5, N'Savski venac')
INSERT [dbo].[Opstine] ([opstinaID], [naziv]) VALUES (6, N'Vozdovac')
INSERT [dbo].[Opstine] ([opstinaID], [naziv]) VALUES (7, N'Vracar')
INSERT [dbo].[Opstine] ([opstinaID], [naziv]) VALUES (8, N'Zemun')
INSERT [dbo].[Opstine] ([opstinaID], [naziv]) VALUES (9, N'Cukarica')
INSERT [dbo].[Opstine] ([opstinaID], [naziv]) VALUES (10, N'Zvezdara')
INSERT [dbo].[Opstine] ([opstinaID], [naziv]) VALUES (11, N'Surcin')
SET IDENTITY_INSERT [dbo].[Opstine] OFF
GO
SET IDENTITY_INSERT [dbo].[Restoran] ON 

INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (1, N'12345678', N'Mag', N'Vidikovacki venac106', N'+381112335045', N'mag@gmail.com', N'asdasdasdasdasd', N'Content/Img/Restorani/restoran1.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2834.0536916876813!2d20.414708914921963!3d44.73892138956487!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a71f6e9749d05%3A0xd83cf8e1560622fd!2sPe%C4%8Denjara%20MAG!5e0!3m2!1ssr!2srs!4v1616171155923!5m2!1ssr!2srs', 4)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (2, N'12345679', N'PizzaBar', N'Bulevar Mihaila Pupina 165v', N'+381112225467', N'pizzabar@gmail.com', N'prilagođeno vegetarijancima, opcije za vegane, opcije bez glutena', N'Content/Img/Restorani/pizaBar.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3365.427425956347!2d20.41388137318341!3d44.82205646273419!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a657aaf992de9%3A0x879ee951a9d9be0b!2z0J_QuNGG0LAg0LHQsNGA!5e0!3m2!1ssr!2srs!4v1616354438341!5m2!1ssr!2srs', 1)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (3, N'12355376', N'Restoran picerija Snezana', N'Knez Mihailova 50', N'+381112635706', N'snezanar@gmail.com', N'prilagođeno vegetarijancima, opcije za vegane, opcije bez glutena', N'Content/Img/Restorani/snezana.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2830.1130900319645!2d20.45246791575103!3d44.81926068426478!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a654c8b97f287%3A0x75b6e88e257e6645!2zU25lxb5hbmE!5e0!3m2!1ssr!2srs!4v1616354545186!5m2!1ssr!2srs', 2)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (8, N'12315367', N'Vapiano', N'Bulevar Mihajla Pupina 4 ', N'+381 11 2854436', N'vapiano@gmail.com', N'prilagođeno vegetarijancima, opcije za vegane', N'Content/Img/Restorani/vapiano.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3365.8011323210017!2d20.435724985654765!3d44.81565417912205!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a655bb64a97d1%3A0xeda251b229e7abbb!2sVAPIANO!5e0!3m2!1ssr!2srs!4v1616354601132!5m2!1ssr!2srs', 1)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (9, N'23545780', N'Osteria Mozzarella', N'Urosa Martinovica 31', N'+381 69 750300', N'osteria@gmail.com', N'prilagođeno vegetarijancima, opcije za vegane', N'Content/Img/Restorani/osteria.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2830.780726300854!2d20.3975288157507!3d44.80565718516247!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a6f9b47038e6f%3A0xe2572a2b01770b50!2sOsteria%20Mozzarella!5e0!3m2!1ssr!2srs!4v1616354639554!5m2!1ssr!2srs', 1)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (10, N'23425367', N'LaPizza', N'Cara Nikolaja II 83', N'+381 65 9779979', N'pizza@gmail.com', N'prilagođeno vegetarijancima, opcije za vegane', N'Content/Img/Restorani/lapizza.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3454.1384070069603!2d20.48188606683058!3d44.79833288118401!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a70779966996f%3A0xe634706d771cc30!2sLa%20Piazza!5e1!3m2!1ssr!2srs!4v1616354860420!5m2!1ssr!2srs', 7)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (11, N'12463779', N'Fine Sushi Bar', N'Hadzi-Djerina 28 Vracar', N'+381 61 3152298', N'sushibar@gmail.com', N'prilagođeno vegetarijancima, opcije za vegane, opcije bez glutena', N'Content/Img/Restorani/sushi.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3453.8362039697918!2d20.47568651575067!3d44.803380885312635!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a7a9fad1e0beb%3A0x8033e9a99f4e5121!2sFine%20Sushi!5e1!3m2!1ssr!2srs!4v1616354959165!5m2!1ssr!2srs', 7)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (12, N'32547255', N'W Sushi', N'Vuka Karadžića 12', N'+381 69 663238', N'w@gmail.com', N'prilagođeno vegetarijancima, opcije za vegane, opcije bez glutena', N'Content/Img/Restorani/wsushi.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d27630.673875574215!2d20.460365631299233!3d44.80341378278621!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a654d24391955%3A0x4c03dce492c74262!2sW%20sushi%20restaurant%20%26%20cocktail%20bar!5e1!3m2!1ssr!2srs!4v1616355002643!5m2!1ssr!2srs', 2)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (15, N'25367895', N'Peking', N'Vuka Karadzica 2', N'+381 21 81931', N'peking@gmail.com', N'prilagođeno vegetarijancima', N'Content/Img/Restorani/peking.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3452.923931426165!2d20.454742315751044!3d44.81861678430728!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a654cca01e959%3A0x70390f4f5e2546c1!2z0J_QtdC60LjQvQ!5e1!3m2!1ssr!2srs!4v1616355057792!5m2!1ssr!2srs', 2)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (16, N'12452678', N'Ping Pong Centar', N'Vojvode Stepe 94g', N'+381 69 2634167', N'ping@gmail.com', N'doručak, ručak, večera, otvoreno noću, pića', N'Content/Img/Restorani/pingpong.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3455.219639556315!2d20.470340915750096!3d44.78026828683731!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a7aa8a3c00007%3A0xd3e73f46ac5ccd47!2sPing%20Pong%20Centar!5e1!3m2!1ssr!2srs!4v1616355235266!5m2!1ssr!2srs', 6)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (17, N'12412415', N'Dva Stapića', N'Bulevar Mihaila Pupina 4 ', N'+381 11 4043550', N'dvastapica@gmail.com', N'dostava na kućnu adresu, mesta za sedenje, dostupan parking, parking na ulici, služi alkohol, besplatan Wi-Fi', N'Content/Img/Restorani/stapici.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3453.107412673559!2d20.435026315750974!3d44.815552784509464!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a655bb905d9c9%3A0x72ca9dd17ac9ef82!2zRHZhIMWgdGFwacSHYSAtIFRDIFXFocSHZQ!5e1!3m2!1ssr!2srs!4v1616355342382!5m2!1ssr!2srs', 1)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (18, N'23567890', N'Restoran Durmitor', N'Omladinskih Brigada 16A,', N'+381 11 2602330', N'durmitor@gmail.com', N'prilagođeno vegetarijancima', N'Content/Img/Restorani/durmitor.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3452.703884627024!2d20.408636715751165!3d44.82229118406467!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a657a26b4e6b9%3A0xfb4054cfa32f729!2z0JTRg9GA0LzQuNGC0L7RgA!5e1!3m2!1ssr!2srs!4v1616355380155!5m2!1ssr!2srs', 1)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (19, N'33467367', N'Tri Sesira', N'Zadarska 29', N'+381 60 3130180', N'sesiri@gmail.com', N'prilagođeno vegetarijancima', N'Content/Img/Restorani/sesiri.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3452.948975042568!2d20.46256321575104!3d44.818198584334866!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a7ab6b04577b7%3A0x86e4d0906b4b9805!2z0KLRgNC4INGI0LXRiNC40YDQsA!5e1!3m2!1ssr!2srs!4v1616355408463!5m2!1ssr!2srs', 2)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (20, N'23526433', N'Madera', N'Bulevar Kralja Aleksandra 43', N'+381 11 3231332', N'madera@gmail.com', N'prilagođeno vegetarijancima, opcije za vegane, opcije bez glutena', N'Content/Img/Restorani/madera.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3453.5376027406733!2d20.467701815750694!3d44.80836828498347!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a7aa411e977e1%3A0x5b1e304247933796!2z0JzQsNC00LXRgNCw!5e1!3m2!1ssr!2srs!4v1616355439212!5m2!1ssr!2srs', 3)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (22, N'23523523', N'Careva Ćuprija', N'Boulevard Vojvode Miscica, 79', N'+381 11 3690144', N'careva@gmail.com', N'prilagođeno vegetarijancima,ručak, večera, branč, doručak ', N'Content/Img/Restorani/careva.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3454.852415879711!2d20.429860015750183!3d44.78640428643259!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a6fdf4f7cbdf3%3A0x67b91b824a7128e1!2z0KbQsNGA0LXQstCwINGb0YPQv9GA0LjRmNCw!5e1!3m2!1ssr!2srs!4v1616355474496!5m2!1ssr!2srs', 5)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (24, N'12412545', N'Cevap kod Dekija', N'Strahinjica Bana 71', N'+381 64 0000505', N'deki@gmail.com', N'ručak, večera', N'Content/Img/Restorani/deki.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3452.8424874993725!2d20.462201315751088!3d44.81997678421751!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a7ab4fd086e23%3A0x51957d982c2ca1a6!2s%C4%86evap%20kod%20Dekija!5e1!3m2!1ssr!2srs!4v1616355513182!5m2!1ssr!2srs', 2)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (25, N'14515155', N'Saran', N'Kej Oslobodenja 53', N'+381 11 2618235', N'saran@gmail.com', N'prilagođeno vegetarijancima, opcije bez glutena', N'Content/Img/Restorani/saran.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3451.1574195814765!2d20.410805415751742!3d44.848107782360465!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a65ac3af50113%3A0x73a1d3a3253f267a!2z0KjQsNGA0LDQvQ!5e1!3m2!1ssr!2srs!4v1616355559506!5m2!1ssr!2srs', 8)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (26, N'12412412', N'Fish&Bar
', N'Skadarska 49', N'+381 63 1032290', N'fish@gmail.com', N'Morska hrana, brza hrana, mediteranska', N'Content/Img/Restorani/fisbar.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13813.842631554237!2d20.46220124269889!3d44.80965338881276!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a7bb10dfa3f73%3A0x470f4095b04351d!2sFish%26Bar!5e1!3m2!1ssr!2srs!4v1616355592985!5m2!1ssr!2srs', 7)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (27, N'23653736', N'Burger House', N'Nikole Spasica 3', N'+381 11 4056658', N'house@gmail.com', N'hrana za poneti, letnja bašta, mesta za sedenje, služi alkohol, besplatan Wi-Fi, prihvata kreditne kartice, Usluga za stolom', N'Content/Img/Restorani/house.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3452.9352915016466!2d20.45254381575101!3d44.818427084319765!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a654ce55f19c7%3A0xd5082e3f1a03d98b!2sBurger%20House%20Bros.%20Centar!5e1!3m2!1ssr!2srs!4v1616355626787!5m2!1ssr!2srs', 2)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (28, N'32463790', N'Intergalactic Diner', N'Internacionalnih Brigada 22', N'+381 11 2434444', N'diner@gmail.com', N'američka, brza hrana, restoran sa jeftinom hranom', N'Content/Img/Restorani/diner.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3454.3437252932804!2d20.466903715750426!3d44.79490298587192!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a7072c5cdcd01%3A0x2fd683b57422b796!2z0JjQvdGC0LXRgNCz0LDQu9Cw0LrRgtC40Log0LTQsNGY0L3QtdGA!5e1!3m2!1ssr!2srs!4v1616355658862!5m2!1ssr!2srs', 7)
INSERT [dbo].[Restoran] ([RestoranID], [PIB], [Naziv], [Adresa], [Telefon], [Email], [Opis], [Slika], [Mapa], [Opstina]) VALUES (29, N'34634686', N'Burger Craft', N'Petrogradska 15 ', N'+381 60 7229995', N'craft@gmail.com', N'oručak, ručak, večera, branč, otvoreno noću, pića', N'Content/Img/Restorani/craft.jpg', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3454.024347501249!2d20.476042615750547!3d44.800238185520065!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x475a7aa9507afbbf%3A0xbb026f3ac78f8c17!2sBurgerCraft%20Beograd!5e1!3m2!1ssr!2srs!4v1616355691862!5m2!1ssr!2srs', 2)
SET IDENTITY_INSERT [dbo].[Restoran] OFF
GO
SET IDENTITY_INSERT [dbo].[Rola] ON 

INSERT [dbo].[Rola] ([RolaID], [Naziv]) VALUES (1, N'Administrator')
INSERT [dbo].[Rola] ([RolaID], [Naziv]) VALUES (2, N'Korisnik')
SET IDENTITY_INSERT [dbo].[Rola] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoviRestorana] ON 

INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (1, N'Tradicionalna', 1)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (2, N'Rostilj', 1)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (3, N'Pecenje', 1)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (4, N'Italijanska', 2)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (5, N'Pasta', 2)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (6, N'Pizza', 2)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (7, N'Italijanska', 3)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (8, N'Pizza', 3)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (9, N'Dezerti', 3)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (14, N'Brza hrana', 8)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (15, N'Italijanska', 8)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (16, N'Pasta', 8)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (17, N'Italijanska', 9)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (18, N'Mediteranska', 9)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (19, N'Dezerti', 9)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (20, N'Italijanska', 10)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (21, N'Mediteranska', 10)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (22, N'Pizza', 10)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (24, N'Azijska', 11)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (25, N'Sushi', 11)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (26, N'Japanska', 11)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (27, N'Azijska', 12)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (28, N'Japanska', 12)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (29, N'Sushi', 12)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (32, N'Azijska', 15)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (33, N'Japanska', 15)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (34, N'Sushi', 15)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (35, N'Azijska', 16)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (36, N'Japanska', 16)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (37, N'Sushi', 16)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (38, N'Azijska', 17)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (39, N'Japanska', 17)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (40, N'Sushi', 17)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (41, N'Tradicionalna', 18)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (43, N'Rostilj', 18)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (44, N'Pecenje', 18)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (45, N'Tradicionalna', 19)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (46, N'Rostilj', 19)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (47, N'Corbe', 19)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (48, N'Tradicionalna', 20)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (49, N'Pizza', 20)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (50, N'Pasta', 20)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (51, N'Morska ', 22)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (52, N'Mediteranska', 22)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (53, N'Morska', 24)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (54, N'Mediteranska', 24)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (55, N'Morska', 25)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (56, N'Mediteranska', 25)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (57, N'Morska', 26)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (58, N'Mediteranska', 26)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (59, N'Americka', 27)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (60, N'Brza hrana', 27)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (61, N'Palacinke', 27)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (62, N'Americka', 28)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (63, N'Brza hrana', 28)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (64, N'Palacinke', 28)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (65, N'Americka ', 29)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (66, N'Brza hrana', 29)
INSERT [dbo].[TipoviRestorana] ([TipId], [Naziv], [RestoranID]) VALUES (67, N'Palacinke', 29)
SET IDENTITY_INSERT [dbo].[TipoviRestorana] OFF
GO
ALTER TABLE [dbo].[KorisnikRola]  WITH CHECK ADD  CONSTRAINT [FK_KorisnikRola_Korisnik] FOREIGN KEY([KorisnikID])
REFERENCES [dbo].[Korisnik] ([KorisnikID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KorisnikRola] CHECK CONSTRAINT [FK_KorisnikRola_Korisnik]
GO
ALTER TABLE [dbo].[KorisnikRola]  WITH CHECK ADD  CONSTRAINT [FK_KorisnikRola_Rola] FOREIGN KEY([RolaID])
REFERENCES [dbo].[Rola] ([RolaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KorisnikRola] CHECK CONSTRAINT [FK_KorisnikRola_Rola]
GO
ALTER TABLE [dbo].[OceneKomentari]  WITH CHECK ADD  CONSTRAINT [FK_OceneKomentari_Korisnik] FOREIGN KEY([KorisnikID])
REFERENCES [dbo].[Korisnik] ([KorisnikID])
GO
ALTER TABLE [dbo].[OceneKomentari] CHECK CONSTRAINT [FK_OceneKomentari_Korisnik]
GO
ALTER TABLE [dbo].[OceneKomentari]  WITH CHECK ADD  CONSTRAINT [FK_OceneKomentari_Restoran] FOREIGN KEY([RestoranID])
REFERENCES [dbo].[Restoran] ([RestoranID])
GO
ALTER TABLE [dbo].[OceneKomentari] CHECK CONSTRAINT [FK_OceneKomentari_Restoran]
GO
ALTER TABLE [dbo].[Restoran]  WITH CHECK ADD  CONSTRAINT [FK_Restoran_Opstine] FOREIGN KEY([Opstina])
REFERENCES [dbo].[Opstine] ([opstinaID])
GO
ALTER TABLE [dbo].[Restoran] CHECK CONSTRAINT [FK_Restoran_Opstine]
GO
ALTER TABLE [dbo].[TipoviRestorana]  WITH CHECK ADD  CONSTRAINT [FK_TipoviRestorana_Restoran] FOREIGN KEY([RestoranID])
REFERENCES [dbo].[Restoran] ([RestoranID])
GO
ALTER TABLE [dbo].[TipoviRestorana] CHECK CONSTRAINT [FK_TipoviRestorana_Restoran]
GO
USE [master]
GO
ALTER DATABASE [GdeDaJedem] SET  READ_WRITE 
GO
