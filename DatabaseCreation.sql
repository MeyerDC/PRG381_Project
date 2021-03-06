USE [master]
GO
/****** Object:  Database [CateringDB]    Script Date: 2021/03/07 20:11:17 ******/
CREATE DATABASE [CateringDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CateringDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CateringDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CateringDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CateringDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CateringDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CateringDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CateringDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CateringDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CateringDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CateringDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CateringDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CateringDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CateringDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CateringDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CateringDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CateringDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CateringDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CateringDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CateringDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CateringDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CateringDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CateringDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CateringDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CateringDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CateringDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CateringDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CateringDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CateringDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CateringDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CateringDB] SET  MULTI_USER 
GO
ALTER DATABASE [CateringDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CateringDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CateringDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CateringDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CateringDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CateringDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CateringDB] SET QUERY_STORE = OFF
GO
USE [CateringDB]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 2021/03/07 20:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [nchar](10) NOT NULL,
	[ClientName] [varchar](50) NOT NULL,
	[ClientSurname] [varchar](50) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 2021/03/07 20:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [nchar](10) NOT NULL,
	[ClientID] [nchar](10) NOT NULL,
	[VenueID] [nchar](10) NOT NULL,
	[Date] [date] NOT NULL,
	[ConfirmedEvent] [bit] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Decor] [varchar](50) NULL,
	[DecorDetails] [varchar](max) NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 2021/03/07 20:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[FoodID] [nchar](10) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2021/03/07 20:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[EventID] [nchar](10) NOT NULL,
	[FoodID] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 2021/03/07 20:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue](
	[VenueID] [nchar](10) NOT NULL,
	[VenueName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Venue] PRIMARY KEY CLUSTERED 
(
	[VenueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Client]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Venue] FOREIGN KEY([VenueID])
REFERENCES [dbo].[Venue] ([VenueID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Venue]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Event]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Food] FOREIGN KEY([FoodID])
REFERENCES [dbo].[Food] ([FoodID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Food]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteEvent]    Script Date: 2021/03/07 20:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteEvent] 
	-- Add the parameters for the stored procedure here
	@EventID nchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DELETE FROM [dbo].[Event]
      WHERE EventID = @EventID
END
GO
/****** Object:  StoredProcedure [dbo].[spEventUpdate]    Script Date: 2021/03/07 20:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[spEventUpdate] 
	-- Add the parameters for the stored procedure here
	@Date date,
	@ConfirmedEvent bit,
	@Decor varchar(50),
	@DecorDetails varchar(max),
	@Price money,
	@EventID nchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[Event]
   SET [Date] = @Date
      ,[ConfirmedEvent] = @ConfirmedEvent
      ,[Decor] = @Decor
      ,[DecorDetails] = @DecorDetails
      ,[Price] = @Price
 WHERE EventID = @EventID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetEvent]    Script Date: 2021/03/07 20:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetEvent] 
	-- Add the parameters for the stored procedure here

AS
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        dbo.Event.Date, dbo.Client.ClientName, dbo.Client.ClientSurname, dbo.Client.Phone, dbo.Event.Type, dbo.Event.ConfirmedEvent, dbo.Venue.VenueName
FROM            dbo.Client INNER JOIN
                         dbo.Event ON dbo.Client.ClientID = dbo.Event.ClientID INNER JOIN
                         dbo.Venue ON dbo.Event.VenueID = dbo.Venue.VenueID CROSS JOIN
                         dbo.Food
GO
/****** Object:  StoredProcedure [dbo].[spGetFood]    Script Date: 2021/03/07 20:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetFood] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        dbo.Food.*, Type AS Expr1, Price AS Expr2, Name AS Expr3
FROM            dbo.Food
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertClient]    Script Date: 2021/03/07 20:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertClient] 
	-- Add the parameters for the stored procedure here
	@ClientName varchar(50),
	@ClientSurname varchar(50),
	@Phone varchar(50),
	@Email varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO [dbo].[Client]
           ([ClientName]
           ,[ClientSurname]
           ,[Phone]
           ,[Email])
     VALUES
           (@ClientName
           ,@ClientSurname
           ,@Phone
           ,@Email)
END
GO
USE [master]
GO
ALTER DATABASE [CateringDB] SET  READ_WRITE 
GO
