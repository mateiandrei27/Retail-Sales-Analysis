#  Retail Sales Analysis – Business Case

## 1. Business Context  
A mid-sized retail company operating across multiple sales channels (in-store and online) seeks to understand its sales performance, customer behavior, and category profitability.  
This analysis leverages historical transaction data to identify key business drivers, seasonal patterns, and optimization opportunities.

---

## 2. Objective  
The goal of this project is to extract actionable insights from sales data to:  
- Identify **top-performing product categories** and their revenue share.  
- Analyze **customer demographics** and high-value customer segments.  
- Understand **temporal sales trends** (time of day, seasonality).  
- Evaluate **gender-based purchasing patterns**.  
- Provide **data-driven recommendations** to optimize sales strategy.  

The full SQL analysis queries used for this project can be found **[here](retail_sales_queries.sql)**.

---

## 3. Business Questions  
This project aims to answer the following key business questions:  
1. Which product categories drive the majority of sales and revenue?  
2. Who are the top 5 customers contributing most to total revenue?  
3. What is the average age of customers per category, and what does that imply for marketing segmentation?  
4. Which month and time of day record the highest sales volumes?  
5. Are there notable differences in purchasing behavior between male and female customers?  
6. How can these insights guide marketing, staffing, and inventory decisions?

---

## 4. Dataset Description  
- **Data source:** Internal retail database (anonymized sample).  
- **Period covered:** **January 2022 – December 2023**  
- **Total transactions:** **1,987**  
- **Key fields:**  
  - `transactions_id` – Unique transaction identifier  
  - `sale_date`, `sale_time` – Timestamp of transaction  
  - `customer_id`, `gender`, `age` – Customer demographics  
  - `category`, `quantity`, `price_per_unit`, `cogs`, `total_sale`  

---

## 5. Tools & Technologies  
- **Database:** PostgreSQL  
- **Analysis:** SQL (data cleaning, aggregation, business logic)   
- **Environment:** DBeaver

---

## 6. Key Insights  

###  Product Category Performance  
| Category | Total Sales | % of Total Revenue |
|-----------|--------------|--------------------|
| Electronics | 311,445 | 34.29% |
| Clothing | 309,995 | 34.13% |
| Beauty | 286,790 | 31.58% |

**Insight:**  
Sales are well distributed across the three main categories, with Electronics slightly leading. Combined, these categories represent **100% of total sales**, indicating a balanced product portfolio.

---

###  Top 5 Customers by Revenue  
| Customer ID | Total Sales | % of Total |
|--------------|-------------|-------------|
| 3 | 38,440 | 4.23% |
| 1 | 30,750 | 3.39% |
| 5 | 30,405 | 3.35% |
| 2 | 25,295 | 2.79% |
| 4 | 23,580 | 2.60% |

**Insight:**  
The top 5 customers together contribute nearly **16.36%** of total revenue - a clear opportunity for **customer retention and loyalty initiatives**.

---

###  Customer Age Analysis  
| Category | Average Age |
|-----------|--------------|
| Overall | 41.35 |
| Electronics | 41.60 |
| Clothing | 41.93 |
| Beauty | 40.42 |

**Insight:**  
Customers are predominantly in the **40–42 age range**, suggesting that **marketing efforts** should target a mature audience with higher purchasing power and brand loyalty tendencies.

---

###  Peak Sales Periods  
- **Peak Month:** **December 2022 (₤71,880 total sales)**  
- **Peak Time of Day:** **Evening (₤390,065 total sales)**  

**Insight:**  
Sales spike during **December**, likely due to the holiday season, and peak in the **Evening hours (6–9 PM)** — ideal for running **targeted promotions or flash sales** during that period.

---

###  Gender Trends  
| Gender | Total Sales | % of Total |
|---------|-------------|-------------|
| Female | 463,110 | 50.99% |
| Male | 445,120 | 49.01% |

**Insight:**  
Purchasing behavior is almost evenly split between genders, with **females slightly leading (51%)** — suggesting that marketing strategies should maintain a **gender-balanced approach**.

---

## 7. Business Recommendations  

1. **Leverage seasonal trends:**  
   - Launch marketing campaigns and promotions in **Q4**, particularly in **December**, to maximize holiday-driven sales.  

2. **Focus on customer retention:**  
   - Implement a **loyalty or rewards program** for high-value customers (top 5 contribute 16% of total revenue).  

3. **Optimize marketing by demographics:**  
   - Target age group **40–45** with lifestyle-focused campaigns.  

4. **Adjust operational strategy:**  
   - Increase staffing and inventory availability during **Evening hours**, when customer activity peaks.  

5. **Maintain category balance:**  
   - Electronics, Clothing, and Beauty all perform strongly — continue diversified product focus rather than over-investing in a single category.  

---

## 8. Limitations & Future Work  
- Data is historical (2022–2023), not real-time.  
- Lacks geographical segmentation (cannot assess regional performance).  
- Profit and margin analyses can be expanded with product-level granularity.  

**Next Steps:**  
- Integrate sales with CRM data for customer segmentation (RFM analysis).  
- Develop **interactive dashboards (Power BI / Tableau)** for management reporting.  
- Explore **predictive analytics** (forecasting sales by category and month).
