-- Determine the TOP 100 most popular tracks by sales

SELECT
t.TrackId,
t.Name AS TrackName,
SUM(il.Quantity) AS Sales
FROM InvoiceLine il
INNER JOIN Track t
ON il.TrackId = t.TrackId
GROUP BY t.TrackId
ORDER BY Sales DESC
LIMIT 100;

-- Determine the top 100 tracks by total revenue

SELECT
t.TrackId,
t.Name AS TrackName,
SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
INNER JOIN Track t
ON il.TrackId = t.TrackId
GROUP BY t.TrackId,
t.Name
ORDER BY Revenue DESC
LIMIT 100;

-- Determine the number of unsold tracks

SELECT
COUNT(*) AS UnsoldTracks
FROM
(SELECT t.TrackId
FROM Track t
LEFT JOIN InvoiceLine il
ON t.TrackId = il.TrackId
GROUP BY t.TrackId
HAVING COUNT(il.InvoiceLineId) = 0);

-- Determine the top 10 albums by number of tracks sold

SELECT
a.Title AS AlbumTitle,
SUM(il.Quantity) AS TotalSales
FROM InvoiceLine il
INNER JOIN Track t
ON il.TrackId = t.TrackId
INNER JOIN Album a
ON a.AlbumId = t.AlbumId
GROUP BY a.AlbumId,
a.Title
ORDER BY TotalSales DESC
LIMIT 10;

-- Determine the number of tracks by genre

SELECT g.Name AS Genre,
COUNT(t.TrackId) AS TrackCount
FROM Genre g
INNER JOIN Track t
ON t.GenreId = g.GenreId
GROUP BY g.GenreId,
g.Name
ORDER BY TrackCount DESC;

-- Determine the number of tracks sold by genre

SELECT g.Name AS Genre,
SUM(il.Quantity) AS Sales
FROM Genre g
INNER JOIN Track t
ON t.GenreId = g.GenreId
LEFT JOIN InvoiceLine il
ON il.TrackId = t.TrackId
GROUP BY g.Name
ORDER BY Sales DESC;