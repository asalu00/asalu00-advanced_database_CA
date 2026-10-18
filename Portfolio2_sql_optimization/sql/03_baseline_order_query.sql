-- ExpressMall SQL Query Optimisation
-- Baseline performance test: customer orders and customers

EXPLAIN ANALYZE
SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    c.customer_id,
    c.full_name,
    c.email,
    c.phone
FROM expressmall.customer_orders AS o
JOIN expressmall.customers AS c
    ON o.customer_id = c.customer_id;