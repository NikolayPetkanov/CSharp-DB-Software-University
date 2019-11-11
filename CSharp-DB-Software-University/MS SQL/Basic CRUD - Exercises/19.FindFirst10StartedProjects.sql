  SELECT TOP 10 * 
    FROM Projects AS p
   WHERE p.StartDate <= GETDATE()
ORDER BY p.StartDate,
         p.Name