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
