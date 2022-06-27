CREATE TRIGGER tr_ItemHeroLevelCheck
ON UserGameItems INSTEAD OF INSERT
AS
BEGIN
	IF (SELECT i.MinLevel FROM inserted
	JOIN Items AS i ON i.Id = ItemId) <= 
	(SELECT ug.Level FROM inserted
	JOIN UsersGames AS ug ON ug.Id = UserGameId)
	BEGIN
		INSERT UserGameItems (ItemId, UserGameId)
		SELECT i.ItemId, i.UserGameId 
		FROM inserted AS i
	END
END


