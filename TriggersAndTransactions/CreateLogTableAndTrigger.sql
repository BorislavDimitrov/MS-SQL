CREATE OR ALTER TRIGGER tr_AccountsUpdateAddToLogs
ON Accounts FOR UPDATE
AS
	INSERT INTO Logs 
	SELECT i.Id, d.Balance, i.Balance
	FROM inserted AS i
	JOIN deleted AS d ON d.Id = i.Id
