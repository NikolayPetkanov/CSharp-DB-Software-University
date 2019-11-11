CREATE PROC usp_AssignProject @employeeId INT, @projectID INT
    AS
 BEGIN TRANSACTION
        INSERT INTO EmployeesProjects 
	VALUES (@employeeId, @projectID)
    
       DECLARE @projectsCount INT = 
       (SELECT COUNT(*) 
	  FROM EmployeesProjects 
	 WHERE EmployeeID = @employeeId)

            IF (@projectsCount > 3)
         BEGIN
               ROLLBACK
	       RAISERROR('The employee has too many projects!', 16, 1)
               RETURN
           END
COMMIT