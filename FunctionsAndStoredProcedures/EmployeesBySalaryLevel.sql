CREATE OR ALTER PROCEDURE usp_EmployeesBySalaryLevel (@SalaryLevel VARCHAR(10))
AS
BEGIN
	SELECT sq.FirstName,sq.LastName
		FROM(SELECT e.FirstName, e.LastName, dbo.udf_GetSalaryLevel(e.Salary) AS SalaryLevel
			FROM Employees AS e) AS sq
	WHERE sq.SalaryLevel = @SalaryLevel
END	
