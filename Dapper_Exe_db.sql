use Dapper_Exe
create table [dbo].[People]
(
   [Id] [int] identity(1,1) not null,
   [Firstname] nvarchar(100) not null,
   [Lastname]  nvarchar(100) not null,
   [Email] nvarchar(200) not null,
   [Phone] nvarchar(100) not null
   constraint [Pk_People] primary key clustered
   (
      [Id] asc
   )
)

insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Viktor','Zafirovski','viktor_23@vik.com','+389/71-554-663')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Petar','Peev','pero_003@vik.com','+389/72-952-609')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Aleksandra','Zafirovska','aleksa@gmail.com','+389/71-123-863')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Risto','Vrtev','riki223#@outlook.com','+389/77-123-321')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Shaban','TRstena','shabi#90@outlook.com','+389/71-554-663')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Gregor','Fucka','greg_asa85@gmail.com','+389/77-504-868')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Kristina','Sazdova','kiki23au#@yahoo.com','+389/78-120-007')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Makedonka','Arnaudovska','mkd_mk2020@vik.com','+389/71-555-667')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Janko','Petreski','jan_ko4@vik.com','+389/72-110-859')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Aleksandra','Zdravevska','aleksandra_50@gmail.com','+389/77-129-229')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Mitko','Vrtev','major756#@outlook.com','+389/71-985-092')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Musli','Shabani','milan_fk9@gmail.com','+389/71-564-160')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Georgi','Zukov','redarmy*45@yahoo.com','+389/77-917-828')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Saska','Jovic','slava_utre@vik.com','+389/78-120-781')
insert into dbo.People(Firstname, Lastname, Email, Phone)
values('Sasko','Krstevski','sale5#@gmail.com','+389/77-912-103')
go

create procedure dbo.People_GetByLastname(@lName nvarchar(100))
as
begin
    select *
    from dbo.People
	where Lastname = @lName
end
exec dbo.People_GetByLastname 'Peev'
go
drop procedure dbo.People_GetByLastname
create procedure dbo.People_Insert(@fName nvarchar(100),@lName nvarchar(100),@mail nvarchar(200), @phone nvarchar(100))
as
begin
   insert into dbo.People(Firstname, Lastname, Email, Phone)
   values(@fName,@lName,@mail,@phone)
end
exec dbo.People_Insert 'Bojan','Krsteski','boki@gmail.com','+389/78-007-270'
exec dbo.People_Insert 'Katerina','Stoparevska','kate_rina@yahoo.com','+389/71-026-229'
exec dbo.People_Insert 'Katerina','Bejatovic','katerina@outlook.com','+381/641-807-357'
exec dbo.People_Insert 'Muarem','Aliovski','muki_maki@gmail.com','+389/72-126-536'
exec dbo.People_Insert 'Ana','Sazdova','ane23@gmail.com','+389/71-021-896'
go
select *
from dbo.People

delete from dbo.People
where Firstname = '@fName'