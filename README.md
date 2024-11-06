# SQL_Project

## SQL Project 1 ( Sales Data)

### Overview

#### Total sales for each product category
```
SELECT product, SUM(Total_sale) AS Total_sale
FROM SalesData
GROUP BY product;
```
#### Number of sales transactions in each region
```
SELECT region, COUNT(*) AS transaction_count
FROM SalesData
GROUP BY region;
```
#### Highest-selling product by total sales value
```
SELECT TOP 1 product, SUM(Total_sale) AS total_sales
FROM SalesData
GROUP BY product
ORDER BY total_sales DESC;
```
#### Total revenue per product
```
SELECT product, SUM(Total_sale) AS total_revenue
FROM SalesData
GROUP BY product;
```
#### Monthly sales totals for the current year
```
SELECT MONTH(Orderdate) AS month,
SUM(Total_sale) AS total_sales
FROM SalesData
WHERE YEAR(Orderdate) = 2024
GROUP BY MONTH(Orderdate)
ORDER BY MONTH(Orderdate);
```
#### Top 5 customers by total purchase amount
```
SELECT TOP 5 customer_id, SUM(Total_sale) AS total_purchase
FROM SalesData
GROUP BY customer_id
ORDER BY total_purchase DESC;
```
#### Percentage of total sales contributed by each region
```
SELECT region,
SUM(Total_sale) AS total_sales,
(SUM(Total_sale) / (SELECT SUM(Total_sale) FROM SalesData) * 100) AS percentage_of_total_sales
FROM SalesData
GROUP BY region;
```
#### Products with no sales in the last quarter
```
SELECT product 
FROM SalesData
GROUP BY product
```


-- ========================== -- End of SQL project 1 Analysis -- ==========================


## SQL Project 2 ( Customer Data)

### Overview
```
Select*
from [dbo].[Customer data 1]
```
#### Retriving the total number of costomers from each Region
```
SELECT Region, COUNT(CustomerID) AS TotalCustomers
FROM [dbo].[Customer data 1]
GROUP BY Region;
```
#### The most popular subscription type by the number of customers

SELECT SubscriptionType, COUNT(CustomerID) AS TotalCustomers
FROM [dbo].[Customer data 1]
GROUP BY SubscriptionType
ORDER BY TotalCustomers DESC

#### Customers who canceled their subscription with 6months
```
SELECT CustomerId, CustomerName, 
Region,SubscriptionType,SubscriptionStart, 
SubscriptionEnd, Canceled,
Revenue
FROM [dbo].[Customer data 1]
WHERE Canceled = 0
And datediff(month, SubscriptionStart,SubscriptionStart) <= 182;
```
#### Average subscription duration for all customers
```
SELECT AVG(datediff(Month, Subscriptionstart, SubscriptionEnd)) 
AS Average_Subscription_Duration
FROM [dbo].[Customer data 1];
```
#### Customers with Subscription longer than 12 months
```
Select CustomerID
From [dbo].[Customer data 1]
where datediff(MONTH, SubscriptionStart, SubscriptionEnd) >12;
```
#### Total Revenue by Subscription Type
```
Select SubscriptionType,
sum(Revenue) as TOTAL_Revenue
From [dbo].[Customer data 1]
group by SubscriptionType;
```
#### Find the Top 3 REgion by Subscription Cancellation
```
SElect Region, count(*) as
cancellations
from [dbo].[Customer data 1]
where Canceled = 0
Group by Region
Order by cancellations desc
```
#### Find the total Number of Active and canceled subscription
```
Select Canceled,
Count(*) as
TotalSubscriptions
From [dbo].[Customer data 1]
group by Canceled;
```
--------------------------------------------END OF SQL PROJECT 2-----------------------------------------

