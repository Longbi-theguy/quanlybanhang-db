--Thống kê số lượng đơn hàng của từng khách hàng, kể cả khách chưa đặt hàng
SELECT c.CustomerID, c.CustomerName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;
--Mối quan hệ: Giữa Customers và Orders là quan hệ 1 - Nhiều (1:N) 
--(1 khách hàng có nhiều đơn hàng, 1 đơn hàng thuộc về 1 khách hàng qua CustomerID).
--Ý nghĩa phép LEFT JOIN: Lấy tất cả khách hàng kể cả người chưa đặt hàng nào.