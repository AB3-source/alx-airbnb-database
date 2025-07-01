# Performance Monitoring Report – Airbnb Clone Project

---

## 🎯 Objective

Continuously monitor and refine database performance by analyzing execution plans and applying schema optimizations.

---

## 🧪 Tools Used

- `EXPLAIN`: Inspects how MySQL executes a query and shows if indexes are used.
- `SHOW PROFILE`: Measures performance metrics (e.g., CPU usage, duration) for profiling a running query.

---

## 📌 Query 1: Total Bookings Per User

### SQL

```sql
SELECT 
    users.id, users.name, COUNT(bookings.id) AS total_bookings
FROM 
    users
LEFT JOIN 
    bookings ON users.id = bookings.user_id
GROUP BY 
    users.id;

## 📌 Query 2: Properties with Avg Rating > 4.0
SELECT 
    id, name
FROM 
    properties
WHERE 
    id IN (
        SELECT property_id
        FROM reviews
        GROUP BY property_id
        HAVING AVG(rating) > 4.0
    );

Optional Using SHOW PROFILE (MySQL)
SET profiling = 1;

-- Run the target query
SELECT users.id, users.name, COUNT(bookings.id)
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id;

SHOW PROFILES;
SHOW PROFILE FOR QUERY 1;
