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
