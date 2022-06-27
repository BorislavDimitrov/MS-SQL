CREATE OR ALTER PROC usp_BuyItemsForGameAndHeroInRange(@Username VARCHAR(100), @GameName VARCHAR(100), @RangeStart INT, @RangeEnd INT)
AS
BEGIN

	DECLARE @UserGameId INT 
	SET @UserGameId = (SELECT ug.Id FROM UsersGames AS ug
	JOIN Users AS u ON u.Id = ug.UserId
	JOIN Games AS g ON g.Id = ug.GameId
	WHERE u.Username = @Username
	AND g.Name = @GameName)

	WHILE @RangeStart <= @RangeEnd
	BEGIN
		INSERT INTO UserGameItems VALUES
		(@RangeStart, @UserGameId)

		UPDATE UsersGames 
		SET Cash -= (SELECT Price FROM Items WHERE id = @RangeStart)
		WHERE Id = (SELECT ug.Id FROM UsersGames AS ug
		JOIN Users AS u ON u.Id = ug.UserId
		JOIN Games AS g ON g.Id = ug.GameId
		WHERE u.Username = @Username
		AND g.Name = @GameName)

		SET @RangeStart += 1	
	END
END
