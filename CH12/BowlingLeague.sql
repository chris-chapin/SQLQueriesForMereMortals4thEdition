-- What is the largest handicap held by any bowler at the current time?
-- There is some domain calculation here that I don't want to bother understanding since I'm not a bowler
SELECT MAX(HandiCapScore) AS LargestHandicap
FROM Bowler_Scores

-- Which locations hosted tournaments on the earliest tournament date?
SELECT TourneyLocation
FROM Tournaments
WHERE TourneyDate = (SELECT MIN(TourneyDate) FROM Tournaments)

-- What is the last tournament date we have on our schedule?
SELECT MAX(TourneyDate)
FROM Tournaments