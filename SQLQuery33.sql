SELECT CaseManagerID, CMFirstName, CMLastName
FROM CaseManager
JOIN Student ON Student.StudentID = CaseManager.StudentID
WHERE Student.Eligibility = 'AU'
GROUP BY CaseManagerID, CMFirstName, CMLastName, CaseManager.StudentID
HAVING COUNT(CaseManager.StudentID) = 1;

SELECT CaseManager.CaseManagerID, EdSetting.SchoolName, Student.StuFirstName, Student.StuLastName
FROM CaseManager
JOIN Student ON Student.StudentID = CaseManager.StudentID
JOIN StudentEdSettingLink ON StudentEdSettingLink.StudentID = Student.StudentID
JOIN EdSetting ON EdSetting.StudentEdSettingLinkID = StudentEdSettingLink.StudentEdSettingLinkID
GROUP BY CaseManager.CaseManagerID, Student.StuFirstName, EdSetting.SchoolName, Student.StuLastName
HAVING SchoolName = 'Fabulous Middle' ;

SELECT Specialist.SpecID, Specialist.SpecFirstName, Specialist.SpecLastName
FROM Specialist
RIGHT JOIN SLP ON SLP.SpecID = Specialist.SpecID
WHERE Specialist.SpecStartDate < '8/1/2018';




