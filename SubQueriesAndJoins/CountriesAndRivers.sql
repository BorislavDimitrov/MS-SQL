SELECT TOP(5) c.CountryName, r.RiverName
FROM Countries AS c
LEFT JOIN Continents AS ct ON c.ContinentCode = ct.ContinentCode
LEFT JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
WHERE c.ContinentCode = 'AF'
ORDER BY c.CountryName ASC

