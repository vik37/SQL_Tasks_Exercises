use [SEDCClass1]

-- scalar variable
DECLARE @FirstName nvarchar(100)
set @FirstName = 'Aleksandra'

select * 
from [dbo].[Employee]
where FirstName = @FirstName
go

SELECT * 
FROM Employee
WHERE DateOfBirth > '1982.01.01'
GO

-- table variable

DECLARE @EmployeeList TABLE
(EmployeeID int, FirstName nvarchar(100),DateOfBirth date);

INSERT INTO @EmployeeList
SELECT Id,FirstName,DateOfBirth
FROM [dbo].[Employee]
WHERE Gender = 'F'

SELECT * FROM @EmployeeList
GO

-- Temp table 
CREATE TABLE #EmployeeList
(LastName nvarchar(100), HireDate date);

INSERT INTO #EmployeeList
SELECT LastName,HireDate
FROM [dbo].[Employee]
WHERE FirstName like 'A%'

SELECT * 
FROM #EmployeeList
WHERE LEN(LastName) = 7

drop table #EmployeeList
GO

-- String Functions
select FirstName,
       left(FirstName,3) as LeftFunction,
	   right(FirstName,3) as RigtFunction,
	   len(FirstName) as LenFunction,
	   SUBSTRING(FirstName,1,3) as SubstringFunction,
       REPLACE(FirstName,'Ale','X-') as ReplaceFunction,
       Concat(FirstName, N' + ', LastName) as Concat_Name
from [dbo].[Employee]

select LastName,STRING_AGG(FirstName,',') WITHIN GROUP (ORDER BY FirstName) firstname_list
from dbo.Employee
where
	FirstName = 'Borce' and LastName = 'Popovski'
group by LastName

select LastName, STRING_AGG(FirstName,',') within group (order by FirstName) Firstname_List
from [dbo].[Employee]
group by LastName

select *
from dbo.Employee	