 CREATE FUNCTION ufn_CalculateFutureValue 
		(@InitialSum DECIMAL(18, 4), @YearlyInterestRate FLOAT, @NumberOfYears INT)
RETURNS DECIMAL(18, 4)
     AS
  BEGIN
        DECLARE @FutureValue DECIMAL(18, 4)
            SET @FutureValue = @InitialSum * (POWER(1 + @YearlyInterestRate, @NumberOfYears))
    
        RETURN @FutureValue
    END