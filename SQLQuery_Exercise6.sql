use [Exercise_01]
go

select distinct p.[Name], e.Position, e.HireDate, fe.Stores
from [dbo].[tbl_Person] p
left join [dbo].[Employee] e on e.PersonID = p.Id
left join [dbo].[FactoryEvropa] fe on fe.EmployeeID = e.ID

select *
from [dbo].[tbl_Person]
select *
from [dbo].[Employee]

select *
from [dbo].[FactoryEvropa]

select * 
from [dbo].[Produced]