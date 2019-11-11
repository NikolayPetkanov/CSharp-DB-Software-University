CREATE TABLE Users (
       Id INT IDENTITY(1, 1),
       Username VARCHAR(30) NOT NULL,
       Password VARCHAR(26) NOT NULL,
       ProfilePicture VARBINARY(MAX),
       LastLoginTime SMALLDATETIME,
       IsDeleted BIT

       CONSTRAINT PK_Users
       PRIMARY KEY (Id),

       CONSTRAINT UQ_Username
       UNIQUE (Username)
)

INSERT INTO Users (Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
       VALUES ('john33', '88888888', 8001, '2019-04-09 11:37:15', 0),
              ('michael', '12345', 55555, '2018-11-19 11:37:15', 1),
              ('george_clarkson', 'abbbbba', NULL, '2017-12-22 12:55:17', 0),
              ('kevinnn', 'petedinici', NULL, '2014-05-30 05:02:00', 1),
              ('DaNiEl', '987654321', 1, '2016-02-14 23:01:55', 1)