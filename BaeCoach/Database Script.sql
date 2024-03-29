USE [master]
GO
/****** Object:  Database [BaeCoach]    Script Date: 10/21/2019 10:47:29 PM ******/
CREATE DATABASE [BaeCoach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaeCoach', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BaeCoach.mdf' , SIZE = 8384KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BaeCoach_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BaeCoach_log.ldf' , SIZE = 64512KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BaeCoach] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaeCoach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BaeCoach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BaeCoach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BaeCoach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BaeCoach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BaeCoach] SET ARITHABORT OFF 
GO
ALTER DATABASE [BaeCoach] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BaeCoach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BaeCoach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BaeCoach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BaeCoach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BaeCoach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BaeCoach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BaeCoach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BaeCoach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BaeCoach] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BaeCoach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BaeCoach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BaeCoach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BaeCoach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BaeCoach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BaeCoach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BaeCoach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BaeCoach] SET RECOVERY FULL 
GO
ALTER DATABASE [BaeCoach] SET  MULTI_USER 
GO
ALTER DATABASE [BaeCoach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BaeCoach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BaeCoach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BaeCoach] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BaeCoach] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BaeCoach', N'ON'
GO
USE [BaeCoach]
GO
/****** Object:  Table [dbo].[Active]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Active](
	[ActiveID] [int] IDENTITY(1,1) NOT NULL,
	[ActiveDescription] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Coach]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coach](
	[CoachID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[FK_TitleID] [int] NULL,
	[FK_GenderID] [int] NULL,
	[FK_ActiveID] [int] NULL,
	[FK_CityID] [int] NULL,
	[LoginID] [int] NULL,
	[CoachExperience] [int] NULL,
	[University] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CoachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [smallint] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Code] [varchar](2) NOT NULL,
	[Language] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExperienceLevel]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExperienceLevel](
	[ExperienceID] [int] IDENTITY(1,1) NOT NULL,
	[ExperienceDescription] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExperienceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[GenderDescription] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[myUser]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[myUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[FK_TitleID] [int] NULL,
	[FK_GenderID] [int] NULL,
	[FK_RelationshipStatusIdn] [int] NULL,
	[FK_ActiveID] [int] NULL,
	[FK_CityID] [int] NULL,
	[LoginID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[PostText] [varchar](max) NOT NULL,
	[FK_UserID] [int] NULL,
	[Topic] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Regions](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[CountryId] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RelationshipStatus]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RelationshipStatus](
	[RelationshipStatusID] [int] IDENTITY(1,1) NOT NULL,
	[RelationshipStatusDescription] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RelationshipStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Response]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Response](
	[ResponseID] [int] IDENTITY(1,1) NOT NULL,
	[RespronsText] [varchar](max) NOT NULL,
	[FK_CoachID] [int] NULL,
	[FK_ResponseID] [int] NULL,
	[FK_PostID] [int] NULL,
	[Topic] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ResponseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Title]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Title](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[Titledescription] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Topics](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[TopicName] [varchar](50) NOT NULL,
	[ImageLinks] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[University]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[University](
	[UniversityID] [int] IDENTITY(1,1) NOT NULL,
	[UniversityName] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UniversityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userLogin]    Script Date: 10/21/2019 10:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userLogin](
	[UserLoginID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[UserPassword] [varchar](50) NULL,
	[LoginType] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserLoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Active] ON 

INSERT [dbo].[Active] ([ActiveID], [ActiveDescription]) VALUES (1, N'Active')
INSERT [dbo].[Active] ([ActiveID], [ActiveDescription]) VALUES (2, N'Inactive')
SET IDENTITY_INSERT [dbo].[Active] OFF
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (1, 1, N'Aix?s')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (2, 1, N'Aixirivali')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (3, 1, N'Aixirivall')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (4, 1, N'Aixirvall')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (5, 1, N'Aixovall')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (6, 2, N'Andorra')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (7, 2, N'Andorra la Vella')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (8, 2, N'Andorra-Vieille')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (9, 2, N'Andorre')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (10, 2, N'Andorre-la-Vieille')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (11, 2, N'Andorre-Vieille')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (12, 3, N'Ansalonga')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (13, 4, N'Any?s')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (14, 3, N'Arans')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (15, 3, N'Arinsal')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (16, 1, N'Aubiny?')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (17, 1, N'Auvinya')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (18, 1, N'Bi?isarri')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (19, 1, N'Bixessarri')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (20, 1, N'Bixisarri')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (21, 5, N'Canillo')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (22, 6, N'Casas Vila')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (23, 1, N'Certers')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (24, 1, N'Cert?s')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (25, 1, N'Eixirivall')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (26, 3, N'El Pui')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (27, 6, N'Els Bons')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (28, 3, N'El Serrat')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (29, 5, N'Els Plans')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (30, 5, N'El Tarter')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (31, 6, N'El Tremat')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (32, 5, N'El Vilar')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (33, 6, N'Encamp')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (34, 7, N'Engordany')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (35, 3, N'Ercs')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (36, 3, N'Ercz')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (37, 3, N'Erez')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (38, 3, N'Erts')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (39, 7, N'Escaldas')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (40, 7, N'Escaldes')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (41, 3, N'Esc?s')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (42, 1, N'Fontaneda')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (43, 1, N'Juberri')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (44, 1, N'Juverri')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (45, 3, N'La Cortinada')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (46, 5, N'La Costa')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (47, 5, N'L''Aldosa')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (48, 4, N'L''Aldosa')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (49, 3, N'La Ma?ana')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (50, 3, N'La Massana')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (51, 7, N'Las Escadas')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (52, 2, N'la Vieja')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (53, 6, N'Les Bons')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (54, 7, N'Les Escaldes')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (55, 3, N'Llors')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (56, 3, N'Llorta')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (57, 3, N'Llorts')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (58, 1, N'Llumeneres')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (59, 3, N'Lors')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (60, 3, N'Lo Serrat')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (61, 1, N'Mas d''Alins')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (62, 3, N'Mas de Ribafeta')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (63, 5, N'Meritxell')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (64, 6, N'Molleres')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (65, 6, N'Mosquera')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (66, 1, N'Nagol')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (67, 4, N'Ordino')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (68, 3, N'Pal')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (69, 5, N'Pas de la Casa')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (70, 5, N'Prats')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (71, 3, N'Puiol del Piu')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (72, 5, N'Ransol')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (73, 5, N'Sanctuaire de Meritxeli')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (74, 5, N'Sanctuaire de Meritxell')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (75, 5, N'San Joan de Casettas')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (76, 1, N'San Juli?')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (77, 2, N'Santa Coloma')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (78, 1, N'Santa Juli? de Loria')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (79, 5, N'Sant Joan de Casellas')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (80, 5, N'Sant Joan de Caselles')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (81, 1, N'Sant Juli? de L?ria')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (82, 1, N'Sant Juli?')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (83, 5, N'Sant Pere')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (84, 5, N'Santuari de Meritxell')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (85, 4, N'Segudet')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (86, 1, N'Sertes')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (87, 3, N'Sispony')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (88, 5, N'Soldeu')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (89, 4, N'Sorn?s')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (90, 6, N'Vila')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (91, 1, N'Vixesarri')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (92, 3, N'Xixerella')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (93, 8, N'`Abadilah')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (94, 9, N'Abu Dabi')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (95, 9, N'Abu Dhabi')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (96, 10, N'Abu Hail')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (97, 10, N'Abu Hayl')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (98, 9, N'Abu Zabi')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (99, 9, N'Abu Zaby')
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (100, 9, N'Abu Zabye')
GO
INSERT [dbo].[Cities] ([Id], [RegionId], [Name]) VALUES (101, 101, N'Pretoria')
SET IDENTITY_INSERT [dbo].[Coach] ON 

INSERT [dbo].[Coach] ([CoachID], [Name], [Surname], [Username], [FK_TitleID], [FK_GenderID], [FK_ActiveID], [FK_CityID], [LoginID], [CoachExperience], [University]) VALUES (3, N'Bruce', N'Liu', N'bruce@gmail.com', 1, 1, 1, 101, NULL, 3, 11364)
INSERT [dbo].[Coach] ([CoachID], [Name], [Surname], [Username], [FK_TitleID], [FK_GenderID], [FK_ActiveID], [FK_CityID], [LoginID], [CoachExperience], [University]) VALUES (4, N'Lali', N'Ledwaba', N'lali@gmail.com', 3, 2, 1, 101, NULL, 3, 11364)
INSERT [dbo].[Coach] ([CoachID], [Name], [Surname], [Username], [FK_TitleID], [FK_GenderID], [FK_ActiveID], [FK_CityID], [LoginID], [CoachExperience], [University]) VALUES (5, N'Annie', N'Mare', N'annie@gmail.com', 3, 2, 1, 101, NULL, 1, 11364)
SET IDENTITY_INSERT [dbo].[Coach] OFF
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (1, N'Andorra', N'AD', N'ca')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (2, N'United Arab Emirates', N'AE', N'ar')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (3, N'Afghanistan', N'AF', N'fa')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (4, N'Antigua and Barbuda', N'AG', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (5, N'Anguilla', N'AI', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (6, N'Albania', N'AL', N'sq')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (7, N'Armenia', N'AM', N'hy')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (8, N'Netherlands Antilles', N'AN', N'nl')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (9, N'Angola', N'AO', N'pt')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (10, N'Argentina', N'AR', N'es')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (11, N'Austria', N'AT', N'de')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (12, N'Australia', N'AU', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (13, N'Aruba', N'AW', N'nl')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (14, N'Azerbaijan', N'AZ', N'az')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (15, N'Bosnia and Herzegovina', N'BA', N'bs')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (16, N'Barbados', N'BB', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (17, N'Bangladesh', N'BD', N'bn')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (18, N'Belgium', N'BE', N'nl')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (19, N'Burkina Faso', N'BF', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (20, N'Bulgaria', N'BG', N'bg')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (21, N'Bahrain', N'BH', N'ar')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (22, N'Burundi', N'BI', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (23, N'Benin', N'BJ', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (24, N'Bermuda', N'BM', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (25, N'Brunei Darussalam', N'BN', N'ms')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (26, N'Bolivia', N'BO', N'es')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (27, N'Brazil', N'BR', N'pt')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (28, N'Bahamas', N'BS', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (29, N'Bhutan', N'BT', N'dz')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (30, N'Botswana', N'BW', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (31, N'Belarus', N'BY', N'be')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (32, N'Belize', N'BZ', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (33, N'Canada', N'CA', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (34, N'Cocos (Keeling) Islands', N'CC', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (35, N'Democratic Republic of the Congo', N'CD', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (36, N'Central African Republic', N'CF', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (37, N'Congo', N'CG', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (38, N'Switzerland', N'CH', N'de')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (39, N'Cote D''Ivoire (Ivory Coast)', N'CI', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (40, N'Cook Islands', N'CK', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (41, N'Chile', N'CL', N'es')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (42, N'Cameroon', N'CM', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (43, N'China', N'CN', N'zh')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (44, N'Colombia', N'CO', N'es')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (45, N'Costa Rica', N'CR', N'es')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (46, N'Cuba', N'CU', N'es')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (47, N'Cape Verde', N'CV', N'pt')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (48, N'Christmas Island', N'CX', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (49, N'Cyprus', N'CY', N'el')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (50, N'Czech Republic', N'CZ', N'cs')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (51, N'Germany', N'DE', N'de')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (52, N'Djibouti', N'DJ', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (53, N'Denmark', N'DK', N'da')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (54, N'Dominica', N'DM', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (55, N'Dominican Republic', N'DO', N'es')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (56, N'Algeria', N'DZ', N'ar')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (57, N'Ecuador', N'EC', N'es')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (58, N'Estonia', N'EE', N'et')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (59, N'Egypt', N'EG', N'ar')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (60, N'Western Sahara', N'EH', N'ar')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (61, N'Eritrea', N'ER', N'ti')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (62, N'Spain', N'ES', N'es')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (63, N'Ethiopia', N'ET', N'am')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (64, N'Finland', N'FI', N'fi')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (65, N'Fiji', N'FJ', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (66, N'Falkland Islands (Malvinas)', N'FK', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (67, N'Federated States of Micronesia', N'FM', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (68, N'Faroe Islands', N'FO', N'fo')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (69, N'France', N'FR', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (70, N'Gabon', N'GA', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (71, N'Great Britain (UK)', N'GB', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (72, N'Grenada', N'GD', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (73, N'Georgia', N'GE', N'ka')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (74, N'French Guiana', N'GF', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (75, N'Guernsey', N'GG', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (76, N'Ghana', N'GH', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (77, N'Gibraltar', N'GI', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (78, N'Greenland', N'GL', N'kl')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (79, N'Gambia', N'GM', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (80, N'Guinea', N'GN', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (81, N'Guadeloupe', N'GP', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (82, N'Equatorial Guinea', N'GQ', N'es')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (83, N'Greece', N'GR', N'el')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (84, N'S. Georgia and S. Sandwich Islands', N'GS', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (85, N'Guatemala', N'GT', N'es')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (86, N'Guinea-Bissau', N'GW', N'pt')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (87, N'Guyana', N'GY', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (88, N'Hong Kong', N'HK', N'zh')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (89, N'Honduras', N'HN', N'es')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (90, N'Croatia (Hrvatska)', N'HR', N'hr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (91, N'Haiti', N'HT', N'fr')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (92, N'Hungary', N'HU', N'hu')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (93, N'Indonesia', N'ID', N'id')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (94, N'Ireland', N'IE', N'en')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (95, N'Israel', N'IL', N'he')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (96, N'India', N'IN', N'hi')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (97, N'Iraq', N'IQ', N'ar')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (98, N'Iran', N'IR', N'fa')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (99, N'Iceland', N'IS', N'is')
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (100, N'Italy', N'IT', N'it')
GO
INSERT [dbo].[Countries] ([Id], [Name], [Code], [Language]) VALUES (101, N'South Africa', N'ZA', N'en')
SET IDENTITY_INSERT [dbo].[ExperienceLevel] ON 

INSERT [dbo].[ExperienceLevel] ([ExperienceID], [ExperienceDescription]) VALUES (1, N'Beginner')
INSERT [dbo].[ExperienceLevel] ([ExperienceID], [ExperienceDescription]) VALUES (2, N'Intermediate')
INSERT [dbo].[ExperienceLevel] ([ExperienceID], [ExperienceDescription]) VALUES (3, N'Expert')
SET IDENTITY_INSERT [dbo].[ExperienceLevel] OFF
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([GenderID], [GenderDescription]) VALUES (1, N'Male')
INSERT [dbo].[Gender] ([GenderID], [GenderDescription]) VALUES (2, N'Female')
INSERT [dbo].[Gender] ([GenderID], [GenderDescription]) VALUES (3, N'Other')
INSERT [dbo].[Gender] ([GenderID], [GenderDescription]) VALUES (4, N'Male')
INSERT [dbo].[Gender] ([GenderID], [GenderDescription]) VALUES (5, N'Female')
INSERT [dbo].[Gender] ([GenderID], [GenderDescription]) VALUES (6, N'Other')
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[myUser] ON 

INSERT [dbo].[myUser] ([UserID], [Name], [Surname], [Username], [FK_TitleID], [FK_GenderID], [FK_RelationshipStatusIdn], [FK_ActiveID], [FK_CityID], [LoginID]) VALUES (1, N'Charl', N'Swartz', N'çharlswartz', 1, 1, 1, 2, 1, 1)
INSERT [dbo].[myUser] ([UserID], [Name], [Surname], [Username], [FK_TitleID], [FK_GenderID], [FK_RelationshipStatusIdn], [FK_ActiveID], [FK_CityID], [LoginID]) VALUES (2, N'Annie', N'Bananie', N'anbun@gmail.com', 1, 1, 1, 1, 1, NULL)
INSERT [dbo].[myUser] ([UserID], [Name], [Surname], [Username], [FK_TitleID], [FK_GenderID], [FK_RelationshipStatusIdn], [FK_ActiveID], [FK_CityID], [LoginID]) VALUES (3, N'Ndlali', N'Ledwaba', N'Lallie@gail.com', 3, 2, 3, 1, 1, NULL)
INSERT [dbo].[myUser] ([UserID], [Name], [Surname], [Username], [FK_TitleID], [FK_GenderID], [FK_RelationshipStatusIdn], [FK_ActiveID], [FK_CityID], [LoginID]) VALUES (4, N'Charl', N'Swartz', N'charlswartz@gmail.com', 1, 1, 3, 1, 101, NULL)
INSERT [dbo].[myUser] ([UserID], [Name], [Surname], [Username], [FK_TitleID], [FK_GenderID], [FK_RelationshipStatusIdn], [FK_ActiveID], [FK_CityID], [LoginID]) VALUES (5, N'Izaan', N'van Zyl', N'izaan@gmail.com', 3, 2, 1, NULL, 101, NULL)
SET IDENTITY_INSERT [dbo].[myUser] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [PostText], [FK_UserID], [Topic]) VALUES (4, N'My husband hurts me', 2, 2)
INSERT [dbo].[Post] ([PostID], [PostText], [FK_UserID], [Topic]) VALUES (5, N'We don''t communicate like we use to. What can I do?', 1, 3)
INSERT [dbo].[Post] ([PostID], [PostText], [FK_UserID], [Topic]) VALUES (6, N'I have an abusive wife. Help!', 1, 2)
INSERT [dbo].[Post] ([PostID], [PostText], [FK_UserID], [Topic]) VALUES (7, N'I''m being abused. I''m to scared to leave, because he will find me. What can I do?', 2, 2)
INSERT [dbo].[Post] ([PostID], [PostText], [FK_UserID], [Topic]) VALUES (8, N'Why am I an abusive partner. I don''t wanna her my partner anymore. I need help. Can someone help me?', 1, 2)
INSERT [dbo].[Post] ([PostID], [PostText], [FK_UserID], [Topic]) VALUES (9, N'Communication is dead in our relationship. How can we fix it?', 1, 3)
INSERT [dbo].[Post] ([PostID], [PostText], [FK_UserID], [Topic]) VALUES (10, N'INF272 has abused my mind.', 1, 2)
SET IDENTITY_INSERT [dbo].[Post] OFF
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (1, N'Sant Julia de Loria', 1)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (2, N'Andorra la Vella', 1)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (3, N'La Massana', 1)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (4, N'Ordino', 1)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (5, N'Canillo', 1)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (6, N'Encamp', 1)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (7, N'Escaldes-Engordany', 1)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (8, N'Fujairah', 2)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (9, N'Abu Dhabi', 2)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (10, N'Dubai', 2)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (11, N'Ras Al Khaimah', 2)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (12, N'Umm Al Quwain', 2)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (13, N'Sharjah', 2)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (14, N'Ajman', 2)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (15, N'Paktika', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (16, N'Farah', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (17, N'Helmand', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (18, N'Kondoz', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (19, N'Bamian', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (20, N'Ghowr', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (21, N'Laghman', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (22, N'', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (23, N'Ghazni', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (24, N'Vardak', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (25, N'Oruzgan', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (26, N'Zabol', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (27, N'Badghis', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (28, N'Badakhshan', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (29, N'Faryab', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (30, N'Takhar', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (31, N'Lowgar', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (32, N'Herat', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (33, N'Daykondi', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (34, N'Sar-e Pol', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (35, N'Balkh', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (36, N'Kabol', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (37, N'Nimruz', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (38, N'Kandahar', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (39, N'Khowst', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (40, N'', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (41, N'Kapisa', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (42, N'Nangarhar', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (43, N'Samangan', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (44, N'Paktia', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (45, N'Baghlan', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (46, N'Jowzjan', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (47, N'Konar', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (48, N'Nurestan', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (49, N'', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (50, N'', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (51, N'', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (52, N'Panjshir', 3)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (53, N'Saint John', 4)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (54, N'Saint Paul', 4)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (55, N'Saint George', 4)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (56, N'Saint Peter', 4)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (57, N'Saint Mary', 4)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (58, N'Barbuda', 4)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (59, N'Saint Philip', 4)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (60, N'', 5)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (61, N'Vlore', 6)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (62, N'Korce', 6)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (63, N'Shkoder', 6)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (64, N'Durres', 6)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (65, N'Elbasan', 6)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (66, N'Kukes', 6)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (67, N'Fier', 6)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (68, N'Berat', 6)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (69, N'Gjirokaster', 6)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (70, N'Tirane', 6)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (71, N'Lezhe', 6)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (72, N'Diber', 6)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (73, N'Aragatsotn', 7)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (74, N'Ararat', 7)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (75, N'Kotayk''', 7)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (76, N'Tavush', 7)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (77, N'Syunik''', 7)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (78, N'Geghark''unik''', 7)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (79, N'Vayots'' Dzor', 7)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (80, N'Lorri', 7)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (81, N'Armavir', 7)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (82, N'Yerevan', 7)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (83, N'Shirak', 7)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (84, N'', 8)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (85, N'Benguela', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (86, N'Uige', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (87, N'Bengo', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (88, N'Cuanza Norte', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (89, N'Malanje', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (90, N'Cuanza Sul', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (91, N'Huambo', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (92, N'Moxico', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (93, N'Cuando Cubango', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (94, N'Bie', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (95, N'Huila', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (96, N'Lunda Sul', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (97, N'', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (98, N'Zaire', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (99, N'Cunene', 9)
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (100, N'Lunda Norte', 9)
GO
INSERT [dbo].[Regions] ([Id], [Name], [CountryId]) VALUES (101, N'Gauteng', 101)
SET IDENTITY_INSERT [dbo].[RelationshipStatus] ON 

INSERT [dbo].[RelationshipStatus] ([RelationshipStatusID], [RelationshipStatusDescription]) VALUES (1, N'Married')
INSERT [dbo].[RelationshipStatus] ([RelationshipStatusID], [RelationshipStatusDescription]) VALUES (2, N'In a Relationship')
INSERT [dbo].[RelationshipStatus] ([RelationshipStatusID], [RelationshipStatusDescription]) VALUES (3, N'Single')
INSERT [dbo].[RelationshipStatus] ([RelationshipStatusID], [RelationshipStatusDescription]) VALUES (4, N'Its Complicated')
SET IDENTITY_INSERT [dbo].[RelationshipStatus] OFF
SET IDENTITY_INSERT [dbo].[Response] ON 

INSERT [dbo].[Response] ([ResponseID], [RespronsText], [FK_CoachID], [FK_ResponseID], [FK_PostID], [Topic]) VALUES (2, N'Get over it', 3, NULL, 4, 2)
INSERT [dbo].[Response] ([ResponseID], [RespronsText], [FK_CoachID], [FK_ResponseID], [FK_PostID], [Topic]) VALUES (3, N'You will be OK', 3, 2, 4, 2)
INSERT [dbo].[Response] ([ResponseID], [RespronsText], [FK_CoachID], [FK_ResponseID], [FK_PostID], [Topic]) VALUES (4, N'Get yourself a Mr Bruce.', 3, 2, 10, 1)
INSERT [dbo].[Response] ([ResponseID], [RespronsText], [FK_CoachID], [FK_ResponseID], [FK_PostID], [Topic]) VALUES (5, N'Tell her to Stop!', 3, 2, 6, 1)
INSERT [dbo].[Response] ([ResponseID], [RespronsText], [FK_CoachID], [FK_ResponseID], [FK_PostID], [Topic]) VALUES (6, N'Move out of the house. Call your mom.', 3, 2, 4, 1)
INSERT [dbo].[Response] ([ResponseID], [RespronsText], [FK_CoachID], [FK_ResponseID], [FK_PostID], [Topic]) VALUES (7, N'Call the police.', 3, 2, 4, 1)
INSERT [dbo].[Response] ([ResponseID], [RespronsText], [FK_CoachID], [FK_ResponseID], [FK_PostID], [Topic]) VALUES (8, N'Please contact someone you trust to get you away from there', 3, 2, 4, 1)
INSERT [dbo].[Response] ([ResponseID], [RespronsText], [FK_CoachID], [FK_ResponseID], [FK_PostID], [Topic]) VALUES (14, N'Therapy', 3, 2, 8, 2)
SET IDENTITY_INSERT [dbo].[Response] OFF
SET IDENTITY_INSERT [dbo].[Title] ON 

INSERT [dbo].[Title] ([TitleID], [Titledescription]) VALUES (1, N'Mr')
INSERT [dbo].[Title] ([TitleID], [Titledescription]) VALUES (2, N'Mrs')
INSERT [dbo].[Title] ([TitleID], [Titledescription]) VALUES (3, N'Miss')
INSERT [dbo].[Title] ([TitleID], [Titledescription]) VALUES (4, N'Ms')
INSERT [dbo].[Title] ([TitleID], [Titledescription]) VALUES (5, N'Mx')
INSERT [dbo].[Title] ([TitleID], [Titledescription]) VALUES (6, N'Dr')
INSERT [dbo].[Title] ([TitleID], [Titledescription]) VALUES (7, N'Prof')
INSERT [dbo].[Title] ([TitleID], [Titledescription]) VALUES (8, N'Pr')
INSERT [dbo].[Title] ([TitleID], [Titledescription]) VALUES (9, N'Fr')
SET IDENTITY_INSERT [dbo].[Title] OFF
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (1, N'Alcholism', N'	https://www.addictioncenter.com/app/uploads/2018/09/AdobeStock_175229643.jpeg	')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (2, N'Abuse', N'	https://www.helpguide.org/wp-content/uploads/2018/11/abuse-500.jpg ')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (3, N'Bad Communication', N'	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2uK2DHWh4ml-mz1Buq-FEZU6Uev8_yNVkeTSbxzXSATaBY_KkfQ	')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (4, N'Frequent arguing', N'	https://timedotcom.files.wordpress.com/2018/12/GettyImages-YLI_048.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (5, N'Disagreements', N'	http://www.zumi.ng/wp-content/uploads/2018/06/African-American-Couple-Arguing-in-Bed-1024x683.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (6, N'Cheating', N'	https://markmanson.net/wp-content/uploads/2015/04/cheating.jpg ')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (7, N'Jealousy', N'	https://images.lifealth.com/uploads/2018/01/Characteristics-of-Excessive-Jealousy-in-a-Relationship.jpg	')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (8, N'Addiction', N'	https://nationalpostcom.files.wordpress.com/2019/01/addict.jpg?quality=80&strip=all&w=780 ')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (9, N'Lack of Support', N'	https://www.rnz.co.nz/assets/news/176471/eight_col_suicide.jpg?1541714702')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (10, N'Family', N'	https://www.eharmony.co.uk/relationship-advice/wp-content/uploads/2012/06/in_laws_600x369.jpg ')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (11, N'Insecurities', N'	https://www.talkspace.com/blog/wp-content/uploads/2019/03/overcome-your-insecurities_660W_JW-1.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (12, N'Lack of attention', N'	https://www.verywellmind.com/thmb/AWdH8CGWk_CvXUAAlHhr89Wb9BE=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/young-woman-sitting-on-sofa--looking-at-distressed-man-at-table-74583142-5a7f74226bf06900374afa0a.jpg ')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (13, N'Financial Problems', N'	https://www.nationaldebtrelief.com/wp-content/uploads/2013/07/How-To-Use-Financial-Management-As-A-Debt-Solution.jpeg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (14, N'Friends', N'	https://www.missnowmrs.com/Newlywed-Blog/wp-content/uploads/2010/07/Newlywed-Bromance-Issue.jpg ')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (15, N'Commitment Issues', N'	https://hips.hearstapps.com/cos.h-cdn.co/assets/14/50/1600x800/landscape_nrm_1418407059-committment.jpeg?resize=480:*')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (16, N'Respect', N'	https://j36ify8omo-flywheel.netdna-ssl.com/wp-content/uploads/2017/04/When-Your-Spouse-Wont-Change-blog-size.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (17, N'Self Esteem', N'	https://www.healthyplace.com/sites/default/files/uploads/2015/01/low-selfesteem.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (18, N'Anger Management', N'	http://dreamstop.com/wp-content/uploads/2013/07/Screaming-Dream-meaning.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [ImageLinks]) VALUES (19, N'Psychological Disorders', N'	https://i1.wp.com/www.manwants.co.uk/wp-content/uploads/2017/07/anxiety.png?fit=590%2C374')
SET IDENTITY_INSERT [dbo].[Topics] OFF
SET IDENTITY_INSERT [dbo].[University] ON 

INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (1, N'	University of Andorra	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (2, N'	Abu Dhabi University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (3, N'	Ajman University of Science & Technology	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (4, N'	Alain University of Science and Technology	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (5, N'	Al Ghurair University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (6, N'	Alhosn University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (7, N'	Al Khawarizmi International College	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (8, N'	American College Of Dubai	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (9, N'	American University in Dubai	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (10, N'	American University in the Emirates	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (11, N'	American University of Sharjah	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (12, N'	British University in Dubai	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (13, N'	Dubai Medical College for Girls	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (14, N'	Dubai Pharmacy College	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (15, N'	Etisalat University College	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (16, N'	Gulf Medical University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (17, N'	Hamdan Bin Mohammed e-University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (18, N'	Higher Colleges of Technology	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (19, N'	Ittihad University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (20, N'	Jumeira University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (21, N'	Khalifa University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (22, N'	Khalifa University of Science, Technology and Research	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (23, N'	Masdar University Of Science And Technology	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (24, N'	New York University, Abu Dhabi	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (25, N'	Paris-Sorbonne University Abu Dhabi	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (26, N'	Rak Medical & Health Sciences University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (27, N'	Rochester Institute of Technology, Dubai	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (28, N'	Skyline University College, Sharjah	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (29, N'	Synergy University, Dubai Campus	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (30, N'	The Emirates Academy of Hotel Managment	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (31, N'	The Petroleum Institute	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (32, N'	United Arab Emirates University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (33, N'	University Of Dubai	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (34, N'	University of Jazeera	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (35, N'	University of Sharjah	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (36, N'	University of Wollongong - Dubai Campus	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (37, N'	Zayed University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (38, N'	Afghan University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (39, N'	Al-Birony University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (40, N'	American University of Afghanistan	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (41, N'	Aria Institute of Higher Education	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (42, N'	Badakhshan University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (43, N'	Baghlan University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (44, N'	Bakhtar University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (45, N'	Balkh University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (46, N'	Bamiyan University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (47, N'	Bost University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (48, N'	Dawat University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (49, N'	Dunya Institute of Higher Education	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (50, N'	Faryab Higher Education Institute	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (51, N'	Ghazni University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (52, N'	Herat University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (53, N'	Ibn Sina University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (54, N'	Jawzjan University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (55, N'	Kaboora Institute of Higher Education	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (56, N'	Kabul Education University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (57, N'	Kabul Health Sciences Institute	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (58, N'	Kabul Medical University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (59, N'	Kabul University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (60, N'	Kandahar University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (61, N'	Kardan University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (62, N'	Karwan Institute of Higher Education	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (63, N'	Kateb Institute of Higher Education	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (64, N'	Khana-e-Noor Institute of Higher Education	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (65, N'	Khurasan University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (66, N'	Maryam Institute of Higher Education	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (67, N'	Nangarhar University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (68, N'	National Military Academy of Afghanistan	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (69, N'	Paktia University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (70, N'	Pamir University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (71, N'	Parwan University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (72, N'	Polytechnical University of Kabul	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (73, N'	Rana Institute of Higher Education	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (74, N'	Sadat Institute of Higher Education	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (75, N'	Salam University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (76, N'	Shaikh Zayed University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (77, N'	Taj Institute of Higher Education	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (78, N'	Takhar University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (79, N'	American University of Antigua	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (80, N'	University of Health Sciences Antigua	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (81, N'	Academy of Arts	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (82, N'	Academy of Sports and Physical Training	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (83, N'	Agricultural University of Tirane	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (84, N'	American University of Tirana	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (85, N'	Beder University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (86, N'	Epoka University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (87, N'	Polytechnic University of Tirane	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (88, N'	University of Elbasan "Aleksander Xhuvani"	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (89, N'	University of Gjirokstra "Eqerem Cabej"	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (90, N'	University of Korca "Fan Noli"	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (91, N'	University of New York Tirana	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (92, N'	University of Shkodra "Luigj Gurakuqi"	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (93, N'	University of Tirana	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (94, N'	University of Vlora "Ismail Qemali"	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (95, N'	University “Pavaresia” Vlore	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (96, N'	American University of Armenia	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (97, N'	Armenian State Agrarian University	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (98, N'	Armenian State University of Economics	')
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (99, N'	Eurasia International University	')
GO
INSERT [dbo].[University] ([UniversityID], [UniversityName]) VALUES (11364, N'University of Pretoria')
SET IDENTITY_INSERT [dbo].[University] OFF
SET IDENTITY_INSERT [dbo].[userLogin] ON 

INSERT [dbo].[userLogin] ([UserLoginID], [Username], [UserPassword], [LoginType]) VALUES (1, N'anbun@gmail.com', N'04f8996da763b7a969b1028ee3007569eaf3a635486ddab21', 0)
INSERT [dbo].[userLogin] ([UserLoginID], [Username], [UserPassword], [LoginType]) VALUES (2, N'Lallie@gail.com', N'04f8996da763b7a969b1028ee3007569eaf3a635486ddab21', 0)
INSERT [dbo].[userLogin] ([UserLoginID], [Username], [UserPassword], [LoginType]) VALUES (4, N'bruce@gmail.com', N'04f8996da763b7a969b1028ee3007569eaf3a635486ddab21', 1)
INSERT [dbo].[userLogin] ([UserLoginID], [Username], [UserPassword], [LoginType]) VALUES (5, N'charlswartz@gmail.com', N'04f8996da763b7a969b1028ee3007569eaf3a635486ddab21', 0)
INSERT [dbo].[userLogin] ([UserLoginID], [Username], [UserPassword], [LoginType]) VALUES (6, N'lali@gmail.com', N'04f8996da763b7a969b1028ee3007569eaf3a635486ddab21', 1)
INSERT [dbo].[userLogin] ([UserLoginID], [Username], [UserPassword], [LoginType]) VALUES (7, N'annie@gmail.com', N'04f8996da763b7a969b1028ee3007569eaf3a635486ddab21', 1)
INSERT [dbo].[userLogin] ([UserLoginID], [Username], [UserPassword], [LoginType]) VALUES (8, N'izaan@gmail.com', N'04f8996da763b7a969b1028ee3007569eaf3a635486ddab21', 0)
SET IDENTITY_INSERT [dbo].[userLogin] OFF
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Regions] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Regions] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Regions]
GO
ALTER TABLE [dbo].[Coach]  WITH CHECK ADD FOREIGN KEY([CoachExperience])
REFERENCES [dbo].[ExperienceLevel] ([ExperienceID])
GO
ALTER TABLE [dbo].[Coach]  WITH CHECK ADD FOREIGN KEY([FK_ActiveID])
REFERENCES [dbo].[Active] ([ActiveID])
GO
ALTER TABLE [dbo].[Coach]  WITH CHECK ADD FOREIGN KEY([FK_CityID])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Coach]  WITH CHECK ADD FOREIGN KEY([FK_GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[Coach]  WITH CHECK ADD FOREIGN KEY([FK_TitleID])
REFERENCES [dbo].[Title] ([TitleID])
GO
ALTER TABLE [dbo].[Coach]  WITH CHECK ADD FOREIGN KEY([LoginID])
REFERENCES [dbo].[userLogin] ([UserLoginID])
GO
ALTER TABLE [dbo].[Coach]  WITH CHECK ADD FOREIGN KEY([University])
REFERENCES [dbo].[University] ([UniversityID])
GO
ALTER TABLE [dbo].[myUser]  WITH CHECK ADD FOREIGN KEY([FK_ActiveID])
REFERENCES [dbo].[Active] ([ActiveID])
GO
ALTER TABLE [dbo].[myUser]  WITH CHECK ADD FOREIGN KEY([FK_CityID])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[myUser]  WITH CHECK ADD FOREIGN KEY([FK_GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[myUser]  WITH CHECK ADD FOREIGN KEY([FK_RelationshipStatusIdn])
REFERENCES [dbo].[RelationshipStatus] ([RelationshipStatusID])
GO
ALTER TABLE [dbo].[myUser]  WITH CHECK ADD FOREIGN KEY([FK_TitleID])
REFERENCES [dbo].[Title] ([TitleID])
GO
ALTER TABLE [dbo].[myUser]  WITH CHECK ADD FOREIGN KEY([LoginID])
REFERENCES [dbo].[userLogin] ([UserLoginID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([FK_UserID])
REFERENCES [dbo].[myUser] ([UserID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([Topic])
REFERENCES [dbo].[Topics] ([TopicID])
GO
ALTER TABLE [dbo].[Regions]  WITH CHECK ADD  CONSTRAINT [FK_Regions_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Regions] CHECK CONSTRAINT [FK_Regions_Countries]
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD FOREIGN KEY([FK_CoachID])
REFERENCES [dbo].[Coach] ([CoachID])
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD FOREIGN KEY([FK_PostID])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD FOREIGN KEY([FK_ResponseID])
REFERENCES [dbo].[Response] ([ResponseID])
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD FOREIGN KEY([Topic])
REFERENCES [dbo].[Topics] ([TopicID])
GO
USE [master]
GO
ALTER DATABASE [BaeCoach] SET  READ_WRITE 
GO
