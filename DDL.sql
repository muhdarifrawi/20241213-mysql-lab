create database swimming_coach;

CREATE TABLE parents (
    parent_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) DEFAULT ''
);

create table students (
    student_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    swimming_level VARCHAR(45),
    dob DATE
) ENGINE = innodb;

-- Creating Foreign Key
-- 1. Create new column 
ALTER TABLE students ADD COLUMN parent_id INT UNSIGNED;
-- 2. Add constraint to table
ALTER TABLE students ADD CONSTRAINT fk_parents_students FOREIGN KEY (parent_id) REFERENCES parents(parent_id);

-- Removing Column From Table
ALTER TABLE students DROP swimming_level;

-- Modify Existing Columns
ALTER TABLE students MODIFY COLUMN swimming_level INT UNSIGNED;

CREATE TABLE payments (
    payment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    amount DOUBLE(8,2) NOT NULL,
    session_id INT UNSIGNED,
    student_id INT UNSIGNED,
    parent_id INT UNSIGNED,
    method VARCHAR(100) NOT NULL
);

CREATE TABLE sessions (
    session_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    datetime datetime,
    location_id INT UNSIGNED
);

CREATE TABLE attendance (
    attendance_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id INT UNSIGNED,
    session_id INT UNSIGNED
);

CREATE TABLE locations (
    location_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255)
);