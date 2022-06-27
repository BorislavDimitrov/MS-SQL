CREATE TRIGGER tr_UpdateAddToNotificationsEmail
ON Accounts FOR UPDATE 
AS
	INSERT NotificationEmails
	SELECT i.Id,
	'Balance change for account: ' + CAST(i.Id AS varchar) AS [Subject],
	CONCAT_WS(' ', 'On', FORMAT (getdate(),'MMM dd yyyy hh:mmtt'),
	'Your balanced was changed from', d.Balance, 'to', i.Balance + '.')
	FROM deleted AS d 
	JOIN inserted AS i ON i.Id = d.Id

