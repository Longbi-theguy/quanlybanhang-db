--Tìm khách hàng chưa từng phát sinh đơn hàng.
SELECT * 
FROM Customers 
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);