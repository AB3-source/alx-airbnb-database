-- Create index on bookings.user_id for JOINs and filters
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on bookings.property_id for JOINs and aggregation
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create index on reviews.property_id for JOINs
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Create index on users.id (typically already a primary key, but listed for completeness)
CREATE INDEX idx_users_id ON users(id);

-- Create index on properties.id (also usually a primary key)
CREATE INDEX idx_properties_id ON properties(id);
