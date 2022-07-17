-- What is the average retail price of a mountain bike?
SELECT AVG(RetailPrice) AS AverageMountainBikePrice
FROM Products
WHERE ProductName LIKE '%Mountain Bike%'

-- What was the date of our most recent order?
SELECT MAX(OrderDate) AS MostRecentOrderDate
FROM Orders

-- What was the total amount for order number 8?
SELECT SUM(QuotedPrice * QuantityOrdered) AS OrderTotal
FROM Order_Details
WHERE OrderNumber=8