-- Display by category the category name and the count of classes offered for those categories that have three or more classes.
SELECT Categories.CategoryDescription, COUNT(Classes.ClassID) AS TotalClasses
FROM Categories
INNER JOIN Subjects ON Subjects.CategoryID = Categories.CategoryID
INNER JOIN Classes ON Classes.SubjectID = Subjects.SubjectID
GROUP BY Categories.CategoryDescription
HAVING COUNT(Classes.ClassID) > 2

-- List each staff member and the count of classes each is scheduled to teach for those staff members who teach fewer than three classes.
SELECT Staff.StfFirstName, Staff.StfLastname, COUNT(Faculty_Classes.ClassID) AS ClassCount
FROM Staff
LEFT OUTER JOIN Faculty_Classes ON Faculty_Classes.StaffID = Staff.StaffID
GROUP BY Staff.StfFirstName, Staff.StfLastname
HAVING COUNT(Faculty_Classes.ClassID) < 3

-- Show me the subject categories that have fewer than three full professors teaching that subject.
SELECT Categories.CategoryDescription, COUNT(F.StaffID) AS ProfessorCount
FROM Categories
LEFT OUTER JOIN Faculty_Categories ON Faculty_Categories.CategoryID = Categories.CategoryID
LEFT OUTER JOIN (
	SELECT Faculty.StaffID, Faculty.Title, Faculty.Status
	FROM Faculty
	WHERE Faculty.Title = 'Professor' AND Faculty.Status = 'Full Time') AS F
ON F.StaffID = Faculty_Categories.StaffID
GROUP BY Categories.CategoryDescription
HAVING COUNT(F.StaffID) < 3
