-- Get information about all tracks of an artist

SELECT t.Name AS Track,
t.TrackId AS ID,
g.Name AS Genre,
al.Title AS Album,
SUM(il.Quantity) AS Sales
FROM Artist ar
INNER JOIN Album al
ON al.ArtistId = ar.ArtistId
INNER JOIN Track t
ON al.AlbumId = t.AlbumId
LEFT JOIN InvoiceLine il
ON il.TrackId = t.TrackId
INNER JOIN Genre g
ON g.GenreId = t.GenreId
WHERE ar.ArtistId = 90
GROUP BY t.Name,
t.TrackId,
g.Name,
al.Title
ORDER BY al.Title,
t.TrackId;