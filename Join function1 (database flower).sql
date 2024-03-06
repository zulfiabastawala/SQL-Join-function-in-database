create database flower;
use flower;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary_id INT
);
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    salary_amount DECIMAL(10, 2)
);


-- Insert data into 'departments' table
INSERT INTO departments (department_id, department_name)
VALUES 
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

-- Insert data into 'salaries' table
INSERT INTO salaries (salary_id, salary_amount)
VALUES 
    (1, 60000),
    (2, 75000),
    (3, 90000);

-- Insert data into 'employees' table
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary_id)
VALUES 
    (1, 'John', 'Doe', 1, 1),
    (2, 'Jane', 'Smith', 2, 2),
    (3, 'Bob', 'Johnson', 1, 3),
    (4, 'Alice', 'Williams', 3, 2);
    
select * from employees;
select * from departments;
select * from salaries;


-- 1."Retrieve a list of all employees and their department names."
select concat(first_name,",",last_name) Full_Name, department_name  
from employees e join departments d on e.department_id=d.department_id;


-- 2."Find the total salary amount paid to all employees."
select sum(salary_amount) from employees e join salaries s on e.salary_id=s.salary_id;

-- 3."Retrieve a list of employees who earn more than a certain salary threshold (e.g., $50,000)."
select first_name,last_name from employees e join salaries s on e.salary_id=s.salary_id where salary_amount>50000;

-- 4."Find the average salary in each department."
select department_name, avg(salary_amount) as average from employees e 
join salaries s on e.salary_id=s.salary_id 
join departments d on e.department_id=d.department_id group by 1;

-- 5."Retrieve a list of employees, their department names, and the total salary cost for each department."
select first_name,department_name, sum(salary_amount) 
from employees e join departments d on e.department_id= d.department_id  join salaries s on e.salary_id=s.salary_id 
group by 2;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select first_name,department_name,sum(salary_amount) from client1 c inner join dept2 d on c.department_id=d.department_id inner join
salary12 s on c.salary_id=s.salary_id group by 2;

