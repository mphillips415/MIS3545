use AdventureWorksDW2012;


/*Employees whose birthday is in Feburary*/

Select *
 From DimEmployee
 Where MONTH(BirthDate) = 2


/*who are the Sales Representatives whose birthday is in Feburary?*/

Select *
 From DimEmployee
 Where MONTH(BirthDate) = 2 
 AND Title = 'Sales Representative'



/*List all the sales processed by these Sales Representatives - finding fact table of sales,
    Need 'Where' to link the two tables together.  Don't need a join because the where acts like the join and on from previous examples.
 */

Select S.*, e.FirstName, e.LastName
From FactResellerSales as S, DimEmployee as e
Where s.EmployeeKey = e.EmployeeKey
AND MONTH(e.BirthDate) = 2 
 AND e.Title = 'Sales Representative'


/*who is a better sales representative that was born in Feburary?*/

Select SUM(S.SalesAmount) as Sales_Amount, e.FirstName, e.LastName
From FactResellerSales as S, DimEmployee as e
Where s.EmployeeKey = e.EmployeeKey
AND MONTH(e.BirthDate) = 2 
 AND e.Title = 'Sales Representative'
 Group By e.FirstName, e.LastName




/*total Amount of off-line sales in Massachusetts - ResellerSales and then Geography dimension table*/

Select SUM(S.SalesAmount) as Total_Offline_Sales, G.StateProvinceName
 From FactResellerSales as S, DimGeography as G
 Where S.SalesTerritoryKey = G.SalesTerritoryKey
 And G.StateProvinceName = 'Massachusetts'
 Group By G.StateProvinceName



/*Sales Amount of Internet Sales in 1st quarter each year in each country*/

Select SUM(S.SalesAmount) as Internet_Sales_Total_1st_Q, G.CountryRegionCode
 From FactInternetSales as S, DimDate as D, DimGeography as G
 Where S.DueDateKey = D.DateKey
 And D.FiscalQuarter = '1'
 Group By G.CountryRegionCode
 

