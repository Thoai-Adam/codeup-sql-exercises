SHOW DATABASES;
USE albums_db;
SELECT database();
SHOW TABLES;
USE employees;
SELECT database();
SHOW TABLES;

-- 10. after exploring the employees table, there are Primary Key, dates, VarCharacter, enum
-- Which tables do you think contain a numeric type column? * the salaries with the 'int' type
-- Which table do you think contain a string type column? * every table except salaries 
-- which tables do you think contain a date type column? * every table except dept_emp table
-- what is the relationship between the employees and the departments table?
-- Show the SQL that created the dept_manager table.
CREATE TABLE dept_manager (
	emp_no int,
    dept_no char(4),
    from_date date,
    to_date date,
);
