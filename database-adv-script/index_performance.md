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
EXPLAIN Output (Before Index)
	•	Full table scan on bookings
	•	JOIN between users and bookings not using an index
	•	High rows examined

⸻

⚙️ 2. Indexing Strategy

Indexes Created
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

3. After Indexing (Improved Performance)

EXPLAIN Output (After Index)
	•	JOIN between users and bookings uses idx_bookings_user_id
	•	Faster lookup of bookings related to each user
	•	Reduced rows examined (from full table scan to index scan)

