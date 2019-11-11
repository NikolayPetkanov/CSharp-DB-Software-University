DELETE 
  FROM Tickets
 WHERE FlightId IN (SELECT f.Id
					  FROM Flights f
					 WHERE f.Destination = 'Ayn Halagim')

DELETE 
  FROM Flights
 WHERE Destination = 'Ayn Halagim'