SELECT UserName,
	REVERSE(LEFT(REVERSE(Email), CHARINDEX('@', REVERSE(Email)) - 1)) AS [Email Provider]
FROM Users
ORDER BY [Email Provider] , Username 