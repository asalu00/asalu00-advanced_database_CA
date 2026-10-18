
# ExpressMall Database Normalisation

## Introduction

Normalisation is the process of organising relational database tables to reduce unnecessary data duplication and improve data integrity. The ExpressMall database is designed with the principles of First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF) in mind.

## First Normal Form (1NF)

First Normal Form requires each field to contain a single value and each record to be uniquely identifiable.

In ExpressMall, customer names and email addresses are stored in individual fields. Each perfume is represented by a separate record in the perfumes table. Multiple perfumes in an order are stored as separate records in order_items rather than being placed together in one field.

Therefore, the design follows 1NF by using atomic values and identifiable records.

## Second Normal Form (2NF)

Second Normal Form requires a table to be in 1NF and every non-key attribute to depend on the whole candidate key, not only part of a composite key.

The order_items table has a composite primary key consisting of order_id and perfume_id. The quantity and unit_price describe that particular perfume within that particular order and depend on the combination of both key columns.

Customer details, perfume descriptions, and brand information are stored in their own tables rather than being repeated in order_items.

This supports 2NF.

## Third Normal Form (3NF)

Third Normal Form requires a table to be in 2NF and non-key attributes not to depend transitively on a key through another non-key attribute.

Brand names and country information are stored in brands, while perfume records reference brands through brand_id. Customer information is stored in customers, while customer_orders references customers through customer_id.

This prevents brand and customer details from being unnecessarily repeated in order records.

The order_items table also stores unit_price as the price at the time of purchase. This is intentional because a perfume's current price may change after an order has been placed.

The design therefore aims to satisfy 3NF while preserving historical purchase prices.

## Conclusion

The ExpressMall database separates customers, brands, perfumes, orders, order items, and payments into related tables. Primary keys, foreign keys, unique constraints, and check constraints support data integrity. The normalised design reduces duplication and makes the database easier to maintain.
