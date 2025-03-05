# Retail Sales Analysis SQL Project

## Project Overview

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
delete from retail_sales
	where 
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NUll
select count(*)  as total_sales from retail_sales
select count(customer_id) as total_customers from retail_sales
select count(distinct customer_id) as unique_customers from retail_sales
```

### Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
```sql
select *
from retail_sales
where sale_date = '2022-11-05'
```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
```sql
select * 
from retail_sales
where
	category = 'Clothing'
	and
	convert(varchar(7), sale_date, 120) = '2022-11'
	AND
	quantity >= 4
```

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
```sql
select
	category,
	sum(total_sale) as net_sale,
	count (*) as total_orders
from retail_sales
group by category
order by net_sale desc
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
select 
	round(avg(age),2) as avg_age
from retail_sales
where category = 'Beauty'
```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
```sql
select * from retail_sales
where total_sale > 1000
```

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
```sql
select
	category,
	gender,
	count (*) as total_transactions
from retail_sales
group by
	category,
	gender
order by category
```

7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
```sql
with RankedSales as (
    select 
        year(sale_date) as year,
        month(sale_date) as month,
        avg(total_sale) as avg_sale,
       rank() over (partition by year(sale_date) order by avg(total_sale) desc) as rank
    from retail_sales
    group by year(sale_date), month(sale_date)
)
select year, month, avg_sale
from RankedSales
where rank = 1
order by year, month, avg_sale desc;
```

8. **Write a SQL query to find the top 5 customers based on the highest total sales**:
```sql
select top 5 
    customer_id,
    sum(total_sale) as total_sales
from retail_sales
group by customer_id
order by total_sales desc;
```

9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
```sql
select 
	category,
	count(distinct customer_id) as cnt_unique_cs
from retail_sales
group by category
```

10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:
```sql
with hourly_sale as (
    select *,
        case
            when datepart(hour, sale_time) < 12 then 'Morning'
            when datepart(hour, sale_time) between 12 and 17 then 'Afternoon'
            else 'Evening'
        end as shift
    from retail_sales
)
select 
    shift,
    count(*) as total_orders
from hourly_sale
group by shift;
```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.
