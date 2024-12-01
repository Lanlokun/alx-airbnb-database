# Performance Optimization Report

## Objective
The objective of this task was to continuously monitor and improve the performance of frequently used queries by analyzing query execution plans using `EXPLAIN ANALYZE`, identifying bottlenecks, and making necessary schema adjustments.

## Initial Analysis
We analyzed two frequently run queries:
1. A query joining `Booking`, `Users`, and `Property` to fetch bookings for a given date range.
2. A query joining `Booking`, `Property`, and `Users` to fetch bookings for a specific property.

Both queries were found to be inefficient due to the use of sequential scans on large tables, especially the `Booking` table.

## Identified Bottlenecks
- **Sequential Scans**: The `Booking` table was being scanned sequentially for filtering by `start_date` and `user_id`, causing delays.
- **Joins**: The queries involved multiple joins, which also contributed to performance issues when indexes were not in place.

## Proposed Changes
1. **Indexes**: We created indexes on frequently queried columns such as `user_id` and `start_date` in the `Booking` table, and `property_id` in the `Property` table.
2. **Partitioning**: For large datasets, we recommended partitioning the `Booking` table by `start_date` to reduce the amount of data scanned when filtering by date range.

## Implemented Changes
- Created the following indexes:
  - `idx_booking_user_start_date` on `Booking(user_id, start_date)`
  - `idx_property_id` on `Property(property_id)`
- Ran tests using `EXPLAIN ANALYZE` before and after the changes.

## Observed Improvements
1. **Reduced Execution Time**: After implementing the indexes, the query execution time decreased significantly.
2. **Index Scans**: The database now uses index scans instead of sequential scans, improving query performance.
3. **Faster Joins**: The join operations were optimized with the creation of appropriate indexes.

## Conclusion
By implementing the recommended changes, the query performance has improved substantially. Further optimizations may include reviewing query logic and considering partitioning for even larger datasets. Regular monitoring and adjustments should be made to maintain optimal database performance.
