-- SUBQUERY - a query inside a another query - its like answering your question, SQL answers another smaller question first and then uses that answer to answer the bigger question.
-- step 35 - finad the student enrolled in more courses than the average student.

WITH student_course_count AS
(
    SELECT
        student_id,
        COUNT(course_id) AS total_courses
    FROM enrollments
    GROUP BY student_id
)

SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    sc.total_courses
FROM students s
JOIN student_course_count sc
ON s.student_id = sc.student_id
WHERE sc.total_courses >
(
    SELECT AVG(total_courses)
    FROM student_course_count
);

-- instead of calculating the average in a separate query, we can also calculate it in the same query using a subquery.

--step 36 - find courses where every enrolled student has a grade of A.

SELECT
    c.course_id,
    c.course_name
FROM courses c
WHERE EXISTS
(
    SELECT 1
    FROM enrollments e
    WHERE e.course_id = c.course_id
)
AND NOT EXISTS
(
    SELECT 1
    FROM enrollments e
    WHERE e.course_id = c.course_id
    AND COALESCE(e.grade,'F') <> 'A'
);

-- step 37 - hoghest paid professor in every dept

SELECT
    p.professor_id,
    p.prof_name,
    d.dept_name,
    p.salary
FROM professors p
JOIN departments d
ON p.department_id = d.department_id
WHERE p.salary =
(
    SELECT MAX(p2.salary)
    FROM professors p2
    WHERE p2.department_id = p.department_id
);

-- step 38 - average salary per dept greater than 85000

SELECT
    d.dept_name,
    dept_stats.avg_salary
FROM
(
    SELECT
        department_id,
        ROUND(AVG(salary),2) AS avg_salary
    FROM professors
    GROUP BY department_id
) AS dept_stats

JOIN departments d
ON dept_stats.department_id = d.department_id

WHERE dept_stats.avg_salary > 85000;


-------------------------------------------------------------------
-------------------------------------------------------------------

-- TASK 2

-- step 39  student enrollment summary view

CREATE VIEW vw_student_enrollment_summary AS

SELECT

s.student_id,

CONCAT(s.first_name,' ',s.last_name) AS student_name,

d.dept_name,

COUNT(e.course_id) AS total_courses,

ROUND(

AVG(

CASE e.grade

WHEN 'A' THEN 4

WHEN 'B' THEN 3

WHEN 'C' THEN 2

WHEN 'D' THEN 1

WHEN 'F' THEN 0

END

),2

) AS GPA

FROM students s

LEFT JOIN departments d
ON s.department_id=d.department_id

LEFT JOIN enrollments e
ON s.student_id=e.student_id

GROUP BY
s.student_id,
student_name,
d.dept_name;

-- left join -- even student with no enrollments will be included in the view, with total_courses as 0 and GPA as NULL.
-- inner join would hide them 

-- step 40 - course statistics view

CREATE VIEW vw_course_stats AS

SELECT

c.course_name,

c.course_code,

COUNT(e.student_id) AS total_enrollments,

ROUND(

AVG(

CASE e.grade

WHEN 'A' THEN 4

WHEN 'B' THEN 3

WHEN 'C' THEN 2

WHEN 'D' THEN 1

WHEN 'F' THEN 0

END

),2

) AS avg_gpa

FROM courses c

LEFT JOIN enrollments e

ON c.course_id=e.course_id

GROUP BY

c.course_name,

c.course_code;

-- step 41 - student with GPA > 3

SELECT *

FROM vw_student_enrollment_summary

WHERE GPA>3;

-- simple - since the calculation of GPA is already done in the view, we can just filter the results based on the GPA column.

-- step 42 - update

UPDATE vw_student_enrollment_summary

SET GPA=4

WHERE student_id=1;

-- step 43 - check points 

CREATE VIEW vw_cs_students AS

SELECT

student_id,

first_name,

last_name,

department_id

FROM students

WHERE department_id=1

WITH CHECK OPTION;

-------------------------------------------------------------------
-------------------------------------------------------------------

-- TASK 3 
-- STEP 44 
'''CREATE OR REPLACE FUNCTION fn_enroll_student(

p_student_id INT,

p_course_id INT,

p_date DATE

)

RETURNS VOID

LANGUAGE plpgsql

AS $$

BEGIN

IF EXISTS(

SELECT 1

FROM enrollments

WHERE student_id=p_student_id

AND course_id=p_course_id

)

THEN

RAISE EXCEPTION

'Student already enrolled in this course';

END IF;

INSERT INTO enrollments

(student_id,course_id,enrollment_date)

VALUES

(p_student_id,p_course_id,p_date);

END;

$$;'''

-- ERROR -- ON DOING TAKS 44 - UNRECOGINIZED DATA TYPE NEAR ' VOID'

DELIMITER $$

CREATE PROCEDURE sp_enroll_student(
    IN p_student_id INT,
    IN p_course_id INT,
    IN p_enrollment_date DATE
)
BEGIN

    IF EXISTS (
        SELECT 1
        FROM enrollments
        WHERE student_id = p_student_id
          AND course_id = p_course_id
    ) THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student already enrolled in this course';

    ELSE

        INSERT INTO enrollments
        (student_id, course_id, enrollment_date)
        VALUES
        (p_student_id, p_course_id, p_enrollment_date);

    END IF;

END $$

DELIMITER ;

CALL sp_enroll_student(2,5,'2026-07-02');