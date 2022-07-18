-- Display for each bowler the bowler name and the average of the bowler's raw game scores.
SELECT (Bowlers.BowlerLastName + ', ' + Bowlers.BowlerFirstName) AS BowlerFullName, AVG(CAST(Bowler_Scores.RawScore AS FLOAT)) AS AverageRawScore
FROM Bowlers
INNER JOIN Bowler_Scores ON Bowler_Scores.BowlerID = Bowlers.BowlerID
GROUP BY Bowlers.BowlerLastName, Bowlers.BowlerFirstName

-- Calculate the current average and handicap for each bowler.
SELECT BowlerID, AVG(RawScore) AS AverageScore, ROUND((200 - ROUND(AVG(CAST(RawScore AS FLOAT)), 0)) * 0.90, 0) AS AverageHandicapScore
FROM Bowler_Scores
GROUP BY BowlerID

-- Display the highest raw score for each bowler, but solve it using a subquery.
SELECT (Bowlers.BowlerLastName + ', ' + Bowlers.BowlerFirstName) AS BowlerFullName,
(SELECT MAX(Bowler_Scores.RawScore) FROM Bowler_Scores WHERE Bowler_Scores.BowlerID = Bowlers.BowlerID) AS MaxRawScore
FROM Bowlers