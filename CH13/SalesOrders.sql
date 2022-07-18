-- Show me each vendor and the average by vendor of the number of days to deliver products.
SELECT VendName, AVG(DaysToDeliver) AS AverageDaysToDeliver
FROM Vendors
INNER JOIN Product_Vendors ON Product_Vendors.VendorID = Vendors.VendorID
GROUP BY VendName

-- Display for each product the product name and the total sales.
SELECT ProductName, SUM(QuotedPrice * QuantityOrdered) AS TotalSales
FROM Products
INNER JOIN Order_Details ON Order_Details.ProductNumber = Products.ProductNumber
GROUP BY ProductName

-- List all vendors and the count of products sold by each.
SELECT VendName, COUNT(ProductNumber) AS ProductsSold
FROM Vendors
INNER JOIN Product_Vendors ON Product_Vendors.VendorID = Vendors.VendorID
GROUP BY VendName
ORDER BY VendName

-- Challenge: solve #3 with a subquery
SELECT VendName, (SELECT COUNT(ProductNumber) FROM Product_Vendors WHERE Product_Vendors.VendorID = Vendors.VendorID) AS ProductsSold
FROM Vendors
ORDER BY VendName