SELECT a.Id, a.Email, c.Name AS [City] , COUNT(*) AS [Trips]
FROM Accounts AS a
JOIN AccountsTrips AS at ON at.AccountId = a.Id
JOIN Cities AS c ON c.Id = a.CityId
JOIN Trips AS t ON t.Id = at.TripId
JOIN Rooms AS r ON r.Id = t.RoomId
JOIN Hotels AS h ON h.Id = r.HotelId
WHERE a.CityId = h.CityId
GROUP BY a.Id, a.Email, a.CityId, c.Name
ORDER BY Trips DESC, a.Id