*** Variables ***

${LocationMostPopularScript}  SELECT TOP(1) country_id as Country, COUNT(*) as TotalCount FROM hr.locations GROUP BY country_id ORDER BY TotalCount DESC
@{LocationMostPopularExpectedValue}  US  3

${LocationWithNullsScript}  SELECT city as City, country_id as Country FROM hr.locations WHERE postal_code IS NULL
@{LocationWithNullsExpectedValue}  London  UK

${LocationTopCountryScript}  SELECT city as City FROM hr.locations WHERE country_id = (SELECT MAX(country_id) FROM hr.locations)
@{LocationTopCountryExpectedValue}  Southlake  South San Francisco  Seattle

