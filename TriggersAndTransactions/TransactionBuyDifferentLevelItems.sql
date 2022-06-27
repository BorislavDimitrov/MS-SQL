BEGIN TRANSACTION
	DECLARE @sumOfItems INT = (SELECT SUM(i.Price) FROM Items AS i
	WHERE i.MinLevel = 11)

	DECLARE @idInUserGame INT = (SELECT ug.Id FROM UsersGames AS ug
	JOIN Users AS u ON u.Id = ug.UserId
	JOIN Games AS g ON g.Id = ug.GameId
	WHERE g.Name = 'Safflower' AND u.Username = 'Stamat')

	IF (SELECT Cash FROM UsersGames	
	WHERE UsersGames.Id = @idInUserGame) < @sumOfItems
	 BEGIN
		ROLLBACK;
		THROW 50001 ,'Not enough cash', 1		
	 END

	 UPDATE UsersGames 
	 SET Cash -= @sumOfItems
	 WHERE Id = @idInUserGame

	INSERT INTO UserGameItems
	SELECT Id, @idInUserGame FROM Items WHERE Id BETWEEN 11 AND 12

COMMIT

BEGIN TRANSACTION

DECLARE @sumOfItemss INT = (SELECT SUM(i.Price) FROM Items AS i
	WHERE i.MinLevel = 12)

	DECLARE @idInUserGamee INT = (SELECT ug.Id FROM UsersGames AS ug
	JOIN Users AS u ON u.Id = ug.UserId
	JOIN Games AS g ON g.Id = ug.GameId
	WHERE g.Name = 'Safflower' AND u.Username = 'Stamat')

	IF (SELECT Cash FROM UsersGames	
	WHERE UsersGames.Id = @idInUserGamee) < @sumOfItemss
	 BEGIN
		ROLLBACK;
		THROW 50001 ,'Not enough cash', 1		
	 END

	 UPDATE UsersGames 
	 SET Cash -= @sumOfItemss
	 WHERE Id = @idInUserGamee

	INSERT INTO UserGameItems
	SELECT Id, @idInUserGamee FROM Items WHERE Id BETWEEN 19 AND 21

COMMIT

SELECT i.Name
FROM UserGameItems AS ugi
JOIN Items AS i ON i.Id = ugi.ItemId
JOIN UsersGames AS ug ON ug.Id = ugi.UserGameId
JOIN Users AS u ON u.Id = ug.UserId
JOIN Games AS g ON g.Id = ug.GameId
WHERE g.Name = 'Safflower' AND u.Username = 'Stamat'
ORDER BY i.Name