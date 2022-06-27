CREATE FUNCTION ufn_CashInUsersGames (@gameName NVARCHAR(100))
RETURNS TABLE 
AS
RETURN
	
	SELECT SUM(sq.Cash) AS SumCash
		FROM(SELECT ROW_NUMBER() OVER (ORDER BY Cash DESC) AS [Rows], Cash
	FROM Games AS g
	JOIN UsersGames AS ug ON g.Id = ug.GameId
	WHERE g.Name LIKE @gameName
	GROUP BY ug.Cash) AS sq
	WHERE sq.Rows % 2 = 1