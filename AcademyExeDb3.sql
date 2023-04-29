use [AcademyExempleDb]
go
create procedure Test_Procedure
     @First as int = 0,
	 @Second as int = 1
as
  begin
     print 'First'
	 print @First
	 print 'Second'
	 print @Second
  end
exec Test_Procedure
exec Test_Procedure @First = 1
exec Test_Procedure 10, 20
exec Test_Procedure @First = 20, @Second = 30
go
/* -------------------------------------------------- */

create procedure [dbo].[NewStudents](@FirstName nvarchar(50), @LastName nvarchar(100), @DateOfBirth date, @GenderId int)
as
  begin

       insert into [dbo].[Student](FirstName,LastName,DateOfBirth,GenderId)
	   values(@FirstName,@LastName,@DateOfBirth,@GenderId)

	   select count(*) as TotalStudentFirstLetter
	   from [dbo].[Student]
	   where SUBSTRING(FirstName,1,1) = SUBSTRING(@FirstName,1,1)

	   select count(*) as MaleStudens
	   from [dbo].[Student]
	   where GenderId = @GenderId
    print 'Uspeshno vnesen customer'
  end
go

--exec [dbo].[NewStudents]
--  @FirstName = 'Viktor',
--  @LastName = 'Zafirovski',
--  @DateOfBirth = '1982-05-26',
--  @GenderId = 1

exec [dbo].[NewStudents] 'test2', 'test3', '1999-09-19', 2
go
------------------------------------------------------------------
