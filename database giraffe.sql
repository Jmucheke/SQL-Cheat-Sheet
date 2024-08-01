-- Creating a table in sql
-- CREATE DATABASE giraffe;
-- Selecting the database
-- USE giraffe;

-- Creating a table
CREATE TABLE student (
 student_id INT PRIMARY KEY,
 name VARCHAR(20),
 major VARCHAR(20),
);
--  PRIMARY KEY(student_id) -- another method of adding a primary key

-- Describing the table columns
DESCRIBE student;

-- Drop table student
DROP TABLE student;

-- Modifying a table
ALTER TABLE student ADD gpa DECIMAL(3, 2);

-- Dropping a specific column in a table
ALTER TABLE student DROP COLUMN gpa;


-- Inserting values into a table

INSERT INTO student VALUES(
 1, 'Jack', 'Biology'
);

--Specifying whcih columns to enter values to explicitly
INSERT INTO student(student_id, name) VALUES(
 3, 'Clare'
);

-- Getting all values from table
SELECT * FROM student;



-- Adding more attributes to columns during creation
CREATE TABLE student (
 student_id INT AUTO_INCREMENT,
 name VARCHAR(20) NOT NULL,
 major VARCHAR(20) UNIQUE DEFAULT 'undecided'
);


-- Inserting multiple values at once in a table
INSERT INTO student VALUES(
 1, 'Jack', 'Biology');
INSERT INTO student VALUES(
 2,'Kate', 'Sociology');
 INSERT INTO student VALUES(
 3, 'Clare','Chemistry'
);
 INSERT INTO student VALUES(
 4,'Jack','English');
 INSERT INTO student VALUES(
 5,'Mike','Computer Science');


-- Updating values in the table
UPDATE student 
SET major = 'Bio'
WHERE major = 'Biology';

-- Updating values in the table by referencing the id
UPDATE student
SET major ='Computer Science'
WHERE student_id='5';
 
-- Using OR operator
UPDATE student
SET major ='Biochemistry'
WHERE major = 'Bio' OR major ='Chemistry';
 
-- Deleting from table
DELETE FROM student
WHERE student_id = 5;

-- Using AND while deleting
DELETE FROM student
WHERE name = 'Jack' AND major = 'Biochemistry';

-- Using the select keyword
SELECT name, major
FROM student 
ORDER BY name DESC
LIMIT 10;

SELECT name, major
FROM student
WHERE major = 'Biology' OR name = 'JACK';


UPDATE student
SET major = 'Biology'
WHERE major = 'English';

-- using operators

SELECT name, major
FROM student
WHERE major != 'Chemistry';

SELECT name, major
FROM student
WHERE student_id <= 3;


-- Using IN keyword
SELECT *
FROM student
WHERE name IN ('jACK', 'cLARE') AND student_id > 2;