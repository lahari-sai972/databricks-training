

# 21. CTE for Total Sales Per Employee

## Query
```sql
WITH employee_sales AS (
    SELECT employee_id,
    SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)

SELECT * FROM employee_sales;
```

## Output
| employee_id | total_sales |
|-------------|-------------|
| 101 | 25000 |
| 102 | 18000 |
| 103 | 32000 |
| 104 | 15000 |

---

# 22. Employees Whose Sales Exceed Company Average

## Query
```sql
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
```

## Output
| employee_id | total_sales |
|-------------|-------------|
| 103 | 32000 |

---

# 23. Multiple CTEs for Customer Spending & Ranking

## Query
```sql
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
```

## Output
| customer_id | total_spent | customer_rank |
|-------------|-------------|---------------|
| 201 | 40000 | 1 |
| 202 | 30000 | 2 |
| 203 | 18000 | 3 |
| 204 | 12000 | 4 |

---

# 24. Recursive CTE to Generate Numbers 1 to 10

## Query
```sql
WITH numbers AS (
    SELECT 1 AS num

    UNION ALL

    SELECT num + 1
    FROM numbers
    WHERE num < 10
)

SELECT * FROM numbers;
```

## Output
| num |
|-----|
| 1 |
| 2 |
| 3 |
| 4 |
| 5 |
| 6 |
| 7 |
| 8 |
| 9 |
| 10 |

---

# 25. Recursive CTE for Employee Hierarchy

## Query
```sql
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
```

## Output
| employee_id | employee_name | manager_id | level |
|-------------|---------------|------------|-------|
| 1 | Alice | NULL | 1 |
| 2 | Bob | 1 | 2 |
| 3 | Charlie | 1 | 2 |
| 4 | Diana | 2 | 3 |

---

# 26. CTE Filtering Orders Above Average Amount

## Query
```sql
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
```

## Output
| order_id | customer_id | employee_id | total_amount |
|----------|-------------|-------------|--------------|
| 1001 | 201 | 103 | 15000 |
| 1002 | 202 | 101 | 12000 |
| 1005 | 201 | 103 | 17000 |

---

# 27. CTE + Window Function to Rank Customers

## Query
```sql
WITH customer_totals AS (
    SELECT customer_id,
    SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)

SELECT *,
RANK() OVER(ORDER BY total_spending DESC) AS spending_rank
FROM customer_totals;
```

## Output
| customer_id | total_spending | spending_rank |
|-------------|----------------|---------------|
| 201 | 40000 | 1 |
| 202 | 30000 | 2 |
| 203 | 18000 | 3 |
| 204 | 12000 | 4 |

---

# 28. Second Highest Salary in Each Department

## Query
```sql
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
```

## Output
| employee_name | department | salary | salary_rank |
|---------------|------------|--------|-------------|
| Bob | Sales | 65000 | 2 |
| Diana | HR | 55000 | 2 |

---

# 29. Difference Between Salary and Department Max

## Query
```sql
SELECT employee_name, department, salary,
MAX(salary) OVER(PARTITION BY department) - salary
AS salary_difference
FROM employees;
```

## Output
| employee_name | department | salary | salary_difference |
|---------------|------------|--------|-------------------|
| Alice | Sales | 70000 | 0 |
| Bob | Sales | 65000 | 5000 |
| Charlie | HR | 60000 | 0 |
| Diana | HR | 55000 | 5000 |

---

# 30. Top Performing Employee in Each Department

## Query
```sql
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
```

## Output
| employee_id | employee_name | department | total_sales | sales_rank |
|-------------|---------------|------------|-------------|------------|
| 103 | Charlie | HR | 32000 | 1 |
| 101 | Alice | Sales | 25000 | 1 |

---
