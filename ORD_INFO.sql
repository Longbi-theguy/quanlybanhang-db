--Hiển thị mã đơn hàng, tên khách hàng, ngày đặt hàng và trạng thái

SELECT o.OrderID, c.CustomerName, o.OrderDate, o.Status
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

--Kết nối bảng Orders và Customers để chuyển đổi mã khách hàng vô tri 
--thành tên khách hàng cụ thể trên giao diện báo cáo đơn hàng