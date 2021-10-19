use WideWorldImporters
go
CREATE FUNCTION dbo.ufn_SalesByCustomer (@customerid int)  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT P.StockItemID, P.StockItemName, SUM(OL.Quantity) AS 'Total'  
    FROM Warehouse.StockItems AS P   
    JOIN Sales.OrderLines AS OL ON OL.StockItemID = P.StockItemID  
    JOIN Sales.Orders AS SO ON SO.OrderID = OL.OrderID  
    JOIN Sales.Customers AS C ON SO.CustomerID = C.CustomerID  
    WHERE SO.CustomerID = @customerid  
    GROUP BY P.StockItemID, P.StockItemName  
);  
GO 