SELECT mc.CountryCode, Count(mc.MountainId)
FROM MountainsCountries AS mc
WHERE mc.CountryCode IN ('US', 'BG', 'RU')
	GROUP BY (mc.CountryCode)

