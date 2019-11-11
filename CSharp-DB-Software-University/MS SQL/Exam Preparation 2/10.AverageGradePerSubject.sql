  SELECT s.Name,
		 AVG(ss.Grade)
	FROM Subjects s
	JOIN StudentsSubjects ss
	  ON ss.SubjectId = s.Id
GROUP BY s.Id,
		 s.Name
ORDER BY s.Id