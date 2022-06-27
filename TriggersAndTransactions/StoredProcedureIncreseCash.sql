CREATE PROC usp_IncreaseCashInGameBali
AS
BEGIN
	UPDATE UsersGames
	SET Cash -= 50000
	WHERE UserId IN (SELECT u.Id
		FROM Games As g
		JOIN UsersGames AS ug ON ug.GameId = g.Id
		JOIN Users AS u ON u.Id = ug.UserId
		WHERE g.Name = 'Bali' 
		AND u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos' )
	)	
END