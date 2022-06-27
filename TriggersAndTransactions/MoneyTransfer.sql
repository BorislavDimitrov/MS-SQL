CREATE PROC usp_TransferMoney(@SenderId INT,@ReceiverId INT, @Amount DECIMAL(18,4)) 
AS
BEGIN
	BEGIN TRANSACTION
		IF (SELECT COUNT(*) FROM Accounts WHERE Id = @SenderId ) < 1
		BEGIN
			ROLLBACK;
			THROW 50001, 'Not existing account', 1
		END

		IF (SELECT COUNT(*) FROM Accounts WHERE Id = @ReceiverId ) < 1
		BEGIN
			ROLLBACK;
			THROW 50002, 'Not existing account', 1
		END

		IF (SELECT Balance FROM Accounts WHERE Id = @SenderId ) < @Amount
		BEGIN
			ROLLBACK;
			THROW 50003 ,'Not enough money', 1
		END

		EXEC dbo.usp_WithdrawMoney @SenderId, @Amount
		EXEC dbo.usp_DepositMoney @ReceiverId, @Amount

		COMMIT
END