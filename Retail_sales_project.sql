create database project1;
use project1;

-- modified --
select * from retail_sales;

alter table retail_sales modify column  sale_date date;
alter table retail_sales modify column  sale_time time;
alter table retail_sales rename column  ï»¿transactions_id to transactions_id;
alter table retail_sales modify gender varchar(50),modify category varchar(50);
alter table retail_sales modify price_per_unit float,modify cogs float,modify total_sale float;
alter table retail_sales add  primary key (transactions_id);

#type of data
desc retail_sales;

select * from retail_sales;
select count(age),sum(distinct cogs) from retail_sales;
select count(*) from retail_sales; 

#questions
#null checking.
SELECT * FROM retail_sales
WHERE 
    transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR gender IS NULL
    OR category IS NULL
    OR quantiy IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;
 
--
-- How many uniuque customers we have ?
SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales;

-- Data Analysis & Business Key Problems & Answers

select * from retail_sales; 
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT 
    *
FROM
    retail_sales
WHERE
    sale_date = '2022-11-05'; 

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of 2022-5
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantiy > 3
  AND MONTH(sale_date) = 5
  AND YEAR(sale_date) = 2022;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    category, SUM(total_sale) AS total_sales,
    COUNT(*) as total_orders
FROM
    retail_sales
GROUP BY category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT 
    category, ROUND(AVG(age), 0) AS age
FROM
    retail_sales
WHERE
    category = 'beauty'
GROUP BY customer_id;

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT 
    *
FROM
    retail_sales
WHERE
    total_sale >= 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT 
    category, gender, COUNT(*) AS total_transcations
FROM
    retail_sales
GROUP BY gender , category
ORDER BY category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
with month_sale as(
SELECT 
    MONTH(sale_date) AS month,
    YEAR(sale_date) as year,
    AVG(total_sale) AS average_sales,
    rank() over(partition by YEAR(sale_date) order by AVG(total_sale)desc) as rnk
FROM
    retail_sales
group by 1,2) 
select year,month,average_sales from month_sale where rnk=1;

select * from retail_sales;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT 
    customer_id, SUM(total_sale) AS total_sales
FROM
    retail_sales
GROUP BY customer_id
ORDER BY SUM(total_sale) DESC
LIMIT 5;

select * from retail_sales;
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT 
    category, COUNT(DISTINCT (customer_id)) AS count_uniq
FROM
    retail_sales
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN hour(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift;
 