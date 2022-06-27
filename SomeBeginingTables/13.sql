CREATE TABLE Users
(
	id BIGINT IDENTITY(1,1) PRIMARY KEY,
	Username NVARCHAR(30) NOT NULL,
	Password NVARCHAR(26) NOT NULL,
	ProfilePicture IMAGE,
	LastLoginTime DATETIME,
	IsDeleted NVARCHAR(5) 
	CONSTRAINT IsDeleted CHECK (IsDeleted in ('true', 'false'))
)

INSERT INTO Users VALUES
	('Shadow', 'gegeger', NULL, '2019-10.03', 'false'),
	('Shadow2', 'gegrrek24g3', NULL, '2018-10.03', 'false'),
	('Shadow33', '123456789', NULL, '2019-10.03', 'true'),
	('Shadow43', 'gergerg34g34g', NULL, '2019-10.03', 'false'),
	('dgegegr', '123456ve789', NULL, '2019-10.03', 'true')

	ALTER TABLE Users
	DROP CONSTRAINT PK__Users__3213E83F21C814A1

	ALTER TABLE Users
ADD CONSTRAINT PK_Users
PRIMARY KEY(id, Username)

ALTER TABLE Users
ADD CONSTRAINT [MinLengthConstraint] CHECK (DATALENGTH([Password]) > 4)

ALTER TABLE Users
ADD CONSTRAINT dfLastLoginTime
DEFAULT CURRENT_TIMESTAMP FOR LastLoginTime

ALTER TABLE Users
DROP CONSTRAINT PK_Users

ALTER TABLE Users
ADD CONSTRAINT PK_idUsers
PRIMARY KEY (id)


/* 13 */
CREATE DATABASE Movies

CREATE TABLE Directors
(
	Id INT PRIMARY KEY NOT NULL,
	DirectorName NVARCHAR(30) NOT NULL,
	Notes NVARCHAR(300) NULL
)

INSERT INTO Directors VALUES
(1, 'Steven', NULL),
(3, 'Stewrd', NULL),
(2, 'Leam', NULL),
(5, 'Ivan', NULL),
(4, 'Tommy', 'Producer')

CREATE TABLE Genres
(
	Id INT PRIMARY KEY NOT NULL,
	GenreName NVARCHAR(30) NOT NULL,
	Notes NVARCHAR(300) NULL
)

INSERT INTO Genres VALUES
(1, 'Horror', 'Scarry films'),
(4, 'Comedy', 'Funny movies'),
(2, 'Parody', 'Funny moveis'),
(3, 'Sci-fi', 'Fantastic movies'),
(5, 'Historical', 'Historical educational movies')

CREATE TABLE Categories
(
	Id INT PRIMARY KEY NOT NULL,
	CategoryName NVARCHAR(30) NOT NULL,
	Notes NVARCHAR(300) NULL
)

INSERT INTO Categories VALUES
(1, 'Scarry', NULL),
(4, 'Funny', 'Funny movies'),
(2, 'Educational', 'Funny moveis'),
(3, 'Fantasty', NULL),
(5, 'Historical', 'Historical educational movies')

CREATE TABLE Movies
(
	Id INT PRIMARY KEY NOT NULL,
	Title NVARCHAR(30) NOT NULL,
	DirectorId INT,
	CopyrightYear DATETIME NOT NULL,
	Length INT NOT NULL,
	GenreId INT NOT NULL,
	CategoryId INT NOT NULL,
	Rating FLOAT(1) NOT NULL,
	Notes NVARCHAR(300) NULL,
	 FOREIGN KEY (DirectorId) REFERENCES Directors(Id),
	 FOREIGN KEY (GenreId) REFERENCES Genres(Id),
	 FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
)

INSERT INTO Movies VALUES
(1, 'Player one', 1, '2020-05-11', 120, 1, 1, 7.5, 'some movie'),
(2, 'LOTR', 2, '2001-05-21', 230, 2, 2, 10, 'Best movie'),
(3, 'Spider-man', 3, '2020-05-11', 120, 3, 3, 9.5, 'some movie'),
(4, 'Avengers', 4, '2021-05-11', 120, 4, 4, 8.6, 'some movie'),
(5, 'Cars', 5, '2020-05-11', 120, 5, 5, 9.5, 'some movie')

/* 14 */
CREATE DATABASE CarRental

CREATE TABLE Categories
(
	Id INT PRIMARY KEY NOT NULL,
	CategoryName NVARCHAR(30) NOT NULL,
	DailyRate FLOAT NULL,
	WeeklyRate FLOAT NULL,
	MonthlyRate FLOAT NULL,
	WeekendRate FLOAT NULL
)