-- "List all staff members and the count of classes each teaches."

SELECT Staff.StfFirstName, Staff.StfLastname,
(SELECT COUNT(*) FROM Faculty_Classes WHERE Faculty_Classes.StaffID = Staff.StaffID) AS ClassCount
FROM Staff

-- "Display students enrolled in a class on Tuesday."

SELECT StudentID, (Students.StudFirstName + ' ' + Students.StudLastName) AS StudentName
FROM Students
WHERE StudentID IN (
	SELECT Student_Schedules.StudentID
	FROM Student_Schedules
	INNER JOIN Classes ON Classes.ClassID = Student_Schedules.ClassID
	WHERE Classes.TuesdaySchedule = 1)

-- "List the subjects taught on Wednesday."

SELECT SubjectName
FROM Subjects
WHERE SubjectID IN (
	SELECT Subjects.SubjectID
	FROM Subjects
	INNER JOIN Classes ON Classes.SubjectID = Subjects.SubjectID
	WHERE Classes.WednesdaySchedule = 1)
