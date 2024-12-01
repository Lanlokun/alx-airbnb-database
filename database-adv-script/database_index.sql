-- Index on user_id in the Users table for faster lookups and JOINs
CREATE INDEX idx_user_id ON Users(user_id);

-- Index on email in the Users table (useful if searching by email)
CREATE INDEX idx_user_email ON Users(email);

-- Index on user_id and property_id in the Booking table for faster JOINs
CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);

-- Index on booking_date in the Booking table (useful for filtering by booking date)
CREATE INDEX idx_booking_date ON Booking(booking_date);

-- Index on property_id in the Property table for faster lookups and JOINs
CREATE INDEX idx_property_id ON Property(property_id);

-- Index on location in the Property table for faster search queries by location
CREATE INDEX idx_property_location ON Property(location);

-- Index on price in the Property table for faster filtering and sorting by price
CREATE INDEX idx_property_price ON Property(price);

-- EXPLAIN ANALYZE for the query before adding indexes
EXPLAIN ANALYZE 
SELECT * 
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE p.location = 'Nairobi' 
AND b.booking_date BETWEEN '2024-01-01' AND '2024-12-31';

-- EXPLAIN ANALYZE for the query after adding indexes
EXPLAIN ANALYZE 
SELECT * 
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE p.location = 'Nairobi' 
AND b.booking_date BETWEEN '2024-01-01' AND '2024-12-31';
