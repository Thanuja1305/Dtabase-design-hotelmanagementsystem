-- Create Database
CREATE DATABASE HotelManagementSystem;
USE HotelManagementSystem;

-- Hotels Table
CREATE TABLE Hotel (
    hotel_code INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    manager_id INT NOT NULL,
    num_rooms INT NOT NULL,
    star_rating INT NOT NULL
);

-- Rooms Table
CREATE TABLE Room (
    room_number INT NOT NULL,
    hotel_code INT NOT NULL,
    type VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    availability_status BOOLEAN NOT NULL,
    PRIMARY KEY (room_number, hotel_code),
    FOREIGN KEY (hotel_code) REFERENCES Hotel(hotel_code)
);

-- Guests Table
CREATE TABLE Guest (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    loyalty_level VARCHAR(50) NOT NULL,
    booking_history TEXT
);

-- Employees Table
CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    hotel_code INT NOT NULL,
    shift_details TEXT,
    FOREIGN KEY (hotel_code) REFERENCES Hotel(hotel_code)
);

-- Bookings Table
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_number INT NOT NULL,
    hotel_code INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_bill DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES Guest(guest_id),
    FOREIGN KEY (room_number, hotel_code) REFERENCES Room(room_number, hotel_code)
);

-- Feedback Table
CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    feedback_text TEXT,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);



-- DATA INSERTION--
INSERT INTO Hotel (name, city, manager_id, num_rooms, star_rating) VALUES
('Grand Hyatt', 'New York', 1, 200, 5),
('Marriott', 'Los Angeles', 2, 150, 4);

-- Inserting into Employee
INSERT INTO Employee (name, role, hotel_code, shift_details) VALUES
('John Doe', 'Manager', 1, 'Morning Shift'),
('Jane Smith', 'Receptionist', 1, 'Evening Shift'),
('Mark Lee', 'Manager', 2, 'Morning Shift');

-- Inserting into Room
INSERT INTO Room (room_number, hotel_code, type, price_per_night, availability_status) VALUES
(101, 1, 'Deluxe', 200.00, TRUE),
(102, 1, 'Suite', 300.00, TRUE),
(201, 2, 'Standard', 150.00, TRUE);

-- Inserting into Guest
INSERT INTO Guest (name, loyalty_level, booking_history) VALUES
('Alice Brown', 'Gold', 'Booking 1, Booking 2'),
('Bob White', 'Silver', 'Booking 3');

-- Inserting into Booking
INSERT INTO Booking (guest_id, room_number, hotel_code, check_in_date, check_out_date, total_bill) VALUES
(1, 101, 1, '2025-06-01', '2025-06-05', 800.00),
(2, 102, 1, '2025-06-03', '2025-06-07', 1200.00);

-- Inserting into Feedback
INSERT INTO Feedback (booking_id, feedback_text) VALUES
(1, 'Excellent service and amenities!'),
(2, 'Very comfortable stay.');
