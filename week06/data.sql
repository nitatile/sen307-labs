USE sen307_202411353;



INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
'Relational database design, SQL queries, normalization, transactions and indexing using
MySQL.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
'Architectural styles, design patterns, microservices and how to structure large software
systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,

'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
'Supervised and unsupervised learning, neural networks, deep learning and model
evaluation.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));
SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Prof Chinedu Eze', 'c.eze@vua.edu.ng', 2),
('VUA/ST/104', 'Dr Fatima Aliyu', 'f.aliyu@vua.edu.ng', 2),
('VUA/ST/105', 'Dr Tunde Bakare', 't.bakare@vua.edu.ng', 3),
('VUA/ST/106', 'Dr Ngozi Okonjo', 'n.okonjo@vua.edu.ng', 3),
('VUA/ST/107', 'Prof Ibrahim Danjuma', 'i.danjuma@vua.edu.ng', 4),
('VUA/ST/108', 'Dr Blessing Uche', 'b.uche@vua.edu.ng', 4),
('VUA/ST/109', 'Dr Olumide Johnson', 'o.johnson@vua.edu.ng', 5),
('VUA/ST/110', 'Dr Zainab Garba', 'z.garba@vua.edu.ng', 5);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('202411353', 'Nita Tile', 'F', '2005-06-20', 1), 
('20241234', 'Ada Obi', 'F', '2005-03-14', 1),
('20241235', 'John Musa', 'M', '2004-11-02', 2),
('20241236', 'Aisha Mohammed', 'F', '2006-01-19', 3),
('20241237', 'Emeka Okafor', 'M', '2003-08-25', 4),
('20241238', 'Grace Adebayo', 'F', '2005-05-12', 5),
('20241239', 'David Peters', 'M', '2007-02-10', 1),
('20241240', 'Halima Sani', 'F', '2004-09-30', 2),
('20241241', 'Kelechi Nnamdi', 'M', '2005-12-05', 3),
('20241242', 'Folake Ojo', 'F', '2003-04-18', 4),
('20241243', 'Yusuf Ibrahim', 'M', '2006-07-22', 5),
('20241244', 'Chika Okoro', 'F', '2005-10-11', 1),
('20241245', 'Samuel Okon', 'M', '2004-02-28', 2),
('20241246', 'Zainab Kabir', 'F', '2006-08-14', 3),
('20241247', 'Uchechi Nwosu', 'M', '2005-03-03', 4),
('20241248', 'Patience James', 'F', '2003-11-15', 5),
('20241249', 'Kabir Garba', 'M', '2004-06-07', 1),
('20241250', 'Miracle Ezenwa', 'F', '2006-12-31', 2),
('20231251', 'Unenrolled Student One', 'M', '2005-05-05', 1),
('20231252', 'Unenrolled Student Two', 'F', '2005-06-06', 2);

INSERT INTO Enrolment (student_id, course_id) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), 
(1, 2), (2, 2), (3, 2), (4, 2),(19, 2),
(5, 3), (6, 3), (7, 3), (8, 3), (11, 3),
(9, 4), (10, 4), (11, 4), (12, 4),
(13, 5), (14, 5), (15, 5), (16, 5),
(17, 6), (18, 6), (1, 6), (2, 6),
(2, 7), (4, 7), (5, 7), (6, 7),
(7, 8), (8, 8), (9, 8), (10, 8),
(11, 9), (12, 9), (13, 10), (14, 10);

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1, 1), (1, 2), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7), 
(8, 8), 
(9, 9), 
(10, 10);

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';

UPDATE Student SET dept_id = 2 WHERE matric_no = '20231234'; 

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';

INSERT INTO Department (dept_name) VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
(SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));

DELETE FROM Department WHERE dept_name = 'Library and Information Science';

-- Step 1: reassign the dependent student to another department
UPDATE Student
SET dept_id = (SELECT dept_id FROM Department

WHERE dept_name = 'Software Engineering')

WHERE matric_no = '20239999';
-- Step 2: now the delete succeeds
DELETE FROM Department WHERE dept_name = 'Library and Information Science';
SELECT * FROM Department;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;