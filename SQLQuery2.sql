create table [dbo].[Custumer]
(
   [Id] [int] identity(1,1) not null,
   [Name] [nvarchar](100) not null,
   [AccountNumber] [nvarchar](50) null,
   [City] [nvarchar](100) null,
   [RegionName] [nvarchar](100) null,
   [CustomerSize] [nvarchar](10) null,
   [PhoneNumber] [nvarchar](20) null,
   [isActive] [bit] not null,
constraint [PK_Customer] primary key clustered
(
   [Id] asc
))

create table [dbo].[Produce]
(
   [Id] [int] identity(1,4) not null,
   [Code] [nvarchar](50) null,
   [Name] [nvarchar](100) null,
   [Description] [nvarchar](max) null,
   [Weight] [decimal](18, 2) null,
   [Price] [decimal](18, 2) null,
   [Cost] [decimal](18, 2) null,
constraint [PK_Product] primary key clustered
(
  [Id] asc
))

select *
from Produce

create table [dbo].[Order]
(
   [Id] [bigint] identity(1,1) not null,
   [OrderDate] [date] null,
   [Status] [smallint] null,
   [BusinessEntityId] [int] null,
   [CostumerId] [int] null,
   [EmployeeId] [int] null,
   [TotalPrice] [decimal](18,2) null,
   [Comment] [nvarchar](max) null,
constraint [PK_Order] primary key clustered
(
   [Id] asc
))

CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO
