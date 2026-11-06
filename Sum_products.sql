--Tính toán tổng giá trị thanh toán của từng hóa đơn mua hàng bằng cách nhân số lượng sản phẩm
--với đơn giá tương ứng rồi cộng dồn lại.

SELECT OrderID, SUM(Quantity * UnitPrice) AS TotalAmount
FROM OrderDetails
GROUP BY OrderID;

