CREATE FUNCTION udf_ExamGradesToUpdate(@studentId INT, @grade DECIMAL(3, 2))
RETURNS NVARCHAR(100)
  BEGIN
		DECLARE @studentFirstName NVARCHAR(30) = (SELECT s.FirstName
													FROM Students s
												   WHERE s.Id = @studentId)

		IF(@studentFirstName IS NULL)
		BEGIN
		      RETURN 'The student with provided id does not exist in the school!'
		END

		IF(@grade > 6)
		BEGIN
		      RETURN 'Grade cannot be above 6.00!'
		END

		DECLARE @countOfGrades INT = (SELECT COUNT(se.Grade)
										FROM StudentsExams se
									   WHERE se.StudentId = @studentId
									     AND se.Grade >= @grade
										 AND se.Grade <= @grade + 0.5)

		RETURN CONCAT('You have to update ', @countOfGrades, ' grades for the student ', @studentFirstName)
    END