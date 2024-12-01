-- Initial query to retrieve all bookings, user details, property details, and payment details
SELECT 
    b.booking_id, 
    b.booking_date, 
    u.user_id, 
    u.name AS user_name, 
    u.email AS user_email, 
    p.property_id, 
    p.location AS property_location, 
    p.price AS property_price, 
    p.description AS property_description, 
    pay.payment_id, 
    pay.payment_date, 
    pay.amount AS payment_amount 
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id;

-- Analyze the performance of the initial query using EXPLAIN
EXPLAIN 
SELECT 
    b.booking_id, 
    b.booking_date, 
    u.user_id, 
    u.name AS user_name, 
    u.email AS user_email, 
    p.property_id, 
    p.location AS property_location, 
    p.price AS property_price, 
    p.description AS property_description, 
    pay.payment_id, 
    pay.payment_date, 
    pay.amount AS payment_amount 
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id;

SELECT 
    b.booking_id, 
    b.booking_date, 
    u.user_id, 
    u.name AS user_name, 
    p.property_id, 
    p.location AS property_location, 
    p.price AS property_price, 
    pay.payment_id, 
    pay.payment_date, 
    pay.amount AS payment_amount 
FROM Booking b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE pay.payment_id IS NOT NULL
AND p.price > 0;  -- Additional filter to exclude properties with no price set

-- Analyze the performance of the refactored query using EXPLAIN
EXPLAIN 
SELECT 
    b.booking_id, 
    b.booking_date, 
    u.user_id, 
    u.name AS user_name, 
    p.property_id, 
    p.location AS property_location, 
    p.price AS property_price, 
    pay.payment_id, 
    pay.payment_date, 
    pay.amount AS payment_amount 
FROM Booking b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE pay.payment_id IS NOT NULL;
