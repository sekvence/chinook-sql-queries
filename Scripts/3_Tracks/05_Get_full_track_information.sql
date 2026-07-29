-- Get full track's information by name

SELECT t.TrackId,
t.Name AS TrackName,
ar.Name AS Artist,
al.Title AS Album,
g.Name AS Genre,
t.Composer AS Composer,
mt.Name AS MediaType,
printf('%02d:%02d', t.Milliseconds / 60000, (t.Milliseconds % 60000) / 1000) AS Duration,
ROUND(t.Bytes / 1024.0 / 1024.0, 2) AS SizeMB,
t.UnitPrice AS Price
FROM Track t
INNER JOIN Album al
ON al.AlbumId = t.AlbumId
INNER JOIN Artist ar
ON ar.ArtistId = al.ArtistId
INNER JOIN Genre g ON
g.GenreId = t.GenreId
INNER JOIN MediaType mt
ON mt.MediaTypeId = t.MediaTypeId
WHERE TrackName = 'Televisão';