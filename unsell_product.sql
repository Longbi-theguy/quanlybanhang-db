SELECT * 
FROM Products 
WHERE ProductID NOT IN (SELECT DISTINCT ProductID FROM OrderDetails);