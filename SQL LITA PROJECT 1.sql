create database LITA_PROJECT

select *
From [dbo].[sales data]

--Retrieving the total sale for each product category 

Select product, sum(Quantity) as Total_Sale
from [dbo].[sales data]
Group by Product

--Number of sales transaction in each region -

select Region, count(*)as Total_Transaction
from [dbo].[sales data]
Group By Region

--The Highest_ selling product by total sales revenue -

Select Top 1Product, sum(Quantity) As Total_Revenue
from [dbo].[sales data]
Group By Product

--Calculate Total Revenue per Product
Select product, sum(Total_Sales) as Total_Revenue
from [dbo].[sales data]
Group By
Product

--Calculate Monthly Sales Total for the Current Year

select
month(OrderDate) as Month,
sum(Total_Sales) as Monthly_Total_Sales
from [dbo].[sales data]
where
Year(OrderDate) = 2023
group by
Month(OrderDate)
Order By
Month(OrderDate)


--Top 5 Customers By Purchase Amount

Select Top 5
Customer_Id, sum(Total_Sales) as Total_Purchase_Amount
from [dbo].[sales data]
Group By
Customer_Id
order by
Total_Purchase_Amount Desc

--Calculating The Percentage of Total Sales contributed by each Region

Select 
Region,
SUM(Total_Sales) AS Total_Sales_Region,
(SUM(Total_Sales) / (SELECT SUM(Total_Sales) FROM [dbo].[sales data] )) * 100 AS Percentage_Contribution
from 
[dbo].[sales data]
group by Region


--Product with no sales in the last quater

SELECT DISTINCT Product
FROM [dbo].[sales data]
WHERE Product NOT IN (
SELECT Product
FROM [dbo].[sales data]
    WHERE OrderDate >= '2023-07-01' AND OrderDate <= '2023-09-30'
);

where product Not In(select product)