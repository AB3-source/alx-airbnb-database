# 📘 Airbnb Clone – Database Normalization (Up to 3NF)

This document explains how the Airbnb Clone database design adheres to normalization principles, particularly ensuring compliance with the **Third Normal Form (3NF)**.

---

## 🔍 Normalization Summary

| Normal Form | Description |
|-------------|-------------|
| **1NF** | Eliminate repeating groups. Each field should contain atomic values only. |
| **2NF** | Remove partial dependencies. All non-key attributes must depend on the whole primary key. |
| **3NF** | Remove transitive dependencies. No non-key attribute should depend on another non-key attribute. |

---

## ✅ Step-by-Step Normalization Review

---

### 1. **User Table**
#### Current Attributes:
- user_id (PK), first_name, last_name, email, password_hash, phone_number, role, created_at

#### Review:
- All attributes are atomic ✅
- All non-key attributes depend on the primary key (user_id) ✅
- No transitive dependencies ✅

✅ **3NF-compliant**

---

### 2. **Property Table**
#### Current Attributes:
- property_id (PK), host_id (FK), name, description, location, pricepernight, created_at, updated_at

#### Review:
- Atomic fields ✅
- host_id correctly references the User table (no duplication of user data) ✅
- No derived or dependent fields like `host_name`, so no transitive dependency ✅

✅ **3NF-compliant**

---

### 3. **Booking Table**
#### Current Attributes:
- booking_id (PK), property_id (FK), user_id (FK), start_date, end_date, total_price, status, created_at

#### Review:
- All fields are atomic ✅
- Each attribute is fully functionally dependent on booking_id ✅
- `total_price` could be a **derived field** (price_per_night × nights), but keeping it for performance is acceptable with documentation. Not a violation.

✅ **3NF-compliant**

---

### 4. **Payment Table**
#### Current Attributes:
- payment_id (PK), booking_id (FK), amount, payment_date, payment_method

#### Review:
- All fields are atomic ✅
- `amount` depends on `booking_id`, and not on any other non-key attribute ✅
- No duplication of user or booking info ✅

✅ **3NF-compliant**

---

### 5. **Review Table**
#### Current Attributes:
- review_id (PK), property_id (FK), user_id (FK), rating, comment, created_at

#### Review:
- Atomic fields ✅
- Each review refers to one property and one user without duplicating details ✅

✅ **3NF-compliant**

---

### 6. **Message Table**
#### Current Attributes:
- message_id (PK), sender_id (FK), recipient_id (FK), message_body, sent_at

#### Review:
- No multi-valued or repeating groups ✅
- Message is atomic and depends on the full primary key ✅

✅ **3NF-compliant**

---

## 🛠 Potential Normalization Improvements

| Field | Concern | Action |
|-------|--------|--------|
| `total_price` in Booking | Technically derivable | Keep as-is for performance; document clearly |
| `role` ENUM in User | ENUMs are acceptable, but could be extracted into a roles table | Keep for simplicity unless roles are managed externally |
| `payment_method` ENUM | Could be normalized into a table of methods | Keep as ENUM unless payment methods are expected to expand/change dynamically |

---

## ✅ Conclusion

The current database schema adheres to **Third Normal Form (3NF)**:
- Each table has a **single, atomic primary key**.
- All non-key attributes are **fully dependent on the primary key**.
- There are **no transitive dependencies**.
- No redundant or repeating groups exist.

This design ensures:
- Data consistency
- Minimal redundancy
- Scalability and maintainability
