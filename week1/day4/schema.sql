
-- ============================================
-- SQL Assignment – Window Functions and CTEs
-- ============================================


-- ============================================
-- TABLE CREATION
-- ============================================

CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'Alice Johnson', 'Sales', 70000, '2020-01-15'),
(2, 'Bob Smith', 'Sales', 65000, '2021-03-20'),
(3, 'Charlie Brown', 'IT', 90000, '2019-07-01'),
(4, 'Diana Prince', 'IT', 95000, '2018-11-11');


CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    employee_id INT,
    order_date DATE,
    total_amount INT
);

INSERT INTO orders VALUES
(101, 1, 1, '2024-01-10', 500),
(102, 2, 2, '2024-01-11', 700),
(103, 1, 1, '2024-01-15', 1200),
(104, 3, 3, '2024-01-18', 300);



-- ============================================
-- 1. ROW_NUMBER()
-- ============================================

SELECT employee_name, salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;



-- ============================================
-- 2. RANK()
-- ============================================

SELECT employee_name, salary,
RANK() OVER(ORDER BY salary DESC) AS rank_num
FROM employees;



-- ============================================
-- 3. DENSE_RANK()
-- ============================================

SELECT employee_name, salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_num
FROM employees;



-- ============================================
-- 4. Top 3 Highest Paid Employees
-- ============================================

SELECT *
FROM (
    SELECT employee_name, salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS rn
    FROM employees
) t
WHERE rn <= 3;



-- ============================================
-- 5. Rank Employees Within Each Department
-- ============================================

SELECT employee_name, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;



-- ============================================
-- 6. Highest Salary in Each Department
-- ============================================

SELECT employee_name, department, salary,
MAX(salary) OVER(PARTITION BY department) AS highest_salary
FROM employees;



-- ============================================
-- 7. Running Total of Order Amounts
-- ============================================

SELECT order_id, order_date, total_amount,
SUM(total_amount) OVER(ORDER BY order_date) AS running_total
FROM orders;



-- ============================================
-- 8. Cumulative Sales Amount for Each Employee
-- ============================================

SELECT employee_id, order_date, total_amount,
SUM(total_amount) OVER(
    PARTITION BY employee_id
    ORDER BY order_date
) AS cumulative_sales
FROM orders;



-- ============================================
-- 9. Previous Order Amount Using LAG()
-- ============================================

SELECT customer_id, order_date, total_amount,
LAG(total_amount) OVER(
    PARTITION BY customer_id
    ORDER BY order_date
) AS previous_order
FROM orders;



-- ============================================
-- 10. Next Order Amount Using LEAD()
-- ============================================

SELECT customer_id, order_date, total_amount,
LEAD(total_amount) OVER(
    PARTITION BY customer_id
    ORDER BY order_date
) AS next_order
FROM orders;



-- ============================================
-- 11. Difference Between Current and Previous Order
-- ============================================

SELECT customer_id, order_date, total_amount,
total_amount -
LAG(total_amount) OVER(
    PARTITION BY customer_id
    ORDER BY order_date
) AS difference_amount
FROM orders;



-- ============================================
-- 12. Moving Average of Last 3 Orders
-- ============================================

SELECT order_id, order_date, total_amount,
AVG(total_amount) OVER(
    ORDER BY order_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS moving_average
FROM orders;



-- ============================================
-- 13. Divide Employees into Salary Quartiles
-- ============================================

SELECT employee_name, salary,
NTILE(4) OVER(ORDER BY salary DESC) AS quartile
FROM employees;



-- ============================================
-- 14. First Order Placed by Each Customer
-- ============================================

SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS rn
    FROM orders
) t
WHERE rn = 1;



-- ============================================
-- 15. Latest Order Placed by Each Customer
-- ============================================

SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY customer_id
        ORDER BY order_date DESC
    ) AS rn
    FROM orders
) t
WHERE rn = 1;



-- ============================================
-- 16. Employee Salaries with Department Average
-- ============================================

SELECT employee_name, department, salary,
AVG(salary) OVER(PARTITION BY department) AS dept_avg_salary
FROM employees;



-- ============================================
-- 17. Employees Earning Above Department Average
-- ============================================

SELECT *
FROM (
    SELECT employee_name, department, salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg
    FROM employees
) t
WHERE salary > dept_avg;



-- ============================================
-- 18. Department Payroll Using SUM() OVER()
-- ============================================

SELECT employee_name, department, salary,
SUM(salary) OVER(PARTITION BY department) AS dept_payroll
FROM employees;



-- ============================================
-- 19. Percentage Contribution of Salary
-- ============================================

SELECT employee_name, department, salary,
ROUND(
    salary * 100.0 /
    SUM(salary) OVER(PARTITION BY department),
2) AS salary_percentage
FROM employees;



-- ============================================
-- 20. Total Number of Employees
-- ============================================

SELECT employee_name, department,
COUNT(*) OVER() AS total_employees
FROM employees;




