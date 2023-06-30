#Scalar subqueries
#Use albums_db!
USE albums_db;

#What albums had above-average sales?
-- it is important to first find what is the average sale
SELECT AVG(sales) FROM albums;

-- now you'll have to construct an entire query
SELECT *
FROM albums
WHERE sales > (
	SELECT AVG(sales) 
    FROM albums);

-- What about below average? 
SELECT *
FROM albums
WHERE sales < (
	SELECT AVG(sales) 
    FROM albums);
    
-- What was the worst performing album (in terms of sales)?
-- I should look for the minimum of the sales column
SELECT MIN(sales)
FROM albums;

SELECT name
FROM albums
WHERE sales = (
	SELECT MIN(sales)
	FROM albums
);



#Column subqueries
#Use employees!
USE employees;

#Can we combine information from employees and managers without joins?
-- Since managers have a fewer rows, we can use Managers table to filter employees' tables
SELECT emp_no
FROM dept_manager
WHERE to_date > CURDATE();

SELECT *
FROM employees
WHERE emp_no IN (
	SELECT emp_no
    FROM dept_manager
    WHERE to_date > CURDATE()
);

#SHOW employee information for managers hired in the 80s.
-- so my first goal is to user managers to filter the employee
SELECT *
FROM dept_manager
WHERE from_date LIKE '198%';

SELECT * 
FROM employees
WHERE emp_no IN (
	SELECT emp_no
    FROM dept_manager
    WHERE from_date LIKE '198%'
);


#Table subqueries
#Use employees!
USE employees;

#We can join to the results of a subquery!

SELECT *
FROM dept_manager
WHERE from_date LIKE '198%';

SELECT *
FROM employees
INNER JOIN (
	SELECT *
	FROM dept_manager
	WHERE from_date LIKE '198%'
) AS man ON employees.emp_no = man.emp_no;

SELECT dept_no, from_date
FROM (
	SELECT *
    FROM dept_manager
    WHERE from_date LIKE '198%')
AS me;



#advantages of subqueries are less lines, easier to read and understand. 

