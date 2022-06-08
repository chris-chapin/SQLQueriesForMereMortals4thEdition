-- "List the bowling teams and all the team members."
SELECT TeamName, (BowlerFirstName + ' ' + BowlerLastName) AS BowlerName
FROM Teams
INNER JOIN Bowlers ON Bowlers.TeamID = Teams.TeamID

-- "Display the bowlers, the matches they played in, and the bowler game scores."
SELECT Bowlers.BowlerID, MatchID, RawScore
FROM Bowlers
INNER JOIN Bowler_Scores ON Bowler_Scores.BowlerID = Bowlers.BowlerID

-- "Find the bowlers who live in the same ZIP Code."
SELECT FirstBowlerName, SecondBowlerName, BowlersFirstCopy.BowlerZip
FROM (
	SELECT (BowlerFirstName + ' ' + BowlerLastName) AS FirstBowlerName, BowlerZip
	FROM Bowlers) AS BowlersFirstCopy
INNER JOIN (
	SELECT (BowlerFirstName + ' ' + BowlerLastName) AS SecondBowlerName, BowlerZip
	FROM Bowlers) AS BowlersSecondCopy
ON BowlersFirstCopy.FirstBowlerName <> BowlersSecondCopy.SecondBowlerName AND BowlersFirstCopy.BowlerZip = BowlersSecondCopy.BowlerZip
