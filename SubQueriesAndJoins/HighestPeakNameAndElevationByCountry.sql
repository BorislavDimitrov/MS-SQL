SELECT TOP(5) sq.CountryName,
CASE
	WHEN sq.PeakName IS NOT NULL THEN sq.PeakName
	ELSE '(no highest peak)'
END AS 'Highest Peak Name',
CASE
	WHEN sq.Elevation IS NOT NULL THEN sq.Elevation
	ELSE 0
END AS [Highest Peak Elevation],
CASE 
	WHEN sq.MountainRange IS NOT NULL THEN sq.MountainRange
	ELSE '(no mountain)'
END AS [Mountain]

FROM (SELECT c.CountryName, p.PeakName, p.Elevation, m.MountainRange,
	DENSE_RANK() OVER (PARTITION BY CountryName ORDER BY Elevation DESC) AS [Rank]
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
LEFT JOIN Mountains AS m ON m.Id = mc.MountainId
LEFT JOIN Peaks AS p ON p.MountainId = m.Id
GROUP BY c.CountryName, p.PeakName, p.Elevation, m.MountainRange) 
AS sq
WHERE sq.Rank = 1
ORDER BY sq.CountryName ASC , [Highest Peak Name]