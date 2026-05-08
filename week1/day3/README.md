# Week 1 - Day 3

## Topics Covered
- Nested Queries
- Correlated Subqueries
- JOIN Operations
- Aggregate Functions
- Advanced SQL Queries
- Department-wise Analysis

## Work Done
- Solved SQL queries from 46 to 65
- Practiced subqueries using MAX, AVG, and COUNT
- Worked on department and employee analysis
- Implemented JOIN and correlated query concepts

## Concepts Practiced

### Nested Queries
- Highest salary
- Second highest salary
- Nth highest salary

### Correlated Queries
- Employees earning above department average
- Employees older than department average

### JOIN Queries
- Employee and department mapping
- Project and department analysis

### Aggregate Functions
- SUM()
- AVG()
- MAX()
- COUNT()

## Tools Used
- DB Fiddle
- GitHub

## Learnings
- Improved understanding of subqueries
- Learned correlated query execution
- Practiced advanced filtering techniques
- Understood department-based analysis

## Progress
- Completed queries 46–65
- Practiced advanced SQL concepts successfully

## Next Plan
- Revise all SQL concepts
- Practice additional JOIN queries
- Learn window functions and views




   # SQL Joins Assignment

## 📌 Overview
This assignment demonstrates the use of different SQL JOIN operations in PostgreSQL using a simple Student-Course Management database.

The database contains four tables:

- `students`
- `courses`
- `instructors`
- `enrollments`

The assignment focuses on:
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN

It also includes handling unmatched records and generating reports using multiple table joins.

---

# 🗂 Database Schema

## 1. instructors
Stores instructor details.

| Column Name | Data Type |
|-------------|------------|
| instructor_id | INT |
| instructor_name | VARCHAR |
| department | VARCHAR |

---

## 2. students
Stores student details.

| Column Name | Data Type |
|-------------|------------|
| student_id | INT |
| student_name | VARCHAR |
| email | VARCHAR |

---

## 3. courses
Stores course information.

| Column Name | Data Type |
|-------------|------------|
| course_id | INT |
| course_name | VARCHAR |
| instructor_id | INT |

---

## 4. enrollments
Stores student enrollment details.

| Column Name | Data Type |
|-------------|------------|
| enrollment_id | INT |
| student_id | INT |
| course_id | INT |
| enrollment_date | DATE |

---

# 🎯 Objectives

The main objectives of this assignment are:

- Understand SQL JOIN concepts
- Retrieve related data from multiple tables
- Handle NULL and unmatched rows
- Generate reports using joins
- Practice PostgreSQL queries

---

# 📚 Topics Covered

## ✅ LEFT JOIN
Used to retrieve all rows from the left table and matching rows from the right table.

Example tasks:
- Students with enrolled courses
- Courses without enrollments
- Students not enrolled in any course

---

## ✅ RIGHT JOIN
Used to retrieve all rows from the right table and matching rows from the left table.

Example task:
- Students and enrollment information using RIGHT JOIN

---

## ✅ FULL OUTER JOIN
Used to retrieve all matching and non-matching rows from both tables.

Example tasks:
- Students and enrollments
- Instructors and courses

---

## ✅ CROSS JOIN
Used to generate all possible combinations of rows between two tables.

Example task:
- Every student with every course

---

# 🧪 Assignment Questions Included

1. Students and enrolled courses  
2. Courses with no enrollments  
3. Instructors and courses taught  
4. Courses without instructors  
5. RIGHT JOIN example  
6. Students not enrolled in any course  
7. FULL OUTER JOIN example  
8. Courses never enrolled  
9. FULL OUTER JOIN with instructors and courses  
10. Student-Course-Instructor report  
11. Bonus CROSS JOIN challenge  

---

# ⚙️ SQL Concepts Practiced

- Table Relationships
- Foreign Keys
- JOIN Operations
- NULL Handling
- Report Generation
- Data Retrieval Techniques

---

# ▶️ How to Run

1. Open PostgreSQL or pgAdmin
2. Create a new database
3. Run the provided SQL script
4. Execute each assignment query

---

# 🛠 Technologies Used

- PostgreSQL
- SQL

---

# 📖 Learning Outcome

After completing this assignment, you will be able to:

- Write complex JOIN queries
- Combine multiple tables effectively
- Handle missing relationships in databases
- Generate meaningful SQL reports

---


# 📌 Conclusion

This assignment provides practical knowledge of SQL JOIN operations and improves understanding of relational database concepts through real-world examples.
