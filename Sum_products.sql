SELECT OrderID, SUM(Quantity * UnitPrice) AS TotalAmount
FROM OrderDetails
GROUP BY OrderID;