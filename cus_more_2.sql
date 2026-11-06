--tìm khách hàng có từ 2 đơn hàng trở lên.
SELECT c.CustomerID, c.CustomerName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) >= 2;
--Mối quan hệ: Customers và Orders liên kết theo chiều 1 - Nhiều (1:N) qua CustomerID.