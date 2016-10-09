Use AdventureWorksDW2012

/* Employees whose birthday is in February */

Select FirstName, LastName
 From DimEmployee
 Where MONTH(BirthDate) = 2



/* Who are the Sales Representatives whose birthday is in February */

Select *
 From DimEmployee
 Where MONTH(BirthDate) = 2
 AND Title = 'Sales Representative'


/* List all the sales processed by these Sales Representatives */

Select s.*, e.FirstName, e.LastName
 From DimEmployee as E, FactResellerSales as S
 Where E.EmployeeKey = S.EmployeeKey
 AND E.Title = 'Sales Representative'
 AND MONTH(BirthDate) = 2


/* Who is a better sales representative that was born in february */


Select SUM(S.SalesAmount) as Total_Sales_Amount, E.FirstName, E.LastName
 From DimEmployee E, FactResellerSales as S
 Where E.EmployeeKey = S.EmployeeKey
 And E.Title = 'Sales Representative'
 And MONTH(E.BirthDate) = 2
 Group By E.FirstName, E.LastName


/* Total amount of offline sales in Massachusetts */

Select Sum(S.SalesAmount) as Total_Sales, G.StateProvinceName
 From FactResellerSales as S, DimGeography as G
 Where S.SalesTerritoryKey = G.SalesTerritoryKey
 And G.StateProvinceName = 'Massachusetts'
 Group By G.StateProvinceName


/* Sales Amount of Internet Sales in 1st Quarter each year in each country */

Select SUM(S.SalesAmount) as Sales, G.CountryRegionCode, D.CalendarYear
 From FactInternetSales as S, DimGeography as G, DimDate as D
 Where S.DueDateKey = D.DateKey
 AND D.FiscalQuarter = 1
 Group By G.CountryRegionCode, D.CalendarYear
