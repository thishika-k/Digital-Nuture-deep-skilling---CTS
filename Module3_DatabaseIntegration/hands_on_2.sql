--hands-on-2 -- Data manupulation language (DML) 

-- insert 
-- Step 16

INSERT INTO students
(first_name,last_name,email,date_of_birth,department_id,enrollment_year)
VALUES
('Rahul','Sharma','rahul.sharma@college.edu','2004-06-18',2,2023),
('Anjali','Iyer','anjali.iyer@college.edu','2003-10-12',3,2022);

-- update
-- Step 17

UPDATE enrollments
SET grade='B'
WHERE student_id=5
AND course_id=1;

-- delete
-- Step 18

DELETE FROM enrollments
WHERE grade IS NULL;

USE college_db;

-- =====================================================
-- HANDS-ON 2
-- Task 2: Single Table Queries (Steps 20-24)
-- =====================================================

-- Step 20
-- Retrieve all students enrolled in 2022 ordered by last name.

SELECT *
FROM students
WHERE enrollment_year = 2022
ORDER BY last_name ASC;


-- Step 21
-- Find all courses with more than 3 credits.

SELECT *
FROM courses
WHERE credits > 3
ORDER BY credits DESC;


-- Step 22
-- Professors whose salary is between 80000 and 95000.

SELECT *
FROM professors
WHERE salary BETWEEN 80000 AND 95000;


-- Step 23
-- Students whose email ends with @college.edu

SELECT *
FROM students
WHERE email LIKE '%@college.edu';


-- Step 24
-- Count students per enrollment year.

SELECT enrollment_year,
       COUNT(*) AS total_students
FROM students
GROUP BY enrollment_year
ORDER BY enrollment_year;



-- =====================================================
-- HANDS-ON 2
-- Task 3: Multi Table Joins (Steps 25-29)
-- =====================================================

-- Step 25
-- Student name with department name.

SELECT
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    d.dept_name
FROM students s
INNER JOIN departments d
ON s.department_id = d.department_id;


-- Step 26
-- Student name with enrolled course.

SELECT
    e.enrollment_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name,
    e.grade
FROM enrollments e
INNER JOIN students s
ON e.student_id = s.student_id
INNER JOIN courses c
ON e.course_id = c.course_id;


-- Step 27
-- Students not enrolled in any course.

SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.student_id IS NULL;


-- Step 28 -- has LEFT JOIN - ENSURE COURSES WITH ZERO ENROLLMENTS ARE INCLUDED
-- Every course with number of enrolled students.

SELECT
    c.course_name,
    COUNT(e.enrollment_id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;


-- Step 29
-- Departments with professors and salaries.

SELECT
    d.dept_name,
    p.prof_name,
    p.salary
FROM departments d
LEFT JOIN professors p
ON d.department_id = p.department_id
ORDER BY d.dept_name;


-- =====================================================
-- HANDS-ON 2
-- Task 4: Aggregations and Grouping (Steps 30-34)
-- =====================================================

-- Step 30
-- Total number of enrollments per course

SELECT
    c.course_name,
    COUNT(e.enrollment_id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;


-- Step 31
-- Average salary of professors per department

SELECT
    d.dept_name,
    ROUND(AVG(p.salary), 2) AS average_salary
FROM departments d
LEFT JOIN professors p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.dept_name;


-- Step 32
-- Departments whose budget exceeds 600000

SELECT
    dept_name,
    budget
FROM departments
WHERE budget > 600000;


-- Step 33
-- Grade distribution for course CS101

SELECT
    e.grade,
    COUNT(*) AS grade_count
FROM enrollments e
INNER JOIN courses c
ON e.course_id = c.course_id
WHERE c.course_code = 'CS101'
GROUP BY e.grade
ORDER BY e.grade;


-- Step 34
-- Departments having more than 2 enrolled students

SELECT
    d.dept_name,
    COUNT(DISTINCT e.student_id) AS total_students
FROM departments d
INNER JOIN students s
ON d.department_id = s.department_id
INNER JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY d.department_id, d.dept_name
HAVING COUNT(DISTINCT e.student_id) > 2;
