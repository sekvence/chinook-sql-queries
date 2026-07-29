-- Determine the top 20 users by total purchase amount

SELECT c.CustomerId,
c.FirstName,
c.LastName,
SUM(i.Total) AS TotalSpent
FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId,
c.FirstName,
c.LastName
ORDER BY TotalSpent DESC
LIMIT 20;

-- Determine the company's average monthly revenue

SELECT ROUND(AVG(MonthRevenue), 2) AS AverageMonthlyRevenue
FROM
(SELECT strftime('%Y-%m', InvoiceDate) AS Month,
SUM(Total) AS MonthRevenue
FROM Invoice
GROUP BY strftime('%Y-%m', InvoiceDate));

-- Determine the company's average revenue for each month across all years

SELECT m.Month,
ROUND(AVG(Revenue), 2) AS AverageRevenue
FROM
(SELECT strftime('%Y', i.InvoiceDate) AS Year,
strftime('%m', i.InvoiceDate) AS Month,
SUM(i.Total) AS Revenue
FROM Invoice i
GROUP BY Year,
Month) m
GROUP BY m.Month
ORDER BY m.Month;

-- Determine revenue by year

SELECT strftime('%Y', i.InvoiceDate) AS Year,
ROUND(SUM(i.Total), 2) AS Revenue
FROM Invoice i
GROUP BY Year
ORDER BY Year;

-- Determine the revenue by month for the selected year

SELECT strftime('%m', i.InvoiceDate) AS Month,
SUM(i.Total) AS Revenue
FROM Invoice i
WHERE strftime('%Y', i.InvoiceDate) = '2023'
GROUP BY Month
ORDER BY Month;

-- Determine the TOP 5 countries by total sales amount

SELECT i.BillingCountry AS Country,
ROUND(SUM(i.Total), 2) AS Revenue
FROM Invoice i
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 5;

-- Determine the top 5 cities by total revenue

SELECT *
FROM
(SELECT i.BillingCity AS City,
SUM(i.Total) AS Revenue,
RANK() OVER (ORDER BY SUM(i.Total) DESC) AS Rank
FROM Invoice i
GROUP BY City) r
WHERE r.Rank <= 5;

-- Determine the total revenue by genre

SELECT g.Name AS Genre,
SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM Genre g
INNER JOIN Track t
ON t.GenreId = g.GenreId
LEFT JOIN InvoiceLine il
ON il.TrackId = t.TrackId
GROUP BY g.Name
ORDER BY Revenue DESC;