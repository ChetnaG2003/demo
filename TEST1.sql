SECTION A
1. create table employees(
employee_id int,
first_name varchar,
last_name varchar,
salary decimal,
hire_date date,
dept_id int
)

copy employees from 'A:/employees.csv' delimiter ',' csv header
2.
create table departments(
dept_id int,
dept_name varchar
)
-- 3.DIFFERECNCE
-- DROP: REMOVE ENTIRE TABLE INCLUDING TABLE STRUCTURE 
-- DELETE :CAN DELETE SPECIFIC ROWS ACCORDING TO CONDITIONS OR CAN DELTE TABLE ALSO
-- TRUNCATE: IT DELETE ALL ROWS BUT TABLE STRUCTURE REMAINS

-- 4.NUMERIC DATATYPE
-- SMALLINT: Range: -32,768 to 32,767
-- INTEGER or INT: Range: -2,147,483,648 to 2,147,483,647
-- BIGINT: Range: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
-- SERIAL: Range: Typically, from 1 to 2,147,483,647.
-- BIGSERIAL: Typically, from 1 to 9,223,372,036,854,775,807.
-- REAL: Approximately 6-7 decimal digits of precision.
-- DOUBLE PRECISION: Approximately 15-16 decimal digits of precision.
-- NUMERIC or DECIMAL: NUMERIC(10, 2)
 
-- STRING DATAtype:
-- CHAR(n):Fixed-length string (padded with spaces)	
-- VARCHAR(n):	Variable-length string (max n characters)	
-- TEXT:Stores unlimited-length text 

-- 5. difference between varchar,text and char
-- varchar(n):variable length string with a max length we can give limit to input size
-- text: variable length string with unlimited size we can insert till any limit
-- char(n):variable lenth string with fixed size use when values have a fixed length

 

SECTION B
1.
select salary, salary * 1.10 as new_salary from employees
2.
select * from employees where hire_date < '2022-01-01'
3.
select *from employees where salary between 50000 and 80000
4.
select* from employees where first_name like 'J%'
 
-- 5 returning clause: The returning clause is used with INSERT, UPDATE, and DELETE statements to return values from
the  rows without so no need of another query to retrive data we can use(returning*)for entire record or 
(returning column name) for specific columns
ex: insert into tablename values()returning*



SECTION C
1.
select *from employees  order by salary desc 
2. 
select *from employees  order by salary desc limit 3
3.
select  sum(salary) as total_sal_expense from employees

4.
select  avg(salary) AS average_salary FROM employees group by employees having avg(salary) > 70000;


SECTION D
1.
select concat(first_name,' ',last_name ) from employees
2.
select extract('year'from hire_date) from employees
3.
select upper(first_name) from employees
4.
select employee_id, first_name, hire_date, 
       extract (year from age (hire_date)) as years_of_service
From employees;
5.
Select employee_id, first_name, hire_date, date_trunc('month', hire_date) as rounded_hire_date from employees;  

SECTION E

1.
select employee_id ,first_name,salary, coalesce(salary,50000) from employees
2.
select 
    greatest (max(salary), min(salary)) as highest_salary,
    least(max(salary), min(salary)) as lowest_salary
from employees;
3.
SELECT employee_id, first_name, salary,
       (salary / NULLIF((SELECT SUM(salary) FROM employees), 0)) * 100 AS salary_percentage
FROM employees;

SECTION F
1
SELECT e.employee_id, e.first_name, e.last_name, e.salary, e.hire_date, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;
2.
SELECT e.employee_id, e.first_name, e.last_name, e.salary, e.hire_date, 
       COALESCE(d.dept_name, 'No Department') AS dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

3.
Select employee_id, first_name, last_name, salary, hire_date, dept_id
from employees
except
select e.employee_id, e.first_name, e.last_name, e.salary, e.hire_date, e.dept_id
from employees e
inner join departments d on e.dept_id = d.dept_id;
-- 4.
-- UNION: IT REMOVES DUPLICATE 
-- USE WHEN WE WANT ONLY UNIQUE ROWS
-- EX:SELECT 'RAM','SHYAM','GEETA'FROM TABLENAME
   -- UNION  
   -- SELECT'RAM','VINOD','PREM' FROM TABLENAME
   -- output return= shyam,geeta,vinod, prem

-- UNION ALL : IT INCLUDES DUPLICATE ROWS ALSO
-- USE WHEN WE WANT ENTIRE RECORD INCLUDING DUPLICATES
-- EX:SELECT 'RAM','SHYAM','GEETA'FROM TABLENAME
   -- UNION  
   -- SELECT'RAM','VINOD','PREM' FROM TABLENAME
   -- output RETURN = RAM, SHAYM,GEETA ,RAM,vinod, prem


