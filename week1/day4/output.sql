-- ============================================
-- OUTPUTS – SQL Assignment (Window Functions & CTEs)
-- ============================================


-- 1. ROW_NUMBER()

employee_name   | salary | row_num
-----------------------------------
Diana Prince    | 95000  | 1
Charlie Brown   | 90000  | 2
Alice Johnson   | 70000  | 3
Bob Smith       | 65000  | 4


-- 2. RANK()

employee_name   | salary | rank_num
------------------------------------
Diana Prince    | 95000  | 1
Charlie Brown   | 90000  | 2
Alice Johnson   | 70000  | 3
Bob Smith       | 65000  | 4


-- 3. DENSE_RANK()

employee_name   | salary | dense_rank_num
------------------------------------------
Diana Prince    | 95000  | 1
Charlie Brown   | 90000  | 2
Alice Johnson   | 70000  | 3
Bob Smith       | 65000  | 4


-- 4. Top 3 Highest Paid Employees

employee_name   | salary | rn
--------------------------------
Diana Prince    | 95000  | 1
Charlie Brown   | 90000  | 2
Alice Johnson   | 70000  | 3


-- 5. Rank Employees Within Each Department

employee_name   | department | salary | dept_rank
--------------------------------------------------
Alice Johnson   | Sales      | 70000  | 1
Bob Smith       | Sales      | 65000  | 2
Diana Prince    | IT         | 95000  | 1
Charlie Brown   | IT         | 90000  | 2


-- 6. Highest Salary in Each Department

employee_name   | department | salary | highest_salary
-------------------------------------------------------
Alice Johnson   | Sales      | 70000  | 70000
Bob Smith       | Sales      | 65000  | 70000
Charlie Brown   | IT         | 90000  | 95000
Diana Prince    | IT         | 95000  | 95000


-- 7. Running Total of Order Amounts

order_id | order_date | total_amount | running_total
-----------------------------------------------------
101      | 2024-01-10 | 500          | 500
102      | 2024-01-11 | 700          | 1200
103      | 2024-01-15 | 1200         | 2400
104      | 2024-01-18 | 300          | 2700


-- 8. Cumulative Sales Amount for Each Employee

employee_id | order_date | total_amount | cumulative_sales
-----------------------------------------------------------
1           | 2024-01-10 | 500          | 500
1           | 2024-01-15 | 1200         | 1700
2           | 2024-01-11 | 700          | 700
3           | 2024-01-18 | 300          | 300


-- 9. Previous Order Amount Using LAG()

customer_id | order_date | total_amount | previous_order
---------------------------------------------------------
1           | 2024-01-10 | 500          | NULL
1           | 2024-01-15 | 1200         | 500
2           | 2024-01-11 | 700          | NULL
3           | 2024-01-18 | 300          | NULL


-- 10. Next Order Amount Using LEAD()

customer_id | order_date | total_amount | next_order
-----------------------------------------------------
1           | 2024-01-10 | 500          | 1200
1           | 2024-01-15 | 1200         | NULL
2           | 2024-01-11 | 700          | NULL
3           | 2024-01-18 | 300          | NULL


-- 11. Difference Between Current and Previous Order

customer_id | order_date | total_amount | difference_amount
-------------------------------------------------------------
1           | 2024-01-10 | 500          | NULL
1           | 2024-01-15 | 1200         | 700
2           | 2024-01-11 | 700          | NULL
3           | 2024-01-18 | 300          | NULL


-- 12. Moving Average of Last 3 Orders

order_id | order_date | total_amount | moving_average
-------------------------------------------------------
101      | 2024-01-10 | 500          | 500
102      | 2024-01-11 | 700          | 600
103      | 2024-01-15 | 1200         | 800
104      | 2024-01-18 | 300          | 733.33


-- 13. Divide Employees into Salary Quartiles

employee_name   | salary | quartile
------------------------------------
Diana Prince    | 95000  | 1
Charlie Brown   | 90000  | 2
Alice Johnson   | 70000  | 3
Bob Smith       | 65000  | 4


-- 14. First Order Placed by Each Customer

order_id | customer_id | employee_id | order_date | total_amount
-----------------------------------------------------------------
101      | 1           | 1           | 2024-01-10 | 500
102      | 2           | 2           | 2024-01-11 | 700
104      | 3           | 3           | 2024-01-18 | 300


-- 15. Latest Order Placed by Each Customer

order_id | customer_id | employee_id | order_date | total_amount
-----------------------------------------------------------------
103      | 1           | 1           | 2024-01-15 | 1200
102      | 2           | 2           | 2024-01-11 | 700
104      | 3           | 3           | 2024-01-18 | 300


-- 16. Employee Salaries with Department Average

employee_name   | department | salary | dept_avg_salary
--------------------------------------------------------
Alice Johnson   | Sales      | 70000  | 67500
Bob Smith       | Sales      | 65000  | 67500
Charlie Brown   | IT         | 90000  | 92500
Diana Prince    | IT         | 95000  | 92500


-- 17. Employees Earning Above Department Average

employee_name   | department | salary | dept_avg
-------------------------------------------------
Alice Johnson   | Sales      | 70000  | 67500
Diana Prince    | IT         | 95000  | 92500


-- 18. Department Payroll Using SUM() OVER()

employee_name   | department | salary | dept_payroll
-----------------------------------------------------
Alice Johnson   | Sales      | 70000  | 135000
Bob Smith       | Sales      | 65000  | 135000
Charlie Brown   | IT         | 90000  | 185000
Diana Prince    | IT         | 95000  | 185000


-- 19. Percentage Contribution of Salary

employee_name   | department | salary | salary_percentage
----------------------------------------------------------
Alice Johnson   | Sales      | 70000  | 51.85
Bob Smith       | Sales      | 65000  | 48.15
Charlie Brown   | IT         | 90000  | 48.65
Diana Prince    | IT         | 95000  | 51.35


-- 20. Total Number of Employees

employee_name   | department | total_employees
------------------------------------------------
Alice Johnson   | Sales      | 4
Bob Smith       | Sales      | 4
Charlie Brown   | IT         | 4
Diana Prince    | IT         | 4
