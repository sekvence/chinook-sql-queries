-- Get the selected user's purchase history

SELECT i.InvoiceId AS Id,
i.InvoiceDate AS DateOfInvoice,
i.Total AS InvoiceSum
FROM Invoice i
WHERE i.CustomerId = 30
ORDER BY Id;

-- Check if the user has purchased the same track more than once

SELECT il.TrackId,
SUM(il.Quantity) AS PurchaseCount
FROM Invoice i
INNER JOIN InvoiceLine il
ON il.InvoiceId = i.InvoiceId
WHERE i.CustomerId = 90
GROUP BY il.TrackId
HAVING SUM(il.Quantity) > 1;