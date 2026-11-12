-- Filter_High_Value_Products
SELECT 
    ProductID,
    ProductName,
    Price,
    StockQuantity
FROM dbo.Products
WHERE Price > 1000000.00
ORDER BY Price DESC;