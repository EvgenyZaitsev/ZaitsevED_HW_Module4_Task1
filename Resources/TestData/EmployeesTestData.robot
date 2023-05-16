*** Variables ***

${EmployeesCountScript}  SELECT COUNT(*) AS TotalCount FROM hr.employees
${EmployeesCountExpectedValue}  40

${EmployeesOldestOneScript}  SELECT TOP(1) employee_id as ID, first_name as FirstName, last_name as LastName, hire_date as HireDate, salary as Salary FROM hr.employees WHERE hire_date = (SELECT MIN(hire_date) FROM hr.employees)
@{EmployeesOldestOneExpectedValue}  100  Steven  King  1987-06-17  24000.0
