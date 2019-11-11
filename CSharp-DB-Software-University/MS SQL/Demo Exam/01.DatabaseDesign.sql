CREATE DATABASE Bitbucket

CREATE TABLE Users (
	   Id INT IDENTITY(1, 1) PRIMARY KEY,
	   Username NVARCHAR(30) NOT NULL,
	   Password NVARCHAR(30) NOT NULL,
	   Email NVARCHAR(50) NOT NULL
)

CREATE TABLE Repositories (
	   Id INT IDENTITY(1, 1) PRIMARY KEY,
	   Name NVARCHAR(50) NOT NULL
)

CREATE TABLE RepositoriesContributors (
	   RepositoryId INT NOT NULL REFERENCES Repositories(Id),
       ContributorId INT NOT NULL REFERENCES Users(Id),
	   PRIMARY KEY(RepositoryId, ContributorId)
)

CREATE TABLE Issues (
	   Id INT IDENTITY(1, 1) PRIMARY KEY,
	   Title NVARCHAR(255) NOT NULL,
	   IssueStatus NCHAR(6) NOT NULL,
	   RepositoryId INT NOT NULL REFERENCES Repositories(Id),
	   AssigneeId INT NOT NULL REFERENCES Users(Id)
)

CREATE TABLE Commits (
	   Id INT IDENTITY(1, 1) PRIMARY KEY,
	   Message NVARCHAR(255) NOT NULL,
	   IssueId INT REFERENCES Issues(Id),
	   RepositoryId INT NOT NULL REFERENCES Repositories(Id),
       ContributorId INT NOT NULL REFERENCES Users(Id)
)

CREATE TABLE Files (
	   Id INT IDENTITY(1, 1) PRIMARY KEY,
	   Name NVARCHAR(100) NOT NULL,
	   Size DECIMAL(15, 2) NOT NULL,
	   ParentId INT REFERENCES Files(Id),
       CommitId INT NOT NULL REFERENCES Commits(Id)
)