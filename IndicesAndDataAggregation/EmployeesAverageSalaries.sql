SELECT *
INTO neww
FROM Employees
WHERE Salary > 30000

DELETE FROM neww
WHERE ManagerID = 42

UPDATE neww
SET Salary += 5000
WHERE DepartmentID = 1

SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM neww
GROUP BY DepartmentID