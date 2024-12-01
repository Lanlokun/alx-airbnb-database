# Partitioning Implementation Report

## Objective
The goal of implementing table partitioning was to optimize queries on the `Booking` table, particularly for queries filtering by the `start_date` column. The table was partitioned by year, which should reduce query execution time by limiting the number of rows scanned.

## Partitioning Strategy
We partitioned the `Booking` table by the `start_date` column using a range partitioning method. Each partition corresponds to a year (e.g., `Booking_2020`, `Booking_2021`, etc.). The partitioning allows the database to efficiently route queries to only the relevant partition.

## Query Performance Before and After Partitioning

### Before Partitioning:
- Queries that filtered by `start_date` (e.g., fetching bookings for a specific year) required a full table scan, which was slow when the table had a large number of rows.

### After Partitioning:
- Queries filtering by `start_date` now only scan the relevant partition, significantly reducing the number of rows processed.
- For example, a query fetching bookings from the year 2022 will only scan the `Booking_2022` partition, rather than the entire table.

## Observed Improvements
1. **Faster Query Execution**: The execution time for queries fetching data from specific date ranges was significantly reduced. This is especially noticeable in large datasets where the `Booking` table contains millions of rows.
   
2. **Reduced Disk I/O**: Since only the relevant partition is scanned, there is a reduction in the amount of data read from disk, leading to faster query responses.

3. **Improved Maintainability**: Partitioning helps manage large tables by breaking them into smaller, more manageable pieces. Maintenance tasks like backups and optimizations are easier to handle.

## Conclusion
Partitioning the `Booking` table by `start_date` has significantly improved the performance of queries that filter by date range. The partitioning strategy has reduced the number of rows processed and optimized query execution time. Future improvements could include further partitioning strategies (e.g., monthly partitions) or indexing partitions for even faster query performance.
