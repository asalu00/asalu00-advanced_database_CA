
# Portfolio 3: Transactions and Concurrency

## Project: ExpressMall

### 1. Introduction

This portfolio investigates database transactions, transaction rollback, isolation levels, and concurrency control using PostgreSQL on Neon. ExpressMall is an online perfume store that requires reliable inventory management and order processing.

The purpose of these experiments is to demonstrate how database transactions protect data integrity when orders are processed and when multiple operations attempt to update the same inventory record.

### 2. Database Environment

- **Database system:** PostgreSQL
- **Hosting platform:** Neon
- **Schema:** `expressmall_txn_lab`
- **Main tables:** `perfumes` and `orders`
- **Test product:** Amber Essence

### 3. Experiment 1: COMMIT Transaction

**Objective:** Demonstrate how a transaction permanently saves an inventory update and a corresponding order.

**Procedure:** A transaction reduced the stock of Oud Royale by one unit and inserted an order for a test customer. The transaction was committed.

**Observed result:** The order was created with the status `Processing`, and the stock quantity decreased from 10 to 9.

**Conclusion:** The `COMMIT` statement made the changes permanent. This demonstrates how inventory updates and order records can be processed within a transaction.

### 4. Experiment 2: ROLLBACK Transaction

**Objective:** Demonstrate how a transaction reverses changes that should not be saved.

**Procedure:** A transaction temporarily reduced the stock of Velvet Rose and inserted a test order. The transaction was rolled back.

**Observed result:** Velvet Rose stock returned from 4 to 5, and a verification query confirmed that zero rollback test orders remained.

**Conclusion:** The `ROLLBACK` statement reversed both the temporary inventory update and the order insertion.

### 5. Experiment 3: Transaction Isolation Levels

**Objective:** Inspect PostgreSQL transaction isolation settings.

**Procedure:** The default isolation level was checked. Separate transactions were configured to use `READ COMMITTED` and `REPEATABLE READ`.

**Observed result:** The default isolation level was `read committed`. The test transaction using `READ COMMITTED` reported that level, while the test using `REPEATABLE READ` reported `repeatable read`. The final check returned to `read committed`.

**Conclusion:** PostgreSQL supports different isolation levels that determine how transactions observe changes made by other transactions. In this experiment, the isolation level was configured for individual transactions without permanently changing the session default.

### 6. Experiment 4: Concurrency Control

**Objective:** Investigate what happens when two database sessions attempt to update the same inventory record concurrently.

**Procedure:** Session 1 began a transaction and reduced Amber Essence stock from 1 to 0 without committing. Session 2 attempted to update the same row with a five-second lock timeout.

**Observed result:** Session 2 waited for the conflicting transaction and then returned a lock-timeout error. Session 2 was rolled back. Session 1 was subsequently committed, and the stock was restored to 1 after the experiment.

**Conclusion:** PostgreSQL's row-level locking prevented Session 2 from immediately completing a conflicting update while Session 1 held the lock. The lock timeout limited how long Session 2 waited. This demonstrates an important concurrency-control mechanism for inventory management.

### 7. Business Relevance

These experiments are relevant to ExpressMall because online perfume orders depend on accurate stock quantities and reliable order records.

- **COMMIT** saves successful transactions.
- **ROLLBACK** reverses incomplete or unwanted changes.
- **Transaction isolation** controls how transactions interact with concurrent database activity.
- **Concurrency control** helps prevent conflicting inventory updates from being applied without coordination.

Together, these mechanisms help protect data consistency during order processing.

### 8. Evidence

Screenshots documenting the experiments are stored in the project's `screenshots` folder. The SQL scripts used for the experiments are stored in the `sql` folder.

### 9. Conclusion

The experiments demonstrated transaction commitment, rollback, transaction isolation configuration, and PostgreSQL locking behaviour. These concepts are essential for maintaining accurate inventory and dependable order processing in a database-backed e-commerce application.
