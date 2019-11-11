   SELECT pl.Name,
  		  pl.Seats,
		  COUNT(t.Id) AS [Passengers Count]
     FROM Planes pl
LEFT JOIN Flights f
	   ON f.PlaneId = pl.Id
LEFT JOIN Tickets t
	   ON t.FlightId = f.Id
 GROUP BY pl.Name,
		  pl.Seats
 ORDER BY [Passengers Count] DESC,
		  pl.Name,
		  pl.Seats