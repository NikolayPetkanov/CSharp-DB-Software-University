CREATE DATABASE School

CREATE TABLE Students (
       Id INT IDENTITY(1, 1) PRIMARY KEY,
       FirstName NVARCHAR(30) NOT NULL,
       MiddleName NVARCHAR(25),
       LastName NVARCHAR(30) NOT NULL,
       Age INT CHECK(Age >= 5 AND Age <= 100),
       Address NVARCHAR(50),
       Phone NCHAR(10)
)

CREATE TABLE Subjects (
       Id INT IDENTITY(1, 1) PRIMARY KEY,
       Name NVARCHAR(20) NOT NULL,
       Lessons INT CHECK(Lessons > 0) NOT NULL
)

CREATE TABLE StudentsSubjects (
       Id INT IDENTITY(1, 1) PRIMARY KEY,
       StudentId INT NOT NULL REFERENCES Students(Id),
       SubjectId INT NOT NULL REFERENCES Subjects(Id),
       Grade Decimal(3, 2) CHECK(Grade >= 2 AND Grade <= 6) NOT NULL
)

CREATE TABLE Exams (
       Id INT IDENTITY(1, 1) PRIMARY KEY,
       Date DATETIME2,
       SubjectId INT NOT NULL REFERENCES Subjects(Id)
)

CREATE TABLE StudentsExams (
       StudentId INT NOT NULL REFERENCES Students(Id),
       ExamId INT NOT NULL REFERENCES Exams(Id),
       Grade Decimal(3, 2) CHECK(Grade >= 2 AND Grade <= 6) NOT NULL

       PRIMARY KEY(StudentId, ExamId)
)

CREATE TABLE Teachers (
       Id INT IDENTITY(1, 1) PRIMARY KEY,
       FirstName NVARCHAR(20) NOT NULL,
       LastName NVARCHAR(20) NOT NULL,
       Address NVARCHAR(20) NOT NULL,
       Phone NCHAR(10),
       SubjectId INT NOT NULL REFERENCES Subjects(Id)
)

CREATE TABLE StudentsTeachers (
       StudentId INT NOT NULL REFERENCES Students(Id),
       TeacherId INT NOT NULL REFERENCES Teachers(Id)

       PRIMARY KEY(StudentId, TeacherId)
)