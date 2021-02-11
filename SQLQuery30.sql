-- Trigger for History Table
CREATE TRIGGER GradeChangeTrigger
ON Student
AFTER UPDATE
AS
BEGIN
	DECLARE @OldGrade VARCHAR(4) = (SELECT Grade FROM DELETED);
	DECLARE @NewGrade VARCHAR(4) = (SELECT Grade FROM INSERTED);

	IF (@OldGrade <> @NewGrade)
		INSERT INTO GradeChange(GradeChangeID, OldGrade, NewGrade, StudentID, ChangeDate)
		VALUES (ISNULL((SELECT MAX(GradeChangeID)+1 FROM GradeChange), 1),
		@OldGrade,
		@NewGrade,
		(SELECT StudentID FROM INSERTED),
		GETDATE());
END;