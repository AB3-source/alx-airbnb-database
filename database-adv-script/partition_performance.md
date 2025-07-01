# Partitioning Performance Report – Bookings Table

---

## 🧩 Objective

Improve query performance on the large `bookings` table by implementing **RANGE partitioning** on the `start_date` column.

---

## 🔧 Partitioning Strategy

Partitioned the `bookings` table by **year** using:

```sql
PARTITION BY RANGE (YEAR(start_date))
