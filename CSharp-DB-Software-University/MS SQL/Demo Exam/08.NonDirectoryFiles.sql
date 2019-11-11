  SELECT f.Id,
	     f.Name,
  	     STR(f.Size, LEN(f.Size), 2) + 'KB' AS Size
    FROM Files f
   WHERE NOT EXISTS (SELECT ParentId 
					   FROM Files
					  WHERE f.Id = ParentId)
ORDER BY f.Id,
		 f.Name,
		 f.Size DESC