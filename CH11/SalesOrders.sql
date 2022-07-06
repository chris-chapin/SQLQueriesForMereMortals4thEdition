-- "Display products and the latest date each product was ordered."
SELECT
	Products.ProductName,
	(SELECT MAX(Orders.OrderDate)
	FROM Orders
	INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
	WHERE Order_Details.ProductNumber = Products.ProductNumber) AS LastOrdered
FROM Products

-- "List customers who ordered bikes."

SELECT Customers.CustomerID, (Customers.CustFirstName + ' ' + Customers.CustLastName) AS CustomerName
FROM Customers
WHERE (Customers.CustomerID IN
	(SELECT Orders.CustomerID
	FROM Orders
	INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
	INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
	WHERE Products.ProductName LIKE '%Bike'))
ORDER BY CustomerId

-- "What products have never been ordered?"

SELECT Products.ProductName
FROM Products
WHERE Products.ProductName NOT IN 
	(SELECT Products.ProductName
	FROM Orders
	INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
	WHERE Order_Details.ProductNumber = Products.ProductNumber)