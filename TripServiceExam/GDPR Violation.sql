SELECT t.Id AS Id, a.FirstName + ' '+ ISNULL(a.MiddleName + ' ', '') + a.LastName AS [Full Name],
cfa.Name AS [From], cfh.Name AS [To],
CASE
	WHEN t.CancelDate IS NOT NULL THEN 'Canceled'
	ELSE CONCAT(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate), ' days')
END AS [Duration]
FROM Trips AS t
 JOIN Rooms AS r ON r.Id = t.RoomId
JOiN Hotels AS h ON h.Id = r.HotelId
JOiN Cities AS cfh ON cfh.Id = h.CityId
RIGHT JOIN AccountsTrips AS at ON at.TripId = t.Id
JOIN Accounts AS a ON a.Id = at.AccountId
JOIN Cities AS cfa ON cfa.Id = a.CityId
ORDER BY [Full Name] , t.Id
