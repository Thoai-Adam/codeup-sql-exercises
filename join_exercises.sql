#Show all databases
SHOW DATABASES;

#Select the database for the joins lesson
USE join_example_db;

#List all tables
SHOW TABLES;

#Check out what's in the roles table
SELECT *
FROM roles;

#Check out what's in the users table
SELECT *
FROM users;

#Inner join
SELECT *
FROM users
INNER JOIN roles ON users.role_id=roles.id;

SELECT *
FROM roles
INNER JOIN users ON roles.id = users.role_id;

#Left join
SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT *
FROM roles
LEFT JOIN users ON users.role_id = roles.id;   -- does not matter for the inner join

#Right join
SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

#Associative tables using employees database
USE employees;
-- show the tables
SHOW TABLES; 

-- Our goal is to join employees to departments
SELECT *
FROM employees
LIMIT 5;

SELECT *
FROM departments
LIMIT 5;

SELECT *
FROM dept_emp
LIMIT 5;

SELECT *
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no;

-- Using the associative table to complete the join!
SELECT *
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- We can alias tables to shorten text!
SELECT *
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no;

-- Order matters
SELECT *
FROM employees AS e
INNER JOIN departments AS d ON de.dept_no = d.dept_no
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no;

-- Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;

-- Use join, left join, and right join to combine results from the users and roles tables 
-- as we did in the lesson. Before you run each query, guess the expected number of results.
-- INNER JOIN
SELECT *
FROM users as U
JOIN roles as R on U.id = R.id; 


-- LEFT JOIN
SELECT *
FROM users
LEFT JOIN roles ON users.id = roles.id;

-- RIGHT JOIN
SELECT *
FROM roles
RIGHT JOIN users ON users.id = roles.id;

-- Although not explicitly covered in the lesson, aggregate functions like count 
-- can be used with join queries. Use count and the appropriate join type to get a 
-- list of roles along with the number of users that has the role. 
-- Hint: You will also need to use group by in the query.
SELECT roles.name, COUNT(users.id) AS Number_of_users_roles
FROM roles
LEFT JOIN users ON roles.id = users.id
GROUP BY roles.id, roles.name;


-- Use the employees database, Using the example in the Associative Table Joins session as a guide,
-- write a query that shows each deparment along with the name of the current manager
-- for that department.
USE employees;
SELECT *
FROM departments
JOIN dept_manager on dept_manager.dept_no = departments.dept_no;



-- Find the name of all departments currently managed by women
USE employees;
SELECT *
FROM departments
JOIN dept_manager on dept_manager.dept_no = departments.dept_no
JOIN employees on employees.emp_no = dept_manager.emp_no
WHERE employees.gender = 'F' AND dept_manager.to_date = '9999-01-01';

-- Using the example in the Associative Table Joins section as a guide, 
-- write a query that shows each department along with the name of the current manager for that department.



-- 3.Find the name of all departments currently managed by women.
USE employees;
SELECT departments.dept_no, dept_name, first_name, last_name, gender
FROM departments
JOIN dept_manager on dept_manager.dept_no = departments.dept_no
JOIN employees on employees.emp_no = dept_manager.emp_no
WHERE employees.gender = 'F' AND dept_manager.to_date = '9999-01-01';


-- 4.Find the current titles of employees currently working in the Customer Service department.
USE employees;
SELECT first_name, last_name ,departments.dept_name, title
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN titles as emp_titles ON emp_titles.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Customer Service '
    AND dept_emp.to_date = '9999-01-01'
    AND emp_titles.to_date = '9999-01-01';


-- 5.Find the current salary of all current managers.



-- 6.Find the number of current employees in each department.



-- 7.Which department has the highest average salary? Hint: Use current not historic information.



-- 8.Who is the highest paid employee in the Marketing department?



-- 9.Which current department manager has the highest salary?



-- 10.Determine the average salary for each department. Use all salary information and round your results.


-- 11. Bonus Find the names of all current employees, their department name, and their current manager's name.




