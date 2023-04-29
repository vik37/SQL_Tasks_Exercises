--User 1

insert into Test2 values('zzz')

select SCOPE_IDENTITY()
select @@IDENTITY
select IDENT_CURRENT('Test2')

insert into dbo.Test1 Values('X')

select * 
from Test1

select *
from Test2

create trigger trForInsert on Test1 for Insert
as
Begin
   Insert into Test2 Values('YYYY')
End

