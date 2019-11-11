  SELECT s.FirstName + ' ' + ISNULL(s.MiddleName + ' ', '') + s.LastName AS [Full Name]
    FROM Students s
   WHERE s.Id NOT IN (SELECT ss.StudentId
						FROM StudentsSubjects ss)
ORDER BY [Full Name]