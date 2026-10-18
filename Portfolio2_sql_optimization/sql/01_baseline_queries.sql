-- ExpressMall SQL Query Optimisation
-- Step 1: Baseline queries
-- Run these queries before making optimisation changes.

-- Query 1: Retrieve customers
SELECT *
FROM expressmall.customers
LIMIT 100;

-- Query 2: Retrieve perfumes with their brand names
SELECT
    p.perfume_id,
    p.perfume_name,
    b.brand_name,
    p.price
FROM expressmall.perfumes AS p
JOIN expressmall.brands AS b
    ON p.brand_id = b.brand_id;

-- Query 3: Retrieve orders with customer details
SELECT
    o.order_id,
    o.order_date,
    c.customer_id,
    c.first_name,
    c.last_name
FROM expressmall.customer_orders AS o
JOIN expressmall.customers AS c
    ON o.customer_id = c.customer_id;

-- Query 4: Examine the execution plan for the perfume query
EXPLAIN ANALYZE
SELECT
    p.perfume_id,
    p.perfume_name,
    b.brand_name,
    p.price
FROM expressmall.perfumes AS p
JOIN expressmall.brands AS b
    ON p.brand_id = b.brand_id;