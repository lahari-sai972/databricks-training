-- schema.sql

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);

INSERT INTO employees VALUES
(1, 'Amit', 'Chennai', 2000, '2023-01-01'),
(2, 'Ravi', 'Hyderabad', 1500, '2023-01-02'),
(3, 'Sneha', 'Chennai', 3000, '2023-01-03'),
(4, 'Kiran', 'Bangalore', 2500, '2023-01-04'),
(5, 'Priya', 'Chennai', 2000, '2023-01-05'),
(6, 'Arjun', 'Hyderabad', 1800, '2023-01-06'),
(7, 'Neha', 'Bangalore', 2200, '2023-01-07'),
(8, 'Vikas', 'Chennai', 3000, '2023-01-08'),
(9, 'Anjali', 'Hyderabad', 1700, '2023-01-09'),
(10, 'Rahul', 'Bangalore', 2600, '2023-01-10'),
(11, 'Suresh', 'Chennai', 2800, '2023-01-11'),
(12, 'Pooja', 'Hyderabad', 1600, '2023-01-12'),
(13, 'Manoj', 'Bangalore', 2400, '2023-01-13'),
(14, 'Divya', 'Chennai', 2100, '2023-01-14'),
(15, 'Karthik', 'Hyderabad', 1900, '2023-01-15'),
(16, 'Meena', 'Bangalore', 2300, '2023-01-16'),
(17, 'Raj', 'Chennai', 2700, '2023-01-17'),
(18, 'Simran', 'Hyderabad', 2000, '2023-01-18'),
(19, 'Deepak', 'Bangalore', 2500, '2023-01-19'),
(20, 'Nisha', 'Chennai', 2600, '2023-01-20');


-- queries.sql

-- ROW_NUMBER() QUESTIONS

-- Q1
SELECT emp_name, salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;

-- Q2
SELECT emp_name, department, salary,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;

-- Q3
SELECT emp_name, join_date,
ROW_NUMBER() OVER(ORDER BY join_date DESC) AS row_num
FROM employees;

-- Q4
SELECT emp_name, department, join_date,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY join_date ASC) AS row_num
FROM employees;

-- Q5
SELECT emp_name, salary,
ROW_NUMBER() OVER(ORDER BY salary ASC) AS row_num
FROM employees;

-- Q6
SELECT emp_name, department,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY emp_name ASC) AS row_num
FROM employees;


-- RANK() QUESTIONS

-- Q7
SELECT emp_name, salary,
RANK() OVER(ORDER BY salary DESC) AS rank_num
FROM employees;

-- Q8
SELECT emp_name, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_num
FROM employees;

-- Q9
SELECT emp_name, join_date,
RANK() OVER(ORDER BY join_date DESC) AS rank_num
FROM employees;

-- Q10
SELECT emp_name,
RANK() OVER(ORDER BY emp_name ASC) AS rank_num
FROM employees;

-- Q11
SELECT emp_name, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary ASC) AS rank_num
FROM employees;


-- DENSE_RANK() QUESTIONS

-- Q12
SELECT emp_name, salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_num
FROM employees;

-- Q13
SELECT emp_name, department, salary,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_rank_num
FROM employees;

-- Q14
SELECT emp_name, join_date,
DENSE_RANK() OVER(ORDER BY join_date DESC) AS dense_rank_num
FROM employees;

-- Q15
SELECT emp_name, salary,
DENSE_RANK() OVER(ORDER BY salary ASC) AS dense_rank_num
FROM employees;

-- Q16
SELECT emp_name, department, join_date,
DENSE_RANK() OVER(PARTITION BY department ORDER BY join_date ASC) AS dense_rank_num
FROM employees;
