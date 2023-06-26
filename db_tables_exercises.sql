SHOW DATABASES;
USE albums_db;
SELECT database();
SHOW TABLES;
USE employees;
SELECT database();
SHOW TABLES;

-- 10. after exploring the employees table, there are Int, dates, VarCharacter, enum
-- Which tables do you think contain a numeric type column? * every tables except departments
-- Which table do you think contain a string type column? * every table except salaries 
-- which tables do you think contain a date type column? * every table except dept_emp table
-- what is the relationship between the employees and the departments table? * There is no direct relationship between these two tables
-- Show the SQL that created the dept_manager table.
SHOW CREATE TABLE dept_manager;
CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1