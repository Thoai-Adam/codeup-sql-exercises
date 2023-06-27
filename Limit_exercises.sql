
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




-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', 
-- and order your results returned by first name. In your comments, answer: 
-- What was the first and last name in the first row of the results? * Irena Reutenauer
-- What was the first and last name of the last person in the table? * Maya Melter
SELECT first_name, last_name, emp_no
FROM employees
WHERE first_name = 'Irena'
	OR first_name = 'Maya'
    OR first_name = 'Vidya'
ORDER BY first_name;
-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', 
-- and order your results returned by first name and then last name. 
-- In your comments, answer: What was the first and last name in the first row of the results?  *Irena Acton
-- What was the first and last name of the last person in the table? Vidya, Zwizig
SELECT first_name, last_name, emp_no
FROM employees
WHERE first_name = 'Irena'
	OR first_name = 'Maya'
    OR first_name = 'Vidya'
ORDER BY first_name ASC, last_name ASC;
-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', 
-- and order your results returned by last name and then first name. 
-- In your comments, answer: What was the first and last name in the first row of the results? *Irena Acton
-- What was the first and last name of the last person in the table? Maya, Zyda
SELECT last_name, first_name, emp_no
FROM employees
WHERE first_name = 'Irena'
	OR first_name = 'Maya'
    OR first_name = 'Vidya'
ORDER BY last_name ASC, first_name ASC;
-- Write a query to to find all employees whose last name starts and ends with 'E'. 
-- Sort the results by their employee number. Enter a comment with the number of employees returned,  * 899 rows returned
-- the first employee number and their first and last name, * 10021 Ramzi Erde
-- and the last employee number with their first and last name. * 499648 Erde Tadahiro
SELECT last_name, first_name, emp_no
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY emp_no;

-- Write a query to to find all employees whose last name starts and ends with 'E'. 
-- Sort the results by their hire date, so that the newest employees are listed first. 
-- Enter a comment with the number of employees returned, the name of the newest employee,  *1000 rows returned
-- and the name of the oldest employee. Cristinel Erdi 1985-02-02 no 485389
SELECT last_name, first_name, hire_date, emp_no
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY hire_date;
-- Find all employees hired in the 90s and born on Christmas. 
-- Sort the results so that the oldest employee who was hired last is the first result. 
-- Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, *362 returned.
		-- oldest employee who was hired last is Khun Bernini
-- and the name of the youngest employee who was hired first.
		-- Douadi Pettis
SELECT last_name, first_name, hire_date, birth_date, emp_no
FROM employees
WHERE hire_date LIKE '199%-%%-%%' AND birth_date LIKE '%%%%-12-25'
ORDER BY birth_date ASC, hire_date DESC;


-- MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. 
-- For example, to find all the unique titles within the company, 
-- we could run the following query:


-- List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;
-- Find all previous or current employees hired in the 90s and born on Christmas. 
-- Find the first 5 employees hired in the 90's by sorting by hire date 
-- and limiting your results to the first 5 records. 
SELECT DISTINCT last_name, hire_date
FROM employees
WHERE birth_date LIKE '%12-25' AND hire_date LIKE ('199%')
ORDER BY hire_date ASC
LIMIT 5;
-- Write a comment in your code that lists the five names of the employees returned.
		-- Cappello, Mandell, Schreiter, Kushner, Stroustrup
-- Try to think of your results as batches, sets, or pages. 
-- The first five results are your first page. 
-- The five after that would be your second page, etc. 
-- Update the query to find the tenth page of results.
SELECT DISTINCT last_name, hire_date
FROM employees
WHERE birth_date LIKE '%12-25' AND hire_date LIKE ('199%')
ORDER BY hire_date ASC
LIMIT 5 OFFSET 45;
-- LIMIT and OFFSET can be used to create multiple pages of data. 
-- What is the relationship between OFFSET (number of results to skip), 
-- LIMIT (number of results per page), and the page number?