
-- =====================================================
-- 1. List all students along with their department names
-- =====================================================

SELECT 
    s.student_id,
    s.student_name,
    d.department_name
FROM Student s
LEFT JOIN Department d
ON s.department_id = d.department_id;

-- OUTPUT
-- student_id | student_name       | department_name
-- 101        | John Doe           | Computer Science
-- 102        | Mary Jane          | Computer Science
-- 103        | Steve Rogers       | Mechanical
-- 104        | Natasha Romanoff   | Mechanical
-- 105        | Bruce Wayne        | Electronics
-- 106        | Clark Kent         | Electronics
-- 107        | Diana Prince       | Civil
-- 108        | Peter Parker       | Civil
-- 109        | Tony Stark         | Computer Science
-- 110        | Wanda Maximoff     | Mathematics
-- 111        | Barry Allen        | Mathematics
-- 112        | NULL               | NULL
-- 113        | Scott Lang         | NULL
-- 114        | Jean Grey          | NULL
-- 115        | Logan Howlett      | Biotechnology


-- =====================================================
-- 2. Display all staff members and their department names
-- including staff without departments
-- =====================================================

SELECT 
    st.staff_id,
    st.staff_name,
    d.department_name
FROM Staff st
LEFT JOIN Department d
ON st.department_id = d.department_id;

-- OUTPUT
-- staff_id | staff_name      | department_name
-- 1        | Alice Johnson   | Computer Science
-- 2        | Bob Smith       | Computer Science
-- 3        | Charlie Brown   | Mechanical
-- 4        | David Lee       | Mechanical
-- 5        | Eva Green       | Electronics
-- 6        | Frank Hall      | Electronics
-- 7        | Grace Miller    | Civil
-- 8        | NULL            | NULL
-- 9        | Henry Ford      | Mathematics
-- 10       | Ivy Clark       | NULL


-- =====================================================
-- 3. Find all departments that currently have no students assigned
-- =====================================================

SELECT d.department_id, d.department_name
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
WHERE s.student_id IS NULL;

-- OUTPUT
-- No rows found


-- =====================================================
-- 4. Show students who do not have any marks recorded
-- =====================================================

SELECT s.student_id, s.student_name
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id
WHERE m.student_id IS NULL;

-- OUTPUT
-- No rows found


-- =====================================================
-- 5. Display subjects that are not assigned to any staff member
-- =====================================================

SELECT subject_id, subject_name
FROM Subject
WHERE staff_id IS NULL;

-- OUTPUT
-- subject_id | subject_name
-- 209        | NULL


-- =====================================================
-- 6. Find the average CGPA department-wise
-- =====================================================

SELECT 
    d.department_name,
    AVG(s.cgpa) AS average_cgpa
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
GROUP BY d.department_name;

-- OUTPUT
-- department_name   | average_cgpa
-- Biotechnology     | 7.70
-- Civil             | 8.40
-- Computer Science  | 9.20
-- Electronics       | 8.07
-- Mathematics       | 6.85
-- Mechanical        | 7.75
-- NULL              | 8.80


-- =====================================================
-- 7. Display departments where the average CGPA is greater than 8.0
-- =====================================================

SELECT 
    d.department_name,
    AVG(s.cgpa) AS average_cgpa
FROM Department d
JOIN Student s
ON d.department_id = s.department_id
GROUP BY d.department_name
HAVING AVG(s.cgpa) > 8.0;

-- OUTPUT
-- department_name   | average_cgpa
-- Computer Science  | 9.20
-- Electronics       | 8.07
-- Civil             | 8.40


-- =====================================================
-- 8. Find the total number of students in each department
-- =====================================================

SELECT 
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
GROUP BY d.department_name;

-- OUTPUT
-- department_name   | total_students
-- Biotechnology     | 1
-- Civil             | 2
-- Computer Science  | 3
-- Electronics       | 2
-- Mathematics       | 2
-- Mechanical        | 2
-- NULL              | 1


-- =====================================================
-- 9. Display the highest and lowest marks scored in each subject
-- =====================================================

SELECT 
    subject_id,
    MAX(marks) AS highest_marks,
    MIN(marks) AS lowest_marks
FROM Mark
GROUP BY subject_id;

-- OUTPUT
-- subject_id | highest_marks | lowest_marks
-- 201        | 99            | 88
-- 202        | 89            | 75
-- 203        | 81            | 66
-- 204        | 72            | 72
-- 205        | 98            | 54
-- 206        | 94            | 61
-- 207        | 87            | 87
-- 208        | 90            | 65
-- 209        | 73            | 73
-- 210        | 97            | 44


-- =====================================================
-- 10. Find students who scored more than 90 in any exam
-- =====================================================

SELECT DISTINCT
    s.student_id,
    s.student_name,
    m.marks
FROM Student s
JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks > 90;

-- OUTPUT
-- student_id | student_name   | marks
-- 101        | John Doe       | 91
-- 102        | Mary Jane      | 95
-- 105        | Bruce Wayne    | 98
-- 105        | Bruce Wayne    | 94
-- 109        | Tony Stark     | 99
-- 109        | Tony Stark     | 97
