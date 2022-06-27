CREATE FUNCTION udf_GetSalaryLevel(@Salary MONEY)
RETURNS NVARCHAR(10)
AS
BEGIN
	DECLARE @salaryLevel NVARCHAR(10)

	IF @Salary < 30000
	BEGIN
	SET @salaryLevel = 'Low'
	END
	ELSE IF @Salary BETWEEN 30000 AND 50000
	SET @salaryLevel = 'Medium'
	ELSE IF @Salary > 50000
	SET @salaryLevel = 'High'

	RETURN @salaryLevel
END

