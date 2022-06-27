SELECT CountryName AS [Country Name], ISOCode AS [ISO Code]
FROM Countries
WHERE CountryName LIKE '%A%A%A%'
ORDER BY ISOCode ASC