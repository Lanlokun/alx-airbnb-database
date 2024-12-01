
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