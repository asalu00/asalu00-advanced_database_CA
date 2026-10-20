
# ExpressMall E-Commerce: Transactions and Concurrency Control

## 1. Project Overview

ExpressMall is a sample e-commerce perfume store that allows customers to browse perfumes and place orders. This portfolio builds on the database design and SQL optimisation work completed in Portfolios One and Two. It demonstrates how PostgreSQL transactions, isolation levels, and concurrency controls help maintain consistent inventory and order data.

## 2. Business Problem

ExpressMall may receive multiple customer orders at the same time. When stock is limited, concurrent purchase attempts can create a risk of overselling if inventory changes are not handled safely. Incomplete transactions can also leave order and inventory data inconsistent.

For example, two customers may attempt to purchase the last bottle of a perfume. The database must coordinate their updates so that stock is not incorrectly reduced below the available quantity.

## 3. Project Aim

To demonstrate how transactions, rollback, transaction isolation, and concurrency control help protect ExpressMall's inventory and order records in PostgreSQL.

## 4. Objectives

- Demonstrate transaction handling with BEGIN, COMMIT, and ROLLBACK.
- Observe the effect of a committed order and its inventory update.
- Verify that a rolled-back test does not leave its test order or inventory change in place.
- Examine READ COMMITTED and REPEATABLE READ isolation settings.
- Use two database sessions to observe row-level locking during competing inventory updates.
- Document the experiments using SQL scripts, query results, and screenshots.

## 5. Environment and Scope

The experiments were performed in a Neon PostgreSQL test database using the `expressmall_txn_lab` schema and its `perfumes` and `orders` tables. The work used sample ExpressMall data and focused on transaction behaviour, inventory consistency, isolation settings, and concurrent updates. It was a learning exercise rather than a production deployment.

## 6. Experiments Performed

### 6.1 COMMIT

A test order was inserted for Portfolio Test Customer and the stock quantity for Oud Royale was reduced from 10 to 9. The transaction was committed, and subsequent verification showed the order and inventory change persisted.

### 6.2 ROLLBACK

A test transaction temporarily reduced Velvet Rose stock from 5 to 4 and attempted to create a test order. After ROLLBACK, stock returned to 5 and the Rollback Test Customer order count was 0, confirming that the test changes were not retained.

### 6.3 Transaction Isolation

The database's default isolation level was checked as READ COMMITTED. The experiment also explicitly set READ COMMITTED and REPEATABLE READ and verified the reported isolation settings. These checks demonstrated how PostgreSQL reports the isolation level used by a transaction.

### 6.4 Concurrent Inventory Updates

Two database sessions attempted to reduce Amber Essence stock when one unit was available. Session 1 updated the row without immediately committing. Session 2 attempted a competing update with a five-second lock timeout and received a lock-timeout error while waiting for the row. Session 2 was rolled back, Session 1 was committed, and the test inventory was then restored to one unit. This demonstrated row-level locking and the importance of checking stock and handling concurrent updates safely.

## 7. Deliverables and Evidence

The portfolio includes SQL scripts for schema setup, commit and rollback tests, transaction isolation checks, and concurrency testing. Supporting documentation and screenshots record the commands, outputs, and observed results.

## 8. Limitations

The experiments used a small test dataset and a controlled two-session scenario. They demonstrate basic PostgreSQL transaction behaviour but do not represent a full production checkout system. A production implementation would also need carefully designed order and payment workflows, error handling, appropriate constraints, and testing under realistic concurrent workloads.

## 9. Conclusion

The experiments showed that COMMIT preserves successful transaction changes, while ROLLBACK discards uncommitted changes. The isolation checks confirmed the configured transaction levels, and the two-session test demonstrated how row-level locking can make a competing inventory update wait and eventually time out. Together, these results illustrate why transaction management and safe inventory updates are important for ExpressMall.
