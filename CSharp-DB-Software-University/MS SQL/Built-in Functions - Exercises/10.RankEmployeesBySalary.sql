  SELECT e.EmployeeID, 
         e.FirstName, 
         e.LastName, 
         e.Salary,
	     DENSE_RANK() OVER
	     (PARTITION BY Salary ORDER BY EmployeeId) AS Rank
    FROM Employees AS e
   WHERE Salary BETWEEN 10000 AND 50000
ORDER BY Salary DESC