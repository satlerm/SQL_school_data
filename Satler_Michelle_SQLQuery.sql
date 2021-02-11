-- Drop tables are added for early production convenience
DROP TABLE IEPTime;
DROP TABLE Psychologist;
DROP TABLE SLP;
DROP TABLE PT;
DROP TABLE OT;
DROP TABLE VisionServices;
DROP TABLE Specialty;
DROP TABLE CurrentIEP;
DROP TABLE ElementarySchool;
DROP TABLE MiddleSchool;
DROP TABLE HighSchool;
DROP TABLE EdSetting;
DROP TABLE CaseManager;
DROP TABLE Student;


-- Tables for TherapyTracker are below
CREATE TABLE Student (
StudentID DECIMAL(12) NOT NULL PRIMARY KEY,
StuFirstName VARCHAR(64) NOT NULL,
StuLastName VARCHAR(64) NOT NULL,
Grade VARCHAR(4) NOT NULL,
DOB DATE,
Eligibility VARCHAR(64) NOT NULL);

CREATE TABLE CaseManager (
CaseManagerID DECIMAL(12) NOT NULL PRIMARY KEY,
StudentID DECIMAL(12) NOT NULL, 
CMFirstName VARCHAR(64) NOT NULL,
CMLastName VARCHAR(64) NOT NULL,
CMStartDate DATE NOT NULL,
CMEndDate DATE,
FOREIGN KEY (StudentID) REFERENCES Student(StudentID));

CREATE TABLE EdSetting (
EdSettingID DECIMAL(12) NOT NULL PRIMARY KEY,
StudentID DECIMAL(12) NOT NULL,
SchoolName VARCHAR(64) NOT NULL,
Description VARCHAR(255),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID));

CREATE TABLE ElementarySchool (
EdSettingID DECIMAL(12) PRIMARY KEY,
FOREIGN KEY (EdSettingID) REFERENCES EdSetting(EdSettingID));

CREATE TABLE MiddleSchool (
EdSettingID DECIMAL(12) PRIMARY KEY,
FOREIGN KEY (EdSettingID) REFERENCES EdSetting(EdSettingID));

CREATE TABLE HighSchool (
EdSettingID DECIMAL(12) PRIMARY KEY,
FOREIGN KEY (EdSettingID) REFERENCES EdSetting(EdSettingID));

CREATE TABLE CurrentIEP (
CurrentIEPID DECIMAL(12) NOT NULL PRIMARY KEY,
StudentID DECIMAL(12) NOT NULL,
IEPStart DATE NOT NULL,
IEPEND DATE NOT NULL,
FOREIGN KEY (StudentID) REFERENCES Student(StudentID));

CREATE TABLE Specialty (
SpecID DECIMAL(12) NOT NULL PRIMARY KEY,
CurrentIEPID DECIMAL(12) NOT NULL,
LicenseNum VARCHAR(50) NOT NULL,
SpecFirstName VARCHAR(64) NOT NULL,
SpecLastName VARCHAR(64) NOT NULL,
SpecStartDate DATE NOT NULL,
SpecEndDate DATE,
FOREIGN KEY (CurrentIEPID) REFERENCES CurrentIEP(CurrentIEPID));

CREATE TABLE VisionServices (
SpecID DECIMAL(12) PRIMARY KEY
FOREIGN KEY (SpecID) REFERENCES Specialty(SpecID));

CREATE TABLE OT (
SpecID DECIMAL(12) PRIMARY KEY
FOREIGN KEY (SpecID) REFERENCES Specialty(SpecID));

CREATE TABLE PT (
SpecID DECIMAL(12) PRIMARY KEY
FOREIGN KEY (SpecID) REFERENCES Specialty(SpecID));

CREATE TABLE SLP (
SpecID DECIMAL(12) PRIMARY KEY
FOREIGN KEY (SpecID) REFERENCES Specialty(SpecID));

CREATE TABLE Psychologist (
SpecID DECIMAL(12) PRIMARY KEY
FOREIGN KEY (SpecID) REFERENCES Specialty(SpecID));

CREATE TABLE IEPTime (
TimeID DECIMAL(12) NOT NULL PRIMARY KEY,
SpecID DECIMAL(12) NOT NULL,
CurrentIEPID DECIMAL(12) NOT NULL,
IEPMinutes DECIMAL(4) NOT NULL,
IEPFrequency DECIMAL(4) NOT NULL,
FOREIGN KEY (SpecID) REFERENCES Specialty(SpecID),
FOREIGN KEY (CurrentIEPID) REFERENCES CurrentIEP(CurrentIEPID));

-- Non-Unique Index for EdSetting.SchoolName
CREATE INDEX EdSettingSchoolNameIdx
ON EdSetting(SchoolName);

-- Non-Unique Index for Student.Eligibility
CREATE INDEX StudentEligibilityIdx
ON Student(Eligibility);

-- Non-Unique Index for IEPTime.IEPMinutes
CREATE INDEX IEPTimeMinutesIdx
ON IEPTime(IEPMinutes);

-- Unique Indexes for foreign keys are below
CREATE UNIQUE INDEX CaseManagerStudentIDIdx
ON CaseManager(StudentID);

CREATE UNIQUE INDEX EdSettingStudentIDIdx
ON EdSetting(StudentID);

CREATE UNIQUE INDEX CurrentIEPStudentIDIdx
ON CurrentIEP(StudentID);

-- Non-Unique Indexes for Foreign Keys
CREATE INDEX SpecialCurrentIEPIDIdx
ON Specialty(CurrentIEPID);

CREATE INDEX IEPTimeSpecIDIdx
ON IEPTime(SpecID);

CREATE INDEX IEPTimeCurrentIEPIDIdx
ON IEPTime(CurrentIEPID);
