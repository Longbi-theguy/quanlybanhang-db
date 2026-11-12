-- Total_Revenue_By_Product
SELECT 
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM dbo.Products p
INNER JOIN dbo.OrderDetails od ON p.ProductID = od.ProductID
INNER JOIN dbo.Orders o ON od.OrderID = o.OrderID
WHERE o.Status = 2
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalRevenue DESC;
