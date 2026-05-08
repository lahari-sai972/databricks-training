-- 46
SELECT *
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);

-- 47
SELECT *
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);

-- 48
SELECT MAX(salary)
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);

-- 49
SELECT department_id, COUNT(*)
FROM Employee
GROUP BY department_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 50
SELECT *
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 51
SELECT DISTINCT salary
FROM Employee e1
WHERE 3 = (
    SELECT COUNT(DISTINCT salary)
    FROM Employee e2
    WHERE e2.salary >= e1.salary
);

-- 52
SELECT *
FROM Employee
WHERE age > ALL (
    SELECT age
    FROM Employee e
    JOIN Department d
    ON e.department_id = d.department_id
    WHERE d.name = 'HR'
);

-- 53
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 54
SELECT *
FROM Employee
WHERE department_id IN (
    SELECT department_id
    FROM Project
    GROUP BY department_id
    HAVING COUNT(*) >= 2
);

-- 55
SELECT *
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE name = 'Jane Smith'
);
-- 56
SELECT SUM(salary)
FROM Employee
WHERE YEAR(hire_date) = 2020;

-- 57
SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC;

-- 58
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1
AND AVG(salary) > 55000;

-- 59
SELECT *
FROM Employee
WHERE hire_date >= CURRENT_DATE - INTERVAL 2 YEAR
ORDER BY hire_date;

-- 60
SELECT department_id,
COUNT(*),
AVG(salary)
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 61
SELECT name, salary
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 62
SELECT name
FROM Employee
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM Employee
);

-- 63
SELECT d.name,
COUNT(p.project_id)
FROM Department d
LEFT JOIN Project p
ON d.department_id = p.department_id
GROUP BY d.name
ORDER BY COUNT(p.project_id) DESC;

-- 64
SELECT name, department_id, salary
FROM Employee e
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 65
SELECT name, salary
FROM Employee e
WHERE age > (
    SELECT AVG(age)
    FROM Employee
    WHERE department_id = e.department_id
);







-- 1. Display all students and the courses they are enrolled in.
-- Include students who are not enrolled in any course.

SELECT s.student_name, c.course_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id;

------------------------------------------------------------

-- 2. Find all courses that currently have no students enrolled.

SELECT c.course_id, c.course_name
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

------------------------------------------------------------

-- 3. Display all instructors and the courses they teach,
-- including instructors who are not assigned to any course.

SELECT i.instructor_name, c.course_name
FROM instructors i
LEFT JOIN courses c
ON i.instructor_id = c.instructor_id;

------------------------------------------------------------

-- 4. Find all courses that do not have an instructor assigned.

SELECT *
FROM courses
WHERE instructor_id IS NULL;

------------------------------------------------------------

-- 5. Display all students and enrollment information using a RIGHT JOIN.

SELECT s.student_name, e.enrollment_id, e.course_id, e.enrollment_date
FROM students s
RIGHT JOIN enrollments e
ON s.student_id = e.student_id;

------------------------------------------------------------

-- 6. Find students who are not enrolled in any course.

SELECT s.student_id, s.student_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

------------------------------------------------------------

-- 7. Use a FULL OUTER JOIN to display all students and enrollments,
-- including unmatched rows from both tables.

SELECT s.student_name, e.enrollment_id, e.course_id, e.enrollment_date
FROM students s
FULL OUTER JOIN enrollments e
ON s.student_id = e.student_id;

------------------------------------------------------------

-- 8. Find all courses that have never appeared in the enrollments table.

SELECT c.course_id, c.course_name
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

------------------------------------------------------------

-- 9. Display all instructors and courses using a FULL OUTER JOIN
-- and identify unmatched rows.

SELECT i.instructor_name, c.course_name
FROM instructors i
FULL OUTER JOIN courses c
ON i.instructor_id = c.instructor_id;

------------------------------------------------------------

-- 10. Create a report showing:
-- student name, course name, and instructor name.
-- Include rows even if course or instructor information is missing.

SELECT s.student_name,
       c.course_name,
       i.instructor_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id
LEFT JOIN instructors i
ON c.instructor_id = i.instructor_id;

------------------------------------------------------------

-- Bonus Challenge:
-- List every student and every course,
-- even if there is no enrollment relationship between them.

SELECT s.student_name, c.course_name
FROM students s
CROSS JOIN courses c;
