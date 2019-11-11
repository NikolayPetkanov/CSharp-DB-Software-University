UPDATE Tickets
   SET Price += t.Price * 0.13
 FROM Tickets t
 JOIN Flights f
   ON f.Id = t.FlightId
WHERE f.Destination = 'Carlsbad'