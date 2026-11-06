
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'QuanLyBanHang')
BEGIN
    CREATE DATABASE QuanLyBanHang;
END
GO

USE QuanLyBanHang;
GO

IF OBJECT_ID('OrderDetails', 'U') IS NOT NULL DROP TABLE OrderDetails;
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID('Products', 'U') IS NOT NULL DROP TABLE Products;
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE Customers;
GO

-- 3. Tạo lại bảng Customers
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Phone VARCHAR(20),
    City NVARCHAR(50)
);

-- 4. Tạo lại bảng Products
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Price DECIMAL(18, 2) NOT NULL,
    Stock INT NOT NULL
);

-- 5. Tạo lại bảng Orders
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE NOT NULL,
    Status VARCHAR(50) NOT NULL -- 'Completed', 'Pending', 'Cancelled'
);

-- 6. Tạo lại bảng OrderDetails
CREATE TABLE OrderDetails (
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18, 2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID)
);
GO

-- 7. Thêm dữ liệu mẫu
INSERT INTO Customers (CustomerName, Email, Phone, City) VALUES
(N'Nguyễn Văn A', 'a@gmail.com', '0901111111', N'Hà Nội'),
(N'Trần Thị B', 'b@gmail.com', '0902222222', N'Hồ Chí Minh'),
(N'Lê Văn C', 'c@gmail.com', '0903333333', N'Đà Nẵng'),
(N'Phạm Thị D', 'd@gmail.com', '0904444444', N'Cần Thơ'),
(N'Hoàng Văn E', 'e@gmail.com', '0905555555', N'Hải Phòng');

INSERT INTO Products (ProductName, Price, Stock) VALUES
(N'Laptop Dell XPS', 25000000.00, 10),
(N'iPhone 15 Pro', 28000000.00, 15),
(N'Tai nghe Bluetooth', 850000.00, 50),
(N'Bàn phím cơ', 1500000.00, 30),
(N'Chuột không dây', 450000.00, 100);

INSERT INTO Orders (CustomerID, OrderDate, Status) VALUES
(1, '2026-05-01', 'Completed'),
(1, '2026-05-05', 'Pending'),
(2, '2026-05-03', 'Completed'),
(3, '2026-05-04', 'Cancelled'),
(4, '2026-05-06', 'Completed');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 25000000.00),
(1, 3, 2, 850000.00),
(2, 2, 1, 28000000.00),
(3, 2, 1, 28000000.00),
(3, 4, 2, 1500000.00),
(5, 4, 1, 1500000.00);
GO