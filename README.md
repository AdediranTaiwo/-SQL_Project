# SQL_Project

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


-- ========================== -- End of SQL Analysis -- ==========================



