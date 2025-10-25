	-- Data Cleaning
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

	--How many sales we have?
select count(*)  as total_sales from retail_sales

	--How many customers we have?
select count(customer_id) as total_customers from retail_sales

	--How many unique customers we have?
select count(distinct customer_id) as unique_customers from retail_sales

	--Write a SQL query to retrive all columns for sales made on '2022-11-05'
select *
from retail_sales
where sale_date = '2022-11-05'

	--Write a SQL query to retrive all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select * 
from retail_sales
where
	category = 'Clothing'
	and
	convert(varchar(7), sale_date, 120) = '2022-11'
	AND
	quantity >= 4
	
	--Write a SQL query to calculate the total sales (total_sale) for each category
select
	category,
	sum(total_sale) as net_sale,
	count (*) as total_orders
from retail_sales
group by category
order by net_sale desc

	--Write a SQL query to find the average age of customers who purchased items from the 'Beauty' cateogry
select 
	round(avg(age),2) as avg_age
from retail_sales
where category = 'Beauty'

	--Write a SQL query to find all transactions where the total_sale is greater than 1000
select * from retail_sales
where total_sale > 1000

	--Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category
select
	category,
	gender,
	count (*) as total_transactions
from retail_sales
group by
	category,
	gender
order by category

	--Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
with RankedSales as (
    select 
        year(sale_date) as year,
        month(sale_date) as month,
        avg(total_sale) as avg_sale,
        rank() over (partition by year(sale_date) order by AVG(total_sale) desc) as rank
    from retail_sales
    group by year(sale_date), month(sale_date)
)
select year, month, avg_sale
from RankedSales
where rank = 1
order by year, month, avg_sale desc;

	--Write a SQL query to find the top 5 customers based on the highest total sales
select top 5 
    customer_id,
    sum(total_sale) as total_sales
from retail_sales
group by customer_id
order by total_sales desc;


	--Write a SQL query to find the number of unique customers who purchased items from each category
select 
	category,
	count(distinct customer_id) as cnt_unique_cs
from retail_sales
group by category

	--Write a SQL query to create each shift and number of oreders (Ex: Morning <=12, Afternoon between 12&17, Evening >17)
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
