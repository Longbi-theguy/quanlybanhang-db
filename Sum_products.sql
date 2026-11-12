--Calculate_Total_Amount_Per_Order
SELECT 
    od.OrderID,
    SUM(od.Quantity * od.UnitPrice) AS TotalAmount
FROM dbo.OrderDetails AS od
GROUP BY 
    od.OrderID;