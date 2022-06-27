CREATE OR ALTER PROC usp_GetTownsStartingWith (@Text VARCHAR(500))
AS
BEGIN
	SELECT t.Name
	FROM Towns AS t
	WHERE t.Name LIKE @Text + '%'
END


