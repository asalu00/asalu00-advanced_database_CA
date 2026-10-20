-- Portfolio Three: ExpressMall
-- Experiment 3: Transaction Isolation Levels

-- Test 1: Check the default isolation level
SELECT
    'Default isolation level' AS test,
    current_setting('transaction_isolation') AS isolation_level;

-- Test 2: READ COMMITTED
BEGIN;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT
    'Test 2' AS test,
    current_setting('transaction_isolation') AS isolation_level;

COMMIT;

-- Test 3: REPEATABLE READ
BEGIN;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT
    'Test 3' AS test,
    current_setting('transaction_isolation') AS isolation_level;

ROLLBACK;

-- Test 4: Confirm the session default
SELECT
    'Final check' AS test,
    current_setting('transaction_isolation') AS isolation_level;