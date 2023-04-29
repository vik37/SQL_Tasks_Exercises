use [AcademyExempleDb]


select s.FirstName,d.Gender
from [dbo].[Dender] d
inner join  [dbo].[Student] s
on s.GenderId = d.Id
where d.Gender = 'Male'
go
/* scalar function - vraka samo tip   */
create function dbo.fn_StudentFullName(@StudentId int)
returns nvarchar(1000)
as
  begin 
       declare @result nvarchar(1000)
	   select @result = s.FirstName + N' ' + s.LastName
	   from [dbo].[Student] s
	   where @StudentId = s.Id
	   return @result
  end
select dbo.fn_StudentFullName(4)
go
/* Inline-Table valued - vraka vnatresna tabela edinecna  */
create function dbo.fn_StudentBirth(@StudentId int)
  returns table
  as
	     return 
		 select s.FirstName,s.LastName, s.DateOfBirth
		 from [dbo].[Student] s
		 where @StudentId = s.Id
go
select * from dbo.fn_StudentBirth(3)
go
/* Multy-Statment Table valued function - vraka  table variable so poveke parametri vo koj moze da se upotrebat poveke stejtmenti */
create function dbo.fn_AmountPerOrder(@AmountId int,@StudentId int)
returns @output table(FullName nvarchar(1000), TotalInstallmentPey decimal, AllInstallment int)
as
  begin
  insert into @output 
	  select CONCAT(s.FirstName, s.LastName) as FullName, SUM(a.InstallmentPrice) as TotalInstallmentPey, count(a.Installment) as AllInstallment
	  from [dbo].[Order] o
	  inner join [dbo].[Student] s on  o.StudentId = s.Id
	  inner join [dbo].[Amount] a on o.AmountId = a.Id
	  where o.StudentId = @StudentId
	  and o.AmountId = @AmountId
	  group by s.FirstName, s.LastName
	  order by FullName
	  
  return
  end
go

declare @AmointId int = 2
declare @StudentId int = 4
select * from dbo.fn_AmountPerOrder(@AmointId,@StudentId)
select *
from [dbo].[Dender]

exec Test_Procedure @Second = 10

select top 5 [Name]
from [dbo].[Subject]
where SUBSTRING([Name],1,1) = 's'

select sum(InstallmentPrice) as Total
from [dbo].[Amount]
group by is_Payed
having sum(InstallmentPrice) > 60000