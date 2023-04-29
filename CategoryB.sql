use [BCategoryAPI]

select *
from [dbo].[Car]

select *
from [dbo].[CategoryB]

select *
from [dbo].[Instructor]

update [dbo].[Instructor]
set StartedDay = '01/29/2020'
where Id = 13

select *
from [dbo].[Lesson]

select *
from [dbo].[WorkExperience]

select Instructor.Id, WorkExperience.InstructorId, Instructor.Firstname, Instructor.Lastname, Instructor.StartedDay, WorkExperience.Company
from [dbo].[Instructor]
inner join [dbo].[WorkExperience]
on Instructor.Id = WorkExperience.InstructorId

select car.Id, car.Length
from [dbo].[Car] as car
except 
select carpc.CarId, carpc.Id
from [dbo].[CarPerCity] as carpc
order by car.Speed