
USE [master]
/*
GO
CREATE DATABASE [PezzaDb]
GO
*/
USE [PezzaDb]
GO
/****** Object:  Schema [HangFire]    Script Date: 2022/03/22 21:44:26 ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022/03/22 21:44:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configurations]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configurations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uri] [nvarchar](500) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[DiscoveryService] [nvarchar](100) NULL,
 CONSTRAINT [PK_Configurations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[Province] [varchar](100) NOT NULL,
	[PostalCode] [varchar](8) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[ContactPerson] [varchar](200) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK__Customer__3214EC07CE5A6856] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Executions]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Executions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NOT NULL,
	[OnStateFrom] [datetime2](7) NOT NULL,
	[LastExecuted] [datetime2](7) NOT NULL,
	[Uri] [nvarchar](500) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[DiscoveryService] [nvarchar](50) NULL,
 CONSTRAINT [PK_Executions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Failures]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Failures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HealthCheckName] [nvarchar](500) NOT NULL,
	[LastNotified] [datetime2](7) NOT NULL,
	[IsUpAndRunning] [bit] NOT NULL,
 CONSTRAINT [PK_Failures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthCheckExecutionEntries]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthCheckExecutionEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Duration] [time](7) NOT NULL,
	[HealthCheckExecutionId] [int] NULL,
	[Tags] [nvarchar](max) NULL,
 CONSTRAINT [PK_HealthCheckExecutionEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthCheckExecutionHistories]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthCheckExecutionHistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[On] [datetime2](7) NOT NULL,
	[HealthCheckExecutionId] [int] NULL,
 CONSTRAINT [PK_HealthCheckExecutionHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notify]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notify](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Sent] [bit] NOT NULL,
	[Retry] [int] NOT NULL,
	[DateSent] [datetime] NOT NULL,
 CONSTRAINT [PK_Notify] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[RestaurantId] [int] NOT NULL,
	[Amount] [decimal](17, 2) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Completed] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[PictureUrl] [varchar](1000) NOT NULL,
	[Price] [decimal](17, 2) NOT NULL,
	[Special] [bit] NOT NULL,
	[OfferEndDate] [datetime] NULL,
	[OfferPrice] [decimal](17, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[PictureUrl] [varchar](1000) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[Province] [varchar](100) NOT NULL,
	[PostalCode] [varchar](8) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[UnitOfMeasure] [varchar](20) NULL,
	[ValueOfMeasure] [decimal](18, 2) NULL,
	[Quantity] [int] NOT NULL,
	[ExpiryDate] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
	[Comment] [varchar](1000) NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 2022/03/22 21:44:26 ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 2022/03/22 21:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200410110604_initial', N'3.1.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200915210355_3.1.2-changes', N'3.1.11')
GO
SET IDENTITY_INSERT [dbo].[Configurations] ON 

INSERT [dbo].[Configurations] ([Id], [Uri], [Name], [DiscoveryService]) VALUES (1, N'/healthchecks', N'Pezza.Api', NULL)
SET IDENTITY_INSERT [dbo].[Configurations] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (2, N'New name', N'test 123', N'Alberton', N'Eastern Cape', N'222', N'ggggg', N'bertdoe@test.com', N'Bert', CAST(N'2021-01-08T10:20:53.877' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (4, N'John Doe', N'test 123', N'Alberton', N'Eastern Cape', N'112', N'0721230000', N'johndoe@test.com', N'Jane', CAST(N'2021-01-08T10:25:05.547' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (5, N'Stian Le Roux', N'58 klipberg', N'Pretoria', N'Gauteng', N'0081', N'0727033836', N'stianleroux@gmail.com', N'test', CAST(N'2021-01-08T17:28:17.887' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (6, N'Johny Doe', N'51 test', N'Alberton', N'Eastern Cape', N'2222', N'0721110000', N'johndoe@sa.com', N'Jany Doe', CAST(N'2021-01-08T17:37:22.847' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (7, N'Branden Irwin', N'P.O. Box 833, 5480 Cursus Avenue', N'Lithgow', N'NSW', N'7994', N'385-427-3608', N'Fusce.fermentum@IncondimentumDonec.net', N'Clinton', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (8, N'Lillian Hill', N'P.O. Box 458, 2885 Interdum. St.', N'Victor Harbor', N'South Australia', N'9857', N'858-921-6630', N'inceptos.hymenaeos@molestie.net', N'Herrod', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (9, N'Brandon Harper', N'2958 Lorem, Ave', N'Hervey Bay', N'QLD', N'8487', N'466-492-0144', N'augue.malesuada@anteiaculisnec.edu', N'Burke', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (10, N'Robert Myers', N'706-7687 Ipsum Road', N'Gold Coast', N'Queensland', N'1261', N'981-725-6793', N'magna.Duis@ornareelitelit.com', N'Giacomo', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (11, N'Kalia Bowers', N'Ap #138-5197 Eu Avenue', N'Wagga Wagga', N'NSW', N'7393', N'505-914-5644', N'bibendum.ullamcorper@elementumpurusaccumsan.net', N'Adrian', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (12, N'Jeremy Bowers', N'4410 Imperdiet, St.', N'Newcastle', N'New South Wales', N'3654', N'277-452-1329', N'ridiculus.mus@inlobortistellus.com', N'Carlos', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (13, N'Keefe Ratliff', N'2835 Ornare. Road', N'Orange', N'New South Wales', N'9219', N'576-429-7822', N'Cum@vel.co.uk', N'Walter', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (14, N'Maisie Jimenez', N'1379 Est, St.', N'Port Pirie', N'South Australia', N'3313', N'185-526-2834', N'aliquet.nec.imperdiet@gravidanon.org', N'Chadwick', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (15, N'Gil Dale', N'902-6545 Sed, Road', N'Warrnambool', N'VIC', N'4944', N'726-331-9150', N'nec.luctus@lobortismauris.org', N'Elmo', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (16, N'Chase Hoffman', N'P.O. Box 213, 3322 Ipsum St.', N'Cessnock', N'New South Wales', N'7333', N'505-614-1627', N'dui.semper@justo.com', N'Malcolm', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (17, N'Reed Peterson', N'P.O. Box 613, 8726 Tristique Rd.', N'Maryborough', N'Queensland', N'1631', N'903-616-2117', N'a.malesuada.id@tincidunt.com', N'Hamilton', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (18, N'Fuller Cantu', N'3868 Mauris Av.', N'Lithgow', N'New South Wales', N'2269', N'796-102-2764', N'mollis.vitae@lectusjusto.co.uk', N'Austin', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (19, N'Brennan Irwin', N'Ap #651-5454 Suspendisse Av.', N'Bayswater', N'WA', N'8466', N'332-245-0960', N'turpis@elitNullafacilisi.ca', N'Caldwell', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (20, N'Dara Blackburn', N'Ap #605-6745 Id Rd.', N'Penrith', N'New South Wales', N'9383', N'771-684-7078', N'Quisque.ornare@vitae.edu', N'Porter', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (21, N'Bruno Camacho', N'761-5693 Blandit Road', N'Bairnsdale', N'Victoria', N'8744', N'998-334-4830', N'lectus.Cum@est.co.uk', N'Kennan', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (22, N'Deirdre Navarro', N'372-3951 Sit Street', N'Mildura', N'Victoria', N'2455', N'360-899-6911', N'Quisque@duiCum.com', N'Xander', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (23, N'Demetria Meyers', N'P.O. Box 439, 7491 Risus. Rd.', N'Shepparton', N'VIC', N'6958', N'865-549-3306', N'sociis.natoque.penatibus@risus.co.uk', N'Devin', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (24, N'Gage Deleon', N'P.O. Box 622, 7403 Auctor. Ave', N'Newcastle', N'New South Wales', N'2861', N'468-582-7281', N'Nam.tempor@lectuspedeultrices.ca', N'Mason', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (25, N'Cara Duffy', N'848-973 In Road', N'Nedlands', N'WA', N'4827', N'537-500-1701', N'sem.eget@gravidaAliquam.ca', N'Lance', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (26, N'Lesley Donovan', N'Ap #899-2146 Molestie Rd.', N'Wagga Wagga', N'NSW', N'7607', N'458-636-5170', N'semper@Quisquelibero.org', N'Jack', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (27, N'Clementine Maynard', N'P.O. Box 617, 6165 Dui. St.', N'Hervey Bay', N'Queensland', N'6221', N'242-955-5905', N'sed@velnisl.com', N'Dominic', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (28, N'Alisa Eaton', N'154-762 Ornare Rd.', N'Shepparton', N'VIC', N'6410', N'312-607-1596', N'Fusce@semeget.com', N'Denton', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (29, N'Seth Blevins', N'P.O. Box 774, 8736 Dolor Ave', N'Mount Isa', N'QLD', N'4061', N'282-448-2997', N'eu@Vivamus.com', N'Dominic', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (30, N'Diana Hoover', N'620-8283 Rhoncus. Ave', N'Mandurah', N'Western Australia', N'3946', N'804-342-4957', N'Pellentesque.ut.ipsum@urnaUt.net', N'Hammett', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (31, N'Drake Brown', N'572-9098 Est, Avenue', N'Mount Isa', N'Queensland', N'2987', N'177-681-2014', N'amet.ornare.lectus@sedleo.net', N'Drake', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (32, N'Joshua Ross', N'7456 Elit Rd.', N'Swan Hill', N'VIC', N'2909', N'218-762-4027', N'mus.Donec.dignissim@fermentum.net', N'Ross', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (33, N'Patience Woodard', N'Ap #540-4396 Ullamcorper, Av.', N'Shepparton', N'VIC', N'7501', N'405-572-2402', N'In.lorem@elit.org', N'Omar', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (34, N'Neil Barlow', N'P.O. Box 543, 9686 Malesuada Street', N'Sydney', N'NSW', N'5642', N'652-291-7926', N'diam.Proin@nonummyultricies.ca', N'Jeremy', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (35, N'Fulton Mcmillan', N'Ap #727-6590 Quis, Rd.', N'Blue Mountains', N'New South Wales', N'5952', N'151-636-8734', N'massa.non@neccursus.com', N'Myles', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (36, N'Dacey Patrick', N'4746 Quis Road', N'Geelong', N'Victoria', N'7984', N'231-914-4604', N'senectus@mifringilla.ca', N'Harlan', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (37, N'Wanda Bowers', N'Ap #298-1155 Neque St.', N'Greater Hobart', N'TAS', N'8446', N'651-933-0700', N'ac.turpis.egestas@Aliquamfringillacursus.net', N'Keegan', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (38, N'Yoshi Gates', N'P.O. Box 949, 8957 Sed Road', N'Tamworth', N'NSW', N'4823', N'559-815-0076', N'blandit.viverra@eueros.ca', N'Vance', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (39, N'Linus Schmidt', N'2369 Velit Rd.', N'Grafton', N'New South Wales', N'8451', N'489-175-7901', N'magna.Duis.dignissim@arcu.edu', N'Guy', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (40, N'Herman Joyner', N'P.O. Box 313, 3315 Sed, Av.', N'Sydney', N'New South Wales', N'8785', N'182-453-3892', N'ante.Maecenas@adipiscingelit.edu', N'Carter', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (41, N'Libby Ewing', N'P.O. Box 850, 4517 Magna, Rd.', N'Queanbeyan', N'NSW', N'9096', N'406-751-7735', N'Curabitur@leo.org', N'Daquan', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (42, N'Tarik Bowers', N'410-3050 Ultrices Street', N'Ipswich', N'Queensland', N'6240', N'342-629-9765', N'risus.Nulla@est.co.uk', N'Warren', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (43, N'Emery Kramer', N'980-7570 Dignissim St.', N'Blue Mountains', N'New South Wales', N'9602', N'984-783-9620', N'amet.consectetuer@accumsansedfacilisis.ca', N'Silas', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (44, N'Ulric Conley', N'Ap #635-6942 Libero. Av.', N'Mackay', N'Queensland', N'2478', N'558-492-4525', N'Sed@ultriciesligula.co.uk', N'Wesley', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (45, N'Austin Gallagher', N'1375 Risus Street', N'Morwell', N'Victoria', N'6491', N'151-507-1293', N'erat@duinecurna.co.uk', N'Travis', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (46, N'Silas Bradford', N'2280 Nascetur Rd.', N'Bathurst', N'New South Wales', N'5525', N'110-175-4844', N'mollis.vitae@Maurisut.org', N'Mufutau', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (47, N'Dai Mayo', N'P.O. Box 263, 6452 Aliquam Avenue', N'Liverpool', N'NSW', N'9532', N'721-298-9463', N'urna.et@turpisIn.ca', N'Chadwick', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (48, N'Hayes Williamson', N'P.O. Box 251, 7402 Interdum. Rd.', N'Blue Mountains', N'NSW', N'7948', N'109-311-2685', N'facilisis.non.bibendum@semmolestiesodales.net', N'Clarke', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (49, N'Sara Mccall', N'9807 Est. St.', N'Goulburn', N'New South Wales', N'6993', N'812-284-4532', N'dictum.Proin.eget@tortornibhsit.co.uk', N'Oleg', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (50, N'Priscilla Robbins', N'Ap #656-2359 Nec Road', N'Warrnambool', N'VIC', N'5509', N'792-827-5107', N'Proin.ultrices.Duis@Fusce.com', N'Nero', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (51, N'Glenna Mercado', N'P.O. Box 734, 1829 Augue Rd.', N'Lithgow', N'NSW', N'6884', N'667-638-2933', N'vel.arcu.eu@metuseuerat.net', N'Logan', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (52, N'Moses Livingston', N'Ap #990-8012 Ligula. Rd.', N'Blue Mountains', N'NSW', N'2515', N'185-796-1308', N'pellentesque.a.facilisis@egetmetus.edu', N'Linus', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (53, N'Jonas Hughes', N'Ap #819-5709 In Street', N'Rockhampton', N'QLD', N'2820', N'890-392-0639', N'dui@amet.edu', N'Kenyon', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (54, N'Hop Frederick', N'1608 Urna. St.', N'Bundaberg', N'QLD', N'8495', N'605-182-3754', N'pharetra@Donecsollicitudin.net', N'Fuller', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (55, N'Dustin Mullins', N'P.O. Box 690, 8915 Sed, Av.', N'Mildura', N'VIC', N'7724', N'259-842-0196', N'suscipit.est.ac@magnaseddui.com', N'Jared', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (56, N'Owen Lara', N'465-4403 Risus Rd.', N'Sale', N'VIC', N'2992', N'492-421-4379', N'arcu.Aliquam.ultrices@cubiliaCuraeDonec.co.uk', N'Nicholas', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (57, N'Channing Roach', N'822-2473 Aliquet, Av.', N'Palmerston', N'Northern Territory', N'3139', N'725-470-7817', N'amet@arcuMorbi.org', N'Ignatius', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (58, N'Ciaran Buckley', N'P.O. Box 709, 5529 Mattis Road', N'Gladstone', N'Queensland', N'1181', N'580-133-7782', N'at.auctor@ullamcorper.net', N'Luke', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (59, N'John Sosa', N'P.O. Box 989, 3479 In Street', N'Frankston', N'VIC', N'8943', N'561-703-7055', N'a@Aliquam.edu', N'Alden', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (60, N'Dexter Albert', N'P.O. Box 579, 8840 Natoque Street', N'Mackay', N'Queensland', N'3356', N'992-533-2551', N'augue.porttitor@telluseuaugue.ca', N'Wing', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (61, N'Haviva Valdez', N'9729 Ac Avenue', N'Newcastle', N'NSW', N'7892', N'960-771-6305', N'consectetuer.cursus@nonummyipsumnon.com', N'Arden', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (62, N'Lamar Cortez', N'1404 Aliquet, Av.', N'Ararat', N'VIC', N'5749', N'345-218-3621', N'nec.eleifend.non@velit.edu', N'Bernard', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (63, N'Suki Wiggins', N'7814 Lectus Road', N'Bundaberg', N'Queensland', N'6213', N'295-487-1370', N'sem.Pellentesque@ut.org', N'Beau', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (64, N'Naida Talley', N'P.O. Box 711, 1455 Diam Avenue', N'Mount Gambier', N'South Australia', N'7204', N'707-512-3490', N'hendrerit.neque.In@maurissapien.net', N'Tiger', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (65, N'Dieter Avery', N'Ap #319-7707 Consequat, St.', N'Charters Towers', N'Queensland', N'4764', N'264-741-0738', N'ligula.Aliquam.erat@quamquisdiam.edu', N'Reuben', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (66, N'Edward Ewing', N'P.O. Box 278, 8679 Lorem Av.', N'Newcastle', N'New South Wales', N'3067', N'465-138-5658', N'gravida@Lorem.net', N'Jonah', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (67, N'Arsenio Whitaker', N'730-7469 Ante Street', N'Rockhampton', N'Queensland', N'8789', N'947-147-0450', N'gravida@diamnuncullamcorper.co.uk', N'Lev', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (68, N'Glenna Marsh', N'P.O. Box 491, 1078 At, St.', N'Mildura', N'VIC', N'5589', N'694-145-8684', N'ipsum.Curabitur.consequat@euodio.com', N'Dane', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (69, N'Freya Wolf', N'770-7543 Mauris Ave', N'Lithgow', N'NSW', N'5596', N'735-478-5385', N'nunc.id.enim@variusNamporttitor.org', N'Malik', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (70, N'Marcia Brennan', N'Ap #377-6168 Donec Avenue', N'Lithgow', N'NSW', N'3189', N'272-393-5993', N'ac.sem@mi.co.uk', N'Dieter', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (71, N'Xandra Grimes', N'Ap #448-2809 Ipsum Avenue', N'Armidale', N'New South Wales', N'8336', N'703-578-9631', N'tempor@parturientmontes.ca', N'Ronan', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (72, N'Pearl Stark', N'P.O. Box 474, 2095 Tortor, Rd.', N'Sale', N'VIC', N'6771', N'453-610-1444', N'risus.Donec@asollicitudinorci.com', N'Burke', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (73, N'Quynn Conrad', N'547-2223 Pharetra. Av.', N'Maryborough', N'Queensland', N'4322', N'683-519-5070', N'venenatis.lacus@rutrum.org', N'Todd', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (74, N'Gannon Jensen', N'311 Purus, St.', N'Tamworth', N'New South Wales', N'3377', N'360-235-5208', N'vulputate.posuere@maurisSuspendissealiquet.ca', N'Daquan', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (75, N'Amos Sweet', N'502-430 Nunc, St.', N'Orange', N'NSW', N'6271', N'542-619-2164', N'posuere@eleifendCras.com', N'Chaim', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (76, N'Chaim Harvey', N'406-5700 Adipiscing Street', N'Grafton', N'NSW', N'5146', N'619-566-9839', N'Suspendisse.eleifend@sagittisplaceratCras.co.uk', N'Kieran', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (77, N'Coby Zimmerman', N'316-5769 Cum Avenue', N'Melton', N'Victoria', N'7571', N'632-338-1388', N'et.malesuada.fames@a.co.uk', N'Ezra', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (78, N'Savannah Thomas', N'P.O. Box 881, 3297 Ultrices Av.', N'Ararat', N'Victoria', N'1493', N'919-223-3954', N'dui@sapiencursus.ca', N'Kareem', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (79, N'Stewart Taylor', N'286-5535 Nisi Rd.', N'Shepparton', N'VIC', N'4509', N'176-699-7075', N'Donec.fringilla@egestas.co.uk', N'Colorado', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (80, N'Amos Pugh', N'Ap #124-6558 Quis St.', N'Traralgon', N'VIC', N'6769', N'832-225-8406', N'hendrerit.id@nisl.edu', N'Ignatius', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (81, N'Shoshana Bryant', N'Ap #746-9444 Consequat Ave', N'Campbelltown', N'New South Wales', N'2054', N'742-335-2835', N'neque.pellentesque@necante.co.uk', N'Matthew', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (82, N'Garrison Randolph', N'970-7352 Fringilla Rd.', N'Mount Isa', N'QLD', N'8206', N'370-351-7788', N'dui.quis@Phasellusdapibusquam.edu', N'Zeph', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (83, N'Jenette Rodriguez', N'1162 Commodo Ave', N'Port Pirie', N'SA', N'8513', N'113-410-8226', N'inceptos@risusNunc.edu', N'Guy', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (84, N'Wade Travis', N'P.O. Box 988, 8391 Semper Rd.', N'Rockhampton', N'QLD', N'6607', N'725-539-6401', N'mi.Aliquam.gravida@atpede.edu', N'Matthew', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (85, N'Lael Walter', N'775-2479 Sodales St.', N'Liverpool', N'NSW', N'4203', N'318-415-4827', N'malesuada.fringilla@eleifendCrassed.co.uk', N'Nicholas', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (86, N'Lane Joyce', N'474-6819 Mauris Rd.', N'Cessnock', N'New South Wales', N'1162', N'718-561-6249', N'Proin.vel.nisl@dictumplacerat.org', N'David', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (87, N'Eliana Hess', N'712-9900 Feugiat Ave', N'Bairnsdale', N'VIC', N'4316', N'948-369-7295', N'Etiam@elit.co.uk', N'Brent', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (88, N'Kessie Owen', N'P.O. Box 782, 8753 Vitae St.', N'Albury', N'New South Wales', N'1462', N'277-376-9276', N'erat.vitae.risus@mattisornarelectus.edu', N'Silas', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (89, N'Eagan Castaneda', N'9780 Eleifend Ave', N'Hamilton', N'VIC', N'4324', N'921-614-9307', N'molestie@ametnullaDonec.ca', N'Brody', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (90, N'Brynne Kaufman', N'Ap #338-4047 Vestibulum Ave', N'Brisbane', N'QLD', N'1298', N'677-932-0579', N'tincidunt.Donec.vitae@rhoncus.ca', N'Gregory', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (91, N'Hanna Alvarado', N'695-6135 Non, Road', N'Mount Isa', N'QLD', N'5607', N'530-274-0075', N'sit.amet@odio.co.uk', N'Blake', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (92, N'Ariana Bean', N'P.O. Box 143, 3073 Gravida Ave', N'Horsham', N'VIC', N'2488', N'682-855-4032', N'consequat.dolor@luctus.org', N'Harlan', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (93, N'Russell Wise', N'940-2393 Nec Street', N'Newcastle', N'New South Wales', N'1162', N'698-125-4630', N'et@quislectusNullam.co.uk', N'Elton', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (94, N'Tyler Downs', N'Ap #279-9939 Ornare Street', N'Orange', N'New South Wales', N'8379', N'193-552-1721', N'ut.sem@faucibusutnulla.net', N'Ethan', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (95, N'Ian Singleton', N'Ap #815-9058 Et, Road', N'Tamworth', N'NSW', N'8808', N'747-878-5297', N'volutpat.Nulla.facilisis@metusAliquamerat.ca', N'Dexter', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (96, N'Kyle Shepard', N'6812 Risus. Road', N'Parramatta', N'NSW', N'7455', N'695-910-9312', N'Nullam@Namconsequatdolor.org', N'Christopher', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (97, N'Dana Holland', N'P.O. Box 755, 4101 Parturient Ave', N'Lithgow', N'New South Wales', N'1279', N'152-568-6608', N'lectus.Nullam.suscipit@Ut.edu', N'Carson', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (98, N'Indira Reed', N'1115 Ornare Avenue', N'Horsham', N'Victoria', N'3539', N'196-687-0949', N'nisl@eratVivamusnisi.edu', N'Graham', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (99, N'Alyssa Ross', N'P.O. Box 819, 9816 Felis Rd.', N'Wanneroo', N'WA', N'7081', N'908-753-1619', N'Nunc@consectetueripsum.co.uk', N'Shad', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (100, N'Dacey Mcintosh', N'P.O. Box 261, 2790 Libero Rd.', N'Mount Isa', N'Queensland', N'6246', N'611-180-1541', N'sagittis@venenatislacusEtiam.org', N'Beau', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (101, N'Sage Sheppard', N'Ap #749-229 Malesuada Rd.', N'Cairns', N'Queensland', N'7712', N'497-546-1289', N'ut@mauris.co.uk', N'Malik', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
GO
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (102, N'Benedict Leblanc', N'3068 Nunc St.', N'Cessnock', N'New South Wales', N'8362', N'305-485-8306', N'Cum.sociis.natoque@dapibusquam.org', N'Hall', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (103, N'Raymond Bowers', N'9143 Felis, Road', N'Redcliffe', N'Queensland', N'4946', N'237-400-8337', N'Lorem.ipsum@nonummy.org', N'Lars', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (104, N'Armand Lott', N'Ap #542-273 Nulla Street', N'Liverpool', N'NSW', N'5974', N'335-392-4183', N'sit@egetdictumplacerat.org', N'Baker', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (105, N'Zelda Delgado', N'529-6512 Iaculis Street', N'Traralgon', N'Victoria', N'3836', N'174-764-7905', N'senectus@loremutaliquam.edu', N'Gil', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (106, N'Wayne Reed', N'Ap #920-1248 A Road', N'Victor Harbor', N'South Australia', N'2465', N'867-860-6102', N'Quisque@Donecest.com', N'Xander', CAST(N'2021-01-19T20:57:14.883' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (107, N'Byron Miranda', N'7466 A Ave', N'Cessnock', N'New South Wales', N'9876', N'775-696-3814', N'molestie.sodales.Mauris@velit.ca', N'Lev', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (108, N'Kennan Cummings', N'P.O. Box 756, 6072 Scelerisque Av.', N'Goulburn', N'New South Wales', N'6503', N'380-576-3158', N'eleifend.Cras.sed@egetmetus.ca', N'Baxter', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (109, N'Dolan Peterson', N'707-3023 Nec Av.', N'Grafton', N'NSW', N'9339', N'353-981-5295', N'in.felis.Nulla@metussit.ca', N'Perry', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (110, N'Phoebe Norman', N'5938 Magna, Avenue', N'Tamworth', N'New South Wales', N'3294', N'333-846-6804', N'et@augue.com', N'Otto', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (111, N'Urielle Malone', N'480-4890 Suspendisse Avenue', N'Mandurah', N'WA', N'7091', N'915-694-4800', N'ante@imperdietnecleo.org', N'Vladimir', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (112, N'Galvin Vega', N'2657 Aliquet Avenue', N'Melbourne', N'VIC', N'6399', N'727-776-8009', N'Maecenas@mi.net', N'Palmer', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (113, N'Nyssa Cruz', N'Ap #547-6708 Sem Rd.', N'Morwell', N'VIC', N'8311', N'945-985-5877', N'Proin.vel.nisl@fermentummetusAenean.net', N'Austin', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (114, N'Robert Ware', N'7027 Amet Rd.', N'Burnie', N'Tasmania', N'8017', N'266-929-5832', N'at.augue@Morbi.net', N'Ishmael', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (115, N'Kibo Walsh', N'954-1244 Accumsan Ave', N'Bairnsdale', N'VIC', N'1528', N'195-552-1537', N'risus.varius@lectusrutrum.edu', N'Dolan', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (116, N'Melissa Cabrera', N'159-2751 Non, Street', N'Brisbane', N'Queensland', N'9339', N'157-800-4150', N'Curabitur@Aeneanegestashendrerit.co.uk', N'Marsden', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (117, N'Skyler Sargent', N'5708 Lacus. Rd.', N'Melbourne', N'VIC', N'1710', N'788-306-1610', N'arcu.Vestibulum@vulputatenisi.co.uk', N'Ethan', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (118, N'Nelle Hewitt', N'Ap #583-3577 Fusce Av.', N'Fremantle', N'WA', N'2401', N'350-772-5996', N'lorem@at.org', N'Hilel', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (119, N'Patricia Hansen', N'862-6254 Mi. St.', N'Lithgow', N'NSW', N'8913', N'260-734-9499', N'Proin.dolor@tellusimperdietnon.ca', N'Carl', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (120, N'Rae Lawson', N'812-192 Tristique Av.', N'Sydney', N'New South Wales', N'7014', N'773-167-8619', N'mauris.id.sapien@lectussitamet.co.uk', N'Jameson', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (121, N'Chava Suarez', N'662-6183 Metus. Rd.', N'Morwell', N'VIC', N'9471', N'455-456-9376', N'est.Mauris@antelectusconvallis.net', N'Alfonso', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (122, N'Scarlet Hunt', N'P.O. Box 914, 5217 Mauris Road', N'Wollongong', N'NSW', N'6768', N'184-200-0184', N'non.lorem@dolor.com', N'Carson', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (123, N'Carter Kane', N'3802 Mauris Avenue', N'Charters Towers', N'QLD', N'3228', N'206-810-7309', N'mauris.Suspendisse@Sedetlibero.co.uk', N'Kadeem', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (124, N'Dennis Villarreal', N'P.O. Box 491, 6431 Sed, St.', N'Blue Mountains', N'NSW', N'5207', N'908-469-8829', N'In.at@ipsumcursusvestibulum.org', N'Rafael', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (125, N'Walker Vasquez', N'Ap #296-1441 Orci, Rd.', N'Queanbeyan', N'New South Wales', N'3967', N'694-446-7748', N'laoreet.ipsum@mollisvitaeposuere.edu', N'Forrest', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (126, N'Burke Pugh', N'Ap #399-9378 Nunc St.', N'Ararat', N'Victoria', N'3650', N'540-799-0576', N'aptent.taciti.sociosqu@Namac.com', N'Talon', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (127, N'Cecilia Giles', N'P.O. Box 312, 2968 Nulla. Rd.', N'Armidale', N'New South Wales', N'4430', N'111-181-5413', N'orci@Namnullamagna.org', N'Ezra', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (128, N'Tad Wheeler', N'Ap #151-9337 Ut St.', N'Wollongong', N'NSW', N'6435', N'561-688-8166', N'in@lacusNullatincidunt.com', N'Beck', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (129, N'Norman Long', N'P.O. Box 417, 2142 Risus. Rd.', N'Geelong', N'VIC', N'7009', N'647-994-2252', N'in.dolor@facilisisnon.net', N'Guy', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (130, N'Daquan Parker', N'Ap #643-9396 Nulla Street', N'Wollongong', N'New South Wales', N'6206', N'298-279-5174', N'nulla.In.tincidunt@tinciduntvehicularisus.ca', N'Walker', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (131, N'Chandler Garrison', N'330-2959 In Av.', N'Toowoomba', N'QLD', N'4524', N'681-730-5112', N'malesuada.ut@vulputate.ca', N'Hector', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (132, N'Lydia Benjamin', N'Ap #306-3105 Erat. Rd.', N'Canberra', N'Australian Capital Territory', N'4321', N'873-417-6161', N'lorem@nonummy.org', N'Damon', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (133, N'Maxwell Melendez', N'841-661 Vehicula. Rd.', N'Charters Towers', N'Queensland', N'7821', N'192-202-9212', N'ante.bibendum.ullamcorper@Inornare.edu', N'Herman', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (134, N'Yardley Durham', N'1192 Fringilla Street', N'Mount Isa', N'QLD', N'4061', N'193-419-2399', N'Donec.consectetuer@posuere.co.uk', N'Arthur', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (135, N'Courtney Taylor', N'P.O. Box 534, 4354 Ipsum Street', N'Frankston', N'VIC', N'8563', N'873-862-5930', N'euismod.mauris.eu@vitaerisus.net', N'Bert', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (136, N'Remedios Slater', N'930-4928 Purus Rd.', N'Ipswich', N'QLD', N'7859', N'610-628-8627', N'interdum.Nunc.sollicitudin@facilisisSuspendissecommodo.org', N'Roth', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (137, N'Ezra Mcdaniel', N'759-5180 Vitae St.', N'Blue Mountains', N'New South Wales', N'6009', N'179-621-0861', N'ante.dictum.mi@nascetur.edu', N'Benjamin', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (138, N'Nigel Roach', N'5029 Ornare Street', N'Geraldton-Greenough', N'Western Australia', N'6941', N'658-450-9340', N'lectus.Nullam.suscipit@ligula.edu', N'Vladimir', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (139, N'Leigh Cotton', N'3418 Condimentum. Ave', N'Mackay', N'Queensland', N'7982', N'122-556-9927', N'ad@eros.ca', N'Kamal', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (140, N'Geoffrey Santos', N'Ap #326-5345 Sed, Avenue', N'Greater Hobart', N'TAS', N'9677', N'803-682-2696', N'purus.accumsan.interdum@aliquet.com', N'Kirk', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (141, N'Shoshana Valenzuela', N'197-7718 Elit. Rd.', N'Gladstone', N'Queensland', N'1064', N'285-488-2118', N'nulla@velitSedmalesuada.com', N'Jarrod', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (142, N'Dexter Webb', N'P.O. Box 964, 7821 Magna Road', N'Sydney', N'NSW', N'4096', N'285-305-7422', N'enim.Nunc.ut@arcuacorci.com', N'Owen', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (143, N'Kerry Vang', N'P.O. Box 358, 7885 In St.', N'Albury', N'New South Wales', N'9840', N'662-945-5023', N'dui@purussapien.net', N'Dalton', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (144, N'Cherokee Wagner', N'P.O. Box 852, 8939 Enim St.', N'Ararat', N'Victoria', N'4638', N'925-296-9344', N'vehicula.Pellentesque@Nullatempor.ca', N'Kareem', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (145, N'Timon Saunders', N'590-1104 Arcu. Ave', N'Parramatta', N'New South Wales', N'5249', N'817-408-6333', N'Mauris.nulla.Integer@nislelementum.net', N'Darius', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (146, N'Ashton Arnold', N'9243 Velit Road', N'Gosnells', N'Western Australia', N'4955', N'876-408-3013', N'Integer.vulputate.risus@sitamet.edu', N'Neil', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (147, N'Frances Espinoza', N'6474 Sit Rd.', N'Maryborough', N'Queensland', N'3144', N'979-977-0223', N'Lorem@malesuadavelvenenatis.org', N'Zeph', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (148, N'Aurora Waters', N'248-7141 Est, Road', N'Townsville', N'QLD', N'5188', N'369-807-0085', N'rhoncus@blandit.org', N'Duncan', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (149, N'Kay Harvey', N'7798 Rutrum, Rd.', N'Bathurst', N'New South Wales', N'7945', N'839-440-0798', N'a@afacilisis.net', N'Howard', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (150, N'Stephen Zimmerman', N'P.O. Box 725, 6729 Luctus Avenue', N'Port Augusta', N'South Australia', N'8285', N'638-679-7793', N'orci.in.consequat@lacusCrasinterdum.org', N'Wylie', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (151, N'Ross Clayton', N'Ap #402-5683 Iaculis Ave', N'Townsville', N'Queensland', N'6270', N'105-338-2905', N'tristique.senectus.et@semperegestas.edu', N'Tyler', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (152, N'Eleanor Church', N'455-1663 Turpis Avenue', N'Wodonga', N'Victoria', N'2837', N'709-289-1250', N'molestie@laciniaorciconsectetuer.org', N'Evan', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (153, N'Lamar Shields', N'5239 Egestas. Ave', N'Geelong', N'VIC', N'3090', N'850-187-2243', N'purus@sodaleseliterat.net', N'Kasper', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (154, N'Nadine Ford', N'1132 Et Street', N'Logan City', N'Queensland', N'3688', N'893-258-7765', N'scelerisque.lorem.ipsum@id.co.uk', N'Warren', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (155, N'Sloane Dixon', N'622-9430 Libero St.', N'Mackay', N'QLD', N'3140', N'999-549-1428', N'Nam.porttitor@vulputate.org', N'Palmer', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (156, N'Flavia Hester', N'P.O. Box 656, 3948 Convallis Road', N'Blue Mountains', N'NSW', N'3283', N'283-856-6743', N'semper.egestas@erosProinultrices.org', N'Macon', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (157, N'Edan Hebert', N'Ap #285-7633 Sapien. Road', N'Cessnock', N'New South Wales', N'5499', N'412-580-5927', N'Nulla@nisl.org', N'Ethan', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (158, N'Alexander Greene', N'975-4120 Nulla Rd.', N'Sydney', N'NSW', N'2920', N'931-765-6978', N'lacus.Nulla.tincidunt@QuisquevariusNam.co.uk', N'Hall', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (159, N'Hadley Blair', N'3872 Nisl. Rd.', N'Campbelltown', N'New South Wales', N'1832', N'907-451-0365', N'sit.amet.risus@senectus.org', N'Guy', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (160, N'Alexander Cabrera', N'Ap #715-567 Imperdiet Rd.', N'Grafton', N'New South Wales', N'8074', N'157-651-6545', N'magna@semperauctorMauris.com', N'Ray', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (161, N'Violet Potter', N'P.O. Box 866, 6446 Dictum St.', N'Lithgow', N'NSW', N'2967', N'189-987-1401', N'tellus@Inornaresagittis.org', N'Brian', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (162, N'Alexa Cardenas', N'P.O. Box 980, 2360 Ultricies Road', N'Wollongong', N'NSW', N'1534', N'743-104-5996', N'luctus.ut.pellentesque@sociisnatoque.org', N'Caleb', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (163, N'Eaton Weeks', N'P.O. Box 709, 2095 Vitae, Ave', N'Wangaratta', N'Victoria', N'3502', N'659-350-3163', N'diam.nunc@tortornibh.com', N'Callum', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (164, N'August Marks', N'545-1112 Malesuada Rd.', N'Blue Mountains', N'New South Wales', N'8885', N'637-387-1608', N'lacinia.orci.consectetuer@sitametfaucibus.net', N'Ray', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (165, N'Uriah Burt', N'Ap #434-4606 Luctus Ave', N'Benalla', N'VIC', N'3648', N'170-187-7691', N'enim.mi.tempor@eratEtiamvestibulum.net', N'Rahim', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (166, N'Taylor Boyd', N'P.O. Box 632, 548 Ante Ave', N'Bundaberg', N'Queensland', N'8424', N'176-248-3935', N'ligula.Nullam.feugiat@Inornaresagittis.com', N'Leonard', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (167, N'Henry Gray', N'2450 Libero Rd.', N'Sale', N'Victoria', N'7872', N'200-280-1519', N'a.ultricies@adipiscinglacus.co.uk', N'Axel', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (168, N'Ginger Jacobson', N'618-8818 Maecenas Ave', N'Mandurah', N'WA', N'6659', N'957-419-6855', N'diam@velitAliquamnisl.net', N'Norman', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (169, N'Nasim Burks', N'9689 Donec Road', N'Cessnock', N'New South Wales', N'5833', N'785-723-0021', N'nec.urna.suscipit@velitegestas.co.uk', N'Murphy', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (170, N'Dane David', N'276-6026 Ipsum. Street', N'Bairnsdale', N'VIC', N'4571', N'934-209-1674', N'metus.In.lorem@magnaDuisdignissim.edu', N'Isaac', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (171, N'Unity Boyle', N'Ap #284-7363 Proin Rd.', N'Sale', N'VIC', N'9923', N'359-344-1925', N'Mauris@disparturientmontes.co.uk', N'Hashim', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (172, N'Leo Barnett', N'Ap #780-2905 Et Street', N'Dubbo', N'New South Wales', N'2283', N'248-794-2122', N'elit@dolor.edu', N'Arthur', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (173, N'Brody Owen', N'357-2840 Curabitur Av.', N'Mildura', N'Victoria', N'5971', N'603-335-7579', N'tincidunt@convallis.edu', N'Norman', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (174, N'Xerxes Shields', N'P.O. Box 829, 3948 Lobortis Ave', N'Lithgow', N'New South Wales', N'3839', N'297-608-7654', N'in@nascetur.co.uk', N'Timon', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (175, N'Simone Merrill', N'308-5795 Lorem, Avenue', N'Redcliffe', N'QLD', N'7533', N'559-530-8805', N'massa@enimconsequat.ca', N'Zane', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (176, N'Adrian Savage', N'900-6812 Duis Street', N'Campbelltown', N'New South Wales', N'1839', N'212-924-9021', N'Ut.nec.urna@pellentesquemassalobortis.co.uk', N'Ahmed', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (177, N'Beck Hendricks', N'4328 Ut Avenue', N'Ipswich', N'Queensland', N'4212', N'490-556-0719', N'ipsum.Suspendisse@utpharetrased.net', N'Deacon', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (178, N'Judah Turner', N'1026 Aliquet, Ave', N'Orange', N'NSW', N'6694', N'434-977-7839', N'eu@vestibulumlorem.net', N'Channing', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (179, N'Lewis Rasmussen', N'Ap #419-3396 Semper Road', N'Goulburn', N'NSW', N'1476', N'176-733-0100', N'vel.nisl@felisDonectempor.org', N'Hoyt', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (180, N'Pandora Fuentes', N'P.O. Box 235, 7118 Nisi. Avenue', N'Bathurst', N'NSW', N'3113', N'838-633-9189', N'litora.torquent@elitelitfermentum.co.uk', N'Mark', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (181, N'Ray Randolph', N'Ap #390-524 Primis St.', N'Townsville', N'Queensland', N'9962', N'762-894-7710', N'imperdiet@facilisisfacilisismagna.ca', N'Walker', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (182, N'Arden Tran', N'856-7585 Augue. Rd.', N'Cairns', N'QLD', N'8821', N'722-439-5384', N'at.arcu@posuere.com', N'Malcolm', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (183, N'Cassady Kent', N'Ap #877-7365 Tristique Rd.', N'Queanbeyan', N'New South Wales', N'7392', N'628-766-0864', N'penatibus@sollicitudinorci.edu', N'Orson', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (184, N'Coby Lester', N'P.O. Box 172, 6678 Sed Street', N'Dandenong', N'VIC', N'3228', N'658-458-6970', N'sociis.natoque@nequetellus.org', N'Dalton', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (185, N'Madison Burks', N'329-7448 Nunc St.', N'Mackay', N'QLD', N'9714', N'715-961-3848', N'malesuada.ut@Aliquamvulputate.org', N'Steel', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (186, N'Sawyer Conner', N'Ap #632-8439 Duis St.', N'Newcastle', N'New South Wales', N'5422', N'723-401-7266', N'conubia.nostra.per@pede.ca', N'Jesse', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (187, N'Ramona Mills', N'Ap #821-5499 Vestibulum Avenue', N'Gladstone', N'Queensland', N'6702', N'514-414-8834', N'id.ante@atpretiumaliquet.net', N'Clark', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (188, N'Dylan Lambert', N'505-5362 In Road', N'Port Pirie', N'SA', N'3119', N'739-953-3831', N'iaculis.odio.Nam@nascetur.co.uk', N'Levi', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (189, N'Isadora Hardin', N'P.O. Box 538, 3232 Sem Rd.', N'Blue Mountains', N'New South Wales', N'3139', N'771-624-1471', N'egestas.Fusce.aliquet@utaliquam.co.uk', N'Prescott', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (190, N'Melyssa Carey', N'5541 Blandit. St.', N'Moe', N'Victoria', N'6176', N'462-544-5436', N'eu.accumsan@Aliquamgravidamauris.com', N'Hasad', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (191, N'Jonas Cooley', N'6652 Duis Rd.', N'Melbourne', N'VIC', N'5033', N'995-497-6891', N'dui@sitametornare.com', N'Malachi', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (192, N'Kevin Hurley', N'Ap #725-7683 Donec Rd.', N'Gold Coast', N'QLD', N'5651', N'238-968-0984', N'varius.Nam.porttitor@imperdietullamcorperDuis.co.uk', N'Merrill', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (193, N'Colt Giles', N'Ap #336-3838 Eu St.', N'Goulburn', N'NSW', N'3182', N'895-193-9588', N'dolor@duisemperet.co.uk', N'Giacomo', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (194, N'Alma Aguilar', N'P.O. Box 646, 4394 Nec Road', N'Wagga Wagga', N'New South Wales', N'1033', N'514-350-4623', N'eu@Cumsociisnatoque.net', N'Tanner', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (195, N'Blaine Cortez', N'1189 Eu Road', N'Gladstone', N'QLD', N'3040', N'765-125-6616', N'mi.ac@vitaesodalesat.co.uk', N'Stuart', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (196, N'Melyssa Frost', N'P.O. Box 817, 410 Parturient Rd.', N'Armadale', N'WA', N'8095', N'958-450-0402', N'purus.mauris@egetlaoreet.org', N'Herrod', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (197, N'Hermione James', N'P.O. Box 634, 2499 Cras Street', N'Penrith', N'NSW', N'7714', N'562-966-7867', N'ac.feugiat@perconubia.co.uk', N'Hu', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (198, N'Jenna Shaffer', N'520-7139 Nec St.', N'Townsville', N'Queensland', N'6391', N'805-778-5192', N'Phasellus.nulla.Integer@estacmattis.com', N'Tad', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (199, N'Tucker Branch', N'1042 Vulputate, Rd.', N'Wagga Wagga', N'New South Wales', N'7670', N'786-994-6809', N'Ut.semper@veliteget.com', N'Kadeem', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (200, N'Burton Little', N'461-6764 Non St.', N'Gladstone', N'Queensland', N'3517', N'384-942-3459', N'Cras.lorem.lorem@odiosemper.ca', N'Cody', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (201, N'Nolan Chen', N'354-276 Dignissim. St.', N'Redlands', N'QLD', N'2824', N'253-889-2894', N'ante.dictum@magna.org', N'Stephen', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
GO
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (202, N'Yardley Marks', N'777-701 Nullam Av.', N'Bundaberg', N'QLD', N'2483', N'283-624-1514', N'leo.Cras@arcu.edu', N'Dillon', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (203, N'Grady Hanson', N'P.O. Box 464, 4297 Volutpat. Street', N'Ararat', N'VIC', N'3368', N'355-542-6128', N'fringilla.euismod@Quisqueporttitoreros.com', N'Peter', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (204, N'Riley Stone', N'Ap #999-4933 Amet, St.', N'Bairnsdale', N'VIC', N'1034', N'150-851-6934', N'nulla.Donec@interdumCurabiturdictum.edu', N'Bruce', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (205, N'William Salas', N'881-2110 Aliquam St.', N'Belmont', N'Western Australia', N'8699', N'496-594-7723', N'semper.auctor.Mauris@luctusutpellentesque.ca', N'Solomon', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (206, N'Octavia Nieves', N'Ap #368-5787 Proin Avenue', N'Hervey Bay', N'Queensland', N'7284', N'179-162-1521', N'Quisque.imperdiet.erat@pulvinararcuet.ca', N'Jonah', CAST(N'2021-01-19T20:59:01.987' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (207, N'Preston Bender', N'9612 Metus Ave', N'Horsham', N'VIC', N'7651', N'172-286-7980', N'velit@Donec.edu', N'Myles', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (208, N'Driscoll Hines', N'P.O. Box 902, 2327 Quam Street', N'Maryborough', N'QLD', N'9682', N'906-342-4755', N'placerat.eget.venenatis@natoquepenatibuset.ca', N'Hop', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (209, N'Gabriel Walls', N'Ap #114-4376 Nunc Rd.', N'Dandenong', N'Victoria', N'7056', N'679-598-8071', N'elementum@hendrerit.net', N'Craig', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (210, N'Upton Perkins', N'P.O. Box 216, 9478 Velit Rd.', N'Mount Isa', N'QLD', N'6157', N'641-123-7857', N'eleifend.non.dapibus@velnisl.edu', N'Abbot', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (211, N'April Ortiz', N'875-8222 Dictum St.', N'Gosnells', N'Western Australia', N'5985', N'428-455-1110', N'id.erat@seddolorFusce.co.uk', N'Xavier', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (212, N'Kaitlin Spence', N'Ap #901-1557 Semper Rd.', N'Wollongong', N'NSW', N'9903', N'284-386-7633', N'elit@idmagnaet.ca', N'Alan', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (213, N'Kiara Wolfe', N'2452 Et Road', N'Nedlands', N'Western Australia', N'1805', N'262-532-4523', N'blandit.at@eu.co.uk', N'Curran', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (214, N'Quin Hammond', N'614-1737 Consequat St.', N'Grafton', N'NSW', N'7125', N'765-688-3896', N'enim.Suspendisse.aliquet@nibhDonec.ca', N'Lane', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (215, N'Henry Holcomb', N'2990 Ut Rd.', N'Launceston', N'Tasmania', N'2871', N'790-534-8673', N'nisi.Cum@tempor.ca', N'Jermaine', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (216, N'Steven Butler', N'4602 Quam Road', N'Bunbury', N'Western Australia', N'7157', N'693-334-1935', N'in.molestie.tortor@massa.edu', N'Tobias', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (217, N'Hedwig Olson', N'437-978 Sem. St.', N'Maryborough', N'QLD', N'1081', N'556-132-5109', N'vestibulum.massa.rutrum@vel.net', N'Nasim', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (218, N'Fay Kent', N'Ap #596-8237 Posuere Street', N'Port Lincoln', N'South Australia', N'8382', N'715-126-1128', N'Suspendisse.ac@erat.com', N'Ciaran', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (219, N'Thomas Marks', N'434-2197 Quam, Street', N'Townsville', N'Queensland', N'3413', N'248-190-5400', N'Curabitur@ipsumdolorsit.net', N'Barry', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (220, N'Theodore Shields', N'441-926 Commodo Avenue', N'Gladstone', N'QLD', N'2115', N'479-644-9504', N'nec@Aeneaneuismodmauris.co.uk', N'Harper', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (221, N'Sandra Schwartz', N'6987 Ac St.', N'Tamworth', N'NSW', N'2653', N'168-292-1115', N'conubia.nostra@Quisqueporttitor.co.uk', N'Francis', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (223, N'Armando Gross', N'691-2406 Eget Av.', N'Cairns', N'QLD', N'7485', N'981-337-2823', N'pellentesque.eget.dictum@magna.com', N'Hector', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (224, N'Leslie Brewer', N'P.O. Box 868, 4300 Lorem, Street', N'Ararat', N'VIC', N'8215', N'616-300-0969', N'sapien.Aenean.massa@libero.co.uk', N'Trevor', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (225, N'Marsden Norton', N'Ap #558-6942 Eget Av.', N'Queanbeyan', N'NSW', N'9100', N'951-168-1610', N'eget.varius@nuncsed.org', N'Colt', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (226, N'Halla Lyons', N'2393 Proin Road', N'Campbelltown', N'NSW', N'7052', N'887-269-0530', N'adipiscing.elit@luctusvulputatenisi.co.uk', N'Garrett', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (227, N'Wing Cain', N'Ap #104-5603 Fringilla, Av.', N'Cessnock', N'New South Wales', N'9752', N'545-590-1239', N'sed.leo@Duis.org', N'Colton', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (228, N'Christine Hendricks', N'823-2989 Rhoncus Street', N'Traralgon', N'VIC', N'2819', N'117-336-6088', N'sit.amet@vitaemauris.edu', N'Cedric', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (229, N'Ishmael Cline', N'8054 Ultrices Ave', N'Ipswich', N'QLD', N'9481', N'738-186-7615', N'enim.condimentum.eget@senectus.edu', N'Coby', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (230, N'Regina Mercer', N'Ap #979-1545 Sit St.', N'Murray Bridge', N'South Australia', N'2037', N'538-616-9288', N'Aliquam.tincidunt.nunc@facilisisSuspendisse.edu', N'Forrest', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (231, N'Jack Bender', N'P.O. Box 404, 6408 Non Ave', N'Armidale', N'NSW', N'4848', N'294-262-6319', N'eros.non@orciconsectetuereuismod.com', N'Dylan', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (232, N'Halee Livingston', N'P.O. Box 746, 6387 Et Street', N'Albury', N'NSW', N'4887', N'525-949-6716', N'dolor.quam.elementum@erosnec.ca', N'Kermit', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (233, N'Athena Cruz', N'Ap #300-7509 Malesuada Rd.', N'Devonport', N'TAS', N'4490', N'814-938-6846', N'odio.vel.est@lacus.net', N'Leroy', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (234, N'Burton Crane', N'742-1131 Semper Ave', N'Hamilton', N'VIC', N'5151', N'277-213-3482', N'lorem.ac.risus@Phasellus.net', N'Driscoll', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (235, N'Jakeem Andrews', N'5537 Risus. Av.', N'Frankston', N'Victoria', N'7978', N'662-209-9566', N'dignissim.pharetra.Nam@neque.ca', N'Derek', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (236, N'Linda Franks', N'Ap #902-8463 Ut St.', N'Maryborough', N'Queensland', N'5321', N'232-725-0560', N'mauris.id.sapien@luctusipsum.org', N'Wing', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (237, N'Calista Dunlap', N'P.O. Box 379, 4049 Nunc Rd.', N'Warrnambool', N'VIC', N'3448', N'541-351-9019', N'nunc.ac.mattis@porttitor.com', N'Kasper', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (238, N'Clayton Berger', N'Ap #500-1911 Scelerisque Rd.', N'Campbelltown', N'New South Wales', N'9886', N'637-191-5452', N'augue@inlobortis.edu', N'Orson', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (239, N'Oscar Weeks', N'9031 Dignissim. Street', N'Sydney', N'New South Wales', N'3558', N'468-386-7231', N'Vivamus@Nuncuterat.ca', N'Caleb', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (240, N'Basia Fuller', N'Ap #363-8798 Enim. Road', N'Maryborough', N'Queensland', N'7202', N'577-421-5431', N'erat.semper.rutrum@tincidunt.ca', N'Octavius', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (241, N'Brandon Hayden', N'P.O. Box 807, 5591 Sodales Av.', N'Bendigo', N'VIC', N'4788', N'995-670-1474', N'diam.Proin.dolor@inceptoshymenaeos.co.uk', N'Colton', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (242, N'Noelani Clemons', N'Ap #560-4880 Vel, Avenue', N'Nedlands', N'Western Australia', N'6620', N'165-613-8879', N'nascetur.ridiculus@purusmaurisa.edu', N'Vladimir', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (243, N'Perry Atkins', N'4114 Convallis, Street', N'Port Augusta', N'SA', N'1129', N'422-832-8414', N'Duis.dignissim@pede.net', N'Ian', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (244, N'Iris Padilla', N'6416 Adipiscing, Rd.', N'Frankston', N'Victoria', N'4716', N'501-736-0719', N'Integer.urna@Nullaeuneque.edu', N'Brian', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (245, N'Judith Sanford', N'P.O. Box 190, 3506 Dolor. Street', N'Hervey Bay', N'Queensland', N'7824', N'581-217-4466', N'mattis@ultriciesligula.ca', N'Cairo', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (246, N'Neville Buck', N'3930 Mollis. St.', N'Mount Gambier', N'South Australia', N'8272', N'320-474-9307', N'Suspendisse.commodo.tincidunt@ullamcorper.net', N'Stephen', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (247, N'Alea Matthews', N'Ap #433-5144 Velit. Av.', N'Wangaratta', N'Victoria', N'6488', N'552-545-0476', N'eu@est.com', N'Daniel', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (248, N'Xerxes Morales', N'101-902 Natoque St.', N'Subiaco', N'WA', N'5968', N'563-956-0984', N'Morbi@feugiatSednec.ca', N'Dexter', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (249, N'Talon Luna', N'5281 Sit Road', N'Grafton', N'NSW', N'3270', N'307-815-3778', N'nunc.est.mollis@dapibusrutrum.edu', N'Dennis', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (250, N'Baker Tyson', N'949-9961 Ac Av.', N'Warrnambool', N'VIC', N'8119', N'375-950-9849', N'lorem.auctor@Phasellusin.ca', N'Cody', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (251, N'Cherokee Gilliam', N'P.O. Box 161, 1601 Primis Road', N'Penrith', N'New South Wales', N'3257', N'846-835-5912', N'arcu.ac.orci@nonummyFusce.co.uk', N'Byron', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (252, N'Bo Sawyer', N'Ap #831-9755 Urna St.', N'Horsham', N'VIC', N'2261', N'790-206-0187', N'non@neceleifendnon.org', N'Hamish', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (253, N'August Fitzgerald', N'P.O. Box 594, 3900 Lobortis Rd.', N'Wollongong', N'NSW', N'2667', N'877-479-3278', N'aliquet.Phasellus@a.com', N'Vladimir', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (254, N'Tana Wong', N'P.O. Box 880, 7122 Dolor Avenue', N'Albury', N'NSW', N'7716', N'793-653-2724', N'nascetur@ligulaAliquam.com', N'Eaton', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (255, N'Amity Camacho', N'452-9484 Nulla St.', N'Geelong', N'VIC', N'6109', N'377-537-3466', N'quis.massa.Mauris@quamafelis.org', N'Upton', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (256, N'Flynn Blackwell', N'P.O. Box 683, 6932 Sodales Street', N'Redlands', N'Queensland', N'9856', N'172-216-8882', N'Quisque.ornare@amet.com', N'Rigel', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (257, N'Roary Nolan', N'P.O. Box 998, 4977 Leo St.', N'Penrith', N'NSW', N'4214', N'625-594-0725', N'tristique.pellentesque@natoquepenatibuset.ca', N'Brody', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (258, N'Nerea Tucker', N'2647 At St.', N'Swan Hill', N'Victoria', N'5452', N'295-310-2590', N'orci@nequenonquam.com', N'Zachery', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (259, N'Hector Wolf', N'Ap #927-2007 Condimentum St.', N'Adelaide', N'SA', N'7507', N'675-208-0236', N'Praesent@dictumplacerat.co.uk', N'Ronan', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (260, N'Isaac Wyatt', N'P.O. Box 613, 2440 Ut Rd.', N'Launceston', N'Tasmania', N'7398', N'481-182-2861', N'vitae.semper.egestas@nibhQuisquenonummy.edu', N'Arsenio', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (261, N'Ashton Stuart', N'Ap #718-595 Sagittis. Road', N'Rockingham', N'Western Australia', N'4398', N'261-253-7773', N'consectetuer@Phasellusvitae.com', N'Robert', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (262, N'Quinlan Odom', N'P.O. Box 780, 1536 Mus. Rd.', N'Ipswich', N'Queensland', N'6111', N'710-268-8684', N'pellentesque@ametante.co.uk', N'Moses', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (263, N'Diana Lowe', N'120-402 In St.', N'Cessnock', N'NSW', N'5146', N'500-374-9073', N'fringilla.porttitor.vulputate@mitemporlorem.net', N'Duncan', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (264, N'Vladimir Pratt', N'P.O. Box 557, 6751 Interdum Rd.', N'Gladstone', N'Queensland', N'5030', N'639-870-2178', N'non.enim.commodo@velitdui.edu', N'Driscoll', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (265, N'Keely Finch', N'Ap #768-7615 Dui. St.', N'Townsville', N'Queensland', N'7545', N'750-622-9313', N'in.tempus@accumsanneque.com', N'Jordan', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (266, N'Orlando Torres', N'P.O. Box 282, 8591 Nec, Av.', N'Queanbeyan', N'NSW', N'7652', N'310-111-2984', N'vestibulum.lorem.sit@sitamet.net', N'Emmanuel', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (267, N'Tyrone Aguirre', N'P.O. Box 742, 1426 Aenean Ave', N'Cairns', N'Queensland', N'4235', N'205-782-6483', N'Aenean.gravida@maurissitamet.ca', N'Rooney', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (268, N'Valentine Kelley', N'P.O. Box 469, 8126 Mi St.', N'Queanbeyan', N'NSW', N'9474', N'462-782-8769', N'ipsum.primis.in@Morbi.co.uk', N'Daquan', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (269, N'Rhea Stanley', N'P.O. Box 966, 5056 Suspendisse Rd.', N'Liverpool', N'New South Wales', N'9871', N'779-563-2577', N'fermentum.vel.mauris@acorciUt.org', N'Drew', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (270, N'Hayley Mcmillan', N'P.O. Box 509, 1747 Nullam Ave', N'Belmont', N'Western Australia', N'7217', N'989-638-2891', N'quis.diam@estvitaesodales.net', N'Kibo', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (271, N'Wynter Rush', N'Ap #332-9480 Urna, St.', N'Orange', N'NSW', N'8117', N'810-556-4890', N'Aenean@pedeet.net', N'Hayden', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (272, N'Colorado Battle', N'Ap #650-9531 Lobortis Ave', N'Caloundra', N'QLD', N'5172', N'620-740-6253', N'cursus.et.eros@Morbinonsapien.edu', N'Joel', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (273, N'Curran Miles', N'176-3372 Nisi St.', N'Caloundra', N'QLD', N'8865', N'339-883-2579', N'molestie.Sed@euodio.net', N'Axel', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (274, N'Sylvester Boyer', N'Ap #658-5625 Eu Av.', N'Redlands', N'QLD', N'6141', N'654-471-4374', N'pede.malesuada.vel@arcuetpede.org', N'Dante', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (275, N'Vladimir Vinson', N'Ap #557-7363 Porttitor St.', N'Charters Towers', N'QLD', N'9122', N'215-171-8780', N'Nulla.aliquet.Proin@natoque.com', N'Malik', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (276, N'Sarah Bauer', N'1346 Suspendisse Avenue', N'Belgrave', N'VIC', N'2479', N'495-426-0448', N'egestas@fringilla.org', N'Knox', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (277, N'Wyatt Macdonald', N'730-5313 Nonummy St.', N'Wangaratta', N'Victoria', N'3223', N'432-949-3882', N'sit.amet@sitametrisus.edu', N'Abraham', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (278, N'Cherokee Roth', N'P.O. Box 597, 1818 Ligula Road', N'Campbelltown', N'New South Wales', N'6808', N'467-337-2464', N'ultrices.Duis@tincidunt.ca', N'Kennan', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (279, N'Shad Black', N'Ap #713-488 Enim. Avenue', N'Maryborough', N'QLD', N'8655', N'915-960-7018', N'amet.metus.Aliquam@eget.edu', N'Charles', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (280, N'Shaeleigh Alston', N'5248 Phasellus St.', N'Liverpool', N'NSW', N'6607', N'556-396-6251', N'arcu.Vestibulum.ante@Vivamus.org', N'Adam', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (281, N'Cyrus Grimes', N'198-1351 Donec Street', N'Horsham', N'Victoria', N'6429', N'601-791-4342', N'sem@auctor.ca', N'Thaddeus', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (282, N'Eric Roman', N'P.O. Box 173, 6306 Nunc Av.', N'Liverpool', N'New South Wales', N'4816', N'432-368-8785', N'Donec.nibh.Quisque@Crasconvallis.net', N'Clayton', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (283, N'Adena Wood', N'720-7239 Sagittis Road', N'Hervey Bay', N'QLD', N'1746', N'853-593-8294', N'eleifend.Cras.sed@mauriseuelit.net', N'Scott', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (284, N'Cameron Mcdowell', N'Ap #503-9978 Leo. Street', N'Mount Gambier', N'South Australia', N'5702', N'574-910-2314', N'Sed@ipsum.co.uk', N'Oren', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (285, N'Arthur Odom', N'1674 Tincidunt Ave', N'Hervey Bay', N'QLD', N'4992', N'689-481-6603', N'Nam.consequat.dolor@eleifendCras.ca', N'Tyrone', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (286, N'Jena Martinez', N'6702 Libero. St.', N'Orange', N'NSW', N'6545', N'209-365-7675', N'odio@eget.edu', N'Hedley', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (287, N'Hillary Dorsey', N'P.O. Box 426, 4598 Metus Street', N'Adelaide', N'South Australia', N'7269', N'146-767-1533', N'orci@velitCraslorem.ca', N'Quinlan', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (288, N'Bruno Clark', N'3404 Gravida St.', N'Newcastle', N'New South Wales', N'4974', N'448-938-8735', N'sollicitudin.adipiscing@pharetrautpharetra.net', N'Isaac', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (289, N'Britanney Acosta', N'P.O. Box 225, 9451 Purus. St.', N'Bendigo', N'Victoria', N'9072', N'538-700-0928', N'Sed.molestie.Sed@Aliquamvulputate.ca', N'Lars', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (290, N'Charles Webb', N'Ap #706-1277 Quam, Ave', N'Hamilton', N'Victoria', N'7383', N'140-910-4871', N'vitae.risus.Duis@anteVivamus.edu', N'Barry', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (291, N'Ina Daugherty', N'847-3013 Dignissim Av.', N'Darwin', N'NT', N'7357', N'373-315-7125', N'nec@nuncullamcorpereu.co.uk', N'Sean', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (292, N'Holly Harper', N'P.O. Box 907, 3712 Integer Rd.', N'Shepparton', N'Victoria', N'6873', N'234-308-0850', N'amet@eratneque.net', N'Arden', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (293, N'Hector Valencia', N'183-124 Magna Av.', N'Orange', N'NSW', N'8350', N'937-904-0681', N'dapibus@felisDonectempor.com', N'Ryan', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (294, N'Bruno Lane', N'Ap #193-9106 Blandit St.', N'Canning', N'Western Australia', N'4760', N'648-141-6815', N'metus@penatibusetmagnis.net', N'Baker', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (295, N'Luke Weiss', N'P.O. Box 761, 6452 Etiam Rd.', N'Townsville', N'QLD', N'3329', N'515-790-0701', N'Praesent@convalliserateget.com', N'Burton', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (296, N'Galena Guerrero', N'8202 Aenean Rd.', N'Lithgow', N'New South Wales', N'3319', N'584-946-2322', N'primis.in@diam.com', N'Dexter', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (297, N'Jacob Mccarty', N'7458 Tortor, Av.', N'Armidale', N'NSW', N'4843', N'486-116-2669', N'Nunc@magnaLoremipsum.org', N'Hedley', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (298, N'Tatum Torres', N'P.O. Box 786, 6570 Dolor. Street', N'Belgrave', N'VIC', N'1466', N'675-572-1561', N'sed.dictum@Aliquamerat.org', N'Kadeem', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (299, N'Orli Talley', N'3056 Eros. St.', N'Canberra', N'ACT', N'4109', N'474-816-6339', N'egestas.Aliquam@necorciDonec.edu', N'Price', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (300, N'Kadeem Bentley', N'706-7341 Adipiscing Avenue', N'Goulburn', N'New South Wales', N'5902', N'130-162-2197', N'nonummy.ipsum.non@Quisqueac.com', N'Anthony', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (301, N'Alec Christensen', N'4246 Nullam Rd.', N'Palmerston', N'Northern Territory', N'6366', N'560-203-6577', N'porta.elit.a@idante.org', N'Rashad', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (302, N'Gwendolyn Singleton', N'P.O. Box 417, 4132 Vitae, Ave', N'Sale', N'Victoria', N'7619', N'694-271-3091', N'malesuada.fames.ac@scelerisqueloremipsum.com', N'William', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
GO
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (303, N'Armand Mcdowell', N'Ap #864-3803 A, St.', N'Wagga Wagga', N'NSW', N'7608', N'273-623-7332', N'blandit@etmalesuadafames.co.uk', N'Mason', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (304, N'Ciara Norris', N'4156 At Ave', N'Joondalup', N'Western Australia', N'8336', N'845-134-3207', N'a.feugiat@quamvelsapien.co.uk', N'Ezekiel', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (305, N'Alyssa Warren', N'Ap #567-9860 Mauris. Ave', N'Goulburn', N'NSW', N'1378', N'882-655-4707', N'velit.dui.semper@enimSed.com', N'Felix', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [Province], [PostalCode], [Phone], [Email], [ContactPerson], [DateCreated]) VALUES (306, N'Medge Pearson', N'P.O. Box 407, 6978 Tellus. Ave', N'Canberra', N'Australian Capital Territory', N'2338', N'956-423-4914', N'Nunc@utmolestie.co.uk', N'Lyle', CAST(N'2021-01-19T20:59:07.997' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Executions] ON 

INSERT [dbo].[Executions] ([Id], [Status], [OnStateFrom], [LastExecuted], [Uri], [Name], [DiscoveryService]) VALUES (1, 2, CAST(N'2021-01-31T18:01:15.9023919' AS DateTime2), CAST(N'2021-02-09T03:34:56.3098893' AS DateTime2), N'/healthchecks', N'Pezza.Api', NULL)
SET IDENTITY_INSERT [dbo].[Executions] OFF
GO
SET IDENTITY_INSERT [dbo].[HealthCheckExecutionEntries] ON 

INSERT [dbo].[HealthCheckExecutionEntries] ([Id], [Name], [Status], [Description], [Duration], [HealthCheckExecutionId], [Tags]) VALUES (1, N'sqlserver', 2, NULL, CAST(N'00:00:00.0027517' AS Time), 1, N'[]')
SET IDENTITY_INSERT [dbo].[HealthCheckExecutionEntries] OFF
GO
SET IDENTITY_INSERT [dbo].[Notify] ON 

INSERT [dbo].[Notify] ([Id], [CustomerId], [Email], [Sent], [Retry], [DateSent]) VALUES (1, 4, N'johndoe@test.com', 1, 0, CAST(N'2021-01-19T06:21:44.403' AS DateTime))
INSERT [dbo].[Notify] ([Id], [CustomerId], [Email], [Sent], [Retry], [DateSent]) VALUES (2, 4, N'johndoe@test.com', 1, 0, CAST(N'2021-01-19T06:22:17.220' AS DateTime))
INSERT [dbo].[Notify] ([Id], [CustomerId], [Email], [Sent], [Retry], [DateSent]) VALUES (3, 6, N'johndoe@sa.com', 1, 0, CAST(N'2021-01-19T06:23:51.727' AS DateTime))
INSERT [dbo].[Notify] ([Id], [CustomerId], [Email], [Sent], [Retry], [DateSent]) VALUES (4, 6, N'johndoe@sa.com', 1, 0, CAST(N'2021-01-21T20:44:39.293' AS DateTime))
INSERT [dbo].[Notify] ([Id], [CustomerId], [Email], [Sent], [Retry], [DateSent]) VALUES (5, 6, N'johndoe@sa.com', 1, 0, CAST(N'2021-01-21T20:47:24.313' AS DateTime))
INSERT [dbo].[Notify] ([Id], [CustomerId], [Email], [Sent], [Retry], [DateSent]) VALUES (6, 6, N'johndoe@sa.com', 1, 0, CAST(N'2021-01-21T20:56:24.263' AS DateTime))
INSERT [dbo].[Notify] ([Id], [CustomerId], [Email], [Sent], [Retry], [DateSent]) VALUES (7, 6, N'johndoe@sa.com', 1, 0, CAST(N'2021-01-21T21:00:42.100' AS DateTime))
INSERT [dbo].[Notify] ([Id], [CustomerId], [Email], [Sent], [Retry], [DateSent]) VALUES (8, 6, N'johndoe@sa.com', 1, 0, CAST(N'2021-01-21T21:01:19.643' AS DateTime))
INSERT [dbo].[Notify] ([Id], [CustomerId], [Email], [Sent], [Retry], [DateSent]) VALUES (9, 4, N'johndoe@test.com', 1, 0, CAST(N'2021-01-21T21:02:41.780' AS DateTime))
SET IDENTITY_INSERT [dbo].[Notify] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [CustomerId], [RestaurantId], [Amount], [DateCreated], [Completed]) VALUES (3, 6, 1, CAST(138.00 AS Decimal(17, 2)), CAST(N'2021-01-10T08:27:03.333' AS DateTime), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [RestaurantId], [Amount], [DateCreated], [Completed]) VALUES (4, 6, 4, CAST(207.00 AS Decimal(17, 2)), CAST(N'2021-01-10T08:27:44.833' AS DateTime), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [RestaurantId], [Amount], [DateCreated], [Completed]) VALUES (5, 4, 2, CAST(360.00 AS Decimal(17, 2)), CAST(N'2021-01-10T08:29:14.910' AS DateTime), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [RestaurantId], [Amount], [DateCreated], [Completed]) VALUES (6, 4, 2, CAST(207.00 AS Decimal(17, 2)), CAST(N'2021-01-13T13:16:16.993' AS DateTime), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [RestaurantId], [Amount], [DateCreated], [Completed]) VALUES (1006, 6, 2, CAST(207.00 AS Decimal(17, 2)), CAST(N'2021-01-19T06:01:59.783' AS DateTime), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [RestaurantId], [Amount], [DateCreated], [Completed]) VALUES (1007, 4, 2, CAST(207.00 AS Decimal(17, 2)), CAST(N'2021-01-19T06:02:35.533' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (3, 3, 2, 2)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (4, 4, 2, 3)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (5, 5, 4, 5)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (6, 6, 2, 3)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1006, 1006, 2, 3)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1007, 1007, 2, 3)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [PictureUrl], [Price], [Special], [OfferEndDate], [OfferPrice], [IsActive], [DateCreated]) VALUES (2, N'Cheese Speciality', N'Tomato Base, 3 Secret Cheeses', N'2020-12-26_09-18-33-216.jpg', CAST(69.00 AS Decimal(17, 2)), 1, NULL, NULL, 1, CAST(N'2021-01-07T09:18:33.217' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Description], [PictureUrl], [Price], [Special], [OfferEndDate], [OfferPrice], [IsActive], [DateCreated]) VALUES (3, N'Peperoni', N'Tomato Base, Pepperoni & Garlic', N'2020-12-26_09-18-33-216.jpg', CAST(69.00 AS Decimal(17, 2)), 0, NULL, NULL, 1, CAST(N'2021-01-07T09:18:33.217' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Description], [PictureUrl], [Price], [Special], [OfferEndDate], [OfferPrice], [IsActive], [DateCreated]) VALUES (4, N'BBQ Chicken', N'Barbeque Base, Chicken & Mushroom', N'2020-12-26_09-18-33-216.jpg', CAST(72.00 AS Decimal(17, 2)), 0, NULL, NULL, 1, CAST(N'2021-01-07T09:18:33.217' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Description], [PictureUrl], [Price], [Special], [OfferEndDate], [OfferPrice], [IsActive], [DateCreated]) VALUES (5, N'Hawain', N'Tomato Base, Ham & Pineapple', N'2020-12-26_09-18-33-216.jpg', CAST(69.00 AS Decimal(17, 2)), 1, NULL, NULL, 1, CAST(N'2020-12-26T09:18:33.237' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Description], [PictureUrl], [Price], [Special], [OfferEndDate], [OfferPrice], [IsActive], [DateCreated]) VALUES (6, N'Suppreme', N'Tomato Base, Pepperoni, Mushroom, & Onion', N'2020-12-26_09-18-33-216.jpg', CAST(69.00 AS Decimal(17, 2)), 0, NULL, NULL, 1, CAST(N'2021-01-07T09:18:33.217' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Restaurant] ON 

INSERT [dbo].[Restaurant] ([Id], [Name], [Description], [PictureUrl], [Address], [City], [Province], [PostalCode], [IsActive], [DateCreated]) VALUES (1, N'Pretoria', N'Test', N'2020-12-23_23-09-45-254.svg', N'51 test', N'Alberton', N'Eastern Cape', N'2222', 1, CAST(N'2020-12-23T14:15:23.473' AS DateTime))
INSERT [dbo].[Restaurant] ([Id], [Name], [Description], [PictureUrl], [Address], [City], [Province], [PostalCode], [IsActive], [DateCreated]) VALUES (2, N'Melrose Arch', N'Melrose Pezza', N'https://localhost:44315/Picture?file=2020-12-23_23-09-45-254.svg&folder=restaurant', N'51 South Street', N'Alberton', N'Eastern Cape', N'0018', 1, CAST(N'2020-12-23T14:15:23.473' AS DateTime))
INSERT [dbo].[Restaurant] ([Id], [Name], [Description], [PictureUrl], [Address], [City], [Province], [PostalCode], [IsActive], [DateCreated]) VALUES (3, N'The Club', N'The Club Pezza', N'2020-12-23_23-09-45-254.svg', N'9 East Road', N'Pretoria', N'Gauteng', N'2479', 1, CAST(N'2020-12-23T14:15:23.473' AS DateTime))
INSERT [dbo].[Restaurant] ([Id], [Name], [Description], [PictureUrl], [Address], [City], [Province], [PostalCode], [IsActive], [DateCreated]) VALUES (4, N'V&ampA Waterfront', N'V&A Pezza', N'2020-12-23_23-09-45-254.svg', N'11 West Boulevard', N'Cape Town', N'Eastern Cape', N'2305', 1, CAST(N'2020-12-23T14:15:23.473' AS DateTime))
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([Id], [Name], [UnitOfMeasure], [ValueOfMeasure], [Quantity], [ExpiryDate], [DateCreated], [Comment]) VALUES (11, N'Flour', N'Kg', CAST(50.00 AS Decimal(18, 2)), 500, NULL, CAST(N'2021-05-18T20:43:28.473' AS DateTime), NULL)
INSERT [dbo].[Stock] ([Id], [Name], [UnitOfMeasure], [ValueOfMeasure], [Quantity], [ExpiryDate], [DateCreated], [Comment]) VALUES (12, N'John Doe', N'kg', CAST(2.00 AS Decimal(18, 2)), 2, NULL, CAST(N'2021-05-18T21:15:48.653' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Run every minute', N'CreatedAt', N'1611817201401', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Run every minute', N'Cron', N'* * * * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Run every minute', N'Job', N'{"t":"Pezza.Scheduler.Jobs.OrderCompleteJob, Pezza.Scheduler, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","m":"SendNotficationAsync"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Run every minute', N'NextExecution', N'1611817260000', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Run every minute', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Run every minute', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:Run every minute', N'V', N'2', NULL)
GO
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (1, 1, N'Enqueued', N'{"t":"System.Console, System.Console, Version=4.1.2.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","m":"WriteLine","p":["System.String, System.Private.CoreLib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e"]}', N'["\"Run Hangfire job while it''s hot!\""]', CAST(N'2021-01-28T05:45:55.330' AS DateTime), NULL)
SET IDENTITY_INSERT [HangFire].[Job] OFF
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'CurrentCulture', N'"en-ZA"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'CurrentUICulture', N'"en-US"')
GO
SET IDENTITY_INSERT [HangFire].[JobQueue] ON 

INSERT [HangFire].[JobQueue] ([Id], [JobId], [Queue], [FetchedAt]) VALUES (1, 1, N'default', NULL)
SET IDENTITY_INSERT [HangFire].[JobQueue] OFF
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (7)
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1611817260, N'Run every minute', NULL)
GO
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (1, 1, N'Enqueued', NULL, CAST(N'2021-01-28T05:45:55.563' AS DateTime), N'{"EnqueuedAt":"1611812755084","Queue":"default"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
GO
/****** Object:  Index [IX_HealthCheckExecutionEntries_HealthCheckExecutionId]    Script Date: 2022/03/22 21:44:27 ******/
CREATE NONCLUSTERED INDEX [IX_HealthCheckExecutionEntries_HealthCheckExecutionId] ON [dbo].[HealthCheckExecutionEntries]
(
	[HealthCheckExecutionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HealthCheckExecutionHistories_HealthCheckExecutionId]    Script Date: 2022/03/22 21:44:27 ******/
CREATE NONCLUSTERED INDEX [IX_HealthCheckExecutionHistories_HealthCheckExecutionId] ON [dbo].[HealthCheckExecutionHistories]
(
	[HealthCheckExecutionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 2022/03/22 21:44:27 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 2022/03/22 21:44:27 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 2022/03/22 21:44:27 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE([StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 2022/03/22 21:44:27 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 2022/03/22 21:44:27 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 2022/03/22 21:44:27 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 2022/03/22 21:44:27 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 2022/03/22 21:44:27 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Notify] ADD  CONSTRAINT [DF_Notify_Sent]  DEFAULT ((0)) FOR [Sent]
GO
ALTER TABLE [dbo].[Notify] ADD  CONSTRAINT [DF_Notify_Retry]  DEFAULT ((0)) FOR [Retry]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Completed]  DEFAULT ((0)) FOR [Completed]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Special]  DEFAULT ((0)) FOR [Special]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Restaurant] ADD  CONSTRAINT [DF_Restaurant_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Restaurant] ADD  CONSTRAINT [DF_Restaurant_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[HealthCheckExecutionEntries]  WITH CHECK ADD  CONSTRAINT [FK_HealthCheckExecutionEntries_Executions_HealthCheckExecutionId] FOREIGN KEY([HealthCheckExecutionId])
REFERENCES [dbo].[Executions] ([Id])
GO
ALTER TABLE [dbo].[HealthCheckExecutionEntries] CHECK CONSTRAINT [FK_HealthCheckExecutionEntries_Executions_HealthCheckExecutionId]
GO
ALTER TABLE [dbo].[HealthCheckExecutionHistories]  WITH CHECK ADD  CONSTRAINT [FK_HealthCheckExecutionHistories_Executions_HealthCheckExecutionId] FOREIGN KEY([HealthCheckExecutionId])
REFERENCES [dbo].[Executions] ([Id])
GO
ALTER TABLE [dbo].[HealthCheckExecutionHistories] CHECK CONSTRAINT [FK_HealthCheckExecutionHistories_Executions_HealthCheckExecutionId]
GO
ALTER TABLE [dbo].[Notify]  WITH CHECK ADD  CONSTRAINT [FK_Notify_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Notify] CHECK CONSTRAINT [FK_Notify_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Restaurant] FOREIGN KEY([RestaurantId])
REFERENCES [dbo].[Restaurant] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Restaurant]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Product]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
USE [master]
GO
ALTER DATABASE [PezzaDb] SET  READ_WRITE 
GO