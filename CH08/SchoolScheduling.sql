-- "Display buildings and all classrooms in each building."
SELECT Buildings.BuildingCode, ClassRoomID
FROM Buildings
INNER JOIN Class_Rooms ON Buildings.BuildingCode = Class_Rooms.BuildingCode

-- "List students and all the classes in which they are currently enrolled."
SELECT Students.StudentID, Student_Schedules.ClassID
FROM (Students
	INNER JOIN Student_Schedules ON Student_Schedules.StudentID = Students.StudentID)
INNER JOIN Student_Class_Status ON Student_Class_Status.ClassStatus = Student_Schedules.ClassStatus
WHERE Student_Class_Status.ClassStatus = 1

-- "List the faculty staff and the subject each teachers."
SELECT Staff.StaffID, Subjects.SubjectID
FROM ((Staff
	INNER JOIN Faculty_Subjects ON Faculty_Subjects.StaffID = Staff.StaffID)
	INNER JOIN Subjects ON Subjects.SubjectID = Faculty_Subjects.SubjectID)

-- "Show me the students who have a grade of 85 or better in art and who also have a grade of 85 or better in any computer course."
SELECT
	ComputerStudents.StudentID,
	ComputerStudents.Grade AS ComputerGrade,
	ComputerStudents.CategoryID AS ComputerCategory,
	ArtStudents.Grade AS ArtGrade,
	ArtStudents.CategoryID AS ArtCategory
FROM (SELECT Student_Schedules.StudentID, Student_Schedules.Grade, Subjects.CategoryID
	FROM (Student_Schedules
	INNER JOIN Classes ON Classes.ClassID = Student_Schedules.ClassID)
	INNER JOIN Subjects ON Subjects.SubjectID = Classes.SubjectID
	WHERE Subjects.CategoryID = 'CIS' AND Student_Schedules.Grade >= 85) AS ComputerStudents
INNER JOIN (SELECT Student_Schedules.StudentID, Student_Schedules.Grade, Subjects.CategoryID
	FROM (Student_Schedules
	INNER JOIN Classes ON Classes.ClassID = Student_Schedules.ClassID)
	INNER JOIN Subjects ON Subjects.SubjectID = Classes.SubjectID
	WHERE Subjects.CategoryID = 'ART' AND Student_Schedules.Grade >= 85) AS ArtStudents
ON ComputerStudents.StudentID = ArtStudents.StudentID

