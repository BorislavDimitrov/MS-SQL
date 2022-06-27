SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees AS e
GROUP BY DepartmentID
ORDER BY e.DepartmentID