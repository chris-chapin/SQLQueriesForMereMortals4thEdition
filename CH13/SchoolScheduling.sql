-- Display by category the category name and the count of classes offered.
SELECT CategoryDescription, COUNT(ClassID) AS ClassesOffered
FROM Categories
INNER JOIN Subjects ON Subjects.CategoryID = Categories.CategoryID
INNER JOIN Classes ON Classes.SubjectID = Subjects.SubjectID
GROUP BY CategoryDescription

-- List each staff member and the count of classes each is scheduled to teach.
SELECT (Staff.StfFirstName + ' ' + Staff.StfLastname) AS StaffMember, COUNT(*) AS ClassCount
FROM Staff
INNER JOIN Faculty_Classes ON Faculty_Classes.StaffID = Staff.StaffID
GROUP BY (Staff.StfFirstName + ' ' + Staff.StfLastname)

-- Solve #2 using a subquery
SELECT (Staff.StfFirstName + ' ' + Staff.StfLastname) AS StaffMember, 
  (SELECT COUNT(*) FROM Faculty_Classes WHERE Faculty_Classes.StaffID = Staff.StaffID) AS ClassCount
FROM Staff

-- Why does #3 return 5 more rows? Modify #2 to return those 5 additional rows.
-- Because those teaches who don't teach a class are included
SELECT (Staff.StfFirstName + ' ' + Staff.StfLastname) AS StaffMember, COUNT(Faculty_Classes.ClassID) AS ClassCount
FROM Staff
LEFT OUTER JOIN Faculty_Classes ON Faculty_Classes.StaffID = Staff.StaffID
GROUP BY (Staff.StfFirstName + ' ' + Staff.StfLastname)