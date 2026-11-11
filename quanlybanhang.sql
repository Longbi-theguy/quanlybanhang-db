-- 1. Khởi tạo Database
IF DB_ID('QuanLyBanHang') IS NULL
BEGIN
    CREATE DATABASE QuanLyBanHang;
END
GO

USE QuanLyBanHang;
GO

-- 2. Dọn dẹp bảng cũ nếu đã tồn tại (Xóa theo thứ tự phụ thuộc)
IF OBJECT_ID('dbo.OrderDetails', 'U') IS NOT NULL DROP TABLE dbo.OrderDetails;
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL DROP TABLE dbo.Products;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
GO

-- 3. Tạo bảng Customers
CREATE TABLE dbo.Customers (
    CustomerID INT IDENTITY(1,1) CONSTRAINT PK_Customers PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL CONSTRAINT UQ_Customers_Email UNIQUE,
    Phone VARCHAR(15) NULL,
    Address NVARCHAR(255) NULL
);
GO

-- 4. Tạo bảng Products
CREATE TABLE dbo.Products (
    ProductID INT IDENTITY(1,1) CONSTRAINT PK_Products PRIMARY KEY,
    ProductName NVARCHAR(150) NOT NULL,
    Price DECIMAL(18,2) NOT NULL CONSTRAINT CHK_Products_Price CHECK (Price >= 0),
    StockQuantity INT NOT NULL CONSTRAINT CHK_Products_Stock CHECK (StockQuantity >= 0)
);
GO

-- 5. Tạo bảng Orders
CREATE TABLE dbo.Orders (
    OrderID INT IDENTITY(1,1) CONSTRAINT PK_Orders PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL CONSTRAINT DF_Orders_OrderDate DEFAULT GETDATE(),
    Status TINYINT NOT NULL CONSTRAINT DF_Orders_Status DEFAULT 0,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID),
    CONSTRAINT CHK_Orders_Status CHECK (Status IN (0, 1, 2, 3)) -- 0: Pending, 1: Processing, 2: Completed, 3: Cancelled
);
GO

-- 6. Tạo bảng OrderDetails
CREATE TABLE dbo.OrderDetails (
    OrderDetailID INT IDENTITY(1,1) CONSTRAINT PK_OrderDetails PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CONSTRAINT CHK_OrderDetails_Quantity CHECK (Quantity > 0),
    UnitPrice DECIMAL(18,2) NOT NULL CONSTRAINT CHK_OrderDetails_UnitPrice CHECK (UnitPrice >= 0),
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES dbo.Orders(OrderID) ON DELETE CASCADE,
    CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID)
);
GO

-- Thêm dữ liệu Khách hàng
INSERT INTO dbo.Customers (FullName, Email, Phone, Address) VALUES
(N'Nguyễn Văn An', 'an.nguyen@example.com', '0901234567', N'123 Lê Lợi, Quận 1, TP.HCM'),
(N'Trần Thị Bích', 'bich.tran@example.com', '0912345678', N'456 Nguyễn Huệ, Quận 1, TP.HCM'),
(N'Lê Hoàng Cường', 'cuong.le@example.com', '0923456789', N'789 Cách Mạng Tháng 8, Quận 3, TP.HCM'),
(N'Phạm Minh Dung', 'dung.pham@example.com', '0934567890', N'101 Hoàng Văn Thụ, Tân Bình, TP.HCM'),
(N'Hoàng Anh Tuấn', 'tuan.hoang@example.com', '0945678901', N'202 Võ Thị Sáu, Quận 3, TP.HCM');

-- Thêm dữ liệu Sản phẩm
INSERT INTO dbo.Products (ProductName, Price, StockQuantity) VALUES
(N'Laptop Dell XPS 13', 35000000.00, 15),
(N'iPhone 15 Pro Max', 32000000.00, 30),
(N'Bàn phím cơ Keychron K2', 2200000.00, 50),
(N'Chuột Logitech MX Master 3S', 2500000.00, 40),
(N'Màn hình Dell UltraSharp U2723QE', 12500000.00, 0), -- Hết hàng
(N'Tai nghe Sony WH-1000XM5', 8490000.00, 20);

-- Thêm dữ liệu Đơn hàng
INSERT INTO dbo.Orders (CustomerID, OrderDate, Status) VALUES
(1, '2024-01-15 10:30:00', 2), -- Completed
(1, '2024-02-10 14:20:00', 2), -- Completed
(2, '2024-02-12 09:15:00', 1), -- Processing
(3, '2024-02-15 16:45:00', 0), -- Pending
(4, '2024-02-18 11:00:00', 3), -- Cancelled
(1, '2024-02-20 08:30:00', 2); -- Completed

-- Thêm dữ liệu Chi tiết đơn hàng
INSERT INTO dbo.OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 35000000.00), -- Đơn 1: 1 Laptop Dell
(1, 4, 1, 2500000.00),  -- Đơn 1: 1 Chuột Logitech
(2, 2, 1, 32000000.00), -- Đơn 2: 1 iPhone 15
(3, 3, 2, 2200000.00),  -- Đơn 3: 2 Bàn phím
(4, 6, 1, 8490000.00),  -- Đơn 4: 1 Tai nghe
(5, 1, 1, 35000000.00), -- Đơn 5: 1 Laptop (Đã hủy)
(6, 3, 1, 2200000.00),  -- Đơn 6: 1 Bàn phím
(6, 4, 2, 2500000.00);  -- Đơn 6: 2 Chuột Logitech
GO