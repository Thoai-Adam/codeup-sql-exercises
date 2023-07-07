USE employees;
-- Write a query that returns all employees, 
-- their department number, their start date, their end date, 
-- and a new column 'is_current_employee' that is a 1 if the employee is 
-- still with the company and 0 if not. DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.
SELECT
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS 'employees',
    dept_emp.dept_no,
    dept_emp.from_date,
    dept_emp.to_date,
    IF(to_date > CURDATE(), TRUE, FALSE) AS is_current_employee
FROM
    dept_emp
        JOIN
    employees ON employees.emp_no = dept_emp.emp_no
GROUP BY employees.emp_no , dept_emp.dept_no;
-- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS 'employees',
    CASE
        WHEN last_name BETWEEN 'A' AND 'I' THEN 'A-H'
        WHEN last_name BETWEEN 'I' AND 'R' THEN 'I-Q'
        ELSE 'R-Z'
    END AS alpha_group
FROM
    employees;
-- How many employees (current or previous) were born in each decade?
SELECT
    CASE
        WHEN SUBSTR(birth_date, 1, 4) BETWEEN 1950 AND 1959 THEN '1950s'
        ELSE '1960s'
    END AS 'birth_decade',
    COUNT(emp_no)
FROM
    employees
GROUP BY birth_decade;
-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
SELECT
    AVG(salary),
    CASE
        WHEN dept_name IN ('research' , 'development') THEN 'R&D'
        WHEN dept_name IN ('sales' , 'marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('Production' , 'Quality Management') THEN 'Prod & QM'
        WHEN dept_name IN ('finance' , 'human resources') THEN 'Finance & HR'
        ELSE 'CUSTOMER SERVICE'
    END AS dept_group
FROM
    dept_emp
        LEFT JOIN
    salaries ON dept_emp.emp_no = salaries.emp_no
        AND salaries.to_date > CURDATE()
        LEFT JOIN
    departments ON departments.dept_no = dept_emp.dept_no
GROUP BY dept_group;