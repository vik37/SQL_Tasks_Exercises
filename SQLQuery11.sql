use [SEDCClass1]

--Create new procedure called CreateOrder
--Procedure should create only Order header info (not Order details) 
--Procedure should return the total number of orders in the system for the Customer from the new order (regardless the BusinessEntity)
--Procedure should return second resultset with the total amount of all orders for the customer and business entity on input

create procedure dbo.CreateOrder
(@OrderDate date,
@Status smallint,
@BusinessEntityID int,
@CustomerId int,
@EmployeeId int,
@TotalPrice decimal(18,2),
@Comment nvarchar (max))
as
begin

    insert into [dbo].[Order](OrderDate,[Status],BusinessEntityId,CustomerId,EmployeeId,TotalPrice,Comment)
	select @OrderDate,@Status,@BusinessEntityID,@CustomerId,@EmployeeId,@TotalPrice,@Comment

	select count(*)
	from [dbo].[Order]
	where CustomerId = @CustomerId

	select sum(TotalPrice)
	from [dbo].[Order]
	where @BusinessEntityID = @BusinessEntityID

end


exec dbo.CreateOrder '2020.08.01','0','2','4','1','150.00','New order2'

--Create new procedure called CreateOrderDetail
--Procedure should take the single price for item from Product table (Price column)
--Procedure should add details for specific order (new record for new Product/Quantity for specific order)
--When the order detail is inserted procedure should correct the TotalPrice column in the main table (dbo.order)
--Output from this procedure should be resultset with order details in a form of pairs: ProductName and TotalPrice per product (Price*Quantity)

create procedure dbo.CreateOrderDetail
(@OrderID bigint,@ProductId int,@Quantity int)
as
begin
declare @Price decimal(18,2)

select @Price = p.Price
	from [dbo].[Product] p
	where p.Id = @ProductId

    insert into [dbo].[OrderDetails](OrderId,ProductId,Quantity,Price)
	select @OrderID,@ProductId,@Quantity,@Price

	declare @TotalPrice decimal(18,2)

	select @TotalPrice = sum(Quantity * Price) 
	from [dbo].[OrderDetails]
	where OrderId = @OrderID

	update [dbo].[Order]
	set TotalPrice = @TotalPrice
	where Id = @OrderID

	select p.[Name], sum(od.Price * od.Quantity)
	from [dbo].[OrderDetails] od
	inner join [dbo].[Product] p on od.ProductId = p.Id
	where od.OrderId = @OrderID
	group by p.[Name]


	

	

end

exec dbo.CreateOrderDetail '3','2','4'

select *
from [dbo].[OrderDetails]