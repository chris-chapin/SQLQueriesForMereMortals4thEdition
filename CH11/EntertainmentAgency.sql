-- "Show me all entertainers and the count of each entertainer's engagements."

SELECT Entertainers.EntStageName, (SELECT COUNT(*) FROM Engagements WHERE Engagements.EntertainerID = Entertainers.EntertainerID) AS EngagementCount
FROM Entertainers

-- "List customers who have booked entertainers who play country or country rock."

SELECT DISTINCT Customers.CustomerID
FROM Customers
WHERE CustomerID IN (
	SELECT Engagements.CustomerID
	FROM Engagements
	INNER JOIN Entertainer_Styles ON Entertainer_Styles.EntertainerID = Engagements.EntertainerID
	WHERE Entertainer_Styles.StyleID = 6 OR Entertainer_Styles.StyleID = 11)
