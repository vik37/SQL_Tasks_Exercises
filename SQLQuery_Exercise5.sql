use [Exercise_01]


select p.City, sum(Salary) as TotalSalary
from [dbo].[Employee] e
inner join [dbo].[tbl_Person] p on p.Id = e.PersonID
--where Salary > 17000
group by p.City
having sum(Salary) < 35000

--drop table [dbo].[FactoryEvropa]

create table [dbo].[FactoryEvropa]
(
   [ID] int identity(1,1) not null,
   [EmployeeID] int not null,
   [ProducedID] int not null,
   [Products] nvarchar(50) null,
   [Stores] nvarchar(200) null,   
constraint [PK_dbo.Department] primary key clustered
(
    [ID] asc
))
create table [dbo].[Produced]
(
   [ID] int identity(1,1) not null,
   [ExportedQuantity] int not null,
   [ExportedPrice] decimal(16,2) not null,
   [ExportLocation] nvarchar(150) null,
   [ImportMaterial] nvarchar(200) null,   
   [ImportPrice] decimal(18,2) not null,
   [ExportDate] datetime null,
   [ImportDate] datetime null
constraint [PK_dbo.Produced] primary key clustered
(
    [ID] asc
))
--alter table [dbo].[FactoryEvropa] with check
--add constraint UK_Stores unique (Stores)
--go

alter table [dbo].[FactoryEvropa] with check
add constraint [FK_dbo.FactoryEvropa_Employee]
foreign key ([EmployeeID])
references  [dbo].[FactoryEvropa] (ID)
go
alter table [dbo].[FactoryEvropa] with check
add constraint [FK_dbo.FactoryEvropa_Produced]
foreign key ([ProducedID])
references  [dbo].[FactoryEvropa] (ID)
go
--alter table dbo.FactoryEvropa drop constraint UK_Stores
insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(1,1,'Chocolate','Skopje City mall')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(10,22000,'London','Liquid Chocolate',8000,'2018.09.05 12:23:04.000','2017.11.05 14:23:04.000')

insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(1,2,'Chocolate','Factory Warehouse')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(2000,186.40,'Munchester','Liquid Chocolate and Milk',7600.75,'2018.11.05 13:23:44.000','2017.10.08 09:17:24.000')
--delete from [dbo].[Produced] where ID = 4
insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(11,3,'Wafers','Wine&Chocolate – Mlecen restoran')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(500,186.40,'Luxemburg','Milk and Hazelnut',6832.15,'2019.12.19 14:33:00.000','2018.06.18 08:54:24.000')

insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(11,4,'Lokum','Wine&Chocolate – Mlecen restoran')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(1600,106.89,'Kairo','Sugar',2996.95,'2016.02.29 10:17:23.000','2015.03.01 09:51:59.000')

insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(5,5,'Lokum','GTC - ground floor')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(1200,27805.64,'Istambul','Sugar and nuts',10300.95,'2014.02.12 10:19:03.000','2012.12.01 09:51:02.000')

insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(12,6,'Chocolate','Wine&Chocolate – Shirok sokak - Bitola')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(50000,600123.36,'Berlin','Milk and Cocoa',293700.55,'2020.04.30 07:40:43.000','2019.09.09 09:51:23.000')

insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(13,7,'Assorted Chocolates','Wine&Chocolate – Leptokarija')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(9000,170600.36,'Luxemburg','Milk,Cherry and Cocoa',89700.55,'2020.01.27 10:00:16.000','2019.09.21 15:27:33.000')

insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(13,8,'Lokum','Wine&Chocolate – Leptokarija')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(7000,90600.36,'Luxemburg','Sugar',10700.15,'2018.07.03 10:00:16.000','2016.05.21 15:27:19.000')

insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(14,9,'Candies','Bit Pazar - Turkish Bazaar')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(18000,470600.86,'Istambul','Sugar',69000.87,'2017.10.05 11:41:26.000','2015.04.30 16:02:00.000')

insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(15,10,'Candies','Wine&Chocolate - Gjorce Petrov')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(28000,870600.86,'London','Sugar',169000.87,'2019.10.05 11:41:26.000','2018.04.30 16:02:00.000')

insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(16,11,'Assorted Chocolates','Wine&Chocolate - Aerodrom')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(15000,156800.43,'Berlin','Milk and Cocoa',109758.50,'2019.08.25 13:20:06.000','2018.10.30 16:02:00.000')

insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(12,12,'Lokum','Wine&Chocolate – Shirok sokak - Bitola')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(10000,309003.96,'Glasgow','sugar and nuts',93950.85,'2018.10.20 09:10:13.000','2017.05.29 08:58:06.000')

insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(11,13,'Wafers','Wine&Chocolate – Mlecen restoran')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(9000,186.40,'Madrid','Milk and Hazelnut',26832.15,'2019.10.09 14:54:00.000','2018.02.24 08:12:24.000')

insert into [dbo].[FactoryEvropa](EmployeeID,ProducedID,Products,Stores)
values(5,14,'Chocolate','GTC - ground floor')
insert into [dbo].[Produced](ExportedQuantity,ExportedPrice,ExportLocation,ImportMaterial,ImportPrice,ExportDate,ImportDate)
values(6700,20971.67,'London','Milk and Liquid Chocolate',14800.95,'2019.02.12 10:19:03.000','2018.01.31 09:51:02.000')
select * 
from [dbo].[FactoryEvropa]
select *
from [dbo].[Produced]
select *
from [dbo].[tblGender]

select *
from [dbo].[tbl_Person]

select *
from [dbo].[Employee]
select * 
from [dbo].[FactoryEvropa]

select fe.Products,e.Position,p.ImportMaterial
from [dbo].[FactoryEvropa] fe
right join [dbo].[Employee] e on e.ID = fe.EmployeeID
left join [dbo].[Produced] p on p.ID = fe.ProducedID