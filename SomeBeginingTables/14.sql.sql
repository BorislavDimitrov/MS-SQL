CREATE DATABASE Hotel

CREATE TABLE Employees
(
	Id INT PRIMARY KEY NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	Title NVARCHAR(30) NOT NULL,
	Notes NVARCHAR(30) NULL
)

INSERT INTO Employees VALUES
(1, 'Stoqn', 'Shopov', 'Cleaner', NULL),
(2, 'Niki', 'Kostov', 'Manager', NULL),
(3, 'Borislav', 'Dimitrov', 'Owner', 'grfhrt')

CREATE TABLE Customers 
(
	AccountNumber INT PRIMARY KEY NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	PhoneNumber INT NOT NULL,
	CONSTRAINT chkPhoneNumLen CHECK (DATALENGTH(PhoneNumber) < 11),
	EmergencyName NVARCHAR(30) NOT NULL,
	EmergencyNumber INT NOT NULL,
	Notes NVARCHAR(300) NULL
)

INSERT INTO Customers VALUES
(123, 'Stoqn', 'Shopov', 088589545, 'runner', 6783, NULL),
(124, 'Niki', 'Kostov', 0885345363, 'fastrunner', 7412, NULL),
(125, 'Borislav', 'Dimitrov', 0885890091, 'runner', 6783, NULL)

CREATE TABLE RoomStatus
(
	RoomStatus NVARCHAR(10) PRIMARY KEY NOT NULL,
	CONSTRAINT chkRoomStatus CHECK (RoomStatus IN ('Free', 'Taken', 'Cleaning')),
	Notes NVARCHAR(300) NULL
)

INSERT INTO RoomStatus VALUES
('Free', NULL),
('Cleaning', NULL),
('Taken', 'Big room')

CREATE TABLE RoomTypes
(
	RoomType NVARCHAR(10) PRIMARY KEY NOT NULL,
	CONSTRAINT chkRoomType CHECK (RoomType IN ('Big', 'Small', 'Medium')),
	Notes NVARCHAR(300) NULL
)

INSERT INTO RoomTypes VALUES
('Big', NULL),
('Small', NULL),
('Medium', Null)

CREATE TABLE BedTypes
(
	BedType NVARCHAR(10) PRIMARY KEY NOT NULL,
	CONSTRAINT chkBedType CHECK (BedType IN ('BigBed', 'MediumBed', 'SmallBed')),
	Notes NVARCHAR(300) NULL
)

INSERT INTO BedTypes VALUES
('BigBed', NULL),
('MediumBed', NULL),
('SmallBed', NULL)

CREATE TABLE Rooms
(
	RoomNumber INT PRIMARY KEY NOT NULL,
	RoomType NVARCHAR(10) NOT NULL,
	BedType NVARCHAR(10) NOT NULL,
	Rate decimal(2,1) NULL,
	RoomStatus NVARCHAR(10) NOT NULL,
	Notes NVARCHAR(300) NULL,
	FOREIGN KEY (RoomType) REFERENCES RoomTypes(RoomType),
	FOREIGN KEY (BedType) REFERENCES BedTypes(BedType),
	FOREIGN KEY (RoomStatus) REFERENCES RoomStatus(RoomStatus)
)

INSERT INTO Rooms VALUES
(1, 'Big', 'BigBed', 0, 'Taken', NULL),
(2, 'Medium', 'MediumBed', 0, 'Cleaning', NULL),
(3, 'Small', 'BigBed', 0, 'Free', NULL)

CREATE TABLE Payments
(
	Id INT PRIMARY KEY NOT NULL,
	EmployeeId INT NOT NULL,
	PaymentDate DATETIME NOT NULL,
	AccountNumber INT NOT NULL,
	FirstDateOccupied DATETIME NOT NULL,
	LastDateOccipied DATETIME NOT NULL,
	TotalDays INT NOT NULL,
	AmountCharget decimal NOT NULL,
	TaxRate DECIMAL(4,2) NULL,
	TaxAmount DECIMAL(10,2) NOT NULL,
	PaymentTotal DECIMAL(10,2) NOT NULL,
	Notes NVARCHAR(300) NULL,
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
	FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber)
)

INSERT INTO Payments VALUES
(1, 3, '2020-05-04', 123, '2020-05-06', '2020-05-10', 4, 200, 0.9, 400, 600, NULL),
(2, 1, '2019-04-03', 125, '2019-04-04', '2019-04-08', 4, 300, NULL, 400, 700, NULL),
(3, 2, '2020-05-04', 124, '2020-05-06', '2020-05-10', 4, 200, 0.9, 400, 600, NULL)

CREATE TABLE Occupancies 
(
	Id INT PRIMARY KEY NOT NULL,
	EmployeeId INT NOT NULL,
	DateOccupied DATETIME NOT NULL,
	AccountNumber INT NOT NULL,
	RoomNumber INT NOT NULL,
	RateApplied decimal(3,1) NULL,
	PhoneCharge DECIMAL NULL,
	Notes NVARCHAR(300) NULL
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
	FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber),
	FOREIGN KEY (RoomNumber) REFERENCES Rooms(RoomNumber)
)

INSERT INTO Occupancies VALUES
(1, 1, '2019-06-06', 125, 1, 9, NULL, NULL),
(3, 2, '2019-07-10', 123, 2, 10, NULL, NULL),
(2, 3, '2019-010-16', 123, 1, 5, NULL, NULL)
