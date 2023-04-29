use [AcademyExempleDb]

create table [dbo].[Student](
  [Id] [int] identity(1,1) not null,
  [FirstName] [nvarchar](50) not null,
  [LastName] [nvarchar](100) not null,
  [DateOfBirth] [date] not null,
  [GenderId] [int] null,
  constraint [PK_Student] primary key clustered
  (
    [Id] asc
  )
)
go

create table [dbo].[Dender](
   [Id] [int] identity(1,1) not null,
   [Gender] [nvarchar](20) not null,
   constraint [PK_Gender] primary key clustered
   (
     [Id] asc
   )
)
go

create table [dbo].[Subject](
  [Id] [int] identity(1,1) not null,
  [Name] [nvarchar](100) not null,
  [Days] [int] not null,
  [SemesterId] [int] null,
  constraint [PK_Subject] primary key clustered
  (
    [Id] asc
  )
)
go

create table [dbo].[Semester](
  [Id] [int] identity(1,1) not null,
  [Semester] [tinyint] null,
  [StartDay] [date] not null,
  [EndDate] [date] not null,
  constraint [PK_Semester] primary key clustered
  (
    [Id] asc
  )
)
go

create table [dbo].[Order]
(
  [Id] [int] identity(1,1) not null,
  [StudentId] [int] not null,
  [SubjectId] [int] not null,
  [AmountId] [int] not null,
  constraint [PK_Order] primary key clustered
  (
     [Id] asc
  )
)
go

create table [dbo].[Amount](
  [Id] [int] identity(1,1) not null,
  [is_Payed] [bit] not null,
  [FullPrice] [int] not null,
  [Installment] [int] not null,
  constraint [PK_Amount] primary key clustered
  (
    [Id] asc
  )  
)
go
alter table [dbo].[Amount]
alter column Installment data_type
alter table [dbo].[Amount]
add  FullPrice [decimal] not null

alter table [dbo].[Amount]
add  InstallmentPrice [decimal] null

alter table [dbo].[Amount]
add constraint [DF_Amount_FullPrice]
default 154208.92 for FullPrice
go

alter table [dbo].[Amount]
add constraint [CHK_Amount_Installmeent]
check(Installment >= 1 and Installment <= 12);
go

alter table [dbo].[Semester]
add constraint [CHK_Semester_Semester]
check(Semester >= 1 and Semester <= 4);
go

alter table [dbo].[Semester] with check
add constraint UC_Semester_StartDate unique (StartDay,EndDate);

alter table [dbo].[Dender] with check
add constraint UC_Dender_Gender unique (Gender);

delete from dbo.[Amount]
delete from dbo.[Dender]
delete from dbo.[Order]
delete from dbo.[Semester]
delete from dbo.[Student]
delete from dbo.[Subject]

DBCC CHECKIDENT('Amount', RESEED, 0)
DBCC CHECKIDENT('Dender', RESEED, 0)
DBCC CHECKIDENT('Order', RESEED, 0)
DBCC CHECKIDENT('Semester', RESEED, 0)
DBCC CHECKIDENT('Student', RESEED, 0)
DBCC CHECKIDENT('Subject', RESEED, 0)

insert into [dbo].[Student] (FirstName,LastName,DateOfBirth,GenderId)
values('Viktor','Zafirovski','1982-05-26',1)
insert into [dbo].[Student] (FirstName,LastName,DateOfBirth,GenderId)
values('Makarena','Praska','1976-02-12',2)
insert into [dbo].[Student] (FirstName,LastName,DateOfBirth,GenderId)
values('Super','MArio','2003-11-30',1)
insert into [dbo].[Student] (FirstName,LastName,DateOfBirth,GenderId)
values('Angela','Bozinovska','2009-01-16',2)
insert into [dbo].[Student] (FirstName,LastName,DateOfBirth,GenderId)
values('Dedo','Mraz','2069-11-26',1)
insert into [dbo].[Student] (FirstName,LastName,DateOfBirth,GenderId)
values('Goran','Markovski','1996-04-08',1)
insert into [dbo].[Student] (FirstName,LastName,DateOfBirth,GenderId)
values('Elisaveta','Fraj','1986-04-15',1)

insert into [dbo].[Dender] (Gender)
values ('Female')

insert into [dbo].[Semester] (Semester,StartDay,EndDate)
values(1,'2019-10-15','2020-02-20')

insert into [dbo].[Semester] (Semester,StartDay,EndDate)
values(2,'2020-02-21','2020-06-19')

insert into [dbo].[Semester] (Semester,StartDay,EndDate)
values(3,'2020-06-20','2020-09-30')

insert into [dbo].[Semester] (Semester,StartDay,EndDate)
values(4,'2020-10-01','2020-12-29')

insert into [dbo].[Subject] ([Name],[Days],[SemesterId])
values('Intro in programming',16,1)

insert into [dbo].[Subject] ([Name],[Days],[SemesterId])
values('HTML',20,1)

insert into [dbo].[Subject] ([Name],[Days],[SemesterId])
values('CSS',20,1)

insert into [dbo].[Subject] ([Name],[Days],[SemesterId])
values('Java Script',64,1)

insert into [dbo].[Subject] ([Name],[Days],[SemesterId])
values('C-Sharp',80,2)

insert into [dbo].[Subject] ([Name],[Days],[SemesterId])
values('SQL Database',40,2)

insert into [dbo].[Subject] ([Name],[Days],[SemesterId])
values('.Net Core',20,3)

insert into [dbo].[Subject] ([Name],[Days],[SemesterId])
values('ASP .NET MVC',35,3)

insert into [dbo].[Subject] ([Name],[Days],[SemesterId])
values('ASP .NET WEB API - RestFull',35,3)

insert into [dbo].[Subject] ([Name],[Days],[SemesterId])
values('Practical ASP.NET apps development',28,4)

insert into [dbo].[Subject] ([Name],[Days],[SemesterId])
values('Angular',30,4)

insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(1,1,3)
insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(2,1,3)
insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(4,6,1)
insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(3,1,5)
insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(7,2,4)
insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(2,1,3)
insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(4,6,1)
insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(6,8,5)

insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(4,11,2)
insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(1,4,5)
insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(2,10,4)
insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(3,1,2)
insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(4,1,1)
insert into [dbo].[Order] ([StudentId],[SubjectId],[AmountId])
values(7,1,1)

insert into [dbo].[Amount](is_Payed,Installment,FullPrice,InstallmentPrice)
values(1,1,154208.92,null)
insert into [dbo].[Amount](is_Payed,Installment,FullPrice,InstallmentPrice)
values(0,2,154208.92,77104.46)
insert into [dbo].[Amount](is_Payed,Installment,FullPrice,InstallmentPrice)
values(1,4,154208.92,38552.23)
insert into [dbo].[Amount](is_Payed,Installment,FullPrice,InstallmentPrice)
values(1,8,154208.92,19276.15)
insert into [dbo].[Amount](is_Payed,Installment,FullPrice,InstallmentPrice)
values(0,12,154208.92,12850.74)

select *
from [dbo].[Amount]
select *
from [dbo].[Dender]
select *
from [dbo].[Order]
select *
from [dbo].[Semester]
select *
from [dbo].[Student]
select *
from [dbo].[Subject]
select *
from [dbo].[Amount]