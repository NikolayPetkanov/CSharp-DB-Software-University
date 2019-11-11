  SELECT f.Id AS [FlightId],
		 SUM(t.Price) AS [Price]
    FROM Flights f
    JOIN Tickets t
      ON t.FlightId = f.Id
GROUP BY f.Id
ORDER BY [Price] DESC, 
		 [FlightId]