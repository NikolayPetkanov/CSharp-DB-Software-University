    CREATE PROC usp_CalculateFutureValueForAccount (@AccountId INT, @YearlyInterestRate FLOAT)
	AS
    SELECT a.Id AS [Account Id],
           ah.FirstName AS [First Name],
           ah.LastName AS [Last Name],
           a.Balance AS [Current Balance],
           dbo.ufn_CalculateFutureValue(a.Balance, @YearlyInterestRate, 5) AS [Balance in 5 years]  
      FROM AccountHolders ah
INNER JOIN Accounts a
        ON a.AccountHolderId = ah.Id
     WHERE a.Id = @AccountId
