--Top_3_VIP_Customers
SELECT TOP 3
    c.CustomerID,
    c.FullName,
    SUM(od.Quantity * od.UnitPrice) AS TotalSpent
FROM dbo.Customers c
INNER JOIN dbo.Orders o ON c.CustomerID = o.CustomerID
INNER JOIN dbo.OrderDetails od ON o.OrderID = od.OrderID
WHERE o.Status = 2
GROUP BY c.CustomerID, c.FullName
ORDER BY TotalSpent DESC;
