  SELECT r.Description,
         FORMAT(r.OpenDate, 'dd-MM-yyyy') AS OpenDate
    FROM Reports r
   WHERE r.EmployeeId IS NULL
ORDER BY r.OpenDate
