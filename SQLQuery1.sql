

use SEDC

CREATE TABLE DBO.BUSINESSENTITY
(
   ID int identity(1,1) not null,
   NAME nvarchar(200) null,
   region nvarchar(1000) null,
   zipcode nvarchar(10) null,
   size nvarchar(10) null,
   constraint pk_businessentity primary key clustered(id asc)
)

select * 
from BUSINESSENTITY

create table [dbo].[Employee]
(
  [Id] [int] identity(1,1) not null,
  [FirstName] [nvarchar](100) not null,
  [LastName] [nvarchar](100) not null,
  [DateOfBirth] [date] null,
  [Gender] [nchar](1) null,
  [HireDate] [date] null,
  [NationalIdNumber] [nvarchar](20) null,
  constraint [PK_Emloyee] primary key clustered
  (
  [Id] asc
 ))

select *
from Employee
