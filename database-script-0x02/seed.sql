-- Insert sample users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (gen_random_uuid(), 'Amara', 'Mbaye', 'amara.mbaye@example.com', 'hashedpassword1', '2201234567', 'guest'),
    (gen_random_uuid(), 'Kwame', 'Mensah', 'kwame.mensah@example.com', 'hashedpassword2', '2337654321', 'host'),
    (gen_random_uuid(), 'Ayo', 'Adesanya', 'ayo.adesanya@example.com', 'hashedpassword3', '2348101122334', 'admin');

-- Insert sample properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
    (gen_random_uuid(), (SELECT user_id FROM Users WHERE email = 'kwame.mensah@example.com'), 'Serene Coastal Bungalow', 'A peaceful bungalow with ocean views in Takoradi.', 'Takoradi, Ghana', 200.00),
    (gen_random_uuid(), (SELECT user_id FROM Users WHERE email = 'kwame.mensah@example.com'), 'Safari Lodge', 'An exclusive lodge surrounded by wildlife in Maasai Mara.', 'Maasai Mara, Kenya', 500.00);

-- Insert sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status)
VALUES
    (gen_random_uuid(), 
        (SELECT property_id FROM Property WHERE name = 'Serene Coastal Bungalow'), 
        (SELECT user_id FROM Users WHERE email = 'amara.mbaye@example.com'), 
        '2024-12-10', '2024-12-14', 'confirmed'),
    (gen_random_uuid(), 
        (SELECT property_id FROM Property WHERE name = 'Safari Lodge'), 
        (SELECT user_id FROM Users WHERE email = 'amara.mbaye@example.com'), 
        '2025-01-05', '2025-01-10', 'pending');

-- Insert sample payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    (gen_random_uuid(), 
        (SELECT booking_id FROM Booking WHERE start_date = '2024-12-10'), 
        800.00, '2024-12-01', 'credit_card'),
    (gen_random_uuid(), 
        (SELECT booking_id FROM Booking WHERE start_date = '2025-01-05'), 
        2500.00, '2025-01-01', 'paypal');

-- Insert sample reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
    (gen_random_uuid(), 
        (SELECT property_id FROM Property WHERE name = 'Serene Coastal Bungalow'), 
        (SELECT user_id FROM Users WHERE email = 'amara.mbaye@example.com'), 
        5, 'Breathtaking views and very comfortable stay!'),
    (gen_random_uuid(), 
        (SELECT property_id FROM Property WHERE name = 'Safari Lodge'), 
        (SELECT user_id FROM Users WHERE email = 'amara.mbaye@example.com'), 
        4, 'Amazing safari experience, but the food could be better.');

-- Insert sample messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
    (gen_random_uuid(), 
        (SELECT user_id FROM Users WHERE email = 'amara.mbaye@example.com'), 
        (SELECT user_id FROM Users WHERE email = 'kwame.mensah@example.com'), 
        'Hi Kwame, is the Safari Lodge available for the first week of January?'),
    (gen_random_uuid(), 
        (SELECT user_id FROM Users WHERE email = 'kwame.mensah@example.com'), 
        (SELECT user_id FROM Users WHERE email = 'amara.mbaye@example.com'), 
        'Hi Amara, yes, it’s available. Let me know if you want to confirm your booking.');

