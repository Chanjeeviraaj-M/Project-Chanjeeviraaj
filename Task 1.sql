Create Database Academic_Management_System;
USE Academic_Management_System;


-- a) Creating the StudentInfo Table

CREATE TABLE StudentInfo (
    STU_ID INT PRIMARY KEY,
    STU_NAME VARCHAR(100),
    DOB DATE,
    PHONE_NO VARCHAR(15),
    EMAIL_ID VARCHAR(100),
    ADDRESS VARCHAR(255)
);


-- b) Creating the CoursesInfo Table
CREATE TABLE CoursesInfo (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(100),
    COURSE_INSTRUCTOR_NAME VARCHAR(100)
);


-- c) Creating the EnrollmentInfo Table

CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    ENROLL_STATUS VARCHAR(20),
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);


 -- 2. Data Creation

 -- a) Inserting Sample Data into StudentInfo

INSERT INTO StudentInfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS)
VALUES
(1, 'John Doe', '2000-01-15', '123-456-7890', 'john.doe@example.com', '123 Main St'),
(2, 'Jane Smith', '1999-02-20', '987-654-3210', 'jane.smith@example.com', '456 Oak St'),
(3, 'Sam Johnson', '2001-03-10', '456-789-0123', 'sam.johnson@example.com', '789 Pine St');


 -- b) Inserting Sample Data into CoursesInfo

INSERT INTO CoursesInfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME)
VALUES
(101, 'Mathematics', 'Dr. Alice Brown'),
(102, 'Physics', 'Dr. Bob Green'),
(103, 'Chemistry', 'Dr. Carol White');


-- c) Inserting Sample Data into EnrollmentInfo

INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS)
VALUES
(1, 1, 101, 'Enrolled'),
(2, 1, 102, 'Not Enrolled'),
(3, 2, 101, 'Enrolled'),
(4, 3, 103, 'Enrolled');


-- Retrieve the Student Information

 -- a) Retrieve Student Details

SELECT STU_NAME, PHONE_NO, EMAIL_ID, ENROLL_STATUS
FROM StudentInfo
JOIN EnrollmentInfo ON StudentInfo.STU_ID = EnrollmentInfo.STU_ID;


--  b) Retrieve Courses a Specific Student is Enrolled In

SELECT COURSE_NAME
FROM CoursesInfo
JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
WHERE ENROLL_STATUS = 'Enrolled' AND STU_ID = 1;  -- Change the STU_ID to the specific student ID


-- c) Retrieve Course Information Including Instructor Information

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo;


-- d) Retrieve Course Information for a Specific Course

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo
WHERE COURSE_ID = 101;  -- Change the COURSE_ID to the specific course ID


-- e) Retrieve Course Information for Multiple Courses

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo
WHERE COURSE_ID IN (101, 102);  -- Change the COURSE_IDs to the specific course IDs


-- 4. Reporting and Analytics (Using Joining Queries)

-- a) Number of Students Enrolled in Each Course

SELECT COURSE_NAME, COUNT(*) AS NumberOfStudents
FROM CoursesInfo
JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
WHERE ENROLL_STATUS = 'Enrolled'
GROUP BY COURSE_NAME;


-- b) List of Students Enrolled in a Specific Course

SELECT STU_NAME
FROM StudentInfo
JOIN EnrollmentInfo ON StudentInfo.STU_ID = EnrollmentInfo.STU_ID
WHERE ENROLL_STATUS = 'Enrolled' AND COURSE_ID = 101;  -- Change the COURSE_ID to the specific course ID


-- c) Count of Enrolled Students for Each Instructor

SELECT COURSE_INSTRUCTOR_NAME, COUNT(*) AS NumberOfStudents
FROM CoursesInfo
JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
WHERE ENROLL_STATUS = 'Enrolled'
GROUP BY COURSE_INSTRUCTOR_NAME;


-- d) List of Students Who Are Enrolled in Multiple Courses

SELECT STU_NAME
FROM StudentInfo
JOIN EnrollmentInfo ON StudentInfo.STU_ID = EnrollmentInfo.STU_ID
WHERE ENROLL_STATUS = 'Enrolled'
GROUP BY STU_NAME
HAVING COUNT(COURSE_ID) > 1;


-- e) Courses with the Highest Number of Enrolled Students

SELECT COURSE_NAME, COUNT(*) AS NumberOfStudents
FROM CoursesInfo
JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
WHERE ENROLL_STATUS = 'Enrolled'
GROUP BY COURSE_NAME
ORDER BY NumberOfStudents DESC;


