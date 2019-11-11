CREATE FUNCTION udf_UserTotalCommits(@username NVARCHAR(50))
RETURNS INT
     AS
  BEGIN
        RETURN (SELECT COUNT(*)
				 FROM Users u
				 JOIN Commits c
				   ON c.ContributorId = u.Id
				WHERE u.Username = @username)
    END