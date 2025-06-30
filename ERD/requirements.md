### Entities & Key Attributes:

#### 🧑 User
- user_id *(PK)*, first_name, last_name, email *(unique)*, password_hash, phone_number, role *(ENUM)*, created_at

#### 🏠 Property
- property_id *(PK)*, host_id *(FK → User)*, name, description, location, pricepernight, created_at, updated_at

#### 📅 Booking
- booking_id *(PK)*, property_id *(FK)*, user_id *(FK)*, start_date, end_date, total_price, status *(ENUM)*, created_at

#### 💳 Payment
- payment_id *(PK)*, booking_id *(FK)*, amount, payment_date, payment_method *(ENUM)*

#### 📝 Review
- review_id *(PK)*, property_id *(FK)*, user_id *(FK)*, rating *(1–5)*, comment, created_at

#### 💬 Message
- message_id *(PK)*, sender_id *(FK)*, recipient_id *(FK)*, message_body, sent_at

### Relationships:
- One user (host) → Many properties
- One user (guest) → Many bookings
- One property → Many bookings
- One booking → One payment
- One user → Many reviews
- One property → Many reviews
- One user → Many messages (sent/received)
- 
## 📊 Entity-Relationship Diagram

![ER Diagram](./airbnb_er_diagram.png)

Or view/download it here:  
📎 [Download ER Diagram](./airbnb_er_diagram.png
