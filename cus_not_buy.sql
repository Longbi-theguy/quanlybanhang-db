-- List_Inactive_Customers
SELECT 
    c.CustomerID,
    c.FullName,
    c.Email,
    c.Phone
FROM dbo.Customers c
LEFT JOIN dbo.Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;
