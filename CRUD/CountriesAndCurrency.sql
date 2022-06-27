SELECT CountryName, CountryCode,
CASE
	WHEN CurrencyCode != 'EUR' THEN 'Not Euro'
	WHEN CurrencyCode IS NULL THEN 'Not Euro'
	ELSE 'Euro'
END AS Currency
FROM Countries
ORDER BY CountryName ASC