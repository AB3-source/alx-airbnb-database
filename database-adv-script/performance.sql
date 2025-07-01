-- Initial complex query retrieving bookings with user, property, and payment details
SELECT 
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email,
    
    properties.id AS property_id,
    properties.name AS property_name,
    properties.location,
    
    payments.id AS payment_id,
    payments.amount,
    payments.payment_date,
    payments.status

FROM 
    bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id;
