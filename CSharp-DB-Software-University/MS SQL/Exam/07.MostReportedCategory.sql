  SELECT TOP 5
         c.Name AS CategoryName,
         COUNT(r.CategoryId) AS ReportsNumber
    FROM Categories c
	JOIN Reports r
	  ON r.CategoryId = c.Id
GROUP BY c.Name
ORDER BY ReportsNumber DESC,
         c.Name