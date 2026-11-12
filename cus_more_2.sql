--List_Loyal_Customers
SELECT 
    c.CustomerID,
    c.FullName,
    COUNT(o.OrderID) AS CompletedOrdersCount
FROM dbo.Customers c
INNER JOIN dbo.Orders o ON c.CustomerID = o.CustomerID
WHERE o.Status = 2
GROUP BY c.CustomerID, c.FullName
HAVING COUNT(o.OrderID) >= 2;
