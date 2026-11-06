--Hiển thị mã đơn hàng, tên khách hàng, ngày đặt hàng và trạng thái
SELECT o.OrderID, c.CustomerName, o.OrderDate, o.Status
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;