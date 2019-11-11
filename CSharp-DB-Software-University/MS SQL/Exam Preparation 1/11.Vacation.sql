 CREATE FUNCTION udf_CalculateTickets(@origin NVARCHAR(30), @destination NVARCHAR(30), @peopleCount INT)
RETURNS NVARCHAR(100)
  BEGIN
        IF(@peopleCount <= 0)
		BEGIN
		      RETURN 'Invalid people count!'
		END

		DECLARE @flightId INT = (SELECT f.Id 
								   FROM Flights f
								   JOIN Tickets t 
								     ON t.FlightId = f.Id 
								  WHERE f.Origin = @origin AND f.Destination = @destination)
		IF(@flightId IS NULL)
		BEGIN
		      RETURN 'Invalid flight!'
		END

		DECLARE @totalPrice DECIMAL(18, 2) = (SELECT t.Price
												FROM Tickets t
											   WHERE t.FlightId = @flightId) * @peopleCount

		RETURN 'Total price ' + CAST(@totalPrice as VARCHAR(30))
    END