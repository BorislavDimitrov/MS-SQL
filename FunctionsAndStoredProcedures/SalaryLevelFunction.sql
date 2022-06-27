CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @level VARCHAR(10)
	IF @salary < 30000
	SET @level = 'Low'
	ELSE IF @salary <= 50000
	SET @level = 'Average'
	ELSE IF @salary > 50000
	SET @level = 'High'

	RETURN @level
END
