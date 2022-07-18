-- Show each agent's name, the sum of the contract price for the engagements booked, and the agent's total commission.
SELECT Agents.AgtLastName, Agents.AgtFirstName, SUM(ContractPrice) AS ContractPriceSum, CONVERT(money, SUM(ContractPrice * CommissionRate)) AS TotalCommision
FROM Agents
INNER JOIN Engagements ON Engagements.AgentID = Agents.AgentID
GROUP BY AgtLastName, AgtFirstName
