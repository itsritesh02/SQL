# SQL (Structured Query Language)

## 1. What is SQL?

**SQL (Structured Query Language)** is a standard language used to communicate with relational databases.

It is used to **create, read, update, and delete (CRUD)** data stored in a database.

### Simple Definition

> SQL is a language used to manage and work with relational databases.

---

## 2. Why Do We Use SQL?

SQL helps us to:

- Create databases
- Create tables
- Insert data
- Retrieve data
- Update data
- Delete data
- Manage users and permissions
- Perform calculations on data

---

## 3. Real-Life Example

Suppose you have an **Employee** table.

| ID | Name | Salary |
|----|------|--------|
| 1 | Ritesh | 50000 |
| 2 | Rahul | 45000 |
| 3 | Aman | 60000 |

Using SQL you can:

- Find all employees
- Find employees with salary greater than ₹50,000
- Add a new employee
- Update salary
- Delete an employee

---

# 4. What Can SQL Do?

- Create Database
- Create Table
- Insert Records
- Update Records
- Delete Records
- Retrieve Records
- Sort Data
- Filter Data
- Join Multiple Tables
- Perform Calculations

---

# 5. SQL Categories (Most Important)

## 1. DDL (Data Definition Language)

Used to define or change the database structure.

Commands:

- CREATE
- ALTER
- DROP
- TRUNCATE
- RENAME

---

## 2. DML (Data Manipulation Language)

Used to modify data.

Commands:

- INSERT
- UPDATE
- DELETE

---

## 3. DQL (Data Query Language)

Used to retrieve data.

Command:

- SELECT

---

## 4. DCL (Data Control Language)

Used to control user permissions.

Commands:

- GRANT
- REVOKE

---

## 5. TCL (Transaction Control Language)

Used to manage transactions.

Commands:

- COMMIT
- ROLLBACK
- SAVEPOINT

---

# 6. SQL Workflow

```
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
```

---

# 7. SQL Syntax Example

```sql
SELECT * FROM students;
```

Explanation:

- SELECT → Retrieve data
- * → All columns
- FROM → Table name
- students → Table

---

# 8. Features of SQL

- Easy to learn
- Fast
- Standard language
- Supports CRUD operations
- Supports Joins
- Supports Functions
- Used by almost every company

---

# 9. Advantages of SQL

- Easy data retrieval
- Fast query execution
- Secure
- Standard language
- Supports large databases
- Easy to maintain

---

# 10. SQL vs Database

| SQL | Database |
|------|----------|
| A language | A place where data is stored |
| Used to communicate with database | Stores data |
| Executes queries | Contains tables |

Example:

Database → College

SQL →

```sql
SELECT * FROM students;
```

---

# 11. SQL vs MySQL

| SQL | MySQL |
|------|--------|
| Language | Database Management System (DBMS) |
| Used to write queries | Executes SQL queries |
| Standard language | Software |
| Cannot store data | Stores data |

Example:

SQL

```sql
SELECT * FROM students;
```

MySQL executes this query and returns the result.

---

# 12. SQL Used In

- Banking
- Amazon
- Flipkart
- Facebook
- Instagram
- Railway Reservation
- Hospital Management
- School Management
- Food Delivery Apps

---

# 13. Important Points

- SQL stands for Structured Query Language.
- SQL is used with relational databases.
- SQL performs CRUD operations.
- SQL is not a database.
- MySQL, PostgreSQL, SQL Server, and Oracle use SQL.
- SQL is one of the most important skills for Software Engineers.

---

# Interview Questions

## Q1. What is SQL?

**Answer:**

SQL (Structured Query Language) is a standard language used to create, retrieve, update, and delete data in relational databases.

---

## Q2. Why do we use SQL?

**Answer:**

We use SQL to manage databases, create tables, insert data, update data, delete data, retrieve data, and perform data analysis.

---

## Q3. Is SQL a programming language?

**Answer:**

No.

SQL is a **query language**, not a general-purpose programming language.

---

## Q4. Is SQL a database?

**Answer:**

No.

SQL is a language used to communicate with a database.

---

## Q5. What is CRUD?

| Operation | SQL Command |
|-----------|-------------|
| Create | INSERT |
| Read | SELECT |
| Update | UPDATE |
| Delete | DELETE |

---

## Q6. What are the different types of SQL commands?

- DDL
- DML
- DQL
- DCL
- TCL

---

## Q7. Which databases use SQL?

- MySQL
- PostgreSQL
- Oracle
- Microsoft SQL Server
- SQLite

---

## Q8. Difference between SQL and MySQL?

**SQL**
- Language
- Used to write queries

**MySQL**
- Database Management System
- Executes SQL queries

---

# Common Interview Follow-up Questions

- What is DBMS?
- What is RDBMS?
- What is a Database?
- What is a Table?
- What is a Primary Key?
- What is SQL Syntax?
- What is CRUD?
- Difference between SQL and NoSQL?
- Difference between SQL and MySQL?

---

# Quick Revision

- SQL = Structured Query Language
- SQL is a query language
- SQL is not a database
- SQL works with relational databases
- SQL performs CRUD operations
- SQL categories:
  - DDL
  - DML
  - DQL
  - DCL
  - TCL

---

# Practice Questions

1. What is SQL?
2. Why is SQL used?
3. Is SQL a programming language?
4. Is SQL a database?
5. Explain CRUD operations.
6. Name the five categories of SQL commands.
7. What is the difference between SQL and MySQL?
8. Name four databases that use SQL.