SELECT d.Name, SUM(e.Salary)
FROM Employees AS e
JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
GROUP BY d.Name
HAVING SUM(e.Salary) >= 15000
