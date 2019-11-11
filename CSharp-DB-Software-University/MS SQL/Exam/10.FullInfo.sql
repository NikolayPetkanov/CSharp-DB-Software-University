   SELECT ISNULL(e.FirstName + ' ' + e.LastName, 'None') AS Employee,
          ISNULL(d.Name, 'None') AS Department,
		  ISNULL(c.Name, 'None') AS Category,
		  ISNULL(r.Description, 'None') AS Description,
		  ISNULL(FORMAT(r.OpenDate, 'dd.MM.yyyy'), 'None') AS OpenDate,
		  ISNULL(s.Label, 'None') AS Status,
		  ISNULL(u.Name, 'None') AS [User]
     FROM Reports r
LEFT JOIN Employees e
	   ON e.Id = r.EmployeeId
LEFT JOIN Departments d
	   ON d.Id = e.DepartmentId
     JOIN Categories c
	   ON c.Id = r.CategoryId
     JOIN Users u
	   ON u.Id = r.UserId
     JOIN Status s
	   ON s.Id = r.StatusId
 GROUP BY e.FirstName,
          e.LastName,
		  d.Name,
		  c.Name,
		  r.Description,
		  r.OpenDate,
		  s.Label,
		  u.Name
 ORDER BY e.FirstName DESC,
          e.LastName DESC,
		  d.Name,
		  c.Name,
		  r.Description,
		  r.OpenDate,
		  s.Label,
		  u.Name