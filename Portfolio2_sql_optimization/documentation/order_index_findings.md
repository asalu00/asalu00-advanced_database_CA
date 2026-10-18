
# Customer Orders Index Findings

## Existing Indexes
The customer_orders table has indexes on order_id,
customer_id, and order_date. No existing index on
order_status was identified.

## Baseline Test
Query:
SELECT * FROM expressmall.customer_orders
WHERE order_status = 'pending';

- Execution time: 0.033 ms
- Planning time: 0.107 ms
- Execution plan: Sequential Scan (Seq Scan)

## Initial Observation
PostgreSQL used a sequential scan to retrieve pending
orders. Given the small dataset, this may be an
efficient choice. The baseline result alone does not
prove that an additional index is necessary.

## Next Step
Test an index on order_status, collect a new execution
plan, and compare the results. Keep the index only if
the measurements and expected workload justify it.
