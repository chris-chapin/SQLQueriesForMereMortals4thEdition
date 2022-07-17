-- What is the current average class duration?
SELECT AVG(Duration) AverageClassDuration
FROM Classes

-- List the last name and first name of each staff member who has been with us since the earliest hire date.
SELECT StfLastname, StfFirstname
FROM Staff
WHERE DateHired = (SELECT MIN(DateHired) FROM Staff)

-- How many classes are held in room 3346?
SELECT COUNT(*) NumberClassesInRoom3346
FROM Classes
WHERE ClassRoomID = 3346