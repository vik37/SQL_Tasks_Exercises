use [CCategoryAPI]

select *
from [dbo].[CategoryC]

select *
from [dbo].[Instructor]

select *
from [dbo].[Lesson]

select *
from [dbo].[Truck]

select *
from [dbo].[WorkExperience]

select c.City, c.[Address], c.Phone, truck.Model, truck.[Type], truck.[Year]
from [dbo].[CategoryC] as c
left join  [dbo].[TruckPerCity] as tpc on tpc.CategoryCId = c.Id
left join [dbo].[Truck] as truck on tpc.TruckId = truck.Id
where c.Id = 2
order by truck.[Year] desc



