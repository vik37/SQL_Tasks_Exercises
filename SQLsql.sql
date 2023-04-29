use [ExempleDb]

select *
from [dbo].[User]
go

delete from [dbo].[User]
where Id = 3

update [dbo].[User]
set UserName  = 'Mara23'
where Id = 4

insert into [dbo].[User] (UserName, Email,  Subscribe, [Password], ConfirmPassword)
values ('Slave', 'Slavco@outlook.com', 1, 'slav123#', 'slav123#')


create or alter view [dbo].[vw_User]
with  schemabinding
as 
select
	us.Id,
	us.UserName,
	us.[Password]
from [dbo].[User] as  us

create unique clustered index [IX_User]
	on [dbo].[vw_User] (ID asc) with (statistics_norecompute = on)

select *
from [dbo].[User]
select *
from [dbo].[vw_User]
select *
from [dbo].[vw_UserWithoutNorecompute]
select *
from [dbo].[vw_UserWithOffNorecompute]

update statistics [dbo].[vw_User] [IX_User] with fullscan



create or alter view [dbo].[vw_UserWithoutNorecompute]
with  schemabinding
as 
select
	us.Id,
	us.UserName,
	us.[Password]
from [dbo].[User] as  us

create unique clustered index [IX_UserWithoutNorecompute]
	on [dbo].[vw_UserWithoutNorecompute] (ID asc)

create or alter view [dbo].[vw_UserWithOffNorecompute]
with  schemabinding
as 
select
	us.Id,
	us.UserName,
	us.[Password]
from [dbo].[User] as  us

create unique clustered index [IX_UserWithOffNorecompute]
	on [dbo].[vw_UserWithOffNorecompute] (ID asc) with (statistics_norecompute = off)

update [dbo].[vw_User]
set UserName  = 'Marajey23'
where Id = 4