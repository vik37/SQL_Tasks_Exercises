use [Exercise_01]

select *
from [dbo].[tbl_Person]
left join
[dbo].[Employee]
on Employee.PersonID = tbl_Person.Id
left join
[dbo].[FactoryEvropa]
on FactoryEvropa.EmployeeID = Employee.ID;

create view [FactoryEmployees]
as 
select p.[Name]  as Names, p.Email as mail,e.HireDate,e.Salary,g.Gender,
    SUM(e.Salary) as totalAmount, AVG(e.Salary) as averageAmount, COUNT(g.Gender) as byGender
from [dbo].[tbl_Person] p
inner join
[dbo].[Employee] e
on e.PersonID = p.Id
inner join
[dbo].[tblGender] g
on p.GenderId = g.ID
group by p.[Name],p.Email,e.HireDate, e.Salary, g.Gender

select *
from [FactoryEmployees]

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



