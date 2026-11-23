-- ============================================
-- VUA-SEN307 Lab 6: SELECT, Filtering and Joins
-- Name: TILE NITA MYOM Matric: VUG/SEN/24/11353
-- ============================================
USE sen307_11353;

-- Task 1: Students per course (including 0 enrolments)
-- Explanation: Uses a LEFT JOIN from Course to Enrolment so courses without enrolments still appear,
-- groups by course_id and course_title, counts non-NULL student_id values, and orders highest first.
-- Why COUNT(e.student_id) returns 0 (not 1) for an empty course:
-- A LEFT JOIN produces a single row with NULL for Enrolment columns when there is no match.
-- COUNT(column) counts only non-NULL values, so NULL is ignored and returns 0 (whereas COUNT(*) would return 1).
SELECT c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
ORDER BY total_students DESC;

-- Task 2: Filtering grouped course counts with HAVING 
-- Explanation: Groups enrolments by course and uses HAVING to filter aggregated counts after grouping.

-- Threshold of 3
SELECT c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 3
ORDER BY total_students DESC;

-- Threshold of 5
SELECT c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 5
ORDER BY total_students DESC;

-- Threshold of 7
SELECT c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 7
ORDER BY total_students DESC;

-- Task 3: Average number of courses per student (including 0 courses)
-- Explanation: First calculates the course count per student via a LEFT JOIN and GROUP BY,
-- then takes the outer average of those per-student counts rounded to 2 decimal places.
SELECT ROUND(AVG(course_count), 2) AS avg_courses_per_student
FROM (
    SELECT s.student_id, COUNT(e.course_id) AS course_count
    FROM Student s
    LEFT JOIN Enrolment e ON s.student_id = e.student_id
    GROUP BY s.student_id, s.full_name
) AS per_student;


-- Task 4: Non-correlated subquery 
-- Explanation: The inner query retrieves all student_ids present in Enrolment once,
-- and the outer query returns students whose student_id is not in that set.
-- Comparison with Week 7, Task 3:
-- Both approaches identify students with zero enrolments. The NOT IN subquery directly filters
-- Student without bringing in Enrolment/Course columns or needing a NULL check on course_title,
-- whereas the Week 7 LEFT JOIN + WHERE c.course_title IS NULL works by checking unmatched joined rows.
SELECT student_id, full_name
FROM Student
WHERE student_id NOT IN (
    SELECT student_id
    FROM Enrolment
);


-- Task 5: Correlated subquery
-- Explanation: For each student row s, counts their enrolments and compares it against the maximum
-- enrolment count among all students in the same department (s.dept_id), allowing ties.
SELECT d.dept_name, s.full_name,
       (SELECT COUNT(*)
        FROM Enrolment e
        WHERE e.student_id = s.student_id) AS courses
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
WHERE (SELECT COUNT(*)
       FROM Enrolment e
       WHERE e.student_id = s.student_id) = (
           SELECT MAX(dept_student_counts.cnt)
           FROM (
               SELECT COUNT(*) AS cnt
               FROM Student s2
               JOIN Enrolment e2 ON s2.student_id = e2.student_id
               WHERE s2.dept_id = s.dept_id
               GROUP BY s2.student_id
           ) AS dept_student_counts
       )
ORDER BY d.dept_name, s.full_name;