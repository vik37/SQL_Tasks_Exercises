use [SEDCClass1]
go

create function dbo.fn_inlinefunctionexemple (@employeeid int)
returns table
as
    return
    (
    select FirstName,LastName,DateOfBirth
	from [dbo].[Employee]
	where id = @employeeid
	)
go

select *
from dbo.fn_inlinefunctionexemple(1)
go
create function dbo.fn_multitablevariable (@employeeid int)
returns @result table (ID int, FirstName nvarchar(150), LastName nvarchar(150))
as
begin
      
	  if exists (select null from dbo.Employee where id = @employeeid and Gender = 'M')
	  begin
	     insert into @result(ID,FirstName,LastName)
		 select id, FirstName,LastName
		 from dbo.Employee
		 where id =@employeeid
	  end
    
return
end
go

create function dbo.fn_ProductQuantityPrice (@BucinessEntityID int, @CustomerID int)
returns @result table (ProductName nvarchar (100),TotalQuantity int,TotalPrice decimal(10,2))
as
begin
     insert into @result(ProductName,TotalQuantity,TotalPrice)
	 select p.[Name] as ProductName, sum(od.Quantity) as TotalQuantity, sum(od.Price * od.Quantity) as TotalPrice
	 from dbo.[Order] o
	 inner join dbo.OrderDetails od
	 on o.Id = od.OrderId
	 inner join dbo.Product p
	 on od.ProductId = p.Id
	 where o.BusinessEntityId = @BucinessEntityID and o.CustomerId = @CustomerID
	 group by p.[Name]

return
end
go

select *
from dbo.fn_ProductQuantityPrice(1,4)

select *
from [dbo].[Order]