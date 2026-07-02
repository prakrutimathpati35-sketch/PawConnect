-- Create appointments table for PawConnect pet visit booking system
-- Run this script in your MySQL database if the table doesn't exist

CREATE TABLE IF NOT EXISTS appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT NOT NULL,
    pet_name VARCHAR(100) NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(100) NOT NULL,
    user_phone VARCHAR(20) NOT NULL,
    location VARCHAR(100) NOT NULL,
    appointment_datetime DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDING',
    message TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_user_email (user_email),
    INDEX idx_pet_id (pet_id),
    INDEX idx_status (status),
    INDEX idx_appointment_datetime (appointment_datetime)
);

-- Insert sample data for testing (optional)
INSERT INTO appointments (pet_id, pet_name, user_name, user_email, user_phone, location, appointment_datetime, status, message) VALUES
(1, 'Buddy', 'John Doe', 'john@example.com', '555-1234', '123 Main St, City', '2026-04-28 10:00:00', 'PENDING', 'Looking forward to meeting Buddy!'),
(2, 'Luna', 'Jane Smith', 'jane@example.com', '555-5678', '456 Oak Ave, Town', '2026-04-29 14:00:00', 'CONFIRMED', 'Excited to see Luna!');
