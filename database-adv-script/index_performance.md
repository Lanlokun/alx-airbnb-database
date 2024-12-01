
## Steps to Improve Query Performance

### 1. High-Usage Columns
- **`User` Table:**
  - `user_id`: Often used in `JOIN` operations.
  - `email`: Frequently queried to search for specific users.
  
- **`Booking` Table:**
  - `user_id` and `property_id`: Common columns in `JOIN` conditions.
  - `booking_date`: Frequently filtered to get bookings within a date range.
  
- **`Property` Table:**
  - `property_id`: Used in `JOIN` operations.
  - `location`: Often used for search queries based on location.
  - `price`: Commonly used for filtering and sorting properties.

### 2. SQL Commands to Create Indexes

Below are SQL commands to create indexes on high-usage columns in the `User`, `Booking`, and `Property` tables:

```sql
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


EXPLAIN SELECT * FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE p.location = 'Nairobi' AND b.booking_date BETWEEN '2024-01-01' AND '2024-12-31';


EXPLAIN SELECT * FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE p.location = 'Nairobi' AND b.booking_date BETWEEN '2024-01-01' AND '2024-12-31';