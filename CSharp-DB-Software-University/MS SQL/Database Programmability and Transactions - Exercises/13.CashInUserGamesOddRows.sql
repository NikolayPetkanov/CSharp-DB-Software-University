    CREATE FUNCTION ufn_CashInUsersGames (@GameName NVARCHAR(50))
   RETURNS TABLE
    RETURN (SELECT SUM(k.Cash) AS SumCash
              FROM (
		       SELECT ug.Cash,
			      ROW_NUMBER() OVER (ORDER BY ug.Cash DESC) AS RowNumber
	                 FROM UsersGames ug
		   INNER JOIN Games g
			   ON g.Id = ug.GameId
	 	        WHERE g.Name = @GameName) AS k
             WHERE k.RowNumber % 2 = 1)
