 CREATE PROC usp_AssignEmployeeToReport(@EmployeeId INT, @ReportId INT)
     AS
DECLARE @EmployeeDepartmentId INT = (SELECT e.DepartmentId
                                       FROM Employees e
								      WHERE e.Id = @EmployeeId)

DECLARE @CategoryDepartmentId INT = (SELECT c.DepartmentId
                                       FROM Categories c
									   JOIN Reports r
									     ON r.CategoryId = c.Id
									  WHERE r.Id = @ReportId)

     IF (@EmployeeDepartmentId != @CategoryDepartmentId)
  BEGIN
        RAISERROR('Employee doesn''t belong to the appropriate department!', 16, 1)
        RETURN
    END

 UPDATE Reports
    SET EmployeeId = @EmployeeId
  WHERE Id = @ReportId