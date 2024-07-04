-- Database Setup

-- a) Create the Database

CREATE DATABASE if not exists Student_Database_Management_System;
USE Student_Database_Management_System;

-- b) Create the student_table

CREATE TABLE student_table (
    Student_id INTEGER PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT
);


-- 2. Data Entry

-- a) Insert 10 sample records into the student_table.

INSERT INTO student_table (Student_id, Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
(1, 'John Doe', 'Computer Science', 'john.doe@example.com', 1234567890, '123 Main St', '2000-01-15', 'Male', 'CS', 3.5, 'B'),
(2, 'Jane Smith', 'Biology', 'jane.smith@example.com', 9876543210, '456 Oak St', '1999-02-20', 'Female', 'BIO', 3.8, 'A'),
(3, 'Sam Johnson', 'Chemistry', 'sam.johnson@example.com', 4567890123, '789 Pine St', '2001-03-10', 'Male', 'CHEM', 2.9, 'C'),
(4, 'Alice Brown', 'Physics', 'alice.brown@example.com', 3216549870, '101 Elm St', '2002-04-25', 'Female', 'PHY', 4.0, 'A'),
(5, 'Bob Green', 'Mathematics', 'bob.green@example.com', 6543219870, '202 Maple St', '2000-05-15', 'Male', 'MATH', 3.2, 'B'),
(6, 'Carol White', 'Computer Science', 'carol.white@example.com', 7890123456, '303 Cedar St', '2001-06-30', 'Female', 'CS', 2.5, 'C'),
(7, 'David Black', 'Engineering', 'david.black@example.com', 8901234567, '404 Birch St', '1998-07-10', 'Male', 'ENG', 4.5, 'A'),
(8, 'Eva Blue', 'Psychology', 'eva.blue@example.com', 9012345678, '505 Spruce St', '1999-08-20', 'Female', 'PSY', 3.9, 'B'),
(9, 'Frank White', 'Economics', 'frank.white@example.com', 1237894560, '606 Pine St', '2002-09-15', 'Male', 'ECO', 2.8, 'C'),
(10, 'Grace Yellow', 'Literature', 'grace.yellow@example.com', 2345678901, '707 Willow St', '2000-10-05', 'Female', 'LIT', 4.7, 'A');


-- 3. Student Information Retrieval

-- a) Retrieve all students information and sort them by grade in descending order.

SELECT * FROM student_table
ORDER BY Grade DESC;


-- 4. Query for Male Students

-- a) Retrieve information about all male students.

SELECT * FROM student_table
WHERE Gender = 'Male';


-- 5. Query for Students with GPA Less Than 5.0

-- a) Fetch details of students with GPA less than 5.0.

SELECT * FROM student_table
WHERE GPA < 5.0;


-- 6. Update Student Email and Grade

-- a) Update the email and grade of a student with a specific ID.

UPDATE student_table
SET email_id = 'new.email@example.com', Grade = 'A'
WHERE Student_id = 1;  -- Change the Student_id to the specific student ID


-- 7. Query for Students with Grade "B"

-- a) Retrieve names and ages (calculated from Date_of_birth) of all students who have a grade of "B".

SELECT Stu_name,  (EXTRACT(YEAR FROM current_date()) - EXTRACT(YEAR FROM Date_of_birth)) AS Age
FROM student_table
WHERE Grade = 'B';


-- 8. Grouping and Calculation

-- a) Group by Department and Gender, and calculate the average GPA for each combination.

SELECT Department, Gender, AVG(GPA) AS Average_GPA
FROM student_table
GROUP BY Department, Gender;

-- 9. Table Renaming

-- a)Rename the student_table to student_info.

ALTER TABLE student_table RENAME TO student_info;


-- 10. Retrieve Student with Highest GPA

-- a_ Retrieve the name of the student with the highest GPA.

SELECT Stu_name, GPA
FROM student_info
Where GPA = (SELECT max(GPA) from student_info)
