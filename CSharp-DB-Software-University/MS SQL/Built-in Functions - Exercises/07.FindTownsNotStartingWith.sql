  SELECT t.TownID, 
         t.Name 
    FROM Towns AS t
   WHERE LEFT(t.Name, 1) NOT IN ('R', 'B', 'D')
ORDER BY t.Name