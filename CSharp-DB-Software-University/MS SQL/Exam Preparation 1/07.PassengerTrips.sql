SELECT p.FirstName + ' ' + p.LastName AS [FullName],
	   f.Origin,
	   f.Destination
  FROM Passengers p
  JOIN Tickets t
    ON t.PassengerId = p.Id
  JOIN Flights f
    ON f.Id = t.FlightId
ORDER BY [FullName],
		 f.Origin,
		 f.Destination