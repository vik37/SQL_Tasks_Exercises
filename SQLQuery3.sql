select * 
from Employee 
where FirstName = 'Goran'

select * 
from Employee 
where FirstName like 'S%'

select * 
from Employee 
where FirstName like 'S%'

select *
from Employee
where FirstName = 'Aleksandar' order by LastName asc

select *
from Employee
where FirstName = 'Goran' and LastName like '%ov'

--alter table Product 
--add constraint [DF_Product_Price] 
--default 1 for Price

--select * 
--from Product

--insert into Product(Name,Description)
--values ('test','ghjgjh')

--select *
--from Product
--order by Id desc

alter table Product
with check
add constraint [CK_Product_Price] check(Price <= 2*Cost)

insert into Product(Name,Price,Cost)
values('test1',100,20)

select *
from Product order by Id desc


alter table Product with check
add constraint [UN_Product_Name] unique (Name)

update Product set Name = 'Gluten free 2'
where Id = 3

insert into dbo.[Order] (OrderDate,Status,BusinessEntityId,CustomerId,EmployeeId,TotalPrice,Comment)
values ('2020.08.06',0,100,1,1,100,'Test')
alter table dbo.[Order] with check
add constraint FK_Order_BusinessEntityId foreign key ([BusinessEntityId]) references dbo.BusinessEntity([Id]) 

select *
from BusinessEntity

select *
from [Order] 

Order by Id desc

update [Order] set BusinessEntityId = 4
where Id = 3780