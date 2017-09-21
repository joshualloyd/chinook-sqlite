-- 1
SELECT FirstName || ' ' || Lastname AS FullName, CustomerId, Country
FROM Customer
WHERE NOT Country = 'USA';

-- 2
SELECT FirstName || ' ' || Lastname AS FullName
FROM Customer
WHERE Country = 'Brazil';

-- 3
SELECT c.FirstName || ' ' || c.Lastname AS FullName, i.InvoiceId, i.InvoiceDate, i.BillingCountry
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE Country = 'Brazil';

-- 4
SELECT FirstName || ' ' || Lastname AS FullName
FROM Employee
WHERE Title LIKE '%sales%'
AND Title LIKE '%agent%';

-- 5
SELECT DISTINCT BillingCountry
FROM Invoice;

-- 6
SELECT i.InvoiceId, e.FirstName || ' ' || e.LastName AS EmployeeFullName
FROM Invoice i
JOIN Customer c ON  i.CustomerId = c.CustomerId
JOIN Employee e ON c.CustomerId = e.EmployeeId
WHERE e.Title LIKE '%sales%'
AND e.Title LIKE '%agent%';

-- 7
SELECT i.Total, c.FirstName || ' ' || c.Lastname AS CustomerFullName, i.BillingCountry, e.FirstName || ' ' || e.Lastname AS EmployeeFullName
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
WHERE e.Title LIKE '%sales%'
AND e.Title LIKE '%agent%';

-- 8
