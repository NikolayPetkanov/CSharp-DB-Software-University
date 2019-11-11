SELECT TOP 5
           e.EmployeeID,
           e.FirstName,
	   p.Name AS [ProjectName]
      FROM Employees e
 LEFT JOIN EmployeesProjects ep
        ON ep.EmployeeID = e.EmployeeID
 LEFT JOIN Projects p
        ON p.ProjectID = ep.ProjectID
     WHERE p.StartDate > '08-13-2002'
       AND p.EndDate IS NULL
  ORDER BY e.EmployeeID