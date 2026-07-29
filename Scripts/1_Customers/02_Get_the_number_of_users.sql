-- Calculate the number of users by country

SELECT
Country,
Customers,
Percent
FROM
(SELECT c.Country,
COUNT (*) AS Customers,
ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM Customer), 1) AS Percent,
0 AS SortOrder
FROM Customer c
GROUP BY c.Country
UNION ALL
SELECT 'TOTAL',
COUNT(*),
100.0,
1
FROM Customer)
ORDER BY SortOrder,
Customers DESC;

-- Calculate the number of users from company

SELECT
COUNT (*) AS fromCompany,
ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM Customer), 1) AS Percent
FROM Customer c
WHERE c.Company IS NOT NULL;

-- Calculate the distribution of users among support staff

SELECT
SupportAgentId,
AgentLastName,
AgentFirstName,
Customers,
Percent
FROM
(SELECT c.SupportRepId AS SupportAgentId,
e.LastName AS AgentLastName,
e.FirstName AS AgentFirstName,
COUNT (*) AS Customers,
ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM Customer), 1) AS Percent,
0 AS SortOrder
FROM Customer c
INNER JOIN Employee e
ON e.EmployeeId = c.SupportRepId
GROUP BY c.SupportRepId,
e.LastName,
e.FirstName
UNION ALL
SELECT NULL,
NULL,
'TOTAL',
COUNT(*),
100.0,
1
FROM Customer)
ORDER BY SortOrder,
Customers DESC;