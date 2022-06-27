CREATE OR ALTER FUNCTION ufn_CalculateFutureValue (@sum DECIMAL(18,4), @YearlyInterestRate FLOAT, @Years INT)
RETURNS DECIMAL(18,4)
AS
BEGIN 
	DECLARE @result DECIMAL(18,4)
	SET @result = @sum * (POWER(1+ @YearlyInterestRate, @Years))
	RETURN @result
END
