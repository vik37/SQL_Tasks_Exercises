use SamuraiDb

select *
from dbo.Battles

select *
from Quotes

select *
from dbo.SamuraiBattles

delete from dbo.SamuraiBattles


select *
from dbo.Samurais

select *
from dbo.SecretIdentity
/*sp_rename 'dbo.dbo.SamuraiBattles','SamuraiBattles'*/
insert into dbo.Battles(EndDate,[Name],StartDate)
values('1654-12-23','Fukujama Battle','1650-03-05')