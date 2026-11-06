--Thống kê doanh thu theo tháng, chỉ tính đơn Completed.
SELECT 
    YEAR(o.OrderDate) AS OrderYear,
    MONTH(o.OrderDate) AS OrderMonth,
    SUM(od.Quantity * od.UnitPrice) AS MonthlyRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE o.Status = 'Completed'
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY OrderYear, OrderMonth;
--liên kết Orders và OrderDetails qua quan hệ 1 - Nhiều (1:N) (OrderID) để tính tổng doanh thu theo tháng.