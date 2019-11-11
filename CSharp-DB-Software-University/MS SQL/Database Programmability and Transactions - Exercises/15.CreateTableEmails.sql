CREATE TABLE NotificationEmails (
	   Id INT NOT NULL IDENTITY(1, 1),
       Recipient INT NOT NULL,
       Subject NVARCHAR(50) NOT NULL,
       Body NVARCHAR(MAX) NOT NULL

       CONSTRAINT PK_NotificationEmails PRIMARY KEY (Id),
	   CONSTRAINT FK_NotificationEmails_Accounts FOREIGN KEY (Recipient) REFERENCES Accounts (Id)
)

    GO

CREATE TRIGGER tr_LogEmail
	ON Logs
 AFTER INSERT
	AS 
 BEGIN
       DECLARE @accountId INT = (SELECT AccountId FROM inserted)
	   DECLARE @oldSum DECIMAL(18,2) = (SELECT OldSum FROM inserted)
	   DECLARE @newSum DECIMAL(18,2) = (SELECT NewSum FROM inserted)
	   DECLARE @subject VARCHAR(50) = 'Balance change for account: ' + CAST(@accountId AS VARCHAR(10))
	   DECLARE @currentDateTime DATETIME = GETDATE()
	   DECLARE @body VARCHAR(MAX) = ('On ' + CAST(@currentDateTime AS VARCHAR(18)) + ' your balance was changed from '
               + CAST(@oldSum AS VARCHAR(18)) + ' to ' + CAST(@newSum AS VARCHAR(18)) + '.')

		INSERT INTO NotificationEmails (Recipient, [Subject], Body) VALUES
			   (@accountId, @subject, @body)
   END