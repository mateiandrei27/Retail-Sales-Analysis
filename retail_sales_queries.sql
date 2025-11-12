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

select *
from retail_sales
where sale_date = '2022-11-05'

select * 
from retail_sales
where
	category = 'Clothing'
	and
	convert(varchar(7), sale_date, 120) = '2022-11'
	AND
	quantity >= 4
	
select
	category,
	sum(total_sale) as net_sale,
	count (*) as total_orders
from retail_sales
group by category
order by net_sale desc

select 
	round(avg(age),2) as avg_age
from retail_sales
where category = 'Beauty'

select * from retail_sales
where total_sale > 1000

select
	category,
	gender,
	count (*) as total_transactions
from retail_sales
group by
	category,
	gender
order by category

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

select top 5 
    customer_id,
    sum(total_sale) as total_sales
from retail_sales
group by customer_id
order by total_sales desc;


select 
	category,
	count(distinct customer_id) as cnt_unique_cs
from retail_sales
group by category

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
