-- "Display matches with no game data."

SELECT Tourney_Matches.MatchID
FROM Tourney_Matches
LEFT OUTER JOIN Match_Games ON Tourney_Matches.MatchID = Match_Games.MatchID
WHERE Match_Games.MatchID is NULL

-- "Display all tournaments and any matches that have been played."

SELECT Tournaments.TourneyID, PlayedMatches.TourneyMatches, PlayedMatches.GameMatches
FROM Tournaments
LEFT OUTER JOIN (
	SELECT Tourney_Matches.TourneyID, Tourney_Matches.MatchID AS TourneyMatches, Match_Games.MatchID AS GameMatches
	FROM Tourney_Matches
	FULL OUTER JOIN Match_Games ON Match_Games.MatchID = Tourney_Matches.MatchID
	WHERE Match_Games.MatchID is NOT NULL) AS PlayedMatches
ON PlayedMatches.TourneyID = Tournaments.TourneyID