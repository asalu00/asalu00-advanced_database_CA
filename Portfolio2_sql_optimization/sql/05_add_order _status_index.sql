
-- ExpressMall SQL Query Optimisation
-- Portfolio Two: Test index on order_status

CREATE INDEX idx_orders_order_status
ON expressmall.customer_orders (order_status);

-- Refresh table statistics for the query planner
ANALYZE expressmall.customer_orders;
