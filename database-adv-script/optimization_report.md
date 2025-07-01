# Query Optimization Report – Airbnb Clone Project

---

## 🎯 Objective

Optimize a complex SQL query that retrieves bookings, users, properties, and payment information.

---

## ⚙️ Initial Query

The initial query used multiple `JOIN`s:

- `JOIN` on `users`, `properties`, and `payments`
- No `WHERE` clause or filtering
- Full row selection (`SELECT *` behavior)

### Problems Identified via `EXPLAIN`

- Full table scans for all joins
- Potential drop of bookings without payments
- No indexes used for joining columns

---

## 🔧 Refactoring Actions

### Changes Made

- Replaced `JOIN payments` with `LEFT JOIN` to preserve bookings without payments.
- Renamed aliases to shorten identifiers for readability and potential parsing speed.
- Ensured indexes exist on:
  - `bookings.user_id`
  - `bookings.property_id`
  - `payments.booking_id`

### Refactored Query

```sql
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_method,
    pay.status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
LEFT JOIN 
    payments pay ON b.id = pay.booking_id;
