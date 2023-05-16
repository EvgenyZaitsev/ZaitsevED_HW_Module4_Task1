# How to run this solution:
1. Download it to local computer
2. Ensure you have installed pyhton, robotframework, pyodbc, ODBC Driver 18 for SQL Server, robotframework-databaselibrary
3. Ensure you have istalled 'TRN' database from mentoring prerequisites (https://learn.epam.com/myLearning/program?groupGuid=5e997914-76e4-42ff-a19f-7b7bfc78ed45)
4. Update ConnectionVariables.robot file with your credentials and db address (currently they are specific for my local machine)
5. Open CMD and navigate to root folder of the project, then to tests folder
6. Execute next command: robot -d ..\additional\ .\DatabaseTest.robot 
7. Check additional folder for Test Report and Excel file with test cases




Hello Robot framework(RF) task

In this task you will create a project for running RF and perform basic testing of data from "AdventureWorks2012" database via SQL statements (also you can use DB "TRN" from Module 1).

# Task:
1. Create 2 DIFFERENT test cases for data checks on "AdventureWorks2012" database (3 different tables) and document them (name, steps, expected results).
Example TC#1 count for column; TC#2 average function for column, TC#3 max\min values, TC#4 values in range of list ...... etc.
Tables to use:
-[Person].[Address]
-[Production].[Document]
-[Production].[UnitMeasure]
As a result you should have 6 different test cases for 3 different tables (2 per table).
2. Create a project for running RF tests.
3. Automate test cases from step 1 so that they can connect to MS SQL DB from SQL Module on your localhost.
4. Store a test report.

# Expected output:
Git project on git.epam.com with test cases file, code project and test report example.
Please write a meaningfull Readme file, that will help to understand how anyone can use what you have done.

# HINTS and helpful links:
- https://medium.com/arcadia-software-development/insert-data-to-database-sql-server-with-robort-framework-5aae60fdfafc
- https://robotframework.org/#examples
- Creation of user for the connection - https://www.tutorialspoint.com/ms_sql_server/ms_sql_server_create_users.htm
- !!! Restart MS SQL server after user creation !!!
- debug connection issues via ERRORLOG of MS SQL Server

# Grades:
1. Test cases are well documented, meaningfull and different - 40 points
2. RF project is well structured and all tests work just fine on other machine according to Readme instructions - 40 points
3. Test report is present and easy to use - 10 points.
4. Code is following PEP8 recommendations - 10 points.

Pass grade is 80.
