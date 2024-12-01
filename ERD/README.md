## Overview

The ERD represents the relationships between key entities in the system, including:

- **Users:** Can be guests, hosts, or admins. They can make bookings, provide reviews, and send messages.
- **Properties:** Accommodation options listed by hosts. Each property can have multiple bookings and reviews.
- **Bookings:** Reservations made by users for properties. A booking is linked to a user and a property.
- **Payments:** Transactions made for bookings. Each payment is linked to a specific booking.
- **Reviews:** Feedback provided by users about properties. Each review is linked to both a user and a property.
- **Messages:** Communication between users regarding properties or bookings.

## Relationships

- A **User** can have multiple **Bookings**, **Reviews**, and **Messages**.
- A **Property** can have multiple **Bookings** and **Reviews**.
- A **Booking** is linked to a **User** and a **Property**.
- A **Payment** is linked to a **Booking**.
- A **Review** is linked to both a **User** and a **Property**.

The ERD outlines these relationships, ensuring the database structure is optimized for user interactions and property management.
