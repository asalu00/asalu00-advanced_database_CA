
-- Portfolio Three: ExpressMall
-- Experiment 4: Concurrency Testing
-- Database: Neon PostgreSQL
-- Purpose: Demonstrate stock protection and row-level locking.

-- TEST 1: Safe stock update and rollback
-- This test should leave inventory unchanged.

SELECT perfume_name, stock_quantity
FROM expressmall_txn_lab.perfumes
WHERE perfume_name = 'Amber Essence';

BEGIN;

UPDATE expressmall_txn_lab.perfumes
SET stock_quantity = stock_quantity - 1
WHERE perfume_name = 'Amber Essence'
  AND stock_quantity >= 1
RETURNING perfume_name, stock_quantity;

ROLLBACK;

SELECT perfume_name, stock_quantity
FROM expressmall_txn_lab.perfumes
WHERE perfume_name = 'Amber Essence';


-- TEST 2: SESSION 1
-- Run this block in SQL Editor tab 1.
-- Do not commit until Session 2 has attempted its update.

-- BEGIN;
-- UPDATE expressmall_txn_lab.perfumes
-- SET stock_quantity = stock_quantity - 1
-- WHERE perfume_name = 'Amber Essence'
--   AND stock_quantity >= 1
-- RETURNING perfume_name, stock_quantity;
-- COMMIT;


-- TEST 3: SESSION 2
-- Run this block in SQL Editor tab 2 while Session 1
-- is still uncommitted.

-- BEGIN;
-- SET LOCAL lock_timeout = '5s';
-- UPDATE expressmall_txn_lab.perfumes
-- SET stock_quantity = stock_quantity - 1
-- WHERE perfume_name = 'Amber Essence'
--   AND stock_quantity >= 1
-- RETURNING perfume_name, stock_quantity;
-- ROLLBACK;


-- FINAL INVENTORY VERIFICATION
SELECT perfume_name, stock_quantity
FROM expressmall_txn_lab.perfumes
WHERE perfume_name = 'Amber Essence';
