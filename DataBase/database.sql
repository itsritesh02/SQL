-- Database Create
CREATE DATABASE college;

-- Database Use
USE college;



-- Table Create
CREATE TABLE students
(
  id INT PRIMARY KEY,
  name VARCHAR(100),
  age INT
);

-- Data Insert
INSERT INTO students
  (id, name, age)
VALUES
  (1, 'Ritesh', 21),
  (2, 'Rahul', 22);

-- Data Show
SELECT *
FROM students;