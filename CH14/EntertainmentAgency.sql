-- Show me the entertainers who have more than two overlapped bookings.
SELECT Entertainers.EntertainerID, Entertainers.EntStageName
FROM Entertainers
WHERE Entertainers.EntertainerID IN (
	SELECT E1.EntertainerID
	FROM Engagements AS E1
	INNER JOIN Engagements AS E2 ON E1.EntertainerID = E2.EntertainerID AND E1.EngagementNumber <> E2.EngagementNumber AND E1.StartDate <= E2.EndDate AND E1.EndDate >= E2.StartDate
	GROUP BY E1.EntertainerID
	HAVING COUNT(*) > 2)

-- Show each agent's name, the sum of the contract price for the engagements booked, and the agent's total commission for agents whose total commission is more than $1,000.
SELECT Agents.AgtFirstName, Agents.AgtLastName, SUM(Engagements.ContractPrice) AS TotalContractPrice, CONVERT(money, SUM(Engagements.ContractPrice) * Agents.CommissionRate) AS TotalCommission
FROM Agents
INNER JOIN Engagements ON Engagements.AgentID = Agents.AgentID
GROUP BY Agents.AgtFirstName, Agents.AgtLastName, Agents.CommissionRate
HAVING SUM(Engagements.ContractPrice * Agents.CommissionRate) > 1000
