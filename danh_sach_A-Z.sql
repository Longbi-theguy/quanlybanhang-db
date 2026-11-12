-- List_All_Customers_AZ
SELECT 
    CustomerID,
    FullName,
    Email,
    Phone,
    Address
FROM dbo.Customers
ORDER BY FullName ASC;
