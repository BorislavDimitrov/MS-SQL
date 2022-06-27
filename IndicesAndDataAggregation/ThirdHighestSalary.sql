SELECT sq.DepartmentID, sq.Salary
FROM(SELECT e.DepartmentID, e.Salary,
RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) AS Ranked
FROM Employees AS e
GROUP BY e.DepartmentID, e.Salary) AS sq
WHERE sq.Ranked = 3