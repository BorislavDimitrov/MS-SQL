CREATE TABLE Orders
(
	Id INT PRIMARY KEY NOT NULL,
	ProductName VARCHAR(200),
	OrderDate DATE
)

INSERT INTO Orders VALUES
(1,	'Butter',	'2016-09-19 00:00:00.000'),
(2,	'Milk',	'2016-09-30 00:00:00.000'),
(3,	'Cheese',	'2016-09-04 00:00:00.000'),
(4,	'Bread',	'2015-12-20 00:00:00.000'),
(5,	'Tomatoes',	'2015-12-30 00:00:00.000')

SELECT ProductName, OrderDate,
	FORMAT(DATEADD(DAY, 3, OrderDate), 'yyyy-MM-dd 00:00:00.000') AS [Pay Due],
	FORMAT(DATEADD(MONTH, 1, OrderDate), 'yyyy-MM-dd 00:00:00.000') AS [Deliver Due]
FROM Orders

