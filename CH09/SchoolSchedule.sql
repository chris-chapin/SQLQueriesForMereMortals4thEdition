-- "Show me classes that have no students enrolled."
SELECT DISTINCT Classes.ClassID, Subjects.SubjectName
FROM (Classes
	LEFT OUTER JOIN (
		SELECT Student_Schedules.ClassID, Student_Schedules.StudentID, Student_Class_Status.ClassStatusDescription
		FROM Student_Schedules
		INNER JOIN Student_Class_Status ON Student_Class_Status.ClassStatus = Student_Schedules.ClassStatus) AS StudentEnrolledmentStatus
	ON StudentEnrolledmentStatus.ClassID = Classes.ClassID)
INNER JOIN Subjects ON Subjects.SubjectID = Classes.SubjectID
WHERE StudentEnrolledmentStatus.StudentID is NULL OR StudentEnrolledmentStatus.ClassStatusDescription <> 'enrolled'

-- "Display subjects with no faculty assigned."
SELECT Subjects.SubjectName
FROM Subjects
LEFT OUTER JOIN Faculty_Subjects ON Faculty_Subjects.SubjectID = Subjects.SubjectID
WHERE Faculty_Subjects.StaffID is NULL

-- "List students not currently enrolled in any classes."
SELECT (Students.StudFirstName + ' ' + Students.StudLastName) AS StudentName
FROM Students
LEFT OUTER JOIN (
	SELECT (Students.StudFirstName + ' ' + Students.StudLastName) AS EnrolledStudentName, Students.StudentID AS EnrolledStudentId
	FROM Students
	INNER JOIN Student_Schedules ON Student_Schedules.StudentID = Students.StudentID
	WHERE Student_Schedules.ClassStatus = 1) AS EnrolledStudents
ON EnrolledStudents.EnrolledStudentId = Students.StudentID
WHERE EnrolledStudents.EnrolledStudentId is NULL

-- "Display all faculty and the classes they are scheduled to teach."
SELECT (Staff.StfFirstName + ' ' + Staff.StfLastname) AS StaffName, FacultyClasses.ClassID
FROM Staff
LEFT OUTER JOIN (
	SELECT Classes.ClassID, Faculty_Classes.StaffID
	FROM Faculty_Classes
	INNER JOIN Classes ON Classes.ClassID = Faculty_Classes.ClassID) AS FacultyClasses
ON FacultyClasses.StaffID = Staff.StaffID
