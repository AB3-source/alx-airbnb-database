# 🏗️ Airbnb Clone – Database Schema

This directory contains the SQL script to create the core relational schema for the backend of the Airbnb Clone project.

## 📁 Files

- `schema.sql`: Defines the full database schema with constraints and indexes.
- `README.md`: Description of schema purpose and usage.

## 📌 Description

The schema defines six main entities:
1. **Users** – Stores guest, host, and admin data.
2. **Properties** – Listings created by hosts.
3. **Bookings** – Reservation records tied to properties and users.
4. **Payments** – One-to-one relationship with bookings for transaction records.
5. **Reviews** – Guest feedback on properties.
6. **Messages** – Direct communication between users.

## 🔐 Constraints

- Unique emails for users.
- Enum-like checks for roles, status, and payment methods.
- Proper foreign keys with `ON DELETE CASCADE`.
- Indexes on frequently queried fields for performance.

## 🧪 How to Run

Use a PostgreSQL-compatible environment. Enable `pgcrypto` for UUID support:

```sql
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
