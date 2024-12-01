    SELECT 
    b.booking_id, 
    b.start_date, 
    b.end_date, 
    u.first_name AS user_first_name, 
    u.last_name AS user_last_name
FROM 
    Booking b
INNER JOIN 
    Users u ON b.user_id = u.user_id;


SELECT 
    p.property_id, 
    p.name AS property_name, 
    p.location, 
    r.rating, 
    r.comment
FROM 
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id;



SELECT 
    u.user_id, 
    u.first_name AS user_first_name, 
    u.last_name AS user_last_name, 
    b.booking_id, 
    b.start_date, 
    b.end_date
FROM 
    Users u
FULL OUTER JOIN 
    Booking b ON u.user_id = b.user_id;