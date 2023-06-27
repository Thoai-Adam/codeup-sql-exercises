SHOW DATABASES;
USE employees;
SELECT database ();
SHOW TABLES;


-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results? *10200, 10397, 10610
SELECT emp_no, first_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya');
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. What is the employee number of the top three results? Does it match the previous question? * 10200, 10397, 10610
SELECT emp_no, first_name
FROM employees
WHERE first_name = 'Irena'
	OR first_name = 'Maya'
    OR first_name = 'Vidya';
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results. * 17494, 18945, 19058
SELECT emp_no, first_name, gender
FROM employees
WHERE first_name IN ('Irena' 'Vidya')
	OR first_name IN ('Maya')
    AND gender IN ('M');
    -- 10200, 10397, 10821
-- Find all unique last names that start with 'E'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'E%';
-- Find all unique last names that start or end with 'E'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'E%' OR '%E';
-- Find all unique last names that end with E, but does not start with E?
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%';
-- Find all unique last names that start and end with 'E'.
SELECT DISTINCT last_name
FROM employees 
WHERE last_name LIKE 'E%E';
-- Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers. * 10008, 10011, 10012
SELECT hire_date, emp_no, first_name
FROM employees
WHERE hire_date LIKE '199%-%%-%%';  -- could be written as '199%'
-- Find all current or previous employees born on Christmas. Enter a comment with top three employee numbers. 10078, 10115, 10261
SELECT hire_date, emp_no, first_name
FROM employees
WHERE birth_date LIKE '%%%%-12-25'; -- could be written as '%12-25'
-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with top three employee numbers.
SELECT hire_date, emp_no, first_name
FROM employees
WHERE hire_date LIKE '%%%%-12-25'                 -- could be written as '100%' AND birth_date LIKE '%12-25';
	AND birth_date LIKE '199%-%%-%%';
-- Find all unique last names that have a 'q' in their last name.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%';
-- Find all unique last names that have a 'q' in their last name but not 'qu'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';    