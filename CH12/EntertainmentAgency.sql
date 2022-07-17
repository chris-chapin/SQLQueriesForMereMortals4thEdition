-- What is the average salary of a booking agent?
SELECT AVG(Salary) AS AverageBookingAgentSalary
FROM Agents

-- Show me the engagement numbers for all engagements that have a contract price greater than or equal to the overall average contract price.
SELECT EngagementNumber
FROM Engagements
WHERE ContractPrice >= (SELECT AVG(ContractPrice) FROM Engagements)

-- How many entertainers are based in Bellevue?
SELECT COUNT(*) EntertainersInBellevue
FROM Entertainers
WHERE EntCity='Bellevue'

-- Which engagements occur earliest in October 2017?
SELECT EngagementNumber, StartDate
FROM Engagements
WHERE StartDate = (SELECT MIN(StartDate) FROM Engagements WHERE StartDate BETWEEN '2017-10-1' AND '2017-10-31')
