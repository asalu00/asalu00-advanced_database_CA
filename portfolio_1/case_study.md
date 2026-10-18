
# Portfolio 1: Database Design and Modelling

## Case Study: ExpressMall Perfume Shop

### 1. Introduction

ExpressMall is a simulated retail business that sells perfumes from different brands. The business needs a structured database to manage its customers, perfume inventory, customer orders, order items, and payments.

The proposed database uses PostgreSQL and is hosted on Neon, a managed PostgreSQL platform.

### 2. Purpose of the Database

The purpose of the ExpressMall database is to organise business information accurately, reduce unnecessary data duplication, maintain relationships between records, and support reliable retrieval of information.

### 3. Database Users

The main users of the system are:

- Shop administrators, who manage perfume brands and inventory.
- Sales staff, who record customer orders.
- Customers, whose contact and order information is stored.
- Payment and management staff, who review payment records and order statuses.

### 4. Major Data to Be Stored

The database stores the following information:

- Customers: names, email addresses, phone numbers, and registration dates.
- Brands: brand names and countries of origin.
- Perfumes: product names, brands, scent types, sizes, prices, and stock quantities.
- Customer orders: customers placing orders, order dates, and order statuses.
- Order items: perfumes included in each order, quantities, and prices at the time of purchase.
- Payments: payment amounts, methods, statuses, dates, and transaction references.

### 5. Main Database Operations

The database is designed to support the following operations:

1. Register customers and maintain their contact information.
2. Add and manage perfume brands and products.
3. Check available perfume stock and prices.
4. Record customer orders and their items.
5. Track order processing and delivery statuses.
6. Record and retrieve payment information.
7. Retrieve information using SQL queries and relationships between tables.

### 6. Proposed Database Design

The database contains six related tables: customers, brands, perfumes, customer_orders, order_items, and payments.

Primary keys uniquely identify records. Foreign keys maintain relationships between related tables. Constraints help prevent invalid data, while normalisation reduces unnecessary duplication and update anomalies.

### 7. Expected Outcome

The proposed ExpressMall database will provide a structured foundation for managing perfume inventory, customer orders, and payments. It will also support further work on SQL querying, query optimisation, transactions, and advanced database concepts in later portfolio activities.
