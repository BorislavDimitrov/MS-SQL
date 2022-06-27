SELECT FirstName, LastName, FORMAT(BirthDate, 'MM-dd-yyyy') AS BirthDate, c.Name AS [Hometown],
a.Email
FROM Accounts As a
JOIN Cities AS c ON c.Id = a.CityId
WHERE Email LIKE 'e%'
ORDER BY Hometown ASC