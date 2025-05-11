CREATE DATABASE IF NOT EXISTS students_record;

USE students_record;

CREATE TABLE Department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_Name VARCHAR(100) NOT NULL,
    last_Name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    email_Address VARCHAR(150) NOT NULL UNIQUE,
    phone_Number VARCHAR(20),
    enrollment_Date DATE NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_Name VARCHAR(100) NOT NULL,
    credit INT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Grades (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade CHAR(10),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL UNIQUE,
    street VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_Date DATE NOT NULL,
    method VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


-- INSERTING DATA INTO EACH TABLES


INSERT INTO Department (name) VALUES
('Computer Science'),
('Business Administration'),
('Electrical Engineering'),
('Education'),
('Law');

INSERT INTO Students (first_Name, last_Name, gender, email_Address, phone_Number, enrollment_Date, department_id) 
VALUES
('Khutso', 'Makunyane', 'Male', 'khutsomakunyane1@gmail.com', '0648571755', '2023-01-15', 1),
('Jabulani', 'Moloi', 'Male', 'jabulani.moloi@gmail.com', '0723456789', '2023-02-10', 2),
('Xolani', 'Ncube', 'Male', 'xolanincube12345@gmail.com', '0734567890', '2023-03-20', 3),
('Monica', 'Mthimunye', 'Female', 'monicamthimunye@gmail.com', '0745678901', '2023-04-25', 4),
('Mahlatse', 'Matlala', 'Female', 'mahlatse.matlala@gmail.com', '0756789012', '2023-05-30', 5);

INSERT INTO Courses (course_Name, credit, department_id) VALUES
('Database Systems', 4, 1),
('Marketing Principles', 3, 2),
('Circuit Analysis', 4, 3),
('BED Foundation Phase', 4, 4),
('LLB', 3, 5);

INSERT INTO Grades (student_id, course_id, grade) VALUES
(1, 1, 'A'),
(2, 2, 'B+'),
(3, 3, 'A-'),
(4, 4, 'B'),
(5, 5, 'A');

INSERT INTO Address (student_id, street, city, country) VALUES
(1, 'Mohlware', 'Pretoria', 'South Africa'),
(2, 'Mosehla', 'Soshanguve', 'South Africa'),
(3, 'Morula', 'Mamelodi', 'South Africa'),
(4, 'Mmoko', 'Pretoria', 'South Africa'),
(5, 'Letlhabile', 'Cullinan', 'South Africa');


INSERT INTO Payments (student_id, amount, payment_Date, method) VALUES
(1, 10000.00, '2024-01-10', 'Credit Card'),
(2, 9500.50, '2024-01-15', 'Bank Transfer'),
(3, 9800.00, '2024-01-20', 'Mobile Money'),
(4, 10200.75, '2024-01-25', 'Cash'),
(5, 8900.00, '2024-01-30', 'Credit Card');















