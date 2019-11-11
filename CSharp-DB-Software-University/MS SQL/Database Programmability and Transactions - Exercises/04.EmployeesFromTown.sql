    CREATE PROC usp_GetEmployeesFromTown (@TownName VARCHAR(10))
	AS
    SELECT e.FirstName,
           e.LastName
      FROM Employees e
INNER JOIN Addresses a
        ON a.AddressID = e.AddressID
INNER JOIN Towns t
        ON t.TownID = a.TownID
     WHERE t.Name = @TownName