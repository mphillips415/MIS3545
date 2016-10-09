USE AdventureWorks2012;

/*1, Display the total amount collected from the orders for each order date. */

Select OrderDate, SUM(TotalDue) as DailyAmount, COUNT(SalesOrderID) AS Number_of_Orders
 From Sales.SalesOrderHeader
 Group By OrderDate
 Order By Sum(TotalDue) DESC;



/*2, Display the total amount collected from selling the products, 774 and 777. */

Select ProductID,
 Sum(LineTotal) as Total_Amount,
 AVG(UnitPrice) as Avg_Unit_Price,
 MAX(UnitPrice) as Max_Unit_Price,
 Min(UnitPrice) as Min_Unit_Price,
 Sum(OrderQty) as Total_Number_Of_Units
 From Sales.SalesOrderDetail
 Where ProductID = 774 OR ProductID = 777
 Group By ProductID
 

/*3, Write a query to display the sales person BusinessEntityID, last name and first name of all the sales persons and 
the name of the territory to which they belong.  (Person.Person, Sales.Person, Sales.Sales.Territory*/

Select p.BusinessEntityID, T.Name as Territory_Name, PP.LastName, PP.FirstName
 From Sales.SalesPerson As P
 Join Sales.SalesTerritory As T
 ON p.TerritoryID = t.TerritoryID
 Join Person.Person as PP
 ON p.BusinessEntityID = pp.BusinessEntityID 


/*4,  Write a query to display the Business Entities of the customers that have the 'Vista' credit card.
 (Sales.CreditCard, Sales.PersonCreditCArd Person.Person) Don't have to specify with pp.last name, because they are independent of each other*/

Select PP.BusinessEntityID, PP.LastName, PP.FirstName, SC.CardType
 From Sales.CreditCard as SC
 Join Sales.PersonCreditCard as PC
 ON SC.CreditCardID = PC.CreditCardID
 Join Person.Person as PP
 ON PC.BusinessEntityID = PP.BusinessEntityID
 Where SC.CardType = 'Vista'

 /*For each card type, how many customers */
 
 Select CardType, COUNT(BusinessEntityID) AS Number_Of_Customers
 From Sales.CreditCard as SC
 Join Sales.PersonCreditCard as PC
 ON SC.CreditCardID = PC.CreditCardID
 Group By CardType
 

/*5, Write a query to display all the country region codes along with their corresponding territory IDs  Person.CountryRegion, Sales.SalesTerritory*/

Select ST.TerritoryID, CR.CountryRegionCode
 From Sales.SalesTerritory as ST
 Full Outer Join Person.CountryRegion as CR
 ON ST.CountryRegionCode = CR.CountryRegionCode
 Where ST.TerritoryID is NULL  /*List all the countries regions that do not belong to any territory */



/*6, Find out the average of the total dues of all the orders.*/

Select AVG(TotalDue) as Average_Total_Due
 From Sales.SalesOrderHeader



/*7, Write a query to report the sales order ID of those orders where the total value is greater than the average of the 
total values of all the orders (SubQuery) */

Select SalesOrderID, TotalDue
 From Sales.SalesOrderHeader
 Where TotalDue > 
	(Select AVG(TotalDue) as Average_Total_Due
	From Sales.SalesOrderHeader)
Order By TotalDue;


