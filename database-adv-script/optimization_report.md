# Query Optimization Report

## Objective

The goal of this optimization process was to improve the performance of a complex query that retrieves bookings along with user details, property details, and payment details. The steps involved analyzing the initial query using `EXPLAIN`, identifying performance bottlenecks, and refactoring the query for better efficiency.

## Initial Query Analysis

### Original Query:
```sql
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
