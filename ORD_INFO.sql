--Report_Order_Customer_Details
SELECT 
    o.OrderID,
    o.OrderDate,
    c.FullName,
    c.Email,
    c.Phone,
    c.Address,
    o.Status
FROM dbo.Orders AS o
INNER JOIN dbo.Customers AS c 
    ON o.CustomerID = c.CustomerID;
