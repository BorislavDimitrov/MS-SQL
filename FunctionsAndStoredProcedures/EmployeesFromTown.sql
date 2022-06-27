CREATE PROC usp_GetEmployeesFromTown (@TownName VARCHAR(100))
AS
BEGIN
	SELECT e.FirstName, e.LastName
	FROM Employees AS e
	JOIN Addresses AS ad ON ad.AddressID = e.AddressID
	JOIN Towns AS t ON t.TownID = ad.TownID
	WHERE t.Name = @TownName
END