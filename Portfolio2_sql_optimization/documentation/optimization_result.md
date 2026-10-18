
# ExpressMall SQL Optimization Results

## Objective
Evaluate whether an index on order_status improves
the performance of a query filtering customer orders
by status.

## Test Query
EXPLAIN ANALYZE
SELECT *
FROM expressmall.customer_orders
WHERE order_status = 'pending';

## Dataset
- Total orders: 80
- Pending orders: 36

## Results

| Metric | Before Index | After Index |
|---|---:|---:|
| Execution time | 0.033 ms | 0.061 ms |
| Planning time | 0.107 ms | 0.936 ms |
| Execution plan | Seq Scan | Seq Scan |

## Analysis
The query planner selected a sequential scan before
and after the index was created.

The measured execution time increased from 0.033 ms
to 0.061 ms in these individual runs. The planning
time also increased from 0.107 ms to 0.936 ms.

Because the dataset is small and the timings are very
short, these measurements are not sufficient to
conclude that the index generally reduces performance.
The results do show that the index did not produce a
faster execution in this test.

## Limitations
The test uses only 80 synthetic orders, with 36
pending orders. Results may differ significantly with
larger tables, different status distributions, and
repeated measurements.

## Recommendation
Do not claim a performance improvement from this
experiment. Evaluate the index against a representative
workload and larger dataset before deciding whether to
keep it. Retain the index only if its benefits justify
its storage and write-maintenance costs.
