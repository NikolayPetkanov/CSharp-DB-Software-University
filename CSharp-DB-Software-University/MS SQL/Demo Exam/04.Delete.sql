DELETE rc
  FROM RepositoriesContributors rc
 WHERE rc.RepositoryId = 3

DELETE i
  FROM Issues i
 WHERE i.RepositoryId = 3