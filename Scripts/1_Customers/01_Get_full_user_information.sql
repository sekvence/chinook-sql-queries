-- Get full user information by first name and last name

SELECT *
FROM Customer c
WHERE c.FirstName = 'Martha'
AND c.LastName = 'Silk';

-- Get full user information by email address

SELECT *
FROM Customer c
WHERE c.Email = 'puja_srivastava@yahoo.in';
