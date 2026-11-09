
# ExpressMall Database Normalisation

## 1. Introduction

Normalisation is the process of organising data in a relational database to reduce unnecessary duplication, improve data integrity, and prevent insertion, update, and deletion anomalies.

The ExpressMall perfume shop database applies the principles of First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF).

The database separates customer, brand, perfume, order, order item, and payment information into related tables. This approach helps maintain consistent records and supports efficient database management.

## 2. First Normal Form (1NF)

First Normal Form requires that:

- Each table contains rows that can be uniquely identified.
- Each field contains a single, atomic value.
- Repeating groups of values are not stored in the same field.

The ExpressMall database follows 1NF by storing customer names, email addresses, perfume names, prices, and stock quantities in individual fields.

For example, multiple perfumes purchased in a single order are not stored in one field. Instead, each perfume is represented by a separate record in the `order_items` table.

The `customers`, `brands`, `perfumes`, `customer_orders`, `order_items`, and `payments` tables use appropriate primary keys to identify their records.

Therefore, the design satisfies the principles of 1NF.

## 3. Second Normal Form (2NF)

Second Normal Form requires a table to satisfy 1NF and every non-key attribute to depend on the whole candidate key rather than only part of a composite key.

The `order_items` table uses a composite primary key consisting of:

- `order_id`
- `perfume_id`

The attributes `quantity` and `unit_price` describe the quantity and purchase price of a particular perfume within a particular order. They depend on the combination of `order_id` and `perfume_id`.

For example, the quantity of a perfume purchased in one order may differ from the quantity purchased in another order.

Customer details are stored in the `customers` table, while perfume descriptions and brand information are stored in their respective tables. This prevents attributes that depend only on one part of the composite key from being unnecessarily repeated in `order_items`.

The remaining tables use single-column primary keys, so their non-key attributes depend on their respective primary keys.

Therefore, the design supports 2NF.

## 4. Third Normal Form (3NF)

Third Normal Form requires a table to satisfy 2NF and have no inappropriate transitive dependencies of non-key attributes on a primary key.

In the ExpressMall database, customer information is stored in the `customers` table. The `customer_orders` table references customers through `customer_id` instead of repeating customer names, email addresses, and phone numbers in every order.

Similarly, brand information is stored in the `brands` table. The `perfumes` table references brands through `brand_id`, avoiding unnecessary repetition of brand names and countries of origin.

Payment information is stored in the `payments` table, while order information is maintained in `customer_orders`.

The `order_items` table stores `unit_price` as the price of a perfume at the time of purchase. This is intentional because the current price of a perfume may change after an order has been placed. The historical purchase price is therefore associated with the order item rather than being derived from the current perfume price.

These relationships help prevent transitive dependencies and unnecessary duplication.

Therefore, the database is designed to satisfy 3NF, subject to the stated keys and functional dependencies.

## 5. Summary of the Normalised Tables

| Table | Purpose |
|---|---|
| `customers` | Stores customer details |
| `brands` | Stores perfume brand information |
| `perfumes` | Stores perfume product details, prices, and stock |
| `customer_orders` | Stores customer order information |
| `order_items` | Stores perfumes, quantities, and purchase prices within orders |
| `payments` | Stores payment records associated with orders |

The separation of these tables reduces unnecessary duplication and supports the integrity of the database.

## 6. Conclusion

The ExpressMall database uses normalisation principles to organise business information into related tables.

The design applies 1NF through atomic values and identifiable records, 2NF through the removal of partial dependencies, and 3NF through the separation of attributes that depend on other non-key attributes.

Primary keys, foreign keys, unique constraints, and check constraints further support data integrity.

The resulting relational structure provides a reliable foundation for managing customers, perfume inventory, orders, and payments.
