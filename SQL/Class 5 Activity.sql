/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 s.[SalesOrderID]
      ,s.[OrderQty]
      ,s.[ProductID]
	  ,p.[Name]
      ,s.[UnitPrice]
      ,s.[LineTotal]
  FROM [AdventureWorks2012].[Sales].[SalesOrderDetail] AS s,
  [AdventureWorks2012].[Production].[Product] AS p
  WHERE s.[ProductID]=p.[ProductID]