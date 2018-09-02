USE AdventureWorks2012
GO

-- This stored proc gets sales data for Q1 of 2006
EXEC Sales.Sp_GetSalesData_PerYear '2006-01-01', '2006-03-31'