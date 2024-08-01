-- Find all employees
SELECT *
FROM employee;


SELECT *
FROM branch;

-- Find all Clients
SELECT * 
FROM client;

-- Find all employees ordered by salary
SELECT *
FROM employee
ORDER BY salary DESC;

-- Find all employees ordered by sex then name
SELECT *
FROM employee
ORDER BY sex, first_name, last_name;

-- Find the first 5 employees in the employee table
SELECT *
FROM employee
LIMIT 5;

-- Find the first and last name of all employees
SELECT first_name, last_name
FROM employee;

-- Find the forename and surnames of all employees
SELECT first_name AS forename, last_name AS surname
FROM employee;

-- Find out all the different genders
SELECT DISTINCT sex
FROM employee;

-- Find out all the different branch ids
SELECT DISTINCT branch_id
FROM employee;

-- FUNCTIONS
-- Find the number of employees
SELECT COUNT(emp_id)
FROM employee;

-- Find the number of female employees born after 1970
SELECT COUNT(sex) AS No_of_employees_born_after_1970
FROM employee
WHERE sex = 'F' AND birth_day > '1971-01-01';

-- Find the average of all employees' salaries
SELECT AVG(salary) AS Average_of_employees_salary
FROM employee;

-- Find the average of all employees' salaries who are female
SELECT AVG(salary) AS Average_of_employees_salary
FROM employee
WHERE sex = 'F';

-- Find the sum of all employees' salaries
SELECT SUM(salary) AS Sum_of_employees_salary
FROM employee;

-- Find out how many males and females there are
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

-- Find the total sales of each salesman
SELECT SUM(total_sales) AS Total_sales_of_each_salesman, emp_id
FROM works_with
GROUP BY emp_id
ORDER BY Total_sales_of_each_salesman ASC;

-- WILDCARDS
-- % = any # characters, _ = one character

-- Find any client's who are an LLC
SELECT *
FROM client
WHERE client_name LIKE '%LLC'

-- Find any branch suppliers who are in the label business
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '% Label%'

-- Find any employee born in October
SELECT *
FROM employee
WHERE birth_day LIKE '____-10%';

-- Find any Clients who are schools
SELECT *
FROM client
WHERE client_name LIKE '%school%'

-- UNION

-- Find a list of empoyees and branch names
SELECT first_name AS first_name
FROM employee
UNION
SELECT branch_name AS branch_name
FROM branch;

-- Find a list of all clients & branch suppliers's names
SELECT client_name
FROM client 
UNION
SELECT supplier_name 
FROM branch_supplier;

-- Find a list of all money spent or earned by the company
SELECT salary as Money_spent_and_earned
FROM employee
UNION
SELECT total_sales
FROM works_with;

-- JOINS

-- Find all branches and the names of their managers
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

-- The above example is an inner join

-- Find all branches and the names of their managers
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

-- The above example is a left join

-- Find all branches and the names of their managers
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;

-- The above example is a right join

-- NESTED QUERIES

-- Find names of all employees who have
-- sold over 30,000 to a single client

SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
 SELECT works_with.emp_id
 FROM works_with
 WHERE works_with.total_sales > 30000

);

-- Find all clients who are handled by the branch
-- that Michael Scott manages
-- Assume you know Michael's ID

SELECT * 
FROM client
WHERE client.branch_id = (
 SELECT branch.branch_id 
 FROM branch
 WHERE branch.mgr_id = 102
);

-- TRIGGERS

CREATE TABLE trigger_test(
 message VARCHAR(100)
);

-- Adds a message in the trigger_test when a new employee is added
DELIMITER &&
CREATE
 TRIGGER my_trigger BEFORE INSERT
 ON employee
 FOR EACH ROW BEGIN
  INSERT INTO trigger_test VALUES('added new employee');
 END&&
DELIMITER ;

-- Returns back the name of the new employee in the trigger_test when a new employee is added
DELIMITER &&
CREATE
 TRIGGER my_trigger BEFORE INSERT
 ON employee
 FOR EACH ROW BEGIN
  INSERT INTO trigger_test VALUES(NEW.first_name);
 END&&
DELIMITER ;