CREATE TABLE Towns
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Name] NVARCHAR(30) NOT NULL
)

CREATE TABLE Addresses
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	AddressText NVARCHAR(50) NOT NULL,
	TownId INT NOT NULL,
	FOREIGN KEY (TownId) REFERENCES Towns(Id)
)

CREATE TABLE Departments
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Name] NVARCHAR(30) NOT NULL
)

CREATE TABLE Employees
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	MiddleName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	JoBtitle NVARCHAR(30) NOT NULL,
	DepartmentId INT NOT NULL,
	Salary DECIMAL(10,2) NOT NULL,
	AddressId INT NOT NULL,
	FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
	FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
)

INSERT INTO Towns VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

INSERT INTO Departments VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

INSERT INTO Employees VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4,	'01/02/2013',	3500.00),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1,	'02/03/2004', 4000.00),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5,	'28/08/2016', 525.25),
('Georgi', 'Teziev', 'Ivanov', 'CEO', 2,	'09/12/2007', 3000.00),
('Peter', 'Pan', 'Pan', 'Intern', 3,	'28/08/2016', 599.88)

SELECT * FROM Towns
SELECT * FROM Departments
SELECT * FROM Employees

SELECT Name FROM Towns
ORDER BY Name ASC

SELECT Name FROM Departments
ORDER BY Name ASC

SELECT FirstName, LastName, JoBtitle, Salary FROM Employees
ORDER BY Salary DESC

UPDATE Employees
SET Salary *= 1.1
SELECT Salary FROM Employees

UPDATE Payments
SET TaxRate *= 0.97
SELECT TaxRate FROM Payments

DELETE FROM Occupancies