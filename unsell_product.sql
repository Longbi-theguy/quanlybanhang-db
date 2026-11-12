--List_Unsold_Products
SELECT 
    p.ProductID,
    p.ProductName,
    p.Price,
    p.StockQuantity
FROM dbo.Products p
LEFT JOIN dbo.OrderDetails od ON p.ProductID = od.ProductID
LEFT JOIN dbo.Orders o ON od.OrderID = o.OrderID AND o.Status = 2
WHERE od.OrderDetailID IS NULL;
