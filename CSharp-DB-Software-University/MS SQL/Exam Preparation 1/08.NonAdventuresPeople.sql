  SELECT p.FirstName,
	     p.LastName,
	     p.Age
    FROM Passengers p
   WHERE P.Id NOT IN (SELECT t.PassengerId
					    FROM Tickets t)
ORDER BY p.Age DESC,
		 p.FirstName,
		 p.LastName
