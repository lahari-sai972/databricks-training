-- =====================================================
-- 11. Display all students from Computer Science department
-- =====================================================

SELECT 
    s.student_id,
    s.student_name
FROM Student s
JOIN Department d
ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';


-- =====================================================
-- 12. Find students whose CGPA is greater than 8.5
-- =====================================================

SELECT 
    student_id,
    student_name,
    cgpa
FROM Student
WHERE cgpa > 8.5;


-- =====================================================
-- 13. Display all subjects with their staff names
-- =====================================================

SELECT 
    sub.subject_name,
    st.staff_name
FROM Subject sub
LEFT JOIN Staff st
ON sub.staff_id = st.staff_id;


-- =====================================================
-- 14. Find the total number of subjects in each semester
-- =====================================================

SELECT 
    semester,
    COUNT(subject_id) AS total_subjects
FROM Subject
GROUP BY semester;


-- =====================================================
-- 15. Display students admitted after 2020
-- =====================================================

SELECT 
    student_id,
    student_name,
    admission_year
FROM Student
WHERE admission_year > 2020;


-- =====================================================
-- 16. Find staff members with salary greater than 90000
-- =====================================================

SELECT 
    staff_id,
    staff_name,
    salary
FROM Staff
WHERE salary > 90000;


-- =====================================================
-- 17. Display all female students
-- =====================================================

SELECT 
    student_id,
    student_name
FROM Student
WHERE gender = 'Female';


-- =====================================================
-- 18. Find the number of students in each city
-- =====================================================

SELECT 
    city,
    COUNT(student_id) AS total_students
FROM Student
GROUP BY city;


-- =====================================================
-- 19. Display subjects with credits greater than 3
-- =====================================================

SELECT 
    subject_id,
    subject_name,
    credits
FROM Subject
WHERE credits > 3;


-- =====================================================
-- 20. Find students who scored less than 50 marks
-- =====================================================

SELECT DISTINCT
    s.student_id,
    s.student_name,
    m.marks
FROM Student s
JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks < 50;
