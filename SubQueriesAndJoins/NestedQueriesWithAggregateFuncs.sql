SELECT MIN(a.AverageSalary) AS MinAverage
FROM 
(SELECT e.DepartmentID,
	AVG(e.Salary) AS AverageSalary
FROM Employees AS e
GROUP BY e.DepartmentID) 
AS a