use DrivingSchoolDb


CREATE TABLE [dbo].[Customer]
(
     [ID] [smallint] IDENTITY(1,1) NOT NULL,
	 [FirstName] [nvarchar](50) NOT NULL,
	 [LastName] [nvarchar](50) NOT NULL,
	 [DateOfBith] [date] NOT NULL,
	 [Gender] [nvarchar](1) NOT NULL,
	 [NationalIDNumber] [nvarchar](50) NOT NULL,
	 [BankCard] [nvarchar](20) NOT NULL,
	 [PhoneNumber] [nvarchar](20) NOT NULL,
	 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED
	 (
	       [ID] ASC
	 )
)
go
CREATE TABLE [dbo].[Instructor]
(
	 [ID] [smallint] IDENTITY(1,1) NOT NULL,
	 [FirstName] [nvarchar](50) NOT NULL,
	 [LastName] [nvarchar](50) NOT NULL,
	 [Age] [int] NOT NULL,
	 [Gender] [nvarchar](1) NOT NULL,
	 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED
	 (
	       [ID] ASC
	 )
)
go
CREATE TABLE [dbo].[Category]
(
	 [ID] [smallint] IDENTITY(1,1) NOT NULL,
	 [Category] [int] NOT NULL,
	 [Vehicle] [nvarchar](50) NOT NULL,
	 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED
	 (
	       [ID] ASC
	 )
)
go
CREATE TABLE [dbo].[Vehicle]
(
	 [ID] [smallint] IDENTITY(1,1) NOT NULL,
	 [Type] [nvarchar](50) NOT NULL,
	 [Color] [nvarchar](50) NOT NULL,
	 [Speed] [int] NOT NULL
	 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED
	 (
	       [ID] ASC
	 )
)
go
CREATE TABLE [dbo].[AchievementType]
(
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Proints] [tinyint] NULL,
	[Hours] [int] NULL,
	CONSTRAINT [PK_AchievementType] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)
)
go
CREATE TABLE [dbo].[InstructorAchievement]
(
	 [ID] [smallint] IDENTITY(1,1) NOT NULL,
	 [TimeSpendPolygon] [nvarchar](50) NULL,
	 [TimeSpendCity] [nvarchar](50) NULL,
	 [CustomerSatisfaction] [int] NULL,
	 CONSTRAINT [PK_InstructorAchievement] PRIMARY KEY CLUSTERED
	 (
	       [ID] ASC
	 )
)
go
CREATE TABLE [dbo].[Order]
(
	 [ID] [smallint] IDENTITY(1,1) NOT NULL,
	 [DayStart] [nvarchar](50) NULL,
	 [DayEnd] [nvarchar](50) NULL,
	 [CustomerID] [int] NOT NULL,
	 [InstructorID] [int] NOT NULL,

	 CONSTRAINT [PK_InstructorAchievement] PRIMARY KEY CLUSTERED
	 (
	       [ID] ASC
	 )
)
go