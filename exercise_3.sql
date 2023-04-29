use [Exercise_01]

select salary, Count(*) as fullSum
from [dbo].[Employee] 
group by Salary

declare @num int
set @num = 20

select @num as num
go

declare  @EmployeeLists table
   (EmployeeID int,Salary bigint, HireDate date,Postition nvarchar(200),[Name] nvarchar(100),Email nvarchar(50))
insert into @EmployeeLists
select e.ID,e.Salary,e.HireDate,e.Position,p.[Name],p.Email
from [dbo].[Employee] e
inner join
[dbo].[tbl_Person] p
on e.PersonID = p.Id

select *
from @EmployeeLists
go

create function fn_FullImportPrice(@ProducedId int)
returns int
as
   begin
       declare @Result int
	   select @Result =  sum(p.ExportedPrice / 2)
	   from [dbo].[Produced] p
	   where @ProducedId = p.ID
	   
	   return @Result
   end
   select [dbo].[fn_FullImportPrice](1)
go


select *
from [dbo].[Employee]
select *
from [dbo].[FactoryEvropa]
select *
from [dbo].[Produced]
select *
from [dbo].[tbl_Person]
select *
from [dbo].[tblGender]