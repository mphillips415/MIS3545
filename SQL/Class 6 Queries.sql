use AdventureWorks2012;

/*Using the HumanResource.Employee table, provide a count of the number of employees by job title.  
The query should consider only current employees (the CurrentFlag must equal 1).  
Copy the SQL you used to create this query into a Word document. 

*/

/* Activity 1 */

/*Using the HumanResource.Employee table, provide a count of the number of employees by job title.  
The query should consider only current employees (the CurrentFlag must equal 1).  */

Select JobTitle, COUNT (BusinessEntityID) AS Number
From HumanResources.Employee
Where CurrentFlag = 1
Group By JobTitle


/* Activity 2 */

/*Modify the query you created in Activity 1 so that the output shows only those job titles for which there is 
more than 1 employee.  
Copy the SQL you used to create this query and append it to the Word document you created for Activity 1. 
*/

Select JobTitle, COUNT (BusinessEntityID) AS Number
From HumanResources.Employee
Where CurrentFlag = 1
Group By JobTitle
Having Count([JobTitle]) > 1
Order By Count(BusinessEntityID) DESC


/*In PPT */

Select s.SalesOrderID,
s.OrderQty,
s.UnitPrice,
s.LineTotal,
p.Name
From Sales.salesOrderDetail as s, Production.product as p
Where s.ProductID=p.ProductID


/* Activity 3 */

/*For each product, show its ProductID and Name (from the ProductionProduct table) and the location of its inventory (
from the Product.Location table) and amount of inventory held at that location (from the Production.ProductInventory table). 

*/

Select pp.ProductID, pp.Name as Product_Name, PL.Name as Location, i.Quantity
From Production.Product as pp
Join Production.ProductInventory as i
ON pp.ProductID = i.ProductID
Join Production.Location as pl
ON pl.LocationID = i.LocationID;


/* Activity 4 */

/* Find the product model IDs that have no product associated with them.  
To do this, first do an outer join between the Production.Product table and the Production.ProductModel table in such a way 
that the ID from the ProductModel table always shows, even if there is no product associate with it.  
Then, add a WHERE clause to specify that the ProductID IS NULL 

*/

Select ppm.ProductModelID, pp.ProductID
 From Production.Product as pp
 Right Outer Join Production.ProductModel as ppm
 ON pp.ProductModelID = ppm.ProductModelID
 Where ProductID IS NULL
