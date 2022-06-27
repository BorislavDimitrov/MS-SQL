CREATE PROC usp_WithdrawMoney (@AccountId INT, @MoneyAmount DECIMAL(18,4)) 
AS
BEGIN
	SET @MoneyAmount = ABS(@MoneyAmount)

	UPDATE Accounts
	SET Balance -= @MoneyAmount
	WHERE Id = @AccountId
END