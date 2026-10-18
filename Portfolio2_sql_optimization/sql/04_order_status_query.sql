-- ExpressMall SQL Query Optimisation
-- Performance test: filter orders by status

EXPLAIN ANALYZE
SELECT *
FROM expressmall.customer_orders
WHERE order_status = 'Pending';