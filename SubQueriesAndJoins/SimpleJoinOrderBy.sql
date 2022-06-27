SELECT e.EmployeeID, e.FirstName, e.LastName, d.Name AS [Department Name]
FROM Employees as e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales'
ORDER BY e.EmployeeID