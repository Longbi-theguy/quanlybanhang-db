--Get_Completed_Orders
SELECT 
    o.OrderID,
    c.FullName AS CustomerName,
    o.OrderDate,
    o.Status
FROM dbo.Orders o
INNER JOIN dbo.Customers c ON o.CustomerID = c.CustomerID
WHERE o.Status = 2
ORDER BY o.OrderDate DESC;
