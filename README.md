# Retail Sales Analysis – SQL Project

## Project Description
This project analyzes retail sales data using SQL to answer key business questions related to sales performance, customer behavior, profitability, and time-based trends.  
The project covers **data cleaning, exploratory data analysis (EDA), and advanced SQL analytics**.

---

## Database & Table
- **Database:** project1  
- **Table:** retail_sales  

---

## Data Preparation
The dataset was cleaned and standardized before analysis:
- Converted date and time columns to proper formats
- Fixed corrupted and misspelled column names
- Standardized data types for numeric and categorical fields
- Added a primary key to ensure data integrity
- Renamed columns for consistency

---

## Data Validation
- Checked table structure using `DESC`
- Verified record count
- Identified rows containing NULL values across critical columns

---

## Business Questions Answered

1. Sales transactions on a specific date  
2. High-quantity clothing sales in a given month  
3. Total sales and order count by category  
4. Average age of customers purchasing Beauty products  
5. High-value transactions (total sales ≥ 1000)  
6. Transactions by gender and category  
7. Best-performing month in each year  
8. Top 5 customers by total sales  
9. Unique customer count per category  
10. Order distribution by time-based shifts (Morning, Afternoon, Evening)

---

## Advanced Analysis

- Total profit per category  
- Running total of daily sales  
- Category-wise contribution to overall sales (%)  
- Month-over-month sales growth using window functions  

---

## SQL Concepts Used
- Aggregations (`SUM`, `AVG`, `COUNT`)
- Conditional logic (`CASE`)
- Date & time functions
- Common Table Expressions (CTEs)
- Window functions (`RANK`, `LAG`, `OVER`)
- Data cleaning with `ALTER TABLE`

---

## Key Insights
- Identified top-performing categories and customers  
- Analyzed profitability instead of just revenue  
- Detected seasonal and monthly sales trends  
- Evaluated customer distribution across categories and time shifts  

---

## Tools & Technologies
- MySQL
- SQL (Advanced level)
- 
All SQL queries in this project were formatted using  
[Redgate SQL Formatter](https://www.red-gate.com/website/sql-formatter/)

