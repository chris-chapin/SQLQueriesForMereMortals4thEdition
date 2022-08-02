-- Show me each vendor and the average by vendor of the number of days to deliver products that are greater than the average delivery days for all vendors.
SELECT Vendors.VendName, AVG(Product_Vendors.DaysToDeliver) AS AverageDaysToDeliver
FROM Vendors
INNER JOIN Product_Vendors ON Product_Vendors.VendorID = Vendors.VendorID
GROUP BY Vendors.VendName
HAVING AVG(Product_Vendors.DaysToDeliver) > (SELECT AVG(Product_Vendors.DaysToDeliver) FROM Product_Vendors)

-- Display for each product the product name and the total sales that is greater than the average of sales for all products in that category.
SELECT Products.ProductName, SUM(Order_Details.QuantityOrdered * Order_Details.QuotedPrice) AS TotalProductSales
FROM Products
INNER JOIN Order_Details ON Order_Details.ProductNumber = Products.ProductNumber
GROUP BY Products.ProductName, Products.CategoryID
HAVING SUM(Order_Details.QuantityOrdered * Order_Details.QuotedPrice) > (
	SELECT AVG(A.SumCategory) AS AverageSalePerCategory
	FROM (
		SELECT P2.CategoryID, SUM(OD2.QuantityOrdered * OD2.QuotedPrice) AS SumCategory
		FROM Products AS P2
		INNER JOIN Order_Details AS OD2 ON OD2.ProductNumber = P2.ProductNumber
		GROUP BY P2.CategoryID, P2.ProductNumber) AS A
	WHERE Products.CategoryID = A.CategoryID
	GROUP BY A.CategoryID)

-- How many orders are for only one product?
SELECT COUNT(*) AS SingleItemOrderCount
FROM (
	SELECT Order_Details.OrderNumber
	FROM Order_Details
	GROUP BY Order_Details.OrderNumber
	HAVING COUNT(*) = 1) AS A
