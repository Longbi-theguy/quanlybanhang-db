--sp_GetCustomerOrderHistory
IF OBJECT_ID('dbo.sp_GetCustomerOrderHistory', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_GetCustomerOrderHistory;
GO

CREATE PROCEDURE dbo.sp_GetCustomerOrderHistory
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        c.CustomerID,
        c.FullName,
        o.OrderID,
        o.OrderDate,
        CASE o.Status
            WHEN 0 THEN N'Đang chờ xử lý'
            WHEN 1 THEN N'Đang giao hàng'
            WHEN 2 THEN N'Hoàn thành'
            WHEN 3 THEN N'Đã hủy'
        END AS StatusDescription,
        p.ProductName,
        od.Quantity,
        od.UnitPrice,
        (od.Quantity * od.UnitPrice) AS LineTotal
    FROM dbo.Customers c
    INNER JOIN dbo.Orders o ON c.CustomerID = o.CustomerID
    INNER JOIN dbo.OrderDetails od ON o.OrderID = od.OrderID
    INNER JOIN dbo.Products p ON od.ProductID = p.ProductID
    WHERE c.CustomerID = @CustomerID
    ORDER BY o.OrderDate DESC;
END;
GO
