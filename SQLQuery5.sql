use [SEDCClass1]

select *
from [dbo].[Employee]
where FirstName = 'Goran'

select *
from [dbo].[Employee]
where LastName like 'S%'

select *
from [dbo].[Employee]
where DateOfBirth > '1983.01.01'

select *
from [dbo].[Employee]
where Gender = 'M'
select *
from [dbo].[Employee]
where HireDate >= '1998.01.01' and HireDate <= '1998.01.31'

select *
from [dbo].[Employee]
where LastName like '%A' and HireDate between '2002.01.01' and '2002.02.01'

select *
from [dbo].[Employee]
where FirstName = 'Aleksandra' order by LastName asc

select *
from [dbo].Employee order by FirstName

select *
from [dbo].[Employee]
where Gender = 'M' order by HireDate desc

select FirstName,LastName
from [dbo].[Employee]
union
select FirstName,LastName
from Employee

select FirstName,LastName
from [dbo].[Employee]
union all
select FirstName,LastName
from [dbo].[Employee]

select FirstName,LastName
from [dbo].[Employee]
where FirstName = 'Aleksandra'
intersect
select FirstName,LastName
from [dbo].[Employee]
where LastName = 'Nikolovski'

select [Name]
from [dbo].[BusinessEntity]
union all
select [Name]
from [dbo].[Customer]

select [Name]
from [dbo].BusinessEntity
union
select [Name]
from [dbo].[Customer]

select [Name]
from [dbo].[BusinessEntity]
intersect
select [Name]
from [dbo].[Customer]

select *
from [dbo].[BusinessEntity]

select*
from [dbo].[Customer]

select *
from [dbo].[Employee]

select n.Name as CustomerName, sp.Name as ProductName
from [dbo].[Customer] n 
cross join dbo.Product Sp order by CustomerName asc

select distinct  b.[Name] as BeName, b.Region
from [dbo].[Order] a 
inner join dbo.BusinessEntity b on a.BusinessEntityId = b.Id

select * 
from dbo.BusinessEntity b left join dbo.[Order] o on b.Id = o.BusinessEntityId
where o.Id is NULL

--Calculate the total amount on all orders in the system
--Calculate the total amount per BusinessEntity on all orders in the system
--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20
--Find the Maximal Order amount, and the Average 


select sum(TotalPrice) tp
from [dbo].[Order] 

select be.[Name], sum(TotalPrice) tp
from [dbo].[Order] as o 
inner join dbo.BusinessEntity as be on be.Id = o.BusinessEntityId
group by be.[Name]

select o.BusinessEntityId,be.[Name],be.Region , max(TotalPrice) tp, avg(TotalPrice) atp
from dbo.[Order] as o
inner join dbo.BusinessEntity as be on be.Id = o.BusinessEntityId
group by o.BusinessEntityId, be.[Name],be.Region 


select be.Id, sum(TotalPrice) tp
from [dbo].[Order] as o 
inner join dbo.BusinessEntity as be on be.Id = o.BusinessEntityId
group by be.Id
having sum(TotalPrice) > 580000

select be.[Name], sum(TotalPrice) tp
from [dbo].[Order] as o 
inner join dbo.BusinessEntity as be on be.Id = o.BusinessEntityId
group by be.[Name]

select BusinessEntityId, sum(TotalPrice) ane
from dbo.[Order] as o
inner join dbo.BusinessEntity as be on be.Id = o.BusinessEntityId
where size = 'small' 
group by BusinessEntityId
having sum(TotalPrice) > 580000

select c.Id,c.RegionName + ' - ' + c.City as Region, sum(TotalPrice) as Price 
from [dbo].[Order] o
inner join dbo.Customer c
on o.CustomerId = c.Id
group by c.Id,c.[Name],c.RegionName + ' - ' + c.City
having sum(TotalPrice) > 100000

select o.BusinessEntityId, be.[Name] + ' / ' + be.Region,  max(TotalPrice) as MaxPrice, avg(TotalPrice) as AvgPrice
from dbo.[Order] o
inner join dbo.BusinessEntity be
on o.BusinessEntityId = be.Id
group by o.BusinessEntityId, be.[Name] + ' / ' + be.Region
having max(TotalPrice) > 4 * avg(TotalPrice)

create view dbo.vv_CustomerOrders
as

select CustomerId, sum(TotalPrice) as TotalPrice
from [dbo].[Order]
group by CustomerId

select c.[Name] as customername, vco.TotalPrice
from dbo.vv_CustomerOrders vco
inner join dbo.Customer c on c.Id = vco.CustomerId
where CustomerId > 20
