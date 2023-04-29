use [Exercise_01]

create table [dbo].[Employee]
(
   [ID] int identity(1,1) not null,
   [PersonID] int null,
   [Salary] bigint not null check (Salary >= 12000),
   [HireDate] date not null,
   [Position] nvarchar(200) null
CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED
(
   [ID] asc
))
--drop table [dbo].[Employee]
alter table [dbo].[Employee] with check
add constraint [FK_Employee_PersonID]
foreign key([PersonID])
references [dbo].[tbl_Person] (Id)
go

alter table [dbo].[Employee] with check
add constraint UC_Employee_PersonID unique (PersonID)

insert into [dbo].[Employee] (PersonID,Salary,HireDate,Position)
values(23,12000,'2020.03.09',NULL)

select *
from [dbo].[Employee]

insert into [dbo].[tbl_Person] 
values(23,'Alek','alo@gmail.com',1,38,'Osjek')

update [dbo].[Employee]
set Salary = 14200
where id = 9

select DISTINCT City
from [dbo].[tbl_Person]

select *
from [dbo].[tbl_Person]
where City <> 'Skopje'

select *
from [dbo].[tbl_Person]
where [Name] like '[^VMR]%'

select g.Gender, sum(Salary) as TotalSalary
from [dbo].[Employee] e
inner join [dbo].[tbl_Person] p on e.PersonID = p.Id
inner join [dbo].[tblGender] g on p.GenderId = g.ID
group by g.Gender
having sum(Salary) > 60700

select e.Position,p.City, sum(Salary) as TotalSalery, count(PersonID) as TotalEmployee
from [dbo].[Employee] e
inner join [dbo].[tbl_Person] p on e.PersonID = p.Id
where p.GenderId = 1
group by e.Position,p.City

select e.HireDate,p.[Name]
from [dbo].[Employee] e
cross join [dbo].[tbl_Person] p

select *
from [dbo].[Employee]

select *
from [dbo].[tbl_Person]

select *
from [dbo].[tblGender]