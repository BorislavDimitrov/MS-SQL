CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT)
RETURNS VARCHAR(500)
BEGIN
	DECLARE @table TABLE (RoomId INT, RoomType NVARCHAR(20), Beds INT, PriceRation DECIMAL(18,2))
	INSERT  @table
	SELECT TOP(1) r.Id, r.Type, r.Beds, h.BaseRate + r.Price AS ration
	FROM Rooms AS r
	JOIN Trips AS t ON t.RoomId = r.Id
	JOIN Hotels AS h ON h.Id = r.HotelId
	WHERE r.Beds >= @People AND r.HotelId = @HotelId AND
	((@Date NOT BETWEEN t.ArrivalDate AND t.ReturnDate) OR t.CancelDate IS NOT NULL)
	ORDER BY ration DESC

	IF (SELECT COUNT(*) FROM @table) = 0
	RETURN 'No rooms available'

	DECLARE @roomId INT = (SELECT RoomId FROM @table)
	DECLARE @roomType VARCHAR(20) = (SELECT RoomType FROM @table)
	DECLARE @beds INT = (SELECT Beds FROM @table)
	DECLARE @hotelRoomRation DECIMAL(18,2) = (SELECT PriceRation FROM @table)
	DECLARE @roomPrice DECIMAL(18,2) = @hotelRoomRation * @People
	
	RETURN CONCAT('Room ', @roomId, ':', ' ', @roomType, ' (', @beds, ' beds) - $', @roomPrice)
END

SELECT dbo.udf_GetAvailableRoom(94, '2015-07-26', 3)

SELECT * FROM Rooms
WHERE Id = 175