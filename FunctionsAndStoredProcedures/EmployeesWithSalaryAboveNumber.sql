CREATE PROC usp_GetEmployeesSalaryAboveNumber (@Salary DECIMAL(18,4))
AS
BEGIN
	SELECT e.FirstName, e.LastName
	FROM Employees AS e
	WHERE e.Salary >= @Salary
END