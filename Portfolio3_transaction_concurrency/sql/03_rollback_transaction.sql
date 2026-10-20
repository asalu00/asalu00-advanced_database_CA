
-- Portfolio Three: ExpressMall
-- Experiment 2: Demonstrating ROLLBACK
-- Database: Neon PostgreSQL

-- 1. Check the original stock.
SELECT perfume_name, stock_quantity
FROM expressmall_txn_lab.perfumes
WHERE perfume_name = 'Velvet Rose';

-- 2. Begin a transaction.
BEGIN;

-- 3. Temporarily reduce stock by one bottle.
UPDATE expressmall_txn_lab.perfumes
SET stock_quantity = stock_quantity - 1
WHERE perfume_name = 'Velvet Rose'
  AND stock_quantity >= 1
RETURNING perfume_name, stock_quantity;

-- 4. Temporarily create an order.
INSERT INTO expressmall_txn_lab.orders
    (customer_name, perfume_id, quantity, order_status)
SELECT
    'Rollback Test Customer',
    perfume_id,
    1,
    'Pending'
FROM expressmall_txn_lab.perfumes
WHERE perfume_name = 'Velvet Rose'
RETURNING order_id, customer_name, quantity, order_status;

-- 5. Cancel the transaction.
ROLLBACK;

-- 6. Confirm that stock has returned to its original value.
SELECT perfume_name, stock_quantity
FROM expressmall_txn_lab.perfumes
WHERE perfume_name = 'Velvet Rose';

-- 7. Confirm that the test order was not saved.
SELECT order_id, customer_name, quantity, order_status
FROM expressmall_txn_lab.orders
WHERE customer_name = 'Rollback Test Customer';
