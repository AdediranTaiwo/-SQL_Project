Create Database LITA_PROJECT2

Select*
from [dbo].[Customer data 1]

--Retriving the total number of costomers from each Region

SELECT Region, COUNT(CustomerID) AS TotalCustomers
FROM [dbo].[Customer data 1]
GROUP BY Region;

--The most popular subscription type by the number of customers

SELECT SubscriptionType, COUNT(CustomerID) AS TotalCustomers
FROM [dbo].[Customer data 1]
GROUP BY SubscriptionType
ORDER BY TotalCustomers DESC

--Customers who canceled their subscription with 6months

SELECT CustomerId, CustomerName, 
Region,SubscriptionType,SubscriptionStart, 
SubscriptionEnd, Canceled,
Revenue
FROM [dbo].[Customer data 1]
WHERE Canceled = 0
And datediff(month, SubscriptionStart,SubscriptionStart) <= 182;

--Average subscription duration for all customers

SELECT AVG(datediff(Month, Subscriptionstart, SubscriptionEnd)) 
AS Average_Subscription_Duration
FROM [dbo].[Customer data 1];

--Customers with Subscription longer than 12 months

Select CustomerID
From [dbo].[Customer data 1]
where datediff(MONTH, SubscriptionStart, SubscriptionEnd) >12;

--Total Revenue by Subscription Type

Select SubscriptionType,
sum(Revenue) as TOTAL_Revenue
From [dbo].[Customer data 1]
group by SubscriptionType;

--Find the Top 3 REgion by Subscription Cancellation

SElect Region, count(*) as
cancellations
from [dbo].[Customer data 1]
where Canceled = 0
Group by Region
Order by cancellations desc

--Find the total Number of Active and canceled subscription

Select Canceled,
Count(*) as
TotalSubscriptions
From [dbo].[Customer data 1]
group by Canceled;
