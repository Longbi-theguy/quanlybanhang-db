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

