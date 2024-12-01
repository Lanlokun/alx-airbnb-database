# Database Schema Definition

This project involves creating a normalized database schema for a property rental application. The schema is designed to meet the requirements of the third normal form (3NF) while ensuring data integrity and optimal performance.

## Features
- **Entities:** Users, Properties, Bookings, Payments, Reviews, and Messages.
- **Relationships:** 
  - Users can own properties (`host_id` as a foreign key in `Property`).
  - Users can book properties (`user_id` and `property_id` in `Booking`).
  - Users can leave reviews on properties.
  - Users can send and receive messages.
  - Payments are tied to bookings.
- **Constraints:**
  - All relationships are managed through `FOREIGN KEY` constraints with cascading updates and deletions.
  - ENUM and CHECK constraints ensure valid data input (e.g., valid roles, ratings, and payment methods).

## Tables Overview
- **Users:** Stores user information such as name, email, role, and timestamps.
- **Property:** Represents properties listed by users with details like description, location, and price.
- **Booking:** Tracks property reservations, including status and date ranges.
- **Payment:** Handles payments associated with bookings.
- **Review:** Stores ratings and comments left by users for properties.
- **Message:** Records messages exchanged between users.

## SQL Features
- **Data Types:** Appropriate data types like `VARCHAR`, `UUID`, `TEXT`, and `DECIMAL` are used.
- **Primary Keys:** Each table has a unique primary key (`UUID`).
- **Indexes:** Indexes are added to optimize search performance on frequently queried fields.
- **Timestamps:** Automated timestamp fields (`created_at`, `updated_at`) are included for tracking.

## Setup Instructions
1. Run the SQL `CREATE TABLE` queries in the provided script to initialize the database schema.
2. Ensure your database supports the `UUID` type and ENUM (e.g., PostgreSQL or MySQL).
3. Use the defined indexes for efficient querying and optimal database performance.

## Author
This database schema is designed to ensure scalability, data integrity, and efficiency for a property rental application. Feel free to reach out with suggestions or improvements!
