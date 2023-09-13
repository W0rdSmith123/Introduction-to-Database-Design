IF Not EXISTS(SELECT * FROM sys.databases
WHERE Name = 'HW2')
CREATE DATABASE HW2;
go
use HW2;
go
IF EXISTS(SELECT * FROM sys.tables
WHERE Name = 'Student')
DROP TABLE dbo.Student;
go
IF EXISTS(SELECT * FROM sys.tables
WHERE Name = 'Course')
DROP TABLE dbo.Course;
go
IF EXISTS(SELECT * FROM sys.tables
WHERE Name = 'Section')
DROP TABLE dbo.Section;
go
IF EXISTS(SELECT * FROM sys.tables
WHERE Name = 'Enroll')
DROP TABLE dbo.Enroll;
go
--
-- Create the Student table
--
CREATE TABLE dbo.Student(
studentId INT NOT NULL,
firstName VARCHAR(100),
lastName VARCHAR(100),
street VARCHAR(255),
city VARCHAR(100),
state CHAR(2),
zipcode VARCHAR(10),
telephone CHAR(10)
PRIMARY KEY (studentId)
);
INSERT INTO dbo.Student VALUES
(100,'Samuel','Spade','22 Deer
Rd','London','OH','43140','7401234444'),
(200,'Sherlock','Holmes','222 Baker
St','London',NULL,'L22 3SU',NULL),
(300,'Hercule','Poirot','163 Main
St','Glasgow',NULL,'G11 9QX',''),
(400,'Donald','Duck','123 Aquatic
Way','Anaheim','CA','92802','7145551212'),
(500,'Micky','Mouse','5050 Mansion Dr','Beverly Hills',
'CA','90210','3105551212');
go
--
-- The Course table
--
CREATE TABLE dbo.Course (
courseId INT NOT NULL,
courseNo CHAR(8) NOT NULL,
courseName VARCHAR(40),
description VARCHAR(255),
credits INT NOT NULL,
PRIMARY KEY (courseId)
);
--
INSERT INTO dbo.Course VALUES (1,'MCS 0044','Basic Algebra', 'Review of
algebra.', 4);
INSERT INTO dbo.Course VALUES (2,'MCS 3543','Intro to Databases', 'Organization
of database systems.',3);
go
--
-- The Section table
--
CREATE TABLE dbo.Section (
sectionId INT NOT NULL,
sectionName VARCHAR(20) NOT NULL,
courseId INT NOT NULL,
term VARCHAR(12) NOT NULL
PRIMARY KEY (sectionId)
);
--
INSERT INTO dbo.Section VALUES (1, '1410', 1, 'Fall 2023');
INSERT INTO dbo.Section VALUES (2, '1411', 1, 'Fall 2023');
INSERT INTO dbo.Section VALUES (3, '1722', 2, 'Fall 2023');
INSERT INTO dbo.Section VALUES (4, '1732', 2, 'Fall 2023');
go
--
-- The Enroll table
--
CREATE TABLE dbo.Enroll (
sectionId INT NOT NULL,
studentId INT
PRIMARY KEY (sectionId, studentId)
);
--
INSERT INTO dbo.Enroll VALUES (1, 100),
(1, 500),
(2, 200),
(3, 100),
(4, 300),
(3, 400);
go
select *
from Student S
join Enroll E on S.studentId = E.studentId
join Section T on T.sectionId = E.sectionId
join Course C on C.courseId = T.courseId
order by C.courseName, S.lastName, S.firstName;
go