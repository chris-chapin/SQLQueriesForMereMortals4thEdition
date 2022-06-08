-- "Display agents and the engagement dates they booked, sorted by booking start date."
SELECT Agents.AgentID, Engagements.StartDate, Engagements.EndDate
FROM Agents
INNER JOIN Engagements ON Agents.AgentID = Engagements.AgentID
ORDER BY Engagements.StartDate

-- "List customers and the entertainers they booked."
SELECT DISTINCT Customers.CustomerID, Entertainers.EntertainerID
FROM (Customers
INNER JOIN Engagements ON Customers.CustomerID = Engagements.CustomerID)
INNER JOIN Entertainers ON Engagements.EntertainerID = Entertainers.EntertainerID

-- "Find the agents and entertainers who live in the same postal code."
SELECT AgentID, EntertainerID, AgtZipCode AS SharedZip
FROM (SELECT AgentID, AgtZipCode FROM Agents) AS Agt
INNER JOIN (SELECT EntertainerID, EntZipCode FROM Entertainers) AS Ent
ON AgtZipCode = EntZipCode