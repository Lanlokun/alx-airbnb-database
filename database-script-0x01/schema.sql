-- Users Table
CREATE TABLE Users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Property Table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_host FOREIGN KEY (host_id) REFERENCES Users (user_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Booking Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES Property (property_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES Users (user_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Review Table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES Property (property_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES Users (user_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Message Table
CREATE TABLE Message (
    message_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sender FOREIGN KEY (sender_id) REFERENCES Users (user_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_recipient FOREIGN KEY (recipient_id) REFERENCES Users (user_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Payment Table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    booking_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES Booking (booking_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Indexes for Optimal Performance
CREATE INDEX idx_users_email ON Users (email);
CREATE INDEX idx_property_location ON Property (location);
CREATE INDEX idx_booking_start_end_date ON Booking (start_date, end_date);
CREATE INDEX idx_review_rating ON Review (rating);
