-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: TILE NITA MYOM Matric: VUG/SEN/24/11353
-- ============================================
USE sen307_11353;

-- Task 1: Students in one department, sorted A-Z
-- Explanation: Joins Student table with Department table on dept_id, filters specifically for the Software Engineering department, and sorts the full names in ascending alphabetical order.
SELECT s.full_name, d.dept_name
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;

-- Task 2: Courses with their lecturers (INNER JOIN)
-- Explanation: Connects Course to CourseAllocation and then to Lecturer using multi-table inner joins to 
-- display every course alongside its assigned lecturer's name.
SELECT c.course_title, l.full_name
FROM Course c
JOIN CourseAllocation ca ON c.course_id = ca.course_id
JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id;

-- Task 3: Students and their courses (LEFT JOIN)
-- Explanation: Lists all students and their enrolled courses using LEFT JOINs so that students with zero enrolments are still displayed with NULL values.
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name;

-- Task 3 (Optional Filter for Unenrolled Students):
-- SELECT s.full_name, c.course_title
-- FROM Student s
-- LEFT JOIN Enrolment e ON s.student_id = e.student_id
-- LEFT JOIN Course c ON e.course_id = c.course_id
-- WHERE c.course_title IS NULL
-- ORDER BY s.full_name;

-- Task 4: Filtering with AND / OR / IN / BETWEEN
-- Explanation: Filters student records to find female students belonging to specific department IDs 
-- (1 or 3) who were born within the specified date range using BETWEEN.
SELECT full_name, gender, dept_id, date_of_birth
FROM Student
WHERE gender = 'F' 
  AND dept_id IN (1, 3) 
  AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31';
  
  -- Task 5: Paginating enrolments with LIMIT and OFFSET
-- Explanation: Uses ORDER BY combined with LIMIT and OFFSET to display enrolment records in pages of 10 rows
-- at a time (Page 1: OFFSET 0, Page 2: OFFSET 10).
-- Note: ORDER BY is required because rows in a database have no inherent order; without it, pagination chunks
-- would be random and inconsistent across queries.

-- Page 1 (Rows 1-10)
SELECT enrolment_id, student_id, course_id
FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 0;

-- Page 2 (Rows 11-20)
SELECT enrolment_id, student_id, course_id
FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 10;

-- Challenge: Task 3 rewritten using RIGHT JOIN
-- Explanation: Reverses table precedence by starting from Course/Enrolment and performing a RIGHT
-- JOIN back to Student. 
-- Readability Note: The original LEFT JOIN version (Task 3) is generally much easier to read and reason
-- about because humans naturally read from left to right, placing the primary subject (Student) on the left.
SELECT s.full_name, c.course_title
FROM Course c
RIGHT JOIN Enrolment e ON c.course_id = e.course_id
RIGHT JOIN Student s ON e.student_id = s.student_id
ORDER BY s.full_name;