# Brazilian E-Commerce Analysis — SQL & Power BI

An end-to-end data analytics project built on the Olist Brazilian E-Commerce dataset. The project covers the full workflow: loading raw data into PostgreSQL, cleaning and validating it through a structured SQL pipeline, answering ten business questions with SQL, and presenting the results in an interactive Power BI dashboard connected live to the database.

---

## Project Overview

The dataset contains roughly 100,000 orders placed on the Olist marketplace between 2016 and 2018, spread across nine related tables (orders, order items, products, categories, customers, sellers, payments, reviews, and geolocation). The goal was to turn this raw, messy data into clean insights about revenue, product performance, delivery logistics, customer behavior, and payment trends.

**Tech stack:** PostgreSQL · SQL · Power BI · DAX · VS Code

---

## Repository Structure

```
.
├── sql_load/
│   ├── 1_create_database.sql
│   ├── 2_create_tables.sql
│   └── 3_modify_tables.sql
├── sql_cleaning/
│   ├── 1_remove_duplicates.sql
│   ├── 2_handle_nulls.sql
│   ├── 3_fix_categories.sql
│   ├── 4_standardize_text.sql
│   └── 5_validate_relationships.sql
├── sql_queries/
│   ├── 1_monthly_orders_and_revenue.sql
│   ├── 2_top_categories_by_revenue.sql
│   ├── 3_orders_by_status.sql
│   ├── 4_avg_review_score_by_category.sql
│   ├── 5_top_sellers_by_revenue.sql
│   ├── 6_avg_delivery_time_by_state.sql
│   ├── 7_payment_methods_analysis.sql
│   ├── 8_customers_with_multiple_orders.sql
│   ├── 9_late_vs_ontime_deliveries.sql
│   └── 10_monthly_revenue_growth.sql
├── assets/                         # dashboard screenshots
└── PortfolioProject_eCommerce.pbix # Power BI report
```

---

## Workflow

### 1. Data Loading

The nine CSV files were loaded into PostgreSQL using the `COPY` command. Because the raw data contained duplicate keys and inconsistent values, primary and foreign key constraints were dropped during loading and relationships were validated manually after cleaning instead.

### 2. Data Cleaning

A five-step cleaning pipeline was applied:

- **Remove duplicates** — duplicate rows were removed across all tables using the internal `ctid` row identifier and `ROW_NUMBER()` window functions. (The dataset had been loaded twice, so every table initially held double the correct row count.)
- **Handle nulls** — missing product categories were set to `'unknown'`, missing review titles and messages were filled with placeholder text, and missing order dates were intentionally left as `NULL` since they represent legitimately cancelled or undelivered orders.
- **Fix categories** — three product categories that existed in the products table but were missing from the categories reference table were added back, so no products are silently dropped in joins.
- **Standardize text** — city, category, status, and payment columns were normalized with `LOWER(TRIM())`, and state codes with `UPPER(TRIM())`, to prevent duplicate groupings caused by inconsistent casing or whitespace.
- **Validate relationships** — six orphan-record checks were run across all key relationships; all returned zero orphans, confirming referential integrity.

Final clean row counts: 99,441 orders · 99,441 customers · 98,410 reviews · 112,650 order items · 32,951 products · 3,095 sellers · 71 categories.

### 3. Analysis

Ten business questions were answered with SQL, ranging from simple aggregations to window functions:

| # | Question |
|---|----------|
| 1 | Monthly orders and revenue |
| 2 | Top product categories by revenue |
| 3 | Order count by status |
| 4 | Average review score by category |
| 5 | Top sellers by revenue |
| 6 | Average delivery time by customer state |
| 7 | Payment methods and average installments |
| 8 | Customers with multiple orders |
| 9 | Late vs on-time delivery rate |
| 10 | Month-over-month revenue growth |

### 4. Visualization

Power BI was connected live to the PostgreSQL database. A data model was built linking the tables, and DAX measures were created for the core KPIs (total revenue, total orders, total customers, average review score, on-time delivery rate, and more). Each business question is presented on its own dashboard page, with a consistent KPI header and a dedicated visual.
