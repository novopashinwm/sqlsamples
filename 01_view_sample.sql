use WideWorldImporters
go
DROP VIEW IF EXISTS Website.CustomerDelivery;
Go 

CREATE VIEW Website.CustomerDelivery 
AS
SELECT s.CustomerID,
       s.CustomerName,      
       s.PhoneNumber,
       s.FaxNumber,       
       s.WebsiteURL,       
       c.CityName AS CityName,
       s.DeliveryLocation AS DeliveryLocation,
       s.DeliveryRun,
       s.RunPosition
FROM Sales.Customers AS s
	LEFT OUTER JOIN [Application].Cities AS c
	ON s.DeliveryCityID = c.CityID

GO

SELECT *
FROM Website.CustomerDelivery;