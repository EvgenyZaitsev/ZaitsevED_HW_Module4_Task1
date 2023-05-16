*** Variables ***

${JobsMaxScript}  SELECT TOP (1) 'Max' as Metric, job_title as Title, max_salary as Salary FROM hr.jobs WHERE max_salary = (SELECT MAX(max_salary) FROM hr.jobs)
@{JobsMaxExpectedValue}  Max  President  40000.0

${JobsAverageScript}  SELECT 'Average' as Metric, NULL, AVG(Salary) as Salary FROM hr.employees
@{JobsAverageExpectedValue}  Average  None  8060.0

${JobsMinScript}  SELECT TOP (1) 'Min' as Metric, job_title as Title, min_salary as Salary FROM hr.jobs WHERE min_salary = (SELECT MIN(min_salary) FROM hr.jobs)
@{JobsMinExpectedValue}  Min  Stock Clerk  2000.0

${JobsMostPopularPositionScript}  SELECT TOP(1) Jobs.job_id AS ID, Jobs.job_title AS Title, COUNT(*) AS PositionTotalCount FROM hr.jobs as Jobs JOIN hr.employees as Employees ON Jobs.job_id = Employees.job_id GROUP BY Jobs.job_id, Jobs.job_title ORDER BY PositionTotalCount DESC
@{JobsMostPopularPositionExpectedValue}  6  Accountant  5



