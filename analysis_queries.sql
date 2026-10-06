-- ============================================================
-- Retail Sales Analysis — 17 SQL Queries
-- Run after schema_and_seed.sql
-- ============================================================


-- ============================================================
-- QUERY 1: All orders placed in 2024
-- Concept: WHERE with date filtering
-- ============================================================
SELECT
    order_id,
    customer_id,
    order_date
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY order_date;


-- ============================================================
-- QUERY 2: Total revenue across all orders
-- Concept: SUM aggregation
-- ============================================================
SELECT
    ROUND(SUM(quantity * sale_price), 2) AS total_revenue
FROM order_items;


-- ============================================================
-- QUERY 3: Revenue by product category
-- Concept: JOIN + GROUP BY + ORDER BY
-- ============================================================
SELECT
    p.category,
    ROUND(SUM(oi.quantity * oi.sale_price), 2) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;


-- ============================================================
-- QUERY 4: Top 5 customers by total spend
-- Concept: Multi-table JOIN, aggregation, LIMIT
-- ============================================================
SELECT
    c.customer_id,
    c.name,
    ROUND(SUM(oi.quantity * oi.sale_price), 2) AS total_spent
FROM customers c
JOIN orders o    ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 5;


-- ============================================================
-- QUERY 5: Orders with no line items (data quality check)
-- Concept: LEFT JOIN + IS NULL
-- ============================================================
SELECT
    o.order_id,
    o.customer_id,
    o.order_date
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
WHERE