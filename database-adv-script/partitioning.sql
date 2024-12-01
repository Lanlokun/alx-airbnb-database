-- Create the Booking table with partitioning based on start_date
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    booking_date TIMESTAMP,
    amount DECIMAL(10, 2)
) 
PARTITION BY RANGE (YEAR(start_date));

-- Create partitions for each year (adjust according to your dataset)
CREATE TABLE Booking_2020 PARTITION OF Booking
    FOR VALUES FROM (2020) TO (2021);

CREATE TABLE Booking_2021 PARTITION OF Booking
    FOR VALUES FROM (2021) TO (2022);

CREATE TABLE Booking_2022 PARTITION OF Booking
    FOR VALUES FROM (2022) TO (2023);

CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM (2023) TO (2024);


-- Original query (before partitioning)
SELECT * FROM Booking
WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';

-- Query after partitioning (this will now query the partitioned tables)
SELECT * FROM Booking
WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';
