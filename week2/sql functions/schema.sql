-- LEVEL 1 : QUESTION 1

CREATE TABLE salary_audit (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
tax_percent DECIMAL(5,2),
last_revision DATE
);

INSERT INTO salary_audit VALUES
(1,'karthik',75000.75,10.5,'2022-01-15'),
(2,'veena',65000.40,18.0,'2023-06-01'),
(3,'ravi',85000.90,25.0,'2020-11-20');



-- LEVEL 1 : QUESTION 2

CREATE TABLE bonus_monitor (
emp_code INT,
emp_name VARCHAR(50),
base_salary DECIMAL(10,2),
bonus DECIMAL(10,2),
bonus_date DATE
);

INSERT INTO bonus_monitor VALUES
(101,'Anil',70000.10,30000.00,'2025-01-10'),
(102,'Suresh',60000.55,3000.30,'2024-03-15'),
(103,'Ravi',85000.90,15000.75,'2023-12-01');



-- LEVEL 1 : QUESTION 3

CREATE TABLE employee_experience (
emp_id INT,
emp_name VARCHAR(50),
joining_date DATE,
declared_experience INT,
salary DECIMAL(10,2)
);

INSERT INTO employee_experience VALUES
(1,'Veena','2018-07-01',4,65000.40),
(2,'Ravi','2014-01-10',12,85000.90),
(3,'Anil','2020-09-01',3,70000.10);



-- LEVEL 1 : QUESTION 4

CREATE TABLE salary_digits (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
credit_date DATE
);

INSERT INTO salary_digits VALUES
(1,'Karthik',75000.75,'2025-01-01'),
(2,'Veena',65000.40,'2025-01-02'),
(3,'Suresh',60000.55,'2025-01-03');



-- LEVEL 1 : QUESTION 5

CREATE TABLE payroll_control (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
payment_date DATE
);

INSERT INTO payroll_control VALUES
(1,'Ravi',85000.90,'2025-01-15'),
(2,'Anil',70000.10,'2025-01-16'),
(3,'Veena',65000.40,'2025-01-17');



-- LEVEL 1 : QUESTION 6

CREATE TABLE inflation_watch (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
last_hike DATE
);

INSERT INTO inflation_watch VALUES
(1,'Karthik',75000.75,'2019-01-01'),
(2,'Veena',65000.40,'2022-01-01'),
(3,'Ravi',85000.90,'2017-01-01');



-- LEVEL 1 : QUESTION 7

CREATE TABLE salary_integrity (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
record_date DATE
);

INSERT INTO salary_integrity VALUES
(1,'Anil',-70000.10,'2025-01-10'),
(2,'Veena',65000.40,'2025-01-10'),
(3,'Ravi',0.00,'2025-01-10');



-- LEVEL 1 : QUESTION 8

CREATE TABLE name_salary (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
join_date DATE
);

INSERT INTO name_salary VALUES
(1,'Karthik',75000.75,'2019-03-15'),
(2,'Veena',65000.40,'2021-06-20'),
(3,'Ravi',85000.90,'2016-01-10');



-- LEVEL 1 : QUESTION 9

CREATE TABLE salary_monthly (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
paid_date DATE
);

INSERT INTO salary_monthly VALUES
(1,'Karthik',75000.75,'2025-01-31'),
(2,'Veena',65000.40,'2025-02-28'),
(3,'Ravi',85000.90,'2025-03-31');



-- LEVEL 1 : QUESTION 10

CREATE TABLE digit_audit (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
audit_date DATE
);

INSERT INTO digit_audit VALUES
(1,'Anil',70000.10,'2025-01-01'),
(2,'Veena',65000.40,'2025-01-02');



-- LEVEL 1 : QUESTION 11

CREATE TABLE salary_credit_audit (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
credit_date DATE,
bank_code VARCHAR(10)
);

INSERT INTO salary_credit_audit VALUES
(1,'Karthik',75000.75,'2025-01-04','HDFC01'),
(2,'Veena',65000.40,'2025-01-06','ICIC02'),
(3,'Ravi',85000.90,'2025-01-05','SBIN03'),
(4,'Anil',70000.10,'2025-01-07','AXIS04'),
(5,'Suresh',60000.55,'2025-01-11','HDFC01');



-- LEVEL 1 : QUESTION 12

CREATE TABLE salary_time_drift (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
credit_ts DATETIME
);

INSERT INTO salary_time_drift VALUES
(1,'Karthik',75000.75,'2025-01-10 23:45:00'),
(2,'Veena',65000.40,'2025-01-10 09:15:00'),
(3,'Ravi',85000.90,'2025-01-11 00:10:00'),
(4,'Anil',70000.10,'2025-01-09 18:30:00'),
(5,'Suresh',60000.55,'2025-01-10 02:50:00');



-- LEVEL 1 : QUESTION 13

CREATE TABLE salary_precision (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,4),
record_date DATE
);

INSERT INTO salary_precision VALUES
(1,'Karthik',75000.7567,'2025-01-01'),
(2,'Veena',65000.4044,'2025-01-02'),
(3,'Ravi',85000.9099,'2025-01-03'),
(4,'Anil',70000.1001,'2025-01-04'),
(5,'Suresh',60000.5555,'2025-01-05');



-- LEVEL 1 : QUESTION 14

CREATE TABLE salary_growth (
emp_id INT,
emp_name VARCHAR(50),
base_salary DECIMAL(10,2),
growth_rate DECIMAL(5,2),
last_hike DATE
);

INSERT INTO salary_growth VALUES
(1,'Karthik',75000.75,1.08,'2019-01-01'),
(2,'Veena',65000.40,1.05,'2021-01-01'),
(3,'Ravi',85000.90,1.12,'2017-01-01'),
(4,'Anil',70000.10,1.03,'2022-01-01'),
(5,'Suresh',60000.55,1.06,'2020-01-01');



-- LEVEL 1 : QUESTION 15

CREATE TABLE salary_symmetry (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
processed_date DATE
);

INSERT INTO salary_symmetry VALUES
(1,'Karthik',75557.75,'2025-01-15'),
(2,'Veena',64446.40,'2025-01-16'),
(3,'Ravi',85858.90,'2025-01-17'),
(4,'Anil',70007.10,'2025-01-18'),
(5,'Suresh',60000.55,'2025-01-19');



-- LEVEL 1 : QUESTION 16

CREATE TABLE leap_salary (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
credit_date DATE
);

INSERT INTO leap_salary VALUES
(1,'Karthik',75000.75,'2024-02-29'),
(2,'Veena',65000.40,'2025-02-28'),
(3,'Ravi',85000.90,'2020-02-29'),
(4,'Anil',70000.10,'2023-02-28'),
(5,'Suresh',60000.55,'2024-02-28');



-- LEVEL 1 : QUESTION 17

CREATE TABLE fiscal_salary (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
credit_date DATE
);

INSERT INTO fiscal_salary VALUES
(1,'Karthik',75000.75,'2025-03-31'),
(2,'Veena',65000.40,'2025-04-01'),
(3,'Ravi',85000.90,'2024-03-30'),
(4,'Anil',70000.10,'2024-04-02'),
(5,'Suresh',60000.55,'2025-03-29');



-- LEVEL 1 : QUESTION 18

CREATE TABLE salary_sampling (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
record_date DATE
);

INSERT INTO salary_sampling VALUES
(1,'Karthik',75000.75,'2025-01-01'),
(2,'Veena',65000.40,'2025-01-02'),
(3,'Ravi',85000.90,'2025-01-03'),
(4,'Anil',70000.10,'2025-01-04'),
(5,'Suresh',60000.55,'2025-01-05'),
(6,'Amit',72000.60,'2025-01-06'),
(7,'Neha',68000.80,'2025-01-07');



-- LEVEL 1 : QUESTION 19

CREATE TABLE salary_ascii (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
join_date DATE
);

INSERT INTO salary_ascii VALUES
(1,'Karthik',75000.75,'2019-03-15'),
(2,'Veena',65000.40,'2021-06-20'),
(3,'Ravi',85000.90,'2016-01-10'),
(4,'Anil',70000.10,'2020-09-01'),
(5,'Suresh',60000.55,'2022-11-25');



-- LEVEL 1 : QUESTION 20

CREATE TABLE salary_calendar (
emp_id INT,
emp_name VARCHAR(50),
salary DECIMAL(10,2),
credit_date DATE
);

INSERT INTO salary_calendar VALUES
(1,'Karthik',75000.75,'2025-01-15'),
(2,'Veena',65000.40,'2025-02-14'),
(3,'Ravi',85000.90,'2025-03-31'),
(4,'Anil',70000.10,'2025-04-04'),
(5,'Suresh',60000.55,'2025-05-05');
