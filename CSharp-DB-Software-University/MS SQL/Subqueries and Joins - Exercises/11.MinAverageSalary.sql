  SELECT MIN(d.AverageSalary) 
      AS [MinAverageSalary]
    FROM  (SELECT AVG(e.Salary) 
	       AS [AverageSalary]
             FROM Employees e
         GROUP BY e.DepartmentID) AS d