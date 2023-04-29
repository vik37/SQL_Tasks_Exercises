use SEDCClass1

select be.[Name],bed.*,case when left(AccountNumber,3) ='210' then 'NLB'
                            when left(AccountNumber,3)='200' then 'Stopanska Banka'
							when left(AccountNumber,3)='300' then 'Komercijalna Banka'
							else 'Ostanati' end as banki
from [dbo].[BusinessEntity] be
inner join [dbo].[Businessentity_details] bed on be.ID = bed.BusinessentityID
order by be.[Name]

create procedure dbo.insertNewCustomer 
(@Name nvarchar(100), @AccountNumber nvarchar(100),@City nvarchar(100),@RegionName nvarchar(100),@isActive bit)
as
begin
    insert into dbo.Customer([Name],AccountNumber,City,RegionName,isActive)
	select @Name,@AccountNumber,@City,@RegionName,@isActive

	print 'Iskreirav nov Customer'
	select count(*)
	from [dbo].[Customer]

	select count(*)
	from [dbo].[Customer]
	where substring([Name],1,1) = substring(@Name,1,1)


end
go

exec dbo.insertNewCustomer 'TestSession6','1234','Bitola','Bitolski',1

select *
from [dbo].[Customer]
where [Name] = 'TestSession6'