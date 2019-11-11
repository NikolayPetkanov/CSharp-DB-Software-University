CREATE PROC usp_FindByExtension(@extension NVARCHAR(10))
	AS
 BEGIN
	   SELECT f.Id,
			  f.Name,
			  STR(f.Size, LEN(f.Size), 2) + 'KB' AS Size
	     FROM Files f
		WHERE f.Name LIKE '%' + @extension
   END