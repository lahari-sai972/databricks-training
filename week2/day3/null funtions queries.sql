-- 1. Employees whose salary is NULL
SELECT *
FROM Employees
WHERE salary IS NULL;


-- 2. Orders where discount is NOT NULL
SELECT *
FROM Orders
WHERE discount IS NOT NULL;


-- 3. Products where category is NULL
SELECT *
FROM Products
WHERE category IS NULL;


-- 4. Count employees with NULL manager_id
SELECT COUNT(*) AS null_managers
FROM Employees
WHERE manager_id IS NULL;



-- =====================================================
-- LEVEL 2 (ISNULL / IFNULL)
-- =====================================================

-- 1. Replace NULL salary with 0
SELECT
name,
IFNULL(salary,0) AS salary
FROM Employees;


-- 2. Replace NULL bonus with 1000
SELECT
name,
IFNULL(bonus,1000) AS bonus
FROM Employees;


-- 3. Replace NULL amount with 500
SELECT
customer_name,
IFNULL(amount,500) AS amount
FROM Orders;


-- 4. Replace NULL stock with 0
SELECT
product_name,
IFNULL(stock,0) AS stock
FROM Products;



-- =====================================================
-- LEVEL 3 (COALESCE)
-- =====================================================

-- 1. Salary else bonus
SELECT
name,
COALESCE(salary,bonus) AS earnings
FROM Employees;


-- 2. Salary -> bonus -> 0
SELECT
name,
COALESCE(salary,bonus,0) AS income
FROM Employees;


-- 3. Product price default 1000
SELECT
product_name,
COALESCE(price,1000) AS final_price
FROM Products;


-- 4. Amount -> discount -> 0
SELECT
customer_name,
COALESCE(amount,discount,0) AS payment
FROM Orders;



-- =====================================================
-- LEVEL 4 (NULLIF)
-- =====================================================

-- 1. Salary becomes NULL if 0
SELECT
name,
NULLIF(salary,0) AS salary
FROM Employees;


-- 2. Discount becomes NULL if 0
SELECT
customer_name,
NULLIF(discount,0) AS discount
FROM Orders;


-- 3. Avoid divide by zero
SELECT
amount / NULLIF(discount,0) AS result
FROM Orders;


-- 4. Replace DISC10 with NULL
SELECT
order_id,
NULLIF(coupon_code,'DISC10') AS coupon
FROM Orders;



-- =====================================================
-- LEVEL 5 (REAL-TIME)
-- =====================================================

-- 1. Total earnings
SELECT
name,
IFNULL(salary,0) + IFNULL(bonus,0) AS total_earnings
FROM Employees;


-- 2. Salary and bonus both NULL
SELECT *
FROM Employees
WHERE salary IS NULL
AND bonus IS NULL;


-- 3. Price NULL but category exists
SELECT *
FROM Products
WHERE price IS NULL
AND category IS NOT NULL;


-- 4. Amount and discount both NULL
SELECT *
FROM Orders
WHERE amount IS NULL
AND discount IS NULL;



-- =====================================================
-- LEVEL 6 (ADVANCED)
-- =====================================================

-- 1. Employee income
SELECT
name,
COALESCE(salary,bonus,1000) AS income
FROM Employees;


-- 2. Replace 0 discount with NULL
SELECT
customer_name,
NULLIF(discount,0) AS discount
FROM Orders;


-- 3. Final payable amount
SELECT
customer_name,
IFNULL(amount,0) - IFNULL(discount,0) AS payable_amount
FROM Orders;


-- 4. Salary NULL but manager exists
SELECT *
FROM Employees
WHERE salary IS NULL
AND manager_id IS NOT NULL;
