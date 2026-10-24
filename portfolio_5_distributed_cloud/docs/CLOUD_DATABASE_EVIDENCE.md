
# Portfolio 5: Cloud Database Evidence

## 1. Cloud Database Service
MongoDB Atlas was used as the managed cloud database service for the ExpressMall perfume store case study.

## 2. Connection Test
The JavaScript script `scripts/connect_cloud_database.js` connected to the Atlas cluster using a connection string stored in the `MONGODB_URI` environment variable.

The script successfully ran a database ping command against `expressmall_nosql`.

**Evidence:** `screenshots/01-cloud-database-connection-success.png`

## 3. Database and Collection Check
The JavaScript script `scripts/check_cloud_database.js` connected to the cloud database and listed the collections available in `expressmall_nosql`.

**Evidence:** `screenshots/02-cloud-database-collections.png`

## 4. Relevance to ExpressMall
Using a managed cloud database gives ExpressMall a way to access its data without maintaining its own physical database server. The service provides cloud infrastructure features, but availability, backups, access controls, and recovery settings must be configured and verified separately.

## 5. Limitations
These tests confirm that the application connected to MongoDB Atlas and inspected the database collections. They do not, by themselves, prove that replication failover, sharding, or disaster recovery has been tested.
