-- LEVEL 1 : QUESTION 1

SELECT
LOWER(emp_name) AS employee_name,
ROUND(salary - (salary * tax_percent/100)) AS net_salary,
YEAR(last_revision) AS revision_year,
TIMESTAMPDIFF(MONTH,last_revision,CURDATE()) AS months_since_revision,

CASE
WHEN tax_percent > 20 
AND TIMESTAMPDIFF(MONTH,last_revision,CURDATE()) > 24
THEN 'Flag Tax Shock'

WHEN tax_percent BETWEEN 15 AND 20
THEN 'Flag Review Needed'

ELSE 'Stable'
END AS status

FROM salary_audit;



-- LEVEL 1 : QUESTION 2

SELECT
INITCAP(emp_name) AS employee_name,
ROUND((bonus/base_salary)*100) AS bonus_percentage,
DAYNAME(bonus_date) AS bonus_day,
ABS(base_salary - bonus) AS salary_bonus_difference,

CASE
WHEN ((bonus/base_salary)*100) > 30
AND DAYNAME(bonus_date) IN ('Saturday','Sunday')
THEN 'Suspicious'

WHEN ((bonus/base_salary)*100) <= 20
THEN 'Normal'

ELSE 'Audit'
END AS status

FROM bonus_monitor;



-- LEVEL 1 : QUESTION 3

SELECT
UPPER(emp_name) AS employee_name,
TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) AS actual_experience,

ABS(
declared_experience - 
TIMESTAMPDIFF(YEAR,joining_date,CURDATE())
) AS experience_difference,

FLOOR(salary) AS floor_salary,

CASE
WHEN declared_experience > 
TIMESTAMPDIFF(YEAR,joining_date,CURDATE())
THEN 'Overstated'

WHEN declared_experience < 
TIMESTAMPDIFF(YEAR,joining_date,CURDATE())
THEN 'Understated'

ELSE 'Matched'
END AS status

FROM employee_experience;



-- LEVEL 1 : QUESTION 4

SELECT
RIGHT(emp_name,2) AS last_two_characters,
DAY(credit_date) AS day_of_month,
TRUNCATE(salary,0) AS truncated_salary,
MOD(TRUNCATE(salary,0),10) AS salary_mod,

CASE
WHEN MOD(TRUNCATE(salary,0),10) = DAY(credit_date)
THEN 'Pattern Match'

ELSE 'No Match'
END AS status

FROM salary_digits;



-- LEVEL 1 : QUESTION 5

SELECT
LOWER(emp_name) AS employee_name,
DAYNAME(payment_date) AS weekday,
ROUND(salary) AS rounded_salary,
MOD(ROUND(salary),2) AS salary_mod,

CASE
WHEN MOD(ROUND(salary),2)=0
AND DAYOFMONTH(payment_date)%2<>0
THEN 'Violation'

ELSE 'Compliant'
END AS status

FROM payroll_control;



-- LEVEL 1 : QUESTION 6

SELECT
INITCAP(emp_name) AS employee_name,
TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) AS years_since_hike,
POWER(TIMESTAMPDIFF(YEAR,last_hike,CURDATE()),2) AS power_years,
ROUND(salary * 1.1) AS salary_impact,

CASE
WHEN TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) > 5
THEN 'High Inflation Risk'

WHEN TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) BETWEEN 3 AND 5
THEN 'Moderate'

ELSE 'Low'
END AS status

FROM inflation_watch;



-- LEVEL 1 : QUESTION 7

SELECT
UPPER(emp_name) AS employee_name,
YEAR(record_date) AS record_year,
SIGN(salary) AS salary_sign,
ABS(salary) AS absolute_salary,

CASE
WHEN salary < 0 THEN 'Negative Error'
WHEN salary = 0 THEN 'Zero Salary'
ELSE 'Valid'
END AS status

FROM salary_integrity;



-- LEVEL 1 : QUESTION 8

SELECT
LENGTH(emp_name) AS name_length,
TIMESTAMPDIFF(YEAR,join_date,CURDATE()) AS years_of_service,
ROUND(salary) AS rounded_salary,

CASE
WHEN LENGTH(emp_name) > 
TIMESTAMPDIFF(YEAR,join_date,CURDATE())
THEN 'Name Bias'

ELSE 'Neutral'
END AS status

FROM name_salary;



-- LEVEL 1 : QUESTION 9

SELECT
MONTHNAME(paid_date) AS month_name,
CEIL(salary) AS ceil_salary,
LAST_DAY(paid_date) AS last_day_of_month,

CASE
WHEN paid_date = LAST_DAY(paid_date)
THEN 'End Month Spike'

ELSE 'Regular'
END AS status

FROM salary_monthly;



-- LEVEL 1 : QUESTION 10

SELECT
LEFT(emp_name,1) AS first_character,
TRUNCATE(salary,0) AS truncated_salary,
DAY(audit_date) AS audit_day,

CASE
WHEN DAY(audit_date) > 5
THEN 'Digit Alert'

ELSE 'Normal'
END AS status

FROM digit_audit;



-- LEVEL 1 : QUESTION 11

SELECT
LEFT(bank_code,4) AS bank_prefix,
DAYNAME(credit_date) AS weekday_name,
ROUND(salary) AS rounded_salary,
MOD(ROUND(salary),5) AS salary_mod,

CASE
WHEN DAYNAME(credit_date) IN ('Saturday','Sunday')
AND MOD(ROUND(salary),5)=0
THEN 'Weekend Fraud'

WHEN LEFT(bank_code,4)='HDFC'
THEN 'Bank Review'

ELSE 'Normal'
END AS status

FROM salary_credit_audit;



-- LEVEL 1 : QUESTION 12

SELECT
HOUR(credit_ts) AS credit_hour,
LOWER(emp_name) AS employee_name,
FLOOR(salary) AS floor_salary,
ABS(FLOOR(salary)-HOUR(credit_ts)) AS salary_hour_difference,

CASE
WHEN HOUR(credit_ts) BETWEEN 0 AND 3
THEN 'Midnight Drift'

WHEN HOUR(credit_ts) > 18
THEN 'After Hours'

ELSE 'Business Hours'
END AS status

FROM salary_time_drift;



-- LEVEL 1 : QUESTION 13

SELECT
TRUNCATE(salary,2) AS truncated_salary,

ABS(
ROUND(salary,2)-TRUNCATE(salary,2)
) AS precision_difference,

DAYNAME(record_date) AS day_name,
LENGTH(emp_name) AS name_length,

CASE
WHEN ABS(
ROUND(salary,2)-TRUNCATE(salary,2)
) > 0.01
THEN 'Precision Loss'

ELSE 'Safe'
END AS status

FROM salary_precision;



-- LEVEL 1 : QUESTION 14

SELECT
TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) AS years_since_hike,

POWER(
growth_rate,
TIMESTAMPDIFF(YEAR,last_hike,CURDATE())
) AS growth_power,

ROUND(
base_salary * POWER(
growth_rate,
TIMESTAMPDIFF(YEAR,last_hike,CURDATE())
)
) AS projected_salary,

UPPER(emp_name) AS employee_name,

CASE
WHEN ROUND(
base_salary * POWER(
growth_rate,
TIMESTAMPDIFF(YEAR,last_hike,CURDATE())
)
) > 150000
THEN 'Explosive Growth'

WHEN ROUND(
base_salary * POWER(
growth_rate,
TIMESTAMPDIFF(YEAR,last_hike,CURDATE())
)
) BETWEEN 100000 AND 150000
THEN 'Controlled'

ELSE 'Stagnant'
END AS status

FROM salary_growth;



-- LEVEL 1 : QUESTION 15

SELECT
REPLACE(TRUNCATE(salary,0),'.','') AS salary_without_decimal,

REVERSE(
REPLACE(TRUNCATE(salary,0),'.','')
) AS reversed_salary,

DAYNAME(processed_date) AS weekday_name,
INITCAP(emp_name) AS employee_name,

CASE
WHEN REPLACE(TRUNCATE(salary,0),'.','') =
REVERSE(REPLACE(TRUNCATE(salary,0),'.',''))
THEN 'Symmetric Pay'

ELSE 'Asymmetric'
END AS status

FROM salary_symmetry;



-- LEVEL 1 : QUESTION 16

SELECT
YEAR(credit_date) AS year_value,
CEIL(salary) AS ceil_salary,
DAYOFYEAR(credit_date) AS day_of_year,

CASE
WHEN (YEAR(credit_date)%4=0 
AND YEAR(credit_date)%100<>0)
OR YEAR(credit_date)%400=0
THEN 'Leap Credit'

ELSE 'Non-Leap Credit'
END AS status

FROM leap_salary;



-- LEVEL 1 : QUESTION 17

SELECT

CASE
WHEN MONTH(credit_date) >= 4
THEN CONCAT(YEAR(credit_date),'-',YEAR(credit_date)+1)

ELSE CONCAT(YEAR(credit_date)-1,'-',YEAR(credit_date))
END AS fiscal_year,

MONTHNAME(credit_date) AS month_name,
FORMAT(salary,2) AS formatted_salary,
LOWER(emp_name) AS employee_name,

CASE
WHEN MONTH(credit_date)=3
THEN 'Year End Credit'

WHEN MONTH(credit_date)=4
THEN 'Year Start Credit'

ELSE 'Mid Year'
END AS status

FROM fiscal_salary;



-- LEVEL 1 : QUESTION 18

SELECT
RAND() AS random_value,
ROUND(salary) AS rounded_salary,
DAYNAME(record_date) AS day_name,
LEFT(emp_name,1) AS first_character,

CASE
WHEN RAND() > 0.7
THEN 'Sampled'

ELSE 'Skipped'
END AS status

FROM salary_sampling;



-- LEVEL 1 : QUESTION 19

SELECT
ASCII(LEFT(emp_name,1)) AS ascii_value,
TIMESTAMPDIFF(YEAR,join_date,CURDATE()) AS years_since_joining,
FLOOR(salary) AS floor_salary,

CASE
WHEN ASCII(LEFT(emp_name,1)) >
TIMESTAMPDIFF(YEAR,join_date,CURDATE())
THEN 'Name Dominates'

ELSE 'Experience Dominates'
END AS status

FROM salary_ascii;



-- LEVEL 1 : QUESTION 20

SELECT
DAY(credit_date) AS day_value,
MONTH(credit_date) AS month_value,
RIGHT(TRUNCATE(salary,0),2) AS last_two_salary_digits,
UPPER(emp_name) AS employee_name,

ABS(
DAY(credit_date)-MONTH(credit_date)
) AS day_month_difference,

CASE
WHEN DAY(credit_date)=MONTH(credit_date)

OR RIGHT(TRUNCATE(salary,0),2)=
LPAD(MONTH(credit_date),2,'0')

THEN 'Calendar Match'

ELSE 'Calendar Drift'
END AS status

FROM salary_calendar;
