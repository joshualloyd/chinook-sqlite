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
SELECT strftime('%Y', InvoiceDate) AS Year, sum(Total) AS Sales_Total
FROM Invoice
WHERE InvoiceDate LIKE '2009%'
OR InvoiceDate LIKE '2011%'
GROUP BY strftime('%Y', InvoiceDate);

-- 9
SELECT count(*) AS Invoice_Line_Count
FROM InvoiceLine
WHERE InvoiceId = 37;

-- 10
SELECT InvoiceId, count(*) AS Invoice_Line_Count
FROM InvoiceLine
GROUP BY InvoiceId;

-- 11
SELECT i.InvoiceId, t.Name
FROM InvoiceLine i
JOIN Track t ON i.TrackId = t.TrackId
GROUP BY t.Name;

-- 12
SELECT i.InvoiceId AS Invoice_Number, t.Name AS Track_Name, ar.Name AS Artist_Name
FROM InvoiceLine i
JOIN Track t ON i.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY t.Name;