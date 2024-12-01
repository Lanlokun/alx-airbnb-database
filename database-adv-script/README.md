# SQL Joins Documentation

This document explains the SQL queries that demonstrate the use of different types of joins to retrieve data from the database.

## 1. INNER JOIN - Retrieve all bookings and the respective users who made those bookings

This query uses an `INNER JOIN` to fetch bookings along with the users who made those bookings. It matches records from the `Booking` table and the `Users` table based on the `user_id`. Only the bookings with an associated user will be included in the result.

## 2. LEFT JOIN - Retrieve all properties and their reviews, including properties that have no reviews

The `LEFT JOIN` ensures that all properties are included, even if they don't have any reviews. It fetches property details along with any associated reviews from the `Review` table. If a property has no reviews, the result will show `NULL` for the review fields.

## 3. FULL OUTER JOIN - Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user

The `FULL OUTER JOIN` is used to retrieve all users and all bookings, including users without bookings and bookings not linked to a user. This join ensures that all records from both the `Users` and `Booking` tables are included, with `NULL` values where there is no match.

## Conclusion

These queries demonstrate how different types of joins (INNER JOIN, LEFT JOIN, and FULL OUTER JOIN) can be applied to retrieve relevant data from multiple tables, ensuring comprehensive datasets even when some records do not have matching entries.
