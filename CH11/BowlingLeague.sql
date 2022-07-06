-- "Show me all the bowlers and a count of games each bowled."

SELECT (Bowlers.BowlerFirstName + ' ' + Bowlers.BowlerLastName) AS BowlerName,
(SELECT COUNT(*) FROM Bowler_Scores WHERE Bowlers.BowlerID = Bowler_Scores.BowlerID) AS BowlerGames
FROM Bowlers

-- "List all the bowlers who have a raw score that's less than all of the other bowlers on the same team."

SELECT DISTINCT (Bowlers.BowlerFirstName + ' ' + Bowlers.BowlerLastName) AS BowlerName, Bowlers.BowlerID, Bowlers.TeamID, Bowler_Scores.RawScore
FROM Bowlers
INNER JOIN Bowler_Scores ON Bowler_Scores.BowlerID = Bowlers.BowlerID
WHERE Bowler_Scores.RawScore < ALL (
	SELECT BS2.RawScore
	FROM Bowlers AS B2
	INNER JOIN Bowler_Scores AS BS2 ON BS2.BowlerID = B2.BowlerID
	WHERE Bowlers.BowlerID <> B2.BowlerID AND Bowlers.TeamID = B2.TeamID)
