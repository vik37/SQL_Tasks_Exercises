create database Exercise_01

use Exercise_01

create table tblGender
(
   ID int not null Primary key,
   Gender nvarchar(50) not null,
)

alter table [dbo].[tbl_Person]
add constraint tbl_Person_tblGenderID_FK 
Foreign key (GenderId) references tblGender (ID)

select *
from tblGender

--select *
--from [dbo].[tbl_Person]

select *
from [dbo].[tbl_Person] 
where Name = 'John'

insert into [dbo].[tbl_Person] ([Id],[Name],[Email],[GenderId])
values (4,'Viktor','vik.zaf@gmail.com',1)
go

select * 
from [dbo].[tbl_Person]

update [dbo].[tbl_Person]
set Email = 'vik.j@yahoo.com'
where Email = 'vik.zaf@gmail.com'


select *
from [dbo].[tbl_Person] 

select *
from [dbo].[tblGender] 

insert into [dbo].[tbl_Person] ([Id],[Name],[Email],[GenderId])
values (9,'Sara','sara@gmail.com',2)

insert into [dbo].[tblGender] ([ID],[Gender])
values (3,'Unknown')

alter table [dbo].[tbl_Person]
add constraint DF_tbl_Person_GenderId
default 3 for GenderId

insert into tbl_Person values(3,'Sara','sara@maejs.com',2,23)

insert into tbl_Person values(2,'xyz','m.com',1,20)
insert into tbl_Person
values(10,'Hristo','Hr_isto@totmail.com',3,46)
insert into tbl_Person
values(12,'Samso','nenko@hotmail.com',1,76)
insert into tbl_Person
values(11,'Marija','mit@gmail.com',2,27)
 alter table tbl_Person 

select *
from tbl_Person