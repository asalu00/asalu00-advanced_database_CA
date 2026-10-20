
-- Portfolio Three: ExpressMall Transactions and Concurrency
-- Database: Neon PostgreSQL
-- Purpose: Create an isolated test schema for transaction experiments.

CREATE SCHEMA IF NOT EXISTS expressmall_txn_lab;

CREATE TABLE IF NOT EXISTS expressmall_txn_lab.perfumes (
    perfume_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    perfume_name VARCHAR(150) NOT NULL UNIQUE,
    stock_quantity INTEGER NOT NULL CHECK (stock_quantity >= 0),
    unit_price NUMERIC(10, 2) NOT NULL CHECK (unit_price >= 0)
);

CREATE TABLE IF NOT EXISTS expressmall_txn_lab.orders (
    order_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    perfume_id INTEGER NOT NULL
        REFERENCES expressmall_txn_lab.perfumes(perfume_id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    order_status VARCHAR(30) NOT NULL DEFAULT 'Pending'
        CHECK (order_status IN ('Pending', 'Processing', 'Cancelled')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Insert demonstration perfumes only when they do not already exist.
INSERT INTO expressmall_txn_lab.perfumes
    (perfume_name, stock_quantity, unit_price)
VALUES
    ('Oud Royale', 10, 85000.00),
    ('Velvet Rose', 5, 65000.00),
    ('Amber Essence', 1, 120000.00)
ON CONFLICT (perfume_name) DO NOTHING;

-- Verify the initial inventory.
SELECT perfume_id, perfume_name, stock_quantity, unit_price
FROM expressmall_txn_lab.perfumes
ORDER BY perfume_id;
