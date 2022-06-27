CREATE TABLE Subjects
(
	SubjectID INT PRIMARY KEY,
	SubjectName VARCHAR(50)
)

CREATE TABLE Majors
(
	MajorID INT PRIMARY KEY,
	Name VARCHAR(50)
)

CREATE TABLE Students
(
	StudentID INT PRIMARY KEY,
	StudentNumber INT,
	StudentName VARCHAR(50),
	MajorID INT REFERENCES Majors(MajorID)
)

CREATE TABLE Agenda
(
	StudentID INT REFERENCES Students(StudentID),
	SubjectID INT REFERENCES Subjects(SubjectID),
	CONSTRAINT PK_Student_Subject PRIMARY KEY (StudentID, SubjectID)
)

CREATE TABLE Payments 
(
	PaymentID INT PRIMARY KEY,
	PaymentDate DATE,
	PaymentAmount DECIMAL,
	StudentID INT REFERENCES Students(StudentID)
)
