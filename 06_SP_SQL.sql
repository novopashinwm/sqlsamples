USE WideWorldImporters;  
GO  
IF OBJECT_ID ( 'Student.uspCustomerAllInfo', 'P' ) IS NOT NULL   
    DROP PROCEDURE Student.uspCustomerAllInfo;  
GO  
CREATE PROCEDURE Student.uspCustomerAllInfo  
WITH EXECUTE AS CALLER --выполняются от имени вызывающей стороны родительской процедуры 
AS  
    SET NOCOUNT ON;  
    SELECT c.CustomerName AS Customer, ol.StockItemID AS 'Product id'  
    FROM Sales.Customers AS c   
    JOIN Sales.Orders AS so   
      ON so.CustomerID = c.CustomerID   
    JOIN Sales.OrderLines AS ol   
      ON ol.OrderID = ol.OrderID  
    ORDER BY c.CustomerName ASC;   
GO    