/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Id]
      ,[Name]
      ,[Credits]
      ,[Semesters]
      ,[StudentId]
  FROM [DbCollege].[dbo].[Subjects]