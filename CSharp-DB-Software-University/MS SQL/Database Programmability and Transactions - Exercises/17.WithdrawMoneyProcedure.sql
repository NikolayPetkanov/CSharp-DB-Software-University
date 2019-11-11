CREATE PROC usp_WithdrawMoney (@AccountId INT, @MoneyAmount DECIMAL(18, 4))
    AS
 BEGIN
       BEGIN TRANSACTION
	     DECLARE @Account INT = (Select Id FROM Accounts WHERE Id = @AccountId)
	     DECLARE @Balance DECIMAL(18, 4) = (SELECT Balance FROM Accounts WHERE Id = @AccountID)

	          IF (@AccountId is NULL)
	       BEGIN
		     ROLLBACK
		     RAISERROR('Account does not exist', 16, 1)
		     RETURN
		 END

		  IF (@Balance < @MoneyAmount)
	       BEGIN
		     ROLLBACK
		     RAISERROR('Insufficient funds.', 16, 2)
		     RETURN
		 END

	      UPDATE Accounts
		 SET Balance -= @MoneyAmount
	       WHERE Id = @AccountId
       COMMIT
   END
