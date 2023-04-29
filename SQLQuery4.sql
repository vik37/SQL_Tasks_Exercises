-- Business Entity
------------------

delete from dbo.OrderDetails where 1=1;
delete from dbo.[Order] where 1=1;
delete from dbo.BusinessEntity where 1=1;
delete from dbo.Employee where 1=1;
delete from dbo.Customer where 1=1;
delete from dbo.Product where 1=1;
go

DBCC CHECKIDENT ('OrderDetails', RESEED, 0)
DBCC CHECKIDENT ('[Order]', RESEED, 0)
DBCC CHECKIDENT ('BusinessEntity', RESEED, 0)
DBCC CHECKIDENT ('Employee', RESEED, 0)
DBCC CHECKIDENT ('Product', RESEED, 0)
DBCC CHECKIDENT ('Customer', RESEED, 0)
GO

insert into dbo.BusinessEntity(Name,Region,ZipCode,Size)
values ('Vitalia Skopje','Skopski','1000','Large')
go

insert into dbo.BusinessEntity(Name,Region,ZipCode,Size)
values ('Vitalia Bitola','Bitolski','2000','Large')
go

insert into dbo.BusinessEntity(Name,Region,ZipCode,Size)
values ('Vitalia Strumica','Strumicski','987','Medium')
go

insert into dbo.BusinessEntity(Name,Region,ZipCode,Size)
values ('Vitalia Kumanovo','Kumanovski','500','Medium')
go

insert into dbo.BusinessEntity(Name,Region,ZipCode,Size)
values ('Vitalia Tetovo','Polog','700','Small')
go

insert into dbo.BusinessEntity(Name,Region,ZipCode,Size)
values ('Vitalia Stip','Stipski','300','Small')
go

insert into dbo.BusinessEntity(Name,Region,ZipCode,Size)
values ('Vitalia Ohrid','Ohridski','100','Small')
go

-- Employee table

declare @FirstName table (FirstName nvarchar(50))
insert into @FirstName values ('Aleksandra'),('Borce'),('Biljana'),('Viktor'),('Valentina'),('Goran'),('Gordana'),('Maja'),('Marko')

declare @LastName table (LastName nvarchar(50))
insert into @LastName values ('Stojanovski'),('Nikolovski'),('Zdravevski'),('Ivanovski'),('Popovski'),('Mitrevski'),('Stoilov'),('Pandev'),('Todorov'),('Trajanov')

insert into dbo.Employee (FirstName,LastName,DateOfBirth,Gender,HireDate,NationalIdNumber)
select f.FirstName,l.LastName,'1980.01.01' as date, case when FirstName in ('Ana','Biljana','Valentina','Gordana','Maja') then 'F' else 'M' end as Gender,'2015.01.01' as HireDate,1 as IdNumber
from @FirstName f
CROSS JOIN @LastName l
go

update e set DateOfBirth = dateadd(MM,Id,DateOfBirth),
                         HireDate = dateadd(MM,2*Id,'1990.01.01'),
						 NationalIdNumber = id + cast(10000000 * rand(id*10) as int)
from dbo.Employee e
go

-- Customer

declare @City table (City nvarchar(100),Region nvarchar(100))
insert into @City
select substring(name,9,100),Region
from dbo.BusinessEntity
UNION select 'Radovis','Strumicki'
UNION select 'Kocani','Stipski'
UNION select 'Gevgelija','Strumicki'

declare @Market table (name nvarchar(100))
insert into @Market values ('Vero'),('Tinex'),('Ramstor'),('Kam'),('Zito'),('Zegin'),('Eurofarm'),('Makpetrol'),('Lukoil'),('Tobacco')

insert into dbo.Customer (Name,City,RegionName,isActive)
select m.name + N' ' + c.City as Name, c.City as City ,case when c.Region = 'Strumicki' then 'Stipski' else c.Region end as Region, 1 as isActive
from @Market m
CROSS APPLY @City c

update c set AccountNumber = id + cast(233255 * rand(id*7) as int),
CustomerSize = case when id%3 = 0 then 'Small' when id%3 = 1 then 'Medium' else 'Large' end,
PhoneNumber = N'070' + cast(cast(1000000 * rand(id*3) as int) as nvarchar(10))
from dbo.Customer c
go

-- Product
-----------

INSERT INTO dbo.Product (Name)
VALUES('Crunchy'),('Granola'),('Regular/soft'),('Gluten Free'),('Multigrain'),('Take away'),('Cornflakes'),('Cereals'),('Protein Bar'),('Raw bars'),('No Sugar Added'),('Multigrain'),
('Gluten Free'),('Kids Bar'),('Fruit, Nuts & Seeds'),('Protein balls'),('Rice Cakes'),('Mini cereal bites'),('Dried Fruits'),('Crackers'),('Cookies'),('Unrefined sugars'),
('Natural Sweeteners'),('Diabetic'),('Plant-based drinks'),('Smoothie drinks'),('Natural Juices'),('Green Teas'),('Functional Teas'),('Fruit Teas'),('Seeds'),('Oils & Vinegars'),
('Gluten Free Pasta'),('Flours'),('Superfoods'),('Sport Supplements'),('Honey Syrup'),('Sweet Spreads'),('Spices'),('Soups'),('Salty Spreads'),('Soy Pates'),('Soy milks')


update p set Weight = cast(100* id * rand(100+id) as int),
Cost = cast(20 + 10* id * rand(23+id) as int),
Price = 5 + id + cast(20 + 10* id * rand(23+id) as int),
Code = substring(Name,1,3) + cast(id as nvarchar(10)),
Description = Name + ' description'
from dbo.Product p
GO

-- Order
--------
 
 Insert into dbo.[Order] (OrderDate, Status, BusinessEntityId, CustomerId,EmployeeId,TotalPrice,Comment)
 select '2019.05.01' as OrderDate, 0 as Status, b.Id , c.Id, e.Id, 0 as TotalPrice, N'' as comment
 from dbo.BusinessEntity b
 cross apply dbo.Customer c
 cross apply dbo.Employee e
 where b.Id not in (13,15)
 and c.Id % 10 >3
 and e.Id % 10 <7
 and b.Region = c.RegionName

 update o set OrderDate =  dateadd(DD,-(Id%120),OrderDate)
 from dbo.[Order] o
 GO

 -- Order details
 INSERT INTO dbo.OrderDetails (OrderId, ProductId,Quantity,Price)
 select o.id,p.Id, 1 + (p.id + o.id) % 13,p.Price
 from [Order] o
 cross apply Product p 
 where (o.id %2 + o.id %3 )= p.id % 11
 and p.id % 10 not in (3,4)
 and o.id % 10 < 7
 GO

 ; with cte as (
 select o.Id, sum(d.Quantity * d.Price) as TotalPrice
 from dbo.[Order] o
 inner join dbo.OrderDetails d on o.Id = d.OrderId
 group by o.id 
 )
 update o set TotalPrice = c.TotalPrice
 from dbo.[Order] o
 inner join cte c on c.Id = o.id

GO

SELECT * from dbo.BusinessEntity
select * from dbo.Employee
SELECT * from dbo.Product
select * from dbo.Customer 
select * from dbo.[Order]
select * from dbo.[OrderDetails]