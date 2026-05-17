**Schema (MySQL v5.7)**

    
    CREATE TABLE Employees (
        emp_id INT,
        name VARCHAR(50),
        salary INT,
        bonus INT,
        manager_id INT
    );
    
    INSERT INTO Employees VALUES
    (1, 'Amit', 50000, NULL, 101),
    (2, 'John', NULL, 5000, 102),
    (3, 'Sara', 60000, NULL, NULL),
    (4, 'David', NULL, NULL, 103),
    (5, 'Priya', 45000, 3000, 101),
    (6, 'Kiran', NULL, NULL, NULL),
    (7, 'Ravi', 70000, 7000, 102),
    (8, 'Neha', NULL, 2000, NULL);
    
    
    CREATE TABLE Orders (
        order_id INT,
        customer_name VARCHAR(50),
        amount INT,
        discount INT,
        coupon_code VARCHAR(20)
    );
    
    INSERT INTO Orders VALUES
    (101, 'Amit', 1000, NULL, 'DISC10'),
    (102, 'John', NULL, 50, NULL),
    (103, 'Sara', 2000, NULL, 'DISC20'),
    (104, 'David', NULL, NULL, NULL),
    (105, 'Priya', 1500, 100, NULL),
    (106, 'Kiran', NULL, NULL, 'DISC5'),
    (107, 'Ravi', 3000, NULL, NULL),
    (108, 'Neha', NULL, 200, 'DISC15');
    
    
    CREATE TABLE Products (
        product_id INT,
        product_name VARCHAR(50),
        price INT,
        category VARCHAR(50),
        stock INT
    );
    
    INSERT INTO Products VALUES
    (1, 'Laptop', 50000, 'Electronics', 10),
    (2, 'Phone', NULL, 'Electronics', NULL),
    (3, 'Tablet', 30000, NULL, 5),
    (4, 'Headphones', NULL, NULL, NULL),
    (5, 'Monitor', 20000, 'Electronics', 0),
    (6, 'Keyboard', NULL, 'Accessories', 15),
    (7, 'Mouse', 500, NULL, NULL),
    (8, 'Printer', NULL, 'Electronics', 3);

---

**Query #1**

    -- 1. Employees whose salary is NULL
    SELECT *
    FROM Employees
    WHERE salary IS NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 4      | David |        |       | 103        |
| 6      | Kiran |        |       |            |
| 8      | Neha  |        | 2000  |            |

---
**Query #2**

    -- 2. Orders where discount is NOT NULL
    SELECT *
    FROM Orders
    WHERE discount IS NOT NULL;

| order_id | customer_name | amount | discount | coupon_code |
| -------- | ------------- | ------ | -------- | ----------- |
| 102      | John          |        | 50       |             |
| 105      | Priya         | 1500   | 100      |             |
| 108      | Neha          |        | 200      | DISC15      |

---
**Query #3**

    -- 3. Products where category is NULL
    SELECT *
    FROM Products
    WHERE category IS NULL;

| product_id | product_name | price | category | stock |
| ---------- | ------------ | ----- | -------- | ----- |
| 3          | Tablet       | 30000 |          | 5     |
| 4          | Headphones   |       |          |       |
| 7          | Mouse        | 500   |          |       |

---
**Query #4**

    -- 4. Count employees with NULL manager_id
    SELECT COUNT(*) AS null_managers
    FROM Employees
    WHERE manager_id IS NULL;

| null_managers |
| ------------- |
| 3             |

---
**Query #5**

    -- =====================================================
    -- LEVEL 2 (ISNULL / IFNULL)
    -- =====================================================
    
    -- 1. Replace NULL salary with 0
    SELECT
    name,
    IFNULL(salary,0) AS salary
    FROM Employees;

| name  | salary |
| ----- | ------ |
| Amit  | 50000  |
| John  | 0      |
| Sara  | 60000  |
| David | 0      |
| Priya | 45000  |
| Kiran | 0      |
| Ravi  | 70000  |
| Neha  | 0      |

---
**Query #6**

    -- 2. Replace NULL bonus with 1000
    SELECT
    name,
    IFNULL(bonus,1000) AS bonus
    FROM Employees;

| name  | bonus |
| ----- | ----- |
| Amit  | 1000  |
| John  | 5000  |
| Sara  | 1000  |
| David | 1000  |
| Priya | 3000  |
| Kiran | 1000  |
| Ravi  | 7000  |
| Neha  | 2000  |

---
**Query #7**

    -- 3. Replace NULL amount with 500
    SELECT
    customer_name,
    IFNULL(amount,500) AS amount
    FROM Orders;

| customer_name | amount |
| ------------- | ------ |
| Amit          | 1000   |
| John          | 500    |
| Sara          | 2000   |
| David         | 500    |
| Priya         | 1500   |
| Kiran         | 500    |
| Ravi          | 3000   |
| Neha          | 500    |

---
**Query #8**

    -- 4. Replace NULL stock with 0
    SELECT
    product_name,
    IFNULL(stock,0) AS stock
    FROM Products;

| product_name | stock |
| ------------ | ----- |
| Laptop       | 10    |
| Phone        | 0     |
| Tablet       | 5     |
| Headphones   | 0     |
| Monitor      | 0     |
| Keyboard     | 15    |
| Mouse        | 0     |
| Printer      | 3     |

---
**Query #9**

    -- =====================================================
    -- LEVEL 3 (COALESCE)
    -- =====================================================
    
    -- 1. Salary else bonus
    SELECT
    name,
    COALESCE(salary,bonus) AS earnings
    FROM Employees;

| name  | earnings |
| ----- | -------- |
| Amit  | 50000    |
| John  | 5000     |
| Sara  | 60000    |
| David |          |
| Priya | 45000    |
| Kiran |          |
| Ravi  | 70000    |
| Neha  | 2000     |

---
**Query #10**

    -- 2. Salary -> bonus -> 0
    SELECT
    name,
    COALESCE(salary,bonus,0) AS income
    FROM Employees;

| name  | income |
| ----- | ------ |
| Amit  | 50000  |
| John  | 5000   |
| Sara  | 60000  |
| David | 0      |
| Priya | 45000  |
| Kiran | 0      |
| Ravi  | 70000  |
| Neha  | 2000   |

---
**Query #11**

    -- 3. Product price default 1000
    SELECT
    product_name,
    COALESCE(price,1000) AS final_price
    FROM Products;

| product_name | final_price |
| ------------ | ----------- |
| Laptop       | 50000       |
| Phone        | 1000        |
| Tablet       | 30000       |
| Headphones   | 1000        |
| Monitor      | 20000       |
| Keyboard     | 1000        |
| Mouse        | 500         |
| Printer      | 1000        |

---
**Query #12**

    -- 4. Amount -> discount -> 0
    SELECT
    customer_name,
    COALESCE(amount,discount,0) AS payment
    FROM Orders;

| customer_name | payment |
| ------------- | ------- |
| Amit          | 1000    |
| John          | 50      |
| Sara          | 2000    |
| David         | 0       |
| Priya         | 1500    |
| Kiran         | 0       |
| Ravi          | 3000    |
| Neha          | 200     |

---
**Query #13**

    -- =====================================================
    -- LEVEL 4 (NULLIF)
    -- =====================================================
    
    -- 1. Salary becomes NULL if 0
    SELECT
    name,
    NULLIF(salary,0) AS salary
    FROM Employees;

| name  | salary |
| ----- | ------ |
| Amit  | 50000  |
| John  |        |
| Sara  | 60000  |
| David |        |
| Priya | 45000  |
| Kiran |        |
| Ravi  | 70000  |
| Neha  |        |

---
**Query #14**

    -- 2. Discount becomes NULL if 0
    SELECT
    customer_name,
    NULLIF(discount,0) AS discount
    FROM Orders;

| customer_name | discount |
| ------------- | -------- |
| Amit          |          |
| John          | 50       |
| Sara          |          |
| David         |          |
| Priya         | 100      |
| Kiran         |          |
| Ravi          |          |
| Neha          | 200      |

---
**Query #15**

    -- 3. Avoid divide by zero
    SELECT
    amount / NULLIF(discount,0) AS result
    FROM Orders;

| result |
| ------ |
|        |
|        |
|        |
|        |
| 15.0   |
|        |
|        |
|        |

---
**Query #16**

    -- 4. Replace DISC10 with NULL
    SELECT
    order_id,
    NULLIF(coupon_code,'DISC10') AS coupon
    FROM Orders;

| order_id | coupon |
| -------- | ------ |
| 101      |        |
| 102      |        |
| 103      | DISC20 |
| 104      |        |
| 105      |        |
| 106      | DISC5  |
| 107      |        |
| 108      | DISC15 |

---
**Query #17**

    -- =====================================================
    -- LEVEL 5 (REAL-TIME)
    -- =====================================================
    
    -- 1. Total earnings
    SELECT
    name,
    IFNULL(salary,0) + IFNULL(bonus,0) AS total_earnings
    FROM Employees;

| name  | total_earnings |
| ----- | -------------- |
| Amit  | 50000          |
| John  | 5000           |
| Sara  | 60000          |
| David | 0              |
| Priya | 48000          |
| Kiran | 0              |
| Ravi  | 77000          |
| Neha  | 2000           |

---
**Query #18**

    -- 2. Salary and bonus both NULL
    SELECT *
    FROM Employees
    WHERE salary IS NULL
    AND bonus IS NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 4      | David |        |       | 103        |
| 6      | Kiran |        |       |            |

---
**Query #19**

    -- 3. Price NULL but category exists
    SELECT *
    FROM Products
    WHERE price IS NULL
    AND category IS NOT NULL;

| product_id | product_name | price | category    | stock |
| ---------- | ------------ | ----- | ----------- | ----- |
| 2          | Phone        |       | Electronics |       |
| 6          | Keyboard     |       | Accessories | 15    |
| 8          | Printer      |       | Electronics | 3     |

---
**Query #20**

    -- 4. Amount and discount both NULL
    SELECT *
    FROM Orders
    WHERE amount IS NULL
    AND discount IS NULL;

| order_id | customer_name | amount | discount | coupon_code |
| -------- | ------------- | ------ | -------- | ----------- |
| 104      | David         |        |          |             |
| 106      | Kiran         |        |          | DISC5       |

---
**Query #21**

    -- =====================================================
    -- LEVEL 6 (ADVANCED)
    -- =====================================================
    
    -- 1. Employee income
    SELECT
    name,
    COALESCE(salary,bonus,1000) AS income
    FROM Employees;

| name  | income |
| ----- | ------ |
| Amit  | 50000  |
| John  | 5000   |
| Sara  | 60000  |
| David | 1000   |
| Priya | 45000  |
| Kiran | 1000   |
| Ravi  | 70000  |
| Neha  | 2000   |

---
**Query #22**

    -- 2. Replace 0 discount with NULL
    SELECT
    customer_name,
    NULLIF(discount,0) AS discount
    FROM Orders;

| customer_name | discount |
| ------------- | -------- |
| Amit          |          |
| John          | 50       |
| Sara          |          |
| David         |          |
| Priya         | 100      |
| Kiran         |          |
| Ravi          |          |
| Neha          | 200      |

---
**Query #23**

    -- 3. Final payable amount
    SELECT
    customer_name,
    IFNULL(amount,0) - IFNULL(discount,0) AS payable_amount
    FROM Orders;

| customer_name | payable_amount |
| ------------- | -------------- |
| Amit          | 1000           |
| John          | -50            |
| Sara          | 2000           |
| David         | 0              |
| Priya         | 1400           |
| Kiran         | 0              |
| Ravi          | 3000           |
| Neha          | -200           |

---
**Query #24**

    -- 4. Salary NULL but manager exists
    SELECT *
    FROM Employees
    WHERE salary IS NULL
    AND manager_id IS NOT NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 4      | David |        |       | 103        |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
