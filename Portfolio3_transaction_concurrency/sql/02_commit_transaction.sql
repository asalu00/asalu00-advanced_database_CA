
-- Portfolio Three: ExpressMall
-- Experiment 1: Safe transaction using COMMIT
-- Database: Neon PostgreSQL

BEGIN;

-- Step 1: Reduce stock only if at least one bottle is available.
-- RETURNING lets us verify that a row was actually updated.
WITH stock_update AS (
    UPDATE expressmall_txn_lab.perfumes
    SET stock_quantity = stock_quantity - 1
    WHERE perfume_name = 'Oud Royale'
      AND stock_quantity >= 1
    RETURNING perfume_id
)
-- Step 2: Create the order only if the stock update succeeded.
INSERT INTO expressmall_txn_lab.orders
    (customer_name, perfume_id, quantity, order_status)
SELECT
    'Portfolio Test Customer',
    perfume_id,
    1,
    'Processing'
FROM stock_update
RETURNING order_id, customer_name, perfume_id, quantity, order_status;

-- Step 3: Commit the transaction.
COMMIT;

-- Step 4: Verify the remaining stock.
SELECT perfume_name, stock_quantity
FROM expressmall_txn_lab.perfumes
WHERE perfume_name = 'Oud Royale';

-- Step 5: Verify the test order.
SELECT order_id, customer_name, quantity, order_status
FROM expressmall_txn_lab.orders
WHERE customer_name = 'Portfolio Test Customer'
ORDER BY order_id;
