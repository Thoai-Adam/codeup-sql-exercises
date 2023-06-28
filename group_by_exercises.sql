SELECT Count(first_name), first_name
FROM employees
GROUP BY first_name
HAVING first_name NOT LIKE '%a%';

-- In your script, use DISTINCT to find the unique titles in the titles table. 
-- How many unique titles have there ever been? Answer that in a comment in your SQL file. *7
SELECT DISTINCT title
FROM titles;

-- Write a query to to find a list of all unique last names of all employees that start 
-- and end with 'E' using GROUP BY.
SELECT DISTINCT last_name
FROM employees
GROUP BY last_name
HAVING last_name LIKE 'e%e';
-- Write a query to to find all unique combinations of first and last names of all employees 
-- whose last names start and end with 'E'.
SELECT DISTINCT first_name, last_name
FROM employees
GROUP BY first_name, last_name
HAVING last_name LIKE 'e%e';
-- Write a query to find the unique last names with a 'q' but not 'qu'. 
-- Include those names in a comment in your sql code. * Chleq, Lindqvist, Qiwen
SELECT DISTINCT last_name
FROM employees
GROUP BY last_name 
HAVING last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

-- WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

-- Add a COUNT() to your results (the query above) to find the number of employees with the same last name. *3
SELECT DISTINCT last_name, Count(*)
FROM employees
GROUP BY last_name 
HAVING last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya'. 
-- Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT first_name, gender, COUNT(first_name) AS COUNT
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;

-- From your previous query, are there any duplicate usernames? 
SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1,4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS user_name,
COUNT(*) AS number_usernames
FROM employees
GROUP BY user_name;

-- What is the higest number of times a username shows up? Bonus: 
-- How many duplicate usernames are there from your previous query?
SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1,4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS user_name,
COUNT(*) AS number_usernames
FROM employees
GROUP BY user_name
HAVING number_usernames > 1
ORDER BY COUNT(*) DESC;
-- most times a user name shows up is 6
-- there are 13,251 duplicates
-- Bonus: More practice with aggregate functions:

-- Determine the historic average salary for each employee. 
-- When you hear, read, or think "for each" with regard to SQL, 
-- you'll probably be grouping by that exact column.

-- Using the dept_emp table, count how many current employees work in each department. 
-- The query result should show 9 rows, one for each department and the employee count.

-- Determine how many different salaries each employee has had. 
-- This includes both historic and current.

-- Find the maximum salary for each employee.

-- Find the minimum salary for each employee.

-- Find the standard deviation of salaries for each employee.

-- Now find the max salary for each employee where that max salary is greater than $150,000.

-- Find the average salary for each employee where that average salary is between $80k and $90k.