  SELECT r.Description,
         c.Name AS CategoryName
    FROM Reports r
	JOIN Categories c
	  ON c.Id = r.CategoryId
ORDER BY r.Description,
         c.Name