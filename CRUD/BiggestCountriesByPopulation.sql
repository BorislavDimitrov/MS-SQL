SELECT TOP(30) CountryName, Population
FROM Countries
WHERE ContinentCode IN ('EU')
ORDER BY Population DESC, CountryName ASC