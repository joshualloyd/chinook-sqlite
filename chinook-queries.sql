-- 1
SELECT FirstName || ' ' || Lastname AS FullName, CustomerId, Country
FROM Customer
WHERE NOT Country = 'USA';

-- 2
SELECT *
FROM Customer
WHERE Country = 'Brazil';

-- 3
SELECT c.FirstName || ' ' || c.Lastname AS FullName, i.InvoiceId, i.InvoiceDate, i.BillingCountry
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE Country = 'Brazil';

-- 4
SELECT *
FROM Employee
WHERE Title LIKE '%sales%'
AND Title LIKE '%agent%';

-- 5
SELECT DISTINCT BillingCountry
FROM Invoice;

-- 6
SELECT *
FROM Invoice i
JOIN Customer c ON  i.CustomerId = c.CustomerId
JOIN Employee e ON c.CustomerId = e.EmployeeId
WHERE e.Title LIKE '%sales%'
AND e.Title LIKE '%agent%';