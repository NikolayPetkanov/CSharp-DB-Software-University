  SELECT pa.FirstName + ' ' + pa.LastName AS [Full Name],
         pl.Name AS [Plane Name],
	     f.Origin + ' - ' + f.Destination AS [Trip],
	     lt.Type
    FROM Passengers pa
    JOIN Tickets t
      ON t.PassengerId = pa.Id
    JOIN Flights f
      ON f.Id = t.FlightId
    JOIN Planes pl
      ON pl.Id = f.PlaneId
    JOIN Luggages l
      ON l.Id = t.LuggageId
    JOIN LuggageTypes lt
      ON lt.Id = l.LuggageTypeId
ORDER BY [Full Name],
		 pl.Name,
		 f.Origin,
		 f.Destination,
		 lt.Type