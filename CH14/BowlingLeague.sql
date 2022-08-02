-- Do any team captains have a raw score that is higher than any other member of the team?
SELECT Teams.TeamID, Captains.BowlerID, Captains.BowlerFirstName, Captains.BowlerLastName, Teams.TeamName, MAX(CaptainScores.RawScore) AS MaxCaptainRawScore
FROM Bowlers AS Captains
INNER JOIN Bowler_Scores AS CaptainScores ON CaptainScores.BowlerID = Captains.BowlerID
INNER JOIN Teams ON Teams.CaptainID = Captains.BowlerID
GROUP BY Teams.TeamID, Captains.BowlerID, Captains.BowlerFirstName, Captains.BowlerLastName, Teams.TeamName
HAVING MAX(CaptainScores.RawScore) > (
	SELECT MAX(TeammateScores.RawScore) AS MaxTeammateScore
	FROM Teams AS T2
	INNER JOIN Bowlers AS Teammates ON T2.TeamID = Teammates.TeamID
	INNER JOIN Bowler_Scores AS TeammateScores ON TeammateScores.BowlerID = Teammates.BowlerID
	WHERE Teams.TeamID = Teammates.TeamID AND Teammates.BowlerID <> Captains.BowlerID)

-- Display for each bowler the bowler name and the average of the bowler's raw game scores for bowlers whose average is greater than 155.
SELECT Bowlers.BowlerFirstName, Bowlers.BowlerLastName, AVG(Bowler_Scores.RawScore) AS AverageRawScore
FROM Bowlers
INNER JOIN Bowler_Scores ON Bowler_Scores.BowlerID = Bowlers.BowlerID
GROUP BY Bowlers.BowlerFirstName, Bowlers.BowlerLastName
HAVING AVG(Bowler_Scores.RawScore) > 155

-- List the last name and first name of every bowler whose average raw score is greater than or equal to the overall average score.
SELECT Bowlers.BowlerFirstName, Bowlers.BowlerLastName, AVG(Bowler_Scores.RawScore) AS AverageRawScore
FROM Bowlers
INNER JOIN Bowler_Scores ON Bowler_Scores.BowlerID = Bowlers.BowlerID
GROUP BY Bowlers.BowlerFirstName, Bowlers.BowlerLastName
HAVING AVG(Bowler_Scores.RawScore) > (SELECT AVG(RawScore) FROM Bowler_Scores)