--Summary_Customer_Order_Counts
SELECT 
    c.CustomerID,
    c.FullName,
    COUNT(o.OrderID) AS TotalOrders
FROM dbo.Customers c
LEFT JOIN dbo.Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FullName
ORDER BY TotalOrders DESC;
