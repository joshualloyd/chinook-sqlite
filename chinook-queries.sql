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

-- 13
SELECT count(*) AS Invoice_Total, iv.BillingCountry
FROM InvoiceLine il
JOIN Invoice iv ON il.InvoiceId = iv.InvoiceId
GROUP BY iv.BillingCountry;

-- 14
SELECT count(*) AS Total_Tracks, pl.Name AS Playlist_Name
FROM Playlist pl
JOIN PlaylistTrack pt ON pl.PlaylistId = pt.PlaylistId
GROUP BY pl.Name;

-- 15
SELECT tr.Name AS Track_Name, al.Title AS Album_Title, mt.Name AS Media_Type, g.Name AS Genre_Name
FROM Track tr
JOIN Album al ON tr.AlbumId = al.AlbumId
JOIN MediaType mt ON tr.MediaTypeId = mt.MediaTypeId
JOIN Genre g ON tr.GenreId = g.GenreId;

-- 16
SELECT iv.InvoiceId, count(*) AS Line_Items
FROM Invoice iv
JOIN InvoiceLine il ON iv.InvoiceId = il.InvoiceId
GROUP BY iv.InvoiceId;

-- 17
SELECT sum(iv.Total) AS 'Total Sales', e.FirstName || ' ' || e.LastName AS 'Sales Agent'
FROM Invoice iv
JOIN Customer c ON iv.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
GROUP BY c.SupportRepId;

-- 18
SELECT sum(iv.Total) AS 'Total Sales', e.FirstName || ' ' || e.LastName AS 'Sales Agent'
FROM Invoice iv
JOIN Customer c ON iv.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
WHERE iv.InvoiceDate LIKE '2009%'
GROUP BY c.SupportRepId
ORDER BY sum(iv.Total) DESC
LIMIT 1;

-- 19
SELECT sum(iv.Total) AS 'Total Sales', e.FirstName || ' ' || e.LastName AS 'Sales Agent'
FROM Invoice iv
JOIN Customer c ON iv.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
WHERE iv.InvoiceDate LIKE '2010%'
GROUP BY c.SupportRepId
ORDER BY sum(iv.Total) DESC
LIMIT 1;

-- 20
SELECT sum(iv.Total) AS 'Total Sales', e.FirstName || ' ' || e.LastName AS 'Sales Agent'
FROM Invoice iv
JOIN Customer c ON iv.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId
GROUP BY c.SupportRepId
ORDER BY sum(iv.Total) DESC
LIMIT 1;

-- 21
SELECT count(*) AS 'Customers Assigned', e.FirstName || ' ' || e.LastName AS 'Sales Agent'
FROM Customer c
JOIN Employee e ON c.SupportRepId = e.EmployeeId
GROUP BY c.SupportRepId;

-- 22
SELECT BillingCountry, sum(Total)
FROM Invoice
GROUP BY BillingCountry
ORDER BY sum(Total) DESC;

-- 23
SELECT t.Name, count(il.Quantity), iv.InvoiceDate
FROM Track t
JOIN InvoiceLine il ON t.TrackId = il.TrackId
JOIN Invoice iv ON il.InvoiceId = iv.InvoiceId
WHERE iv.InvoiceDate LIKE '2013%'
GROUP BY t.Name
ORDER BY count(il.Quantity) DESC;

-- 24
SELECT t.Name, count(il.Quantity)
FROM Track t
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY t.Name
ORDER BY count(il.Quantity) DESC
LIMIT 5;
