SELECT a.ContinentCode, a.CurrencyCode, a.Total AS [CurrencyUsage]
FROM (
	SELECT c.ContinentCode, c.CurrencyCode, COUNT(c.CurrencyCode) AS Total,
	DENSE_RANK() OVER (PARTITION BY c.ContinentCode ORDER BY COUNT(c.CurrencyCode) DESC) AS Ranked
	FROM Countries AS c
	GROUP BY c.ContinentCode, c.CurrencyCode
	)AS a
WHERE Ranked = 1 AND Total > 1
ORDER BY a.ContinentCode