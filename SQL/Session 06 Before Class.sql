use AdventureWorks2012;
/*Find out info of all the customers*/

/*
SELECT *
 From Sales.Customer;
 */
 

/*Find out info of all the sales orders*/


/*
Select *
 From Sales.SalesOrderDetail;

 */


/*Find out sales info about productID 843*/

/*
Select *
 From Sales.SalesOrderDetail 
 Where ProductID = 843;

 */


/* Sales info of all the products of which unit price is between 100 and 200*/

/*

Select *
 From Sales.SalesOrderDetail
 Where UnitPrice >= 100 AND UnitPrice <=200; 

 Can also do Where UnitPrice between 100 and 200

 */


/*All the store names*/
/*

Select Name
 From Sales.Store;
 
 */


/*Find out store names that contain "Bike" */

/*
Select Name
 From Sales.Store 
 Where Name Like '%Bike%'
 
 */



/*info of all the credit cards*/

Select *
 From Sales.CreditCard


Select Distinct CardType
 From Sales.CreditCard

/* A list of credit card types*/