SELECT sq.Id, sq.FullName,  MAX(sq.Dayss) AS [LongestTrip], MIN(sq.Dayss) AS [ShortestTrip]
FROM (SELECT a.Id, a.FirstName + ' ' + a.LastName AS [FullName],
DATEDIFF(DAY, t.ArrivalDate , t.ReturnDate) AS Dayss
FROM Accounts AS a
LEFT JOIN AccountsTrips AS at ON at.AccountId = a.Id
JOIN Trips AS t ON t.Id = at.TripId
WHERE a.MiddleName IS NULL AND t.CancelDate IS NULL) AS sq
GROUP BY sq.Id, sq.FullName
ORDER BY LongestTrip DESC, ShortestTrip

