
# Portfolio 5: Distributed and Cloud Database Exercise

## Case Study: ExpressMall E-Commerce

### 1. Introduction
ExpressMall is an online perfume store that sells different perfume brands and products. The business stores customer details, product information, orders, and stock quantities in a database. As the business grows, it needs a database system that remains available, handles increasing customer traffic, and protects data from loss.

### 2. Business Problem
If ExpressMall stores all its data on a single database server, that server could become a point of failure. If it becomes unavailable, customers may be unable to browse perfumes or place orders. A large increase in customers and orders may also affect database performance.

### 3. Distributed Database Solution
ExpressMall can use a cloud-hosted database architecture to improve availability, scalability, and reliability. Database replication can maintain copies of data on multiple database servers. If one server becomes unavailable, a replica may help keep the service running, depending on the database configuration.

Sharding can divide a large dataset across multiple database servers. For example, ExpressMall could distribute order records using a suitable customer or order-based shard key. Sharding would require careful planning to avoid uneven data distribution and unnecessary cross-shard queries.

### 4. Replication and Availability
Replication keeps copies of database data on separate database nodes. It can improve read availability and support recovery from some server failures. The system must be configured correctly, and replication does not replace independent backups.

For ExpressMall, replicated data could help keep perfume and order information accessible when a database node experiences a failure.

### 5. Consistency and Data Integrity
Consistency means that database operations follow the system's rules and that users do not receive unacceptable conflicting data. ExpressMall must pay particular attention to perfume stock quantities. If two customers attempt to purchase the last bottle at the same time, the system must prevent overselling.

The database should use suitable atomic updates, transaction controls, and consistency settings. The application should also handle failed operations and verify order status before confirming a purchase.

### 6. Cloud Deployment
A managed cloud database can reduce the need for ExpressMall to maintain physical database servers. The business should configure access controls, network restrictions, backups, monitoring, and secure connection credentials. Database costs and service limits should be reviewed as usage grows.

### 7. Expected Benefits
- Improved availability through suitable replication and recovery arrangements.
- Ability to scale storage and processing as the business grows.
- Better resilience against individual server failures.
- Flexible cloud deployment and managed database maintenance.
- Improved planning for data consistency and stock management.

### 8. Risks and Limitations
Distributed databases introduce additional complexity. Replication may have delays, sharding requires a suitable shard key, and cloud services can incur costs. Poorly configured permissions or exposed credentials can also put customer information at risk. ExpressMall should test recovery procedures and monitor performance before relying on the system for production orders.

### 9. Conclusion
A distributed and cloud database architecture can help ExpressMall support business growth and improve availability. The most suitable design depends on workload, budget, consistency requirements, and recovery objectives. Replication, sharding, secure cloud configuration, backups, and careful stock-update logic should be evaluated together before deployment.
