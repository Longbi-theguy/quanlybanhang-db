SELECT TOP 3 c.CustomerID, c.CustomerName, SUM(od.Quantity * od.UnitPrice) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE o.Status = 'Completed'
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalSpent DESC;