CREATE PROC usp_ExcludeFromSchool(@StudentId INT)
     AS
DECLARE @id INT = (SELECT s.Id
					 FROM Students s
					WHERE s.Id = @studentId)

IF (@id IS NULL)
BEGIN
	  RAISERROR('This school has no student with the provided id!', 16, 1)
      RETURN
END

DELETE
  FROM StudentsSubjects
 WHERE StudentId = @StudentId

DELETE
FROM StudentsExams
WHERE StudentId = @StudentId

DELETE
  FROM StudentsTeachers
 WHERE StudentId = @StudentId

DELETE
  FROM Students
 WHERE Id = @StudentId