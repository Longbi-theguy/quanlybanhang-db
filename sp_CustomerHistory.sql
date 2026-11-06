--Mục đích: Tạo Stored Procedure (sp_GetCustomerOrderHistory) để tra cứu nhanh 
--lịch sử mua hàng và tổng tiền từng đơn theo CustomerID.
CREATE PROCEDURE sp_GetCustomerOrderHistory
    @CustID INT
AS
BEGIN
    SELECT 
        o.OrderID,
        o.OrderDate,
        o.Status,
        SUM(od.Quantity * od.UnitPrice) AS OrderTotal
    FROM Orders o
    LEFT JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.CustomerID = @CustID
    GROUP BY o.OrderID, o.OrderDate, o.Status;
END;
GO
--Liên kết Orders (1) với OrderDetails (N) qua OrderID.
--Logic xử lý: Dùng LEFT JOIN để quét toàn bộ đơn hàng thuộc về CustomerID được truyền vào 
-- -> Gom nhóm theo đơn (GROUP BY) -> Tính tổng tiền từng hóa đơn.