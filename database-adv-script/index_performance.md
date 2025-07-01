# Index Performance Report – Airbnb Clone Database

This document evaluates how SQL indexes improve the performance of queries in the project.

---

## 🔍 1. Before Indexing (Baseline)

### Query Tested
Total bookings per user:

```sql
SELECT 
    users.id, users.name, COUNT(bookings.id)
FROM 
    users
LEFT JOIN 
    bookings ON users.id = bookings.user_id
GROUP BY 
    users.id;
