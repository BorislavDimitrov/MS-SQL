SELECT sq3.DepartmentID, AVG(sq3.Salary)
FROM(SELECT sq2.DepartmentID, 
CASE
	WHEN sq2.DepartmentID = 1 THEN sq2.Salary + 5000
	ELSE sq2.Salary
END AS Salary
	FROM(SELECT * 
		FROM(SELECT * 
FROM Employees AS e
	WHERE e.Salary > 30000) AS sq
		WHERE sq.ManagerID NOT LIKE 42) AS sq2) AS sq3
GROUP BY sq3.DepartmentID
