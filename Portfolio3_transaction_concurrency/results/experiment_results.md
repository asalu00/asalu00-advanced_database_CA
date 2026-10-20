
# ExpressMall — Portfolio 3 Experiment Results

## Experiment 1: COMMIT

- **Expected:** Inventory update and order are saved permanently.
- **Observed:** Oud Royale stock decreased from 10 to 9, and the test order was created with status `Processing`.
- **Outcome:** Successful.

## Experiment 2: ROLLBACK

- **Expected:** Unwanted changes are reversed.
- **Observed:** Velvet Rose stock temporarily decreased from 5 to 4, then returned to 5. The rollback test order count was 0.
- **Outcome:** Successful.

## Experiment 3: Transaction Isolation

- **Expected:** PostgreSQL reports the configured isolation levels.
- **Observed:** Default `read committed`, test `read committed`, test `repeatable read`, and final default `read committed`.
- **Outcome:** Successful.

## Experiment 4: Concurrency

- **Expected:** A conflicting update waits while another transaction holds a lock.
- **Observed:** Session 1 updated Amber Essence from 1 to 0 without committing. Session 2 waited and received a lock-timeout error. Session 2 was rolled back, Session 1 was committed, and Amber Essence stock was restored to 1.
- **Outcome:** Successful; lock contention was observed and inventory was restored.

## Final Inventory Check

Amber Essence stock quantity after the experiment: **1**.
