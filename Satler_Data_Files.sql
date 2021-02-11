--Added Data

INSERT INTO EdSetting (EdSettingID, StudentEdSettingLinkID, SchoolName)
VALUES (200, 100, 'Fabulous Middle')

UPDATE StudentEdSettingLink
SET EdSettingID = 200
WHERE StudentID = 1;

INSERT INTO EdSetting (EdSettingID, StudentEdSettingLinkID, SchoolName)
VALUES (201, 101, 'Great Elementary')

UPDATE StudentEdSettingLink
SET EdSettingID = 201
WHERE StudentID = 2;

INSERT INTO EdSetting (EdSettingID, StudentEdSettingLinkID, SchoolName)
VALUES (202, 102, 'Fabulous Middle')

UPDATE StudentEdSettingLink
SET EdSettingID = 202
WHERE StudentID = 3;

INSERT INTO EdSetting (EdSettingID, StudentEdSettingLinkID, SchoolName)
VALUES (203, 103, 'Tough High')

UPDATE StudentEdSettingLink
SET EdSettingID = 203
WHERE StudentID = 4;

INSERT INTO Student(StudentID, StuFirstName, StuLastName, Grade, DOB, Eligibility)
VALUES	(10, 'Janet', 'Jones', 4, '5/15/2012', 'LD');

Select *
FROM Student;

UPDATE Student
SET Grade = 3
WHERE StudentID = 10;

UPDATE Student
SET Grade = 5
WHERE StudentID = 10;

UPDATE Student
SET Grade = 4
WHERE StudentID = 10;

Select *
FROM GradeChange

	
Select *
FROM IEPTime

INSERT INTO IEPTime (TimeID, SpecID, IEPMinutes, IEPFrequency)
VALUES (500, 400, 30, 9)

INSERT INTO CaseManager (CaseManagerID, StudentID, CMFirstName, CMLastName, CMStartDate, CMEndDate)
VALUES (600, 1, 'Billy', 'Borders', '8/1/2010', NULL)

INSERT INTO CaseManager (CaseManagerID, StudentID, CMFirstName, CMLastName, CMStartDate, CMEndDate)
VALUES (601, 2, 'Sam', 'Jones', '8/1/2010', NULL)

INSERT INTO CaseManager (CaseManagerID, StudentID, CMFirstName, CMLastName, CMStartDate, CMEndDate)
VALUES (602, 3, 'Steve', 'Carter', '8/1/2019', NULL)

INSERT INTO Student (StudentID, Eligibility)
VALUES (8, 'AU')



INSERT INTO CaseManager (CaseManagerID, StudentID, CMFirstName, CMLastName, CMStartDate, CMEndDate)
VALUES (603, 4, 'Mel', 'Brooks', '8/1/2019', NULL)

INSERT INTO Specialist(SpecID, LicenseNum, SpecFirstName, SpecLastName, SpecStartDate)
VALUES	(403, 555444, 'Bob', 'Combs', '4/1/2013')

INSERT INTO SLP(SpecID, TechCert)
VALUES (403, 464555)

INSERT INTO Specialist(SpecID, LicenseNum, SpecFirstName, SpecLastName, SpecStartDate)
VALUES	(404, 6424, 'Lynn', 'Carter', '4/1/2012')

INSERT INTO SLP(SpecID, TechCert)
VALUES (404, 5679)