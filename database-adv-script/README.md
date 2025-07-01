# Advanced SQL Joins – Airbnb Clone Project

This directory contains advanced SQL queries using different types of JOINs as part of the Airbnb clone database project.

## Files

- `joins_queries.sql`: Contains SQL queries demonstrating INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.
- `README.md`: Documentation for the queries and their purposes.

## Queries Description

### 1. INNER JOIN – Bookings with Users
Retrieves all bookings that have a matching user in the database.

```sql
SELECT ... FROM bookings
INNER JOIN users ON bookings.user_id = users.id;
# SQL Subqueries – Airbnb Clone Project

This directory contains SQL queries that demonstrate the use of both correlated and non-correlated subqueries.

## Files

- `subqueries.sql`: Contains SQL queries using different types of subqueries.
- `README.md`: Documentation for the subqueries and their purposes.

## Queries Description

### 1. Non-Correlated Subquery – Properties with High Ratings
Finds all properties whose average rating (from the reviews table) is greater than 4.0.

```sql
SELECT id, name, location FROM properties
WHERE id IN (
    SELECT property_id FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

---

## 📊 Aggregations and Window Functions

### 1. Total Bookings Per User
Uses the `COUNT()` function and `GROUP BY` to calculate how many bookings each user has made.

```sql
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    COUNT(bookings.id) AS total_bookings
FROM 
    users
LEFT JOIN 
    bookings ON users.id = bookings.user_id
GROUP BY 
    users.id, users.name
ORDER BY 
    total_bookings DESC;
