/******************************************************
This script will create a stored procedure to 
be used for pulling sales data using date paramters.

Just run the stored procedure like so to populate data:
	EXEC Sales.Sp_GetSalesData_PerYear @Begin_Date, @End_Date

*****************************************************/
USE AdventureWorks2012
GO

-- Stored proc to get sales data, parameter for the beign and end dates
CREATE PROCEDURE Sales.sp_GetSalesData_PerYear 
	@Begin_Date DATETIME, 
	@End_Date   DATETIME
AS
SELECT soh.SalesOrderID, 
	soh.OrderDate, 
	soh.ShipDate, 
	p.Name, 
	sod.OrderQty, 
	sod.UnitPrice, 
	sod.UnitPriceDiscount, 
	sod.LineTotal
FROM sales.SalesOrderHeader AS soh
	INNER JOIN sales.SalesOrderDetail AS sod 
		ON soh.SalesOrderID = sod.SalesOrderID
	INNER JOIN Production.Product AS p 
		ON p.ProductID = sod.ProductID
WHERE soh.OrderDate >= @Begin_Date
    AND soh.OrderDate <= @End_Date

--Getting the top 10 just to see which columns I need
--select top 10 * from Sales.SalesOrderHeader

--Getting the top 10 just to see which columns I need
--select top 10 * from Sales.SalesOrderDetail

