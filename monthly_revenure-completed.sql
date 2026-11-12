-- Monthly_Revenue_Report
SELECT 
    YEAR(o.OrderDate) AS [Year],
    MONTH(o.OrderDate) AS [Month],
    SUM(od.Quantity * od.UnitPrice) AS MonthlyRevenue
FROM dbo.Orders o
INNER JOIN dbo.OrderDetails od ON o.OrderID = od.OrderID
WHERE o.Status = 2
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY [Year] DESC, [Month] DESC;
