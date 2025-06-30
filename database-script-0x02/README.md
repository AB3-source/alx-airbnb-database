# 🌱 Airbnb Clone – Sample Data Seeding

This directory contains SQL statements that populate the database with sample data to simulate real-world usage.

## 📁 Files

- `seed.sql`: Inserts sample records for users, properties, bookings, payments, reviews, and messages.
- `README.md`: Description of purpose and how to run the seeding script.

## 📌 Sample Data Overview

| Table     | Sample Records                                                                 |
|-----------|---------------------------------------------------------------------------------|
| Users     | Hosts and guests with roles, emails, and phone numbers                         |
| Properties| Two listings: an apartment and a cabin                                         |
| Bookings  | Each property has one confirmed/pending booking                                |
| Payments  | Payments made for the bookings using credit card and PayPal                    |
| Reviews   | Guest reviews with ratings from 1 to 5                                          |
| Messages  | Direct messages between a guest and host                                       |

## 🧪 How to Run

Ensure your database schema has been created and the `pgcrypto` extension is enabled:

```sql
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
