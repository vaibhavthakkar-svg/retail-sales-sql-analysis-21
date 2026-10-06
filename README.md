# Retail Sales SQL Analysis

A portfolio project demonstrating SQL proficiency through 15+ queries of increasing complexity, applied to a realistic retail sales dataset. Topics covered include filtering, aggregations, JOINs, subqueries, CTEs, and window functions.

## Project Structure

```
retail-sales-sql/
├── README.md
├── schema_and_seed.sql      # Table definitions + sample data
├── analysis_queries.sql     # 15+ analysis queries with comments
└── sample_data.csv          # Source data (importable into Excel or DB)
```

## Dataset Overview

The dataset simulates a small retail business with the following tables:

| Table       | Description                              |
|-------------|------------------------------------------|
| customers   | Customer demographics and region         |
| products    | Product catalog with category and price  |
| orders      | Order headers with date and customer     |
| order_items | Line items linking orders to products    |

## Skills Demonstrated

- **SQL**: SELECT, WHERE, GROUP BY, HAVING, ORDER BY
- **Joins**: INNER, LEFT, and multi-table joins
- **Aggregations**: SUM, AVG, COUNT, MIN, MAX
- **Subqueries & CTEs**: WITH clauses, nested queries
- **Window Functions**: ROW_NUMBER, RANK, LAG, running totals
- **Excel**: The `sample_data.csv` file can be opened in Excel for pivot table analysis

## How to Run

### Option 1: SQLite (Recommended — no install needed beyond sqlite3)

```bash
sqlite3 retail.db < schema_and_seed.sql
sqlite3 retail.db < analysis_queries.sql
```

### Option 2: PostgreSQL

```bash
psql -U your_user -d your_database -f schema_and_seed.sql
psql -U your_user -d your_database -f analysis_queries.sql
```

### Option 3: MySQL

```bash
mysql -u your_user -p your_database < schema_and_seed.sql
mysql -u your_user -p your_database < analysis_queries.sql
```

> **Note:** Window functions require SQLite 3.25+, PostgreSQL 8.4+, or MySQL 8.0+.

## Excel Usage

1. Open `sample_data.csv` in Excel
2. Use **Insert → PivotTable** to explore sales by region, category, or month
3. Try a bar chart of revenue by product category

## Query Index

| # | Query Description                              | Concepts Used              |
|---|------------------------------------------------|----------------------------|
| 1 | All orders in 2024                             | WHERE, date filter         |
| 2 | Total revenue                                  | SUM aggregation            |
| 3 | Revenue by product category                    | GROUP BY                   |
| 4 | Top 5 customers by spend                       | ORDER BY, LIMIT            |
| 5 | Orders with no items (data quality check)      | LEFT JOIN, IS NULL         |
| 6 | Average order value                            | Subquery, AVG              |
| 7 | Products never ordered                         | LEFT JOIN, IS NULL         |
| 8 | Monthly revenue trend                          | Date functions, GROUP BY   |
| 9 | Customers who ordered in every quarter         | HAVING, COUNT DISTINCT     |
|10 | Revenue by region                              | Multi-table JOIN           |
|11 | Top product per category                       | CTE + window function      |
|12 | Customer lifetime value segments               | CTE, CASE                  |
|13 | Month-over-month revenue change                | LAG window function        |
|14 | Running total of revenue                       | SUM OVER window function   |
|15 | Rank customers by region                       | RANK OVER PARTITION        |
|16 | Orders above average order value               | Subquery in WHERE          |
|17 | Category share of total revenue                | CTE, ratio calculation     |

## Author

Built as a portfolio project to demonstrate SQL and data analysis skills.