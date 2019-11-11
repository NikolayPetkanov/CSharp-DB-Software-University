CREATE PROC usp_DepositMoney (@AccountId INT, @MoneyAmount DECIMAL(18, 4))
    AS
 BEGIN
       BEGIN TRANSACTION
	     DECLARE @Account INT = (Select Id FROM Accounts WHERE Id = @AccountId)
	          IF (@AccountId is NULL)
	       BEGIN
		     ROLLBACK
		     RAISERROR('Account does not exist', 16, 1)
		     RETURN
	         END

	          IF (@MoneyAmount < 0)
	       BEGIN
		     ROLLBACK
		     RAISERROR('Can not deposit a negative amount.', 16, 2)
		     RETURN
		 END

	      UPDATE Accounts
                 SET Balance += @MoneyAmount
	       WHERE Id = @AccountId
       COMMIT
   END