SELECT 
	MIN(p.AverageSalary)
FROM(SELECT 
	AVG(e.Salary) AS AverageSalary
FROM Employees AS e
GROUP BY e.DepartmentID) AS p