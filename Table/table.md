# SQL Table

## 1. What is a Table?

A **Table** is a collection of related data stored in the form of **rows and columns** inside a database.

In a relational database (RDBMS), all data is stored in tables.

### Simple Definition

> A table is a structure that stores data in rows and columns.

---

# 2. Table Structure

A table contains:

## Columns (Fields)

Columns define what type of information will be stored.

Example:

```
id
name
age
salary
```

---

## Rows (Records)

Rows contain actual data.

Example:

| id | name | age |
|----|------|-----|
| 1 | Ritesh | 22 |

This complete row is called a record.

---

# 3. Real-Life Example

### Employee Table

| id | name | age | salary |
|----|------|-----|--------|
| 1 | Ritesh | 22 | 50000 |
| 2 | Rahul | 23 | 60000 |
| 3 | Aman | 21 | 40000 |

Here:

- Table Name → Employee
- Columns → id, name, age, salary
- Rows → Employee records

---

# 4. Create Table

## What is CREATE TABLE?

`CREATE TABLE` command is used to create a new table inside a database.

It is a **DDL (Data Definition Language)** command.

---

## Syntax

```sql
CREATE TABLE table_name(
    column1 datatype,
    column2 datatype,
    column3 datatype
);
```

---

## Example

```sql
CREATE TABLE students(
    id INT,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);
```

---

## Explanation

```sql
id INT
```

Creates an id column that stores numbers.

---

```sql
name VARCHAR(50)
```

Creates a name column that stores text up to 50 characters.

---

```sql
age INT
```

Stores age values.

---

```sql
city VARCHAR(50)
```

Stores city names.

---

# 5. Show Tables

## What is SHOW TABLES?

Used to display all tables present inside a database.

---

## Syntax

```sql
SHOW TABLES;
```

---

## Example

```sql
SHOW TABLES;
```

### Output

```
students
employees
users
```

---

# 6. Describe Table

## What is DESC?

`DESC` command shows the structure of a table.

It displays:

- Column name
- Data type
- Null allowed
- Key information

---

## Syntax

```sql
DESC table_name;
```

---

## Example

```sql
DESC students;
```

### Output

| Field | Type |
|------|------|
| id | INT |
| name | VARCHAR(50) |
| age | INT |
| city | VARCHAR(50) |

---

# 7. Insert Data Into Table

## What is INSERT?

INSERT command is used to add new records into a table.

It is a **DML (Data Manipulation Language)** command.

---

## Syntax

```sql
INSERT INTO table_name
VALUES(value1,value2,value3);
```

---

## Example

```sql
INSERT INTO students
VALUES
(1,'Ritesh',22,'Patiala');
```

---

## Insert Multiple Records

```sql
INSERT INTO students
VALUES
(2,'Rahul',21,'Delhi'),
(3,'Aman',23,'Chandigarh');
```

---

# 8. Retrieve Data From Table

## What is SELECT?

SELECT command is used to fetch data from a table.

---

## Syntax

```sql
SELECT column_name
FROM table_name;
```

---

## Example

```sql
SELECT *
FROM students;
```

### Output

| id | name | age | city |
|----|------|-----|------|
|1|Ritesh|22|Patiala|
|2|Rahul|21|Delhi|

---

# 9. Update Table Data

## What is UPDATE?

UPDATE command is used to modify existing records.

---

## Syntax

```sql
UPDATE table_name
SET column=value
WHERE condition;
```

---

## Example

```sql
UPDATE students
SET age=23
WHERE id=1;
```

### Explanation

Student whose id is 1 will have age changed to 23.

---

# 10. Delete Data From Table

## What is DELETE?

DELETE command removes records from a table.

---

## Syntax

```sql
DELETE FROM table_name
WHERE condition;
```

---

## Example

```sql
DELETE FROM students
WHERE id=3;
```

### Explanation

Record with id 3 will be deleted.

---

# 11. Alter Table

## What is ALTER?

ALTER command is used to modify the structure of an existing table.

---

# Add Column

## Syntax

```sql
ALTER TABLE table_name
ADD column_name datatype;
```

---

## Example

```sql
ALTER TABLE students
ADD email VARCHAR(100);
```

New column added:

| id | name | age | email |
|-|-|-|-|

---

# Modify Column

```sql
ALTER TABLE students
MODIFY name VARCHAR(100);
```

Changes column size.

---

# Drop Column

```sql
ALTER TABLE students
DROP COLUMN email;
```

Deletes email column.

---

# 12. Rename Table

## Syntax

```sql
RENAME TABLE old_name
TO new_name;
```

---

## Example

```sql
RENAME TABLE students
TO student_details;
```

---

# 13. Truncate Table

## What is TRUNCATE?

TRUNCATE removes all records from a table but keeps the table structure.

It is a DDL command.

---

## Syntax

```sql
TRUNCATE TABLE table_name;
```

---

## Example

```sql
TRUNCATE TABLE students;
```

Before:

|id|name|
|-|-|
|1|Ritesh|
|2|Rahul|

After:

```
Empty Table
```

---

# 14. Drop Table

## What is DROP?

DROP command permanently removes a table including:

- Data
- Structure

---

## Syntax

```sql
DROP TABLE table_name;
```

---

## Example

```sql
DROP TABLE students;
```

After executing:

```
students table does not exist
```

---

# 15. Table Constraints

Constraints are rules applied to columns.

Types:

- PRIMARY KEY
- FOREIGN KEY
- UNIQUE
- NOT NULL
- DEFAULT
- CHECK

---

## Example

```sql
CREATE TABLE users(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT
);
```

---

# Important Points

- Table stores data in rows and columns.
- One database can have many tables.
- Rows represent records.
- Columns represent attributes.
- CREATE TABLE is a DDL command.
- INSERT, UPDATE, DELETE are DML commands.
- SELECT is used to fetch data.
- DROP deletes the complete table.
- TRUNCATE removes only data.

---

# Interview Questions

## Q1. What is a Table in SQL?

**Answer:**

A table is a collection of related data stored in rows and columns inside a database.

---

## Q2. What is the difference between Row and Column?

| Row | Column |
|-|-|
| Represents a record | Represents an attribute |
| Horizontal data | Vertical data |

---

## Q3. How do you create a table?

Answer:

Using CREATE TABLE command.

Example:

```sql
CREATE TABLE users(
id INT,
name VARCHAR(50)
);
```

---

## Q4. Difference between DROP and TRUNCATE?

| DROP | TRUNCATE |
|-|-|
| Deletes table completely | Deletes only data |
| Structure removed | Structure remains |
| Cannot use table again | Table can be reused |

---

## Q5. Difference between DELETE and TRUNCATE?

| DELETE | TRUNCATE |
|-|-|
| Removes selected rows | Removes all rows |
| WHERE can be used | WHERE cannot be used |
| DML command | DDL command |

---

## Q6. Difference between ALTER and UPDATE?

| ALTER | UPDATE |
|-|-|
| Changes table structure | Changes table data |
| DDL command | DML command |

---

# Common Mistakes

- Forgetting WHERE in UPDATE
- Forgetting WHERE in DELETE
- Using wrong datatype
- Dropping table without backup
- Creating duplicate column names

---

# Practice Questions

1. Create a student table with:
   - id
   - name
   - age
   - course

2. Insert 5 records.

3. Display all students.

4. Update one student's age.

5. Delete one student.

6. Add email column.

7. Remove email column.

8. Rename the table.

9. Truncate the table.

10. Drop the table.