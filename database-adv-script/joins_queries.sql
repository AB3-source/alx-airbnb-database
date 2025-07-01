-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;


-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    properties.location,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id;


-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
-- Note: FULL OUTER JOIN is not supported in some databases like MySQL. Use UNION for compatibility.
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    users.email,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM 
    users
LEFT JOIN 
    bookings ON users.id = bookings.user_id

UNION

SELECT 
    users.id AS user_id,
    users.name AS user_name,
    users.email,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM 
    bookings
LEFT JOIN 
    users ON bookings.user_id = users.id;
