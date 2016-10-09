Use AdventureWorks2012

/* a */

Select HE.JobTitle, P.FirstName, P.LastName
From HumanResources.Employee AS HE
Join Person.Person As P
On HE.BusinessEntityID = P.BusinessEntityID
Where He.JobTitle = 'Sales Representative'



/* b */

Select SUM(SOD.LineTotal) as Total_Sold, PP.Name, PP.ProductID
From Production.Product as PP
Join Sales.SalesOrderDetail as SOD
On PP.ProductID = SOD.ProductID
Group By PP.ProductID, PP.Name
Having Sum(LineTotal) > 5000


/* c */

Select ST.Name, SP.SalesYTD, SP.BusinessEntityID
From Sales.SalesPerson as SP
Join Sales.SalesTerritory as ST
ON SP.TerritoryID = ST.TerritoryID
Where SP.SalesYTD > 500000


/* d */


Select SalesOrderID, TotalDue, OrderDate
 From Sales.SalesOrderHeader
 Where TotalDue > 
	(Select AVG(TotalDue) as Average_Total_Due
	From Sales.SalesOrderHeader)
Order By TotalDue;
Having Year(OrderDate) = 2008


