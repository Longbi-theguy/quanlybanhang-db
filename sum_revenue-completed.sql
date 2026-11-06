--Tính tổng doanh thu của từng sản phẩm, chỉ tính đơn Completed
SELECT p.ProductID, p.ProductName, SUM(od.Quantity * od.UnitPrice) AS Sum_Revenue_completed
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.Status = 'Completed'
GROUP BY p.ProductID, p.ProductName;