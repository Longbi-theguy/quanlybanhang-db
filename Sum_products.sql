--Tính tổng tiền từng đơn hàng bằng SUM(Quantity * UnitPrice).
SELECT OrderID, SUM(Quantity * UnitPrice) AS TotalAmount
FROM OrderDetails
GROUP BY OrderID;