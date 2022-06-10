-- "Display agents who haven't booked an entertainer."

SELECT (Agents.AgtFirstName + ' ' + Agents.AgtLastName) AS AgentName
FROM Agents
LEFT OUTER JOIN Engagements ON Engagements.AgentID = Agents.AgentID
WHERE Engagements.EntertainerID is NULL

-- "List customers with no bookings."

SELECT (Customers.CustFirstName + ' ' + Customers.CustLastName) AS CustumerName
FROM Customers
LEFT OUTER JOIN Engagements ON Engagements.CustomerID = Customers.CustomerID
WHERE Engagements.EntertainerID is NULL

-- "List all entertainers and any engagements they have booked."

SELECT Entertainers.EntStageName, Engagements.EngagementNumber
FROM Entertainers
LEFT OUTER JOIN Engagements ON Engagements.EntertainerID = Entertainers.EntertainerID