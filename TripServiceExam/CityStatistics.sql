SELECT c.Name, COUNT(h.Id) AS Hotels
FROM Cities AS c
LEFT JOIN Hotels AS h ON h.CityId = c.Id
WHERE h.Id IS NOT NULL
GROUP BY c.Name
ORDER BY Hotels DESC, c.Name

