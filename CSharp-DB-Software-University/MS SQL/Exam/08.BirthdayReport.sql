  SELECT u.Username,
         c.Name AS CategoryName
    FROM Users u
	JOIN Reports r
	  ON r.UserId = u.Id
	JOIN Categories c
	  ON c.Id = r.CategoryId
   WHERE DATEPART(d, u.Birthdate) = DATEPART(d, r.OpenDate)
     AND DATEPART(M, u.Birthdate) = DATEPART(M, r.OpenDate)
ORDER BY u.Username,
         c.Name