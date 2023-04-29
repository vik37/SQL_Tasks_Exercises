use [DrivingSchoolIdentityUserRegisterDb]

select *
from [dbo].[AspNetRoles]

select *
from [dbo].[AspNetUsers]

select *
from [dbo].[QuestionAnswerUserProtections]

/*sp_rename 'QuestionAnswerUserProtections.Answer', 'Answer', 'COLUMN'*/

delete 
from [dbo].[AspNetUsers]