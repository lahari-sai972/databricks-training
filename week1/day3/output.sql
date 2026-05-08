46. Employee with the highest salary
-----------------------------------
emp_id | name      | age | salary | department_id | hire_date
3      | Bob Brown | 45  | 80000  | 1             | 2018-02-12


47. Employees whose salary is above average salary
--------------------------------------------------
emp_id | name       | salary
2      | Jane Smith | 60000
3      | Bob Brown  | 80000


48. Second highest salary
-------------------------
60000


49. Department with the most employees
--------------------------------------
department_id | total_employees
1             | 2
2             | 2


50. Employees earning more than department average
--------------------------------------------------
emp_id | name       | salary
3      | Bob Brown  | 80000


51. Third highest salary
------------------------
50000


52. Employees older than all employees in HR department
-------------------------------------------------------
emp_id | name      | age
3      | Bob Brown | 45


53. Departments with average salary greater than 55000
------------------------------------------------------
department_id
1


54. Employees working in departments with at least 2 projects
-------------------------------------------------------------
emp_id | name
1      | John Doe
3      | Bob Brown


55. Employees hired on same date as Jane Smith
----------------------------------------------
emp_id | name
2      | Jane Smith


56. Total salary of employees hired in 2020
-------------------------------------------
50000


57. Average salary by department (descending)
---------------------------------------------
department_id | avg_salary
1             | 65000
2             | 55000
3             | 45000


58. Departments with more than 1 employee and avg salary > 55000
----------------------------------------------------------------
department_id
1


59. Employees hired in last 2 years
-----------------------------------
emp_id | name       | hire_date
4      | Alice Blue | 2021-03-22


60. Total employees and avg salary for departments with >2 employees
--------------------------------------------------------------------
No rows returned


61. Employees earning above department average salary
-----------------------------------------------------
name       | salary
Bob Brown  | 80000


62. Employees hired on same date as oldest employee
---------------------------------------------------
name
Bob Brown


63. Department names with total projects
----------------------------------------
department_name | total_projects
IT              | 2
HR              | 1
Finance         | 1
Marketing       | 1


64. Employee with highest salary in each department
---------------------------------------------------
name        | department_id | salary
Bob Brown   | 1             | 80000
Jane Smith  | 2             | 60000
Alice Blue  | 3             | 45000


65. Employees older than department average age
-----------------------------------------------
name        | salary
Bob Brown   | 80000
Jane Smith  | 60000






-- =========================================================
-- OUTPUTS FOR SQL JOIN QUERIES
-- =========================================================

------------------------------------------------------------
-- 1. Display all students and the courses they are enrolled in.
-- Include students who are not enrolled in any course.
------------------------------------------------------------

+--------------+-------------+
| student_name | course_name |
+--------------+-------------+
| Rahul        | DBMS        |
| Anjali       | Python      |
| Kiran        | Java        |
| Sneha        | NULL        |
+--------------+-------------+


------------------------------------------------------------
-- 2. Find all courses that currently have no students enrolled.
------------------------------------------------------------

+-----------+-------------+
| course_id | course_name |
+-----------+-------------+
| 104       | AI          |
+-----------+-------------+


------------------------------------------------------------
-- 3. Display all instructors and the courses they teach,
-- including instructors who are not assigned to any course.
------------------------------------------------------------

+-----------------+-------------+
| instructor_name | course_name |
+-----------------+-------------+
| Ramesh          | DBMS        |
| Sita            | Python      |
| David           | NULL        |
+-----------------+-------------+


------------------------------------------------------------
-- 4. Find all courses that do not have an instructor assigned.
------------------------------------------------------------

+-----------+-------------+---------------+
| course_id | course_name | instructor_id |
+-----------+-------------+---------------+
| 104       | AI          | NULL          |
+-----------+-------------+---------------+


------------------------------------------------------------
-- 5. Display all students and enrollment information using a RIGHT JOIN.
------------------------------------------------------------

+--------------+---------------+-----------+-----------------+
| student_name | enrollment_id | course_id | enrollment_date |
+--------------+---------------+-----------+-----------------+
| Rahul        | 1             | 101       | 2026-01-10      |
| Anjali       | 2             | 102       | 2026-01-11      |
| Kiran        | 3             | 103       | 2026-01-12      |
+--------------+---------------+-----------+-----------------+


------------------------------------------------------------
-- 6. Find students who are not enrolled in any course.
------------------------------------------------------------

+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 4          | Sneha        |
+------------+--------------+


------------------------------------------------------------
-- 7. Use a FULL OUTER JOIN to display all students and enrollments,
-- including unmatched rows from both tables.
------------------------------------------------------------

+--------------+---------------+-----------+-----------------+
| student_name | enrollment_id | course_id | enrollment_date |
+--------------+---------------+-----------+-----------------+
| Rahul        | 1             | 101       | 2026-01-10      |
| Anjali       | 2             | 102       | 2026-01-11      |
| Sneha        | NULL          | NULL      | NULL            |
+--------------+---------------+-----------+-----------------+


------------------------------------------------------------
-- 8. Find all courses that have never appeared in the enrollments table.
------------------------------------------------------------

+-----------+-------------+
| course_id | course_name |
+-----------+-------------+
| 104       | AI          |
+-----------+-------------+


------------------------------------------------------------
-- 9. Display all instructors and courses using a FULL OUTER JOIN
-- and identify unmatched rows.
------------------------------------------------------------

+-----------------+-------------+
| instructor_name | course_name |
+-----------------+-------------+
| Ramesh          | DBMS        |
| Sita            | Python      |
| David           | NULL        |
| NULL            | AI          |
+-----------------+-------------+


------------------------------------------------------------
-- 10. Create a report showing:
-- student name, course name, and instructor name.
------------------------------------------------------------

+--------------+-------------+-----------------+
| student_name | course_name | instructor_name |
+--------------+-------------+-----------------+
| Rahul        | DBMS        | Ramesh          |
| Anjali       | Python      | Sita            |
| Sneha        | NULL        | NULL            |
+--------------+-------------+-----------------+


------------------------------------------------------------
-- BONUS CHALLENGE:
-- List every student and every course,
-- even if there is no enrollment relationship between them.
------------------------------------------------------------

+--------------+-------------+
| student_name | course_name |
+--------------+-------------+
| Rahul        | DBMS        |
| Rahul        | Python      |
| Rahul        | Java        |
| Anjali       | DBMS        |
| Anjali       | Python      |
| Anjali       | Java        |
+--------------+-------------+
