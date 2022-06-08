-- "List customers and the dates they placed an order, sorted in order date sequence."
SELECT Customers.CustomerID, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
ORDER BY OrderDate

-- "List employees and the customers for whom they booked an order."
SELECT DISTINCT Employees.EmployeeID, Orders.CustomerID
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID

-- "Display all orders, the products in each order, and the amount owed for each product, in order number sequence."
SELECT Orders.OrderNumber, Order_Details.ProductNumber, Products.RetailPrice
FROM (Orders
INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber)
INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
ORDER BY OrderNumber

-- "Show me the vendors and the products they supply to us for products that cost less than $100."
SELECT Vendors.VendorID, Product_Vendors.ProductNumber
FROM Vendors
INNER JOIN Product_Vendors ON Product_Vendors.VendorID = Vendors.VendorID
WHERE Product_Vendors.WholesalePrice < 100

-- "Show me customers and employees who have the same last name."
SELECT
(CustomerNames.CustFirstName + ' ' + CustomerNames.CustLastName) AS Customer,
(EmployeeNames.EmpFirstName + ' ' + EmployeeNames.EmpLastName) AS Employees
FROM (SELECT CustFirstName, CustLastName FROM Customers) AS CustomerNames
INNER JOIN (SELECT EmpFirstName, EmpLastName FROM Employees) AS EmployeeNames
ON EmployeeNames.EmpLastName = CustomerNames.CustLastName

-- "Show me customers and employees who live in the same city."
SELECT
(CustomerNames.CustFirstName + ' ' + CustomerNames.CustLastName) AS Customer,
(EmployeeNames.EmpFirstName + ' ' + EmployeeNames.EmpLastName) AS Employees,
CustomerNames.CustCity AS SharedCity
FROM (SELECT CustFirstName, CustLastName, CustCity FROM Customers) AS CustomerNames
INNER JOIN (SELECT EmpFirstName, EmpLastName, EmpCity FROM Employees) AS EmployeeNames
ON EmployeeNames.EmpCity = CustomerNames.CustCity