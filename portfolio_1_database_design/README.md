
# ExpressMall — Portfolio 1

## Database Design and Modelling

This folder contains the Portfolio 1 deliverables for the ExpressMall perfume shop case study. The project focuses on designing a relational database to manage customers, perfume products, brands, customer orders, order items, and payments.

## Project Deliverables

### Files

- `case_study.md` — Description of the business, its challenges, and database requirements.
- `normalisation.md` — Explanation of database normalisation, covering First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF).
- `expressmall_schema.sql` — PostgreSQL script containing table definitions, primary keys, foreign keys, constraints, and indexes.
- `er_diagram.mmd` — Editable Mermaid source code for the entity-relationship diagram.
- `er_diagram.png` — Exported image of the entity-relationship diagram.

## Database Platform

- **Database system:** PostgreSQL
- **Hosting platform:** Neon.tech
- **Database schema:** `expressmall`

## Database Structure

The ExpressMall database contains six main tables:

1. `customers` — Stores customer information.
2. `brands` — Stores perfume brand information.
3. `perfumes` — Stores perfume details, prices, and available stock.
4. `customer_orders` — Records customer orders and their statuses.
5. `order_items` — Records the perfumes and quantities included in each order.
6. `payments` — Stores payment details and transaction information.

The tables are connected through primary keys and foreign keys to maintain relationships and data integrity.

## Verification

The database schema was executed using Neon PostgreSQL.

The following screenshots are included in the `screenshots` folder as evidence:

- `01-neon-schema-success.png` — Shows successful execution of the database schema.
- `02-expressmall-database-tables.png` — Shows the six tables created in the `expressmall` schema.

## AI Use Declaration

AI assistance was used during the development of this portfolio to help draft and explain aspects of the database design, SQL schema, ER diagram source code, and normalisation documentation.

The student is responsible for reviewing the submitted work, testing the SQL against the database, correcting errors, and understanding the database design and implementation.
