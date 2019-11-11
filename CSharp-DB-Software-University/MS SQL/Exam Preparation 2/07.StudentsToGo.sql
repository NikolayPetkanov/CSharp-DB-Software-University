  SELECT s.FirstName + ' ' + s.LastName AS [Full Name]
    FROM Students s
   WHERE s.Id NOT IN (SELECT se.StudentId
						FROM StudentsExams se)
ORDER BY [Full Name]