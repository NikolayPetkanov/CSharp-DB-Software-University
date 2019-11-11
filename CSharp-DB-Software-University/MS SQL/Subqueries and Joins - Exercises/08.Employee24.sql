    SELECT e.EmployeeID,
           e.FirstName,
	   CASE
           WHEN p.StartDate >= '01-01-2005' THEN NULL
           ELSE p.Name
           END AS [ProjectName]
      FROM Employees e
 LEFT JOIN EmployeesProjects ep
        ON ep.EmployeeID = e.EmployeeID
 LEFT JOIN Projects p
        ON p.ProjectID = ep.ProjectID
     WHERE ep.EmployeeID = 24