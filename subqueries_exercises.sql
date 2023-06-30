#Create a file named subqueries_exercises.sql and craft queries to return the results for the following criteria:

#Find all the current employees with the same hire date as employee 101010 using a subquery.
SELECT hire_date
FROM employees 
Where emp_no = '101010'; 
-- this found out the employee no 101010 hiredate is 1990-10-22

SELECT *
FROM employees
JOIN dept_emp On employees.emp_no = dept_emp.emp_no
WHERE hire_date = (SELECT hire_date
	FROM employees 
	Where emp_no = '101010') AND to_date = "9999-01-01";
    
SELECT *
FROM employees
WHERE hire_date = (
    SELECT hire_date
    FROM employees
    WHERE emp_no = '101010'
)
AND emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE to_date = '9999-01-01'
);

    

#Find all the titles ever held by all current employees with the first name Aamod.
    
SELECT employees.first_name, titles.title
FROM employees
JOIN titles ON employees.emp_no = titles.emp_no
WHERE employees.first_name = 'Aamod'
    AND titles.to_date = '9999-01-01';

#How many people in the employees table are no longer working for the company? 
#Give the answer in a comment in your code. 203184 not working

SELECT COUNT(*) AS num_people_no_longer_working
FROM employees
JOIN titles ON employees.emp_no = titles.emp_no
WHERE titles.to_date != '9999-01-01';

#Find all the current department managers that are female. List their names in a comment in your code.
-- in this case the department manager is my left column and i will use that to filter out employee column

SELECT *
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
WHERE employees.gender = 'F' AND dept_manager.to_date = '9999-01-01';

#Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT AVG(salary) FROM salaries;

SELECT *
FROM employees 
JOIN salaries on salaries.emp_no = employees.emp_no
WHERE salary > (SELECT AVG(salary) FROM salaries) and salaries.to_date = '9999-01-01';

#How many current salaries are within 1 standard deviation of the current highest salary?
# (Hint: you can use a built in function to calculate the standard deviation.) 
#What percentage of all salaries is this?

-- Calculate the number of salaries within 1 standard deviation of the current highest salary
SELECT COUNT(*) AS num_salaries_within_std_dev
FROM salaries
WHERE salary >= (
    SELECT MAX(salary) - STDDEV(salary) 
    FROM salaries 
    WHERE to_date = '9999-01-01'
)
AND to_date = '9999-01-01';

-- Calculate the percentage of all salaries within 1 standard deviation of the current highest salary
SELECT (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM salaries WHERE to_date = '9999-01-01') 
    AS percentage_within_std_dev
FROM salaries
WHERE salary >= (
    SELECT MAX(salary) - STDDEV(salary) 
    FROM salaries 
    WHERE to_date = '9999-01-01'
)
AND to_date = '9999-01-01';

#Hint You will likely use multiple subqueries in a variety of ways
#Hint It's a good practice to write out all of the small queries that you can. 
#Add a comment above the query showing the number of rows returned. 
#You will use this number (or the query that produced it) in other, larger queries.






#BONUS

#Find all the department names that currently have female managers.
#Find the first and last name of the employee with the highest salary.
#Find the department name that the employee with the highest salary works in.

#Who is the highest paid employee within each department.