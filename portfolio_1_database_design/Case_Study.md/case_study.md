
# Portfolio 1: Database Design and Modelling

## Case Study: ExpressMall Perfume Shop

### 1. Introduction

ExpressMall is a simulated e-commerce business that specialises in selling perfumes from different brands. The business offers a variety of fragrance products to customers and requires an organised system for managing customer information, perfume inventory, sales orders, order items, and payments.

As the business grows, managing these records manually or using disconnected spreadsheets can lead to data duplication, inaccurate stock information, inconsistent records, and difficulties retrieving transaction details.

To address these challenges, this portfolio proposes a relational database designed using PostgreSQL and hosted on Neon, a managed PostgreSQL platform. The database provides a structured approach to storing and managing ExpressMall's business information.

### 2. Problem Statement

ExpressMall requires a reliable database system to manage its daily business activities. Without a properly designed database, the business may experience the following problems:

- Duplication of customer and product information.
- Difficulty tracking perfume stock quantities.
- Inconsistent recording of customer orders and payments.
- Challenges retrieving order and payment histories.
- Increased risk of data entry errors and update anomalies.
- Difficulty maintaining relationships between customers, orders, and products.

A well-designed relational database can help reduce these problems by organising data into related tables and enforcing appropriate constraints.

### 3. Purpose and Objectives of the Database

The purpose of the ExpressMall database is to provide a structured and reliable system for managing perfume shop operations.

The main objectives are to:

1. Store customer information accurately.
2. Maintain records of perfume brands and products.
3. Track perfume prices and available stock quantities.
4. Record customer orders and the products included in each order.
5. Maintain order processing and delivery statuses.
6. Store payment amounts, methods, statuses, and transaction references.
7. Reduce unnecessary data duplication through normalisation.
8. Maintain data integrity through primary keys, foreign keys, and constraints.
9. Support efficient retrieval of business information using SQL queries.

### 4. Database Users

The main users of the ExpressMall database include:

- **Shop Administrators:** Manage perfume brands, product information, prices, and inventory.
- **Sales Staff:** Register customer orders and record the products purchased.
- **Customers:** Provide contact information and place orders through the business.
- **Payment Staff:** Record and review payment information and transaction statuses.
- **Management:** Retrieve business information for monitoring sales, inventory, orders, and payments.

These users require accurate and consistent information to support the effective operation of the business.

### 5. Major Data Requirements

The database is designed to store the following categories of information:

#### 5.1 Customers

Stores customer details, including full names, email addresses, phone numbers, and registration dates.

#### 5.2 Brands

Stores perfume brand information, including brand names and countries of origin.

#### 5.3 Perfumes

Stores perfume product information, including product names, associated brands, scent types, sizes, unit prices, and stock quantities.

#### 5.4 Customer Orders

Stores information about customer orders, including the customer who placed the order, the order date, and the current order status.

#### 5.5 Order Items

Stores the individual perfumes included in each order, together with the quantities purchased and the unit prices recorded at the time of purchase.

#### 5.6 Payments

Stores payment information, including payment dates, amounts, payment methods, payment statuses, and transaction references.

### 6. Main Database Operations

The ExpressMall database is designed to support the following operations:

1. Register customers and maintain their contact information.
2. Add and manage perfume brands.
3. Add new perfumes and update product information.
4. Check perfume prices and available stock quantities.
5. Record customer orders.
6. Record the individual products and quantities included in each order.
7. Update order statuses during processing and delivery.
8. Record and retrieve payment information.
9. Retrieve customer order histories.
10. Generate SQL queries to support inventory, order, and payment reporting.

### 7. Proposed Database Design

The proposed database contains six related tables:

- `customers`
- `brands`
- `perfumes`
- `customer_orders`
- `order_items`
- `payments`

The tables are connected through primary key and foreign key relationships.

The `customers` table is related to `customer_orders`, because a customer can place multiple orders. The `brands` table is related to `perfumes`, because a brand can have multiple perfume products. The `customer_orders` table is related to `order_items`, while the `perfumes` table identifies the products included in those order items.

The `payments` table stores payment records associated with customer orders.

Primary keys uniquely identify records, while foreign keys maintain relationships between related tables. Additional constraints help prevent invalid data, such as negative prices, invalid stock quantities, and unsupported order statuses.

The database design also applies normalisation principles to reduce unnecessary data duplication and minimise insertion, update, and deletion anomalies.

### 8. Scope and Limitations

The scope of this portfolio covers the design and implementation of a relational database for the core operations of ExpressMall.

The database focuses on:

- Customer information management.
- Perfume brand and product management.
- Inventory tracking.
- Customer order management.
- Order item recording.
- Payment record management.

The project is a simulated academic database system. It does not include a complete customer-facing e-commerce website, live payment gateway integration, delivery service integration, or automated notification system.

These features may be considered for future development.

### 9. Expected Outcome

The proposed ExpressMall database is expected to provide a structured foundation for managing perfume inventory, customers, orders, and payments.

The design aims to improve data consistency, reduce unnecessary duplication, maintain relationships between records, and support reliable retrieval of business information.

The database also provides a foundation for subsequent portfolio activities involving SQL optimisation, transaction management, concurrency control, NoSQL databases, and advanced database concepts.
