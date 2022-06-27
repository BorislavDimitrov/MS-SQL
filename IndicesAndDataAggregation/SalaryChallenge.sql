SELECT TOP(10) e.FirstName, e.LastName, e.DepartmentID
FROM Employees AS e
JOIN (SELECT DepartmentID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentID) AS ds ON ds.DepartmentID = e.DepartmentID
WHERE e.Salary > ds.AvgSalary