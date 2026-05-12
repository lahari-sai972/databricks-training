
-- ============================================
-- 21. CTE for Total Sales Per Employee
-- ============================================

WITH employee_sales AS (
    SELECT employee_id,
    SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)

SELECT * FROM employee_sales;



-- ============================================
-- 22. Employees Whose Sales Exceed Company Average
-- ============================================

WITH employee_sales AS (
    SELECT employee_id,
    SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)

SELECT *
FROM employee_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM employee_sales
);



-- ============================================
-- 23. Multiple CTEs for Customer Spending & Ranking
-- ============================================

WITH customer_spending AS (
    SELECT customer_id,
    SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
),

customer_ranking AS (
    SELECT *,
    RANK() OVER(ORDER BY total_spent DESC) AS customer_rank
    FROM customer_spending
)

SELECT * FROM customer_ranking;



-- ============================================
-- 24. Recursive CTE to Generate Numbers 1 to 10
-- ============================================

WITH numbers AS (
    SELECT 1 AS num

    UNION ALL

    SELECT num + 1
    FROM numbers
    WHERE num < 10
)

SELECT * FROM numbers;



-- ============================================
-- 25. Recursive CTE for Employee Hierarchy
-- ============================================

CREATE TABLE employee_hierarchy (
    employee_id INT,
    employee_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee_hierarchy VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'Diana', 2);

WITH hierarchy AS (
    SELECT employee_id, employee_name, manager_id, 1 AS level
    FROM employee_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id, e.employee_name,
           e.manager_id, h.level + 1
    FROM employee_hierarchy e
    JOIN hierarchy h
    ON e.manager_id = h.employee_id
)

SELECT * FROM hierarchy;



-- ============================================
-- 26. CTE Filtering Orders Above Average Amount
-- ============================================

WITH avg_orders AS (
    SELECT *
    FROM orders
    WHERE total_amount >
    (
        SELECT AVG(total_amount)
        FROM orders
    )
)

SELECT * FROM avg_orders;



-- ============================================
-- 27. CTE + Window Function to Rank Customers
-- ============================================

WITH customer_totals AS (
    SELECT customer_id,
    SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)

SELECT *,
RANK() OVER(ORDER BY total_spending DESC) AS spending_rank
FROM customer_totals;



-- ============================================
-- 28. Second Highest Salary in Each Department
-- ============================================

SELECT *
FROM (
    SELECT employee_name, department, salary,
    DENSE_RANK() OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank
    FROM employees
) t
WHERE salary_rank = 2;



-- ============================================
-- 29. Difference Between Salary and Department Max
-- ============================================

SELECT employee_name, department, salary,
MAX(salary) OVER(PARTITION BY department) - salary
AS salary_difference
FROM employees;



-- ============================================
-- 30. Top Performing Employee in Each Department
-- ============================================

WITH employee_sales AS (
    SELECT e.employee_id,
           e.employee_name,
           e.department,
           SUM(o.total_amount) AS total_sales
    FROM employees e
    JOIN orders o
    ON e.employee_id = o.employee_id
    GROUP BY e.employee_id,
             e.employee_name,
             e.department
),

ranked_employees AS (
    SELECT *,
    RANK() OVER(
        PARTITION BY department
        ORDER BY total_sales DESC
    ) AS sales_rank
    FROM employee_sales
)

SELECT *
FROM ranked_employees
WHERE sales_rank = 1;

