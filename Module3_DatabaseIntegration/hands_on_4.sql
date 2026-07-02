
-- =====================================
-- Hands-On 4 - QUERY OPTIMISATION
-- Module 3 - Database Integration
-- QUERY OPTIMAISATION - HAVING A INDEX - TO GET THE RIGHT INFO FROM IT - WITHOUT GOING THROUGH ALL THE DATA
-- =====================================

-- STEP 48  - CHECK HOW THE DATA WORKS BEFORE OPTIMISING IT

EXPLAIN FORMAT=JSON
SELECT
    s.first_name,
    s.last_name,
    c.course_name
FROM enrollments e
JOIN students s
ON s.student_id = e.student_id
JOIN courses c
ON c.course_id = e.course_id
WHERE s.enrollment_year = 2022;

-- STEP 49 - FIND FULL TABLE SCAN 
-- MYSQL - READS EVERY ROW IN THE TABLE TO FIND THE DATA - SLOWER THAN INDEXES
-- =====================================

TASK 2 - ADD INDEXES
-- STEP 51 -- INDEX ON ENROLLMENT_YEAR

CREATE INDEX idx_students_enrollment_year
ON students(enrollment_year);

-- STEP 53 - INDEX COURSE CODE 
CREATE INDEX idx_course_code
ON courses(course_code);

-- STEP 54 - EXPLAIN AGAIN 
EXPLAIN FORMAT=JSON

SELECT

s.first_name,

s.last_name,

c.course_name

FROM enrollments e

JOIN students s

ON s.student_id=e.student_id

JOIN courses c

ON c.course_id=e.course_id

WHERE s.enrollment_year=2022;

-- MUCH FEWER ROWS EXAMINED

-- =====================================
-- TASK 3 - N + 1 PROBLEM
-- STEP 55 - N + 1 PROBLEM - 
-- WHEN YOU HAVE A QUERY THAT RETURNS A LIST OF RECORDS AND THEN FOR EACH RECORD YOU HAVE TO DO ANOTHER QUERY TO GET MORE DATA - THIS IS BAD FOR PERFORMANCE

-- STEP 56 - N + 1 PROBLEM EXAMPLE - BAD
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="college_db"
)

cursor = db.cursor()

cursor.execute("SELECT * FROM enrollments")

rows = cursor.fetchall()

for row in rows:

    cursor.execute(
        "SELECT first_name,last_name FROM students WHERE student_id=%s",
        (row[1],)
    )

    print(cursor.fetchone())


-- STEP 57
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="college_db"
)

cursor = db.cursor()

cursor.execute("""

SELECT

s.first_name,

s.last_name,

c.course_name,

e.grade

FROM enrollments e

JOIN students s

ON e.student_id=s.student_id

JOIN courses c

ON e.course_id=c.course_id

""")

for row in cursor.fetchall():

    print(row)

-- STEP 58 MEASURE TIME

import time

start=time.time()

cursor.execute("""
SELECT
s.first_name,
s.last_name,
c.course_name,
e.grade
FROM enrollments e
JOIN students s
ON s.student_id=e.student_id
JOIN courses c
ON c.course_id=e.course_id
""")

cursor.fetchall()

end=time.time()

print("Execution Time:",end-start)