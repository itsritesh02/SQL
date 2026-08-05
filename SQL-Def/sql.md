# SQL (Structured Query Language)

## What is SQL?
SQL (Structured Query Language) is a language used to communicate with relational databases.

It is used to:
- Create Database
- Create Table
- Insert Data
- Retrieve Data
- Update Data
- Delete Data

---

## Why SQL?

- Easy to manage data
- Fast data retrieval
- Supports CRUD operations
- Used in almost every company

---

## SQL Categories

### 1. DDL (Data Definition Language)
Used to define database structure.

Commands:
- CREATE
- ALTER
- DROP
- TRUNCATE
- RENAME

Example:
```sql
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT
);
```

### 2. DML (Data Manipulation Language)
Used to modify data.

Commands:
- INSERT
- UPDATE
- DELETE

Example:
```sql
INSERT INTO students
VALUES (1,'Ritesh',22);

UPDATE students
SET age = 23
WHERE id = 1;

DELETE FROM students
WHERE id = 1;
```

### 3. DQL (Data Query Language)

Command:
- SELECT

Example:

```sql
SELECT * FROM students;
```

### 4. DCL (Data Control Language)

Commands:
- GRANT
- REVOKE

Example:

```sql
GRANT SELECT
ON students
TO user1;
```

### 5. TCL (Transaction Control Language)

Commands:
- COMMIT
- ROLLBACK
- SAVEPOINT

Example:

```sql
COMMIT;
ROLLBACK;
```

---

## CRUD Operations

| Operation | SQL Command |
|-----------|-------------|
| Create | INSERT |
| Read | SELECT |
| Update | UPDATE |
| Delete | DELETE |

---

## Important SQL Commands

### Select All

```sql
SELECT * FROM students;
```

### Select Specific Column

```sql
SELECT name, age
FROM students;
```

### WHERE

```sql
SELECT *
FROM students
WHERE age > 20;
```

### ORDER BY

```sql
SELECT *
FROM students
ORDER BY age ASC;
```

### DISTINCT

```sql
SELECT DISTINCT city
FROM students;
```

### LIMIT

```sql
SELECT *
FROM students
LIMIT 5;
```

---

## Aggregate Functions

```sql
SELECT COUNT(*) FROM students;
SELECT SUM(salary) FROM students;
SELECT AVG(salary) FROM students;
SELECT MAX(salary) FROM students;
SELECT MIN(salary) FROM students;
```

---

## SQL vs MySQL

| SQL | MySQL |
|------|--------|
| Language | Database Software |
| Writes Queries | Executes Queries |

---

## SQL Workflow

Database
↓
Create Table
↓
Insert Data
↓
Retrieve Data
↓
Update Data
↓
Delete Data

---

## Interview Questions

1. What is SQL?
2. What is DBMS?
3. What is RDBMS?
4. Difference between SQL and MySQL?
5. What is CRUD?
6. What is DDL?
7. What is DML?
8. What is DQL?
9. What is Primary Key?
10. What is Foreign Key?

---

## Quick Revision

- SQL = Structured Query Language
- SQL is a query language.
- SQL is not a database.
- MySQL is an RDBMS.
- CRUD = Create, Read, Update, Delete.
- DDL = CREATE, ALTER, DROP.
- DML = INSERT, UPDATE, DELETE.
- DQL = SELECT.
- DCL = GRANT, REVOKE.
- TCL = COMMIT, ROLLBACK, SAVEPOINT.