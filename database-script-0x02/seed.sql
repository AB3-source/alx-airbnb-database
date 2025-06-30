-- Airbnb Clone – Sample Data Seeding
-- File: seed.sql

-- Ensure pgcrypto is enabled for UUID generation
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- === USERS ===
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pwd_1', '0241234567', 'host'),
    (gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pwd_2', '0559876543', 'guest'),
    (gen_random_uuid(), 'Clara', 'Nguyen', 'clara@example.com', 'hashed_pwd_3', '0263456789', 'guest'),
    (gen_random_uuid(), 'David', 'Brown', 'david@example.com', 'hashed_pwd_4', '0201122334', 'host');

-- Get host user IDs
WITH host_ids AS (
    SELECT user_id, email FROM users WHERE role = 'host'
)
-- === PROPERTIES ===
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
    (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'alice@example.com'), 'Ocean View Apartment', 'Beautiful sea view with modern facilities', 'Accra, Ghana', 150.00),
    (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'david@example.com'), 'Mountain Cabin', 'Cozy cabin in the hills perfect for a weekend getaway', 'Aburi, Ghana', 100.00);

-- === BOOKINGS ===
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    (gen_random_uuid(),
     (SELECT property_id FROM properties WHERE name = 'Ocean View Apartment'),
     (SELECT user_id FROM users WHERE email = 'bob@example.com'),
     '2025-07-01', '2025-07-05', 600.00, 'confirmed'),

    (gen_random_uuid(),
     (SELECT property_id FROM properties WHERE name = 'Mountain Cabin'),
     (SELECT user_id FROM users WHERE email = 'clara@example.com'),
     '2025-08-10', '2025-08-12', 200.00, 'pending');

-- === PAYMENTS ===
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
    (gen_random_uuid(),
     (SELECT booking_id FROM bookings WHERE total_price = 600.00),
     600.00, 'credit_card'),

    (gen_random_uuid(),
     (SELECT booking_id FROM bookings WHERE total_price = 200.00),
     200.00, 'paypal');

-- === REVIEWS ===
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
    (gen_random_uuid(),
     (SELECT property_id FROM properties WHERE name = 'Ocean View Apartment'),
     (SELECT user_id FROM users WHERE email = 'bob@example.com'),
     5, 'Amazing view and clean space!'),

    (gen_random_uuid(),
     (SELECT property_id FROM properties WHERE name = 'Mountain Cabin'),
     (SELECT user_id FROM users WHERE email = 'clara@example.com'),
     4, 'Very peaceful. Could use better WiFi.');

-- === MESSAGES ===
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
    (gen_random_uuid(),
     (SELECT user_id FROM users WHERE email = 'bob@example.com'),
     (SELECT user_id FROM users WHERE email = 'alice@example.com'),
     'Hi Alice, can I check in early on July 1st?'),

    (gen_random_uuid(),
     (SELECT user_id FROM users WHERE email = 'alice@example.com'),
     (SELECT user_id FROM users WHERE email = 'bob@example.com'),
     'Sure! Early check-in is fine.');
