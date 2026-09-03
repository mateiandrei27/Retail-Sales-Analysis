#  Retail Sales & Customer Behavior Analysis (SQL)

## 📌 Project Overview
This project delivers a comprehensive exploratory data analysis (EDA) of retail transaction data using **PostgreSQL**. The dataset comprises historical customer transactions, focusing on purchasing patterns, shift-based sales performance, customer demographics, and category profitability to extract actionable business insights.

---

## 🎯 Key Business Questions & SQL Solutions

| Business Focus | Analytical Objective | Business Value & Insight |
| :--- | :--- | :--- |
| **Shift Performance:** Categorize transactions by shift (Morning, Afternoon, Evening). | Analyzed sales distribution across operational hours using `CASE` statements and time windowing. | Helps store management optimize staff scheduling during peak transaction hours (Evening shifts). |
| **Demographic Breakdown:** Evaluate customer retention and spending by age and gender. | Calculated unique customer counts and total revenue per demographic group using `COUNT(DISTINCT customer_id)`. | Identifies high-value customer segments to tailor marketing campaigns. |
| **Category Benchmarking:** Determine top-performing product categories by order volume and net sales. | Aggregated revenue and order quantities per category via SQL `GROUP BY` and `ORDER BY`. | Highlights core product drivers and guides inventory replenishment strategy. |

---

## 🛠️ Step-by-Step SQL Analytics & Highlights

### 1. Data Cleaning & Null Handling
* Identified and removed records with missing critical fields (`sale_date`, `sale_time`, `customer_id`, `gender`, `age`, `category`, `quantity`, `price_per_unit`, `cogs`, `total_sale`).

### 2. Core Business Queries & Trends
* **Best-Selling Months:** Utilized SQL Window Functions (`RANK()` over `EXTRACT(YEAR/MONTH)`) to pinpoint top revenue-generating months per year.
* **Customer Lifetime Activity:** Calculated unique customers buying across specific categories (e.g., *Beauty* vs. *Clothing*).
* **Shift Analytics:** Created dynamic time buckets (`Morning < 12:00`, `Afternoon 12:00-17:00`, `Evening > 17:00`) to measure sales volume per operational shift.

---

## 💡 Key Business Insights

1. **Shift Sales Peak:** The **Evening shift** generates the highest volume of transactions, indicating a need for additional floor staff during late-day hours.
2. **Category Performance:** **Clothing** and **Beauty** emerge as the top revenue-generating categories, driving over **60% of total sales volume**.
3. **High-Value Orders:** Orders with a total sale value exceeding **$1,000** are concentrated in specific peak months, representing prime opportunities for loyalty program incentives.

---

## 📁 Repository Structure
* `retail_sales_queries.sql` – Complete PostgreSQL script (table creation, data cleaning, CTEs, and exploratory queries).
* `Retail Sales Analysis.csv` – Raw transactional dataset used for database ingestion and analysis.
* `README.md` – Project documentation and strategic insights.
