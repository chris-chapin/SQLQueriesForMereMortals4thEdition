-- "Show me customers who have never ordered a helmet."

SELECT (Customers.CustFirstName + ' ' + Customers.CustLastName) AS Customer
FROM Customers
LEFT OUTER JOIN (
	SELECT Orders.CustomerID, Orders.OrderNumber, Products.ProductName
	FROM ((Orders
		INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber)
		INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber)
	WHERE Products.ProductName LIKE '%Helmet%') AS HelmetOrders
ON HelmetOrders.CustomerID = Customers.CustomerID
WHERE HelmetOrders.ProductName is NULL

-- "Display customers who have no sales rep in the same ZIP Code."

SELECT (Customers.CustFirstName + ' ' + Customers.CustLastName) AS Customer
FROM Customers
LEFT OUTER JOIN Employees ON Employees.EmpZipCode = Customers.CustZipCode
WHERE Employees.EmpZipCode is NULL

-- "List all products and the dates for any orders."

SELECT ProductName, OrdersDetails.OrderDate
FROM Products
LEFT OUTER JOIN (
	SELECT DISTINCT Orders.OrderDate, Order_Details.ProductNumber
	FROM Orders
	INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber) AS OrdersDetails
ON OrdersDetails.ProductNumber = Products.ProductNumber