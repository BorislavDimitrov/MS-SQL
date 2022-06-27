SELECT TOP(50)
	e.EmployeeID, CONCAT(e.FirstName, ' ' , e.LastName) AS [Employee Name],
	CONCAT(ee.FirstName, ee.LastName) as [Manager Name],
	d.Name AS [Department Name]
FROM Employees AS e
LEFT JOIN Employees AS ee ON e.ManagerID = ee.EmployeeID
LEFT JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
ORDER BY EmployeeID ASC
