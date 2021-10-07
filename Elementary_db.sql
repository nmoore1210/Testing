DROP DATABASE IF EXISTS elementary_db;
CREATE DATABASE elementary_db;
USE elementary_db;

DROP TABLE IF EXISTS grade_level;
DROP TABLE IF EXISTS emergency_contact;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS job_title;
DROP TABLE IF EXISTS teacher; 

CREATE TABLE teacher (
teacher_id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(100),
room_number INT,
PRIMARY KEY (teacher_id)
);

CREATE TABLE job_title (
job_id INT NOT NULL AUTO_INCREMENT,
teacher_id INT,
grade_taught INT,
start_date VARCHAR(15),
end_date VARCHAR(15),
PRIMARY KEY (job_id),
FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

CREATE TABLE student (
student_id INT NOT NULL AUTO_INCREMENT,
teacher_id INT,
first_name VARCHAR(100),
last_name VARCHAR(100),
birth_date VARCHAR(15),
PRIMARY KEY (student_id),
FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

CREATE TABLE emergency_contact (
contact_id INT NOT NULL AUTO_INCREMENT,
student_id INT,
first_name VARCHAR(50),
last_name VARCHAR(100),
phone_number VARCHAR(20),
email VARCHAR(100),
PRIMARY KEY (contact_id),
FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE grade_level (
grade_id INT NOT NULL AUTO_INCREMENT,
student_id INT,
teacher_id INT,
grade_level INT,
PRIMARY KEY (grade_id),
FOREIGN KEY (student_id) REFERENCES student(student_id),
FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);
