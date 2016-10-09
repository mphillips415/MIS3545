use AdventureWorks2012;

/* 3a */

Select Name, ProductNumber, ListPrice 
 From Production.Product
 Where ListPrice > 500
 Order By ListPrice ASC;



/* 3b */


Select ST.Name, SUM(SO.TotalDue) as Total_Sales_In_August
 From Sales.SalesTerritory as ST
 Join Sales.SalesOrderHeader as SO
 ON ST.TerritoryID = SO.TerritoryID
 Where YEAR(SO.OrderDate) = 2007 and MONTH(SO.OrderDate) = 8      /*Where SO.OrderDate Between '2007-08-01' AND '2007-08-31' */
 Group By ST.Name
 Order By St.Name

 /* 3c */

Select V.Name, Count(Pv.ProductID) as Number_Of_Products_Supplied
 From Purchasing.Vendor as V
 Join Purchasing.ProductVendor as PV
 ON V.BusinessEntityID = PV.BusinessEntityID
 Group By V.Name
 Having COUNT(PV.ProductID) > 3
 Order By COUNT(PV.ProductID) DESC;