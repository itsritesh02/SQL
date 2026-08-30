# SQL Commands — Complete Interview Notes

SQL = Structured Query Language

SQL ka use database ke andar data ko create, read, update, delete aur manage karne ke liye hota hai.

SQL Commands ko mainly 5 categories mein divide kiya jata hai:

1. DDL — Data Definition Language
2. DML — Data Manipulation Language
3. DQL — Data Query Language
4. DCL — Data Control Language
5. TCL — Transaction Control Language

---

# 1. DDL — Data Definition Language

DDL ka use database structure/schema ko create ya modify karne ke liye hota hai.

Main DDL Commands:

- CREATE
- ALTER
- DROP
- TRUNCATE
- RENAME

---

# 2. CREATE

CREATE ka use database, table ya other database objects create karne ke liye hota hai.

## Create Database

    CREATE DATABASE company;

Database select karna:

    USE company;

---

## Create Table

    CREATE TABLE users (
        id INT,
        name VARCHAR(100),
        email VARCHAR(150),
        age INT
    );

---

## Create Table with Constraints

    CREATE TABLE users (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(150) UNIQUE,
        age INT,
        is_active BOOLEAN DEFAULT TRUE
    );

---

# 3. ALTER

ALTER ka use existing table ke structure ko modify karne ke liye hota hai.

Common operations:

- Add column
- Modify column
- Rename column
- Drop column

---

## Add Column

    ALTER TABLE users
    ADD phone VARCHAR(15);

---

## Add Multiple Columns

    ALTER TABLE users
    ADD (
        city VARCHAR(50),
        country VARCHAR(50)
    );

---

## Modify Column

MySQL:

    ALTER TABLE users
    MODIFY age SMALLINT;

---

## Change Data Type

    ALTER TABLE users
    MODIFY name VARCHAR(150);

---

## Rename Column

MySQL:

    ALTER TABLE users
    RENAME COLUMN name TO full_name;

---

## Drop Column

    ALTER TABLE users
    DROP COLUMN phone;

---

# 4. RENAME

Table ka naam change karne ke liye.

    RENAME TABLE users TO customers;

---

# 5. DROP

DROP database object ko completely delete karta hai.

## Drop Table

    DROP TABLE users;

Table:

- Structure delete
- Data delete

Dono remove ho jate hain.

---

## Drop Database

    DROP DATABASE company;

Database completely delete ho jayega.

IMPORTANT:

DROP command carefully use karna chahiye.

---

# 6. TRUNCATE

TRUNCATE table ke andar ka saara data remove karta hai, lekin table structure ko rakhta hai.

    TRUNCATE TABLE users;

Result:

    Data → Delete
    Table Structure → Remains

---

# 7. DROP vs TRUNCATE vs DELETE

| DROP | TRUNCATE | DELETE |
|------|----------|--------|
| Table/database remove | Table ka data remove | Selected/all rows remove |
| Structure bhi remove | Structure remains | Structure remains |
| WHERE nahi | WHERE nahi | WHERE possible |
| DDL | DDL | DML |
| Table completely remove | Fast full data removal | Row-level deletion |

Example:

    DROP TABLE users;

    TRUNCATE TABLE users;

    DELETE FROM users WHERE id = 5;

---

# 8. DML — Data Manipulation Language

DML ka use table ke data ko insert, update aur delete karne ke liye hota hai.

Main commands:

- INSERT
- UPDATE
- DELETE

---

# 9. INSERT

Table mein new records add karne ke liye.

## Insert One Row

    INSERT INTO users (name, email, age)
    VALUES ('Ritesh', 'ritesh@gmail.com', 22);

---

## Insert Multiple Rows

    INSERT INTO users (name, email, age)
    VALUES
    ('Ritesh', 'ritesh@gmail.com', 22),
    ('Rahul', 'rahul@gmail.com', 25),
    ('Aman', 'aman@gmail.com', 24);

---

# 10. UPDATE

Existing data ko modify karne ke liye.

    UPDATE users
    SET age = 23
    WHERE id = 1;

IMPORTANT:

UPDATE ke saath WHERE use karna important hai.

Without WHERE:

    UPDATE users
    SET age = 23;

Saare users ki age update ho sakti hai.

---

# 11. DELETE

Table se records delete karne ke liye.

    DELETE FROM users
    WHERE id = 5;

IMPORTANT:

WHERE ke bina:

    DELETE FROM users;

Table ke saare rows delete ho jayenge.

Table structure remain karega.

---

# 12. DQL — Data Query Language

DQL ka use database se data retrieve/read karne ke liye hota hai.

Main command:

- SELECT

---

# 13. SELECT

Data retrieve karne ke liye.

## Select All Columns

    SELECT *
    FROM users;

---

## Select Specific Columns

    SELECT name, email
    FROM users;

---

## Select Single Column

    SELECT name
    FROM users;

---

# 14. WHERE

Specific condition ke according records filter karne ke liye.

    SELECT *
    FROM users
    WHERE age > 18;

Another:

    SELECT *
    FROM users
    WHERE city = 'Chandigarh';

---

# 15. Comparison Operators

Common operators:

    =
    !=
    <>
    >
    <
    >=
    <=

Examples:

    SELECT *
    FROM users
    WHERE age = 22;

    SELECT *
    FROM users
    WHERE age >= 18;

    SELECT *
    FROM users
    WHERE age != 25;

---

# 16. AND

Multiple conditions ko combine karne ke liye.

    SELECT *
    FROM users
    WHERE age > 18
    AND city = 'Chandigarh';

Dono conditions TRUE honi chahiye.

---

# 17. OR

Agar multiple conditions mein se koi ek TRUE ho.

    SELECT *
    FROM users
    WHERE city = 'Chandigarh'
    OR city = 'Delhi';

---

# 18. NOT

Condition ko reverse karta hai.

    SELECT *
    FROM users
    WHERE NOT city = 'Delhi';

---

# 19. BETWEEN

Range ke andar values find karne ke liye.

    SELECT *
    FROM users
    WHERE age BETWEEN 18 AND 30;

BETWEEN generally inclusive hota hai.

---

# 20. IN

Multiple possible values check karne ke liye.

    SELECT *
    FROM users
    WHERE city IN ('Delhi', 'Chandigarh', 'Mumbai');

IN multiple OR conditions ka short form hai.

---

# 21. NOT IN

Given values ko exclude karne ke liye.

    SELECT *
    FROM users
    WHERE city NOT IN ('Delhi', 'Mumbai');

---

# 22. LIKE

Pattern matching ke liye.

## Starts With

    SELECT *
    FROM users
    WHERE name LIKE 'R%';

R se start hone wale names.

---

## Ends With

    SELECT *
    FROM users
    WHERE name LIKE '%a';

a se end hone wale names.

---

## Contains

    SELECT *
    FROM users
    WHERE name LIKE '%it%';

Name mein "it" contain karne wale records.

---

# 23. Wildcards

## %

Zero ya multiple characters represent karta hai.

    R%

R se start.

    %a

a se end.

    %it%

it kahin bhi.

---

## _

Exactly one character represent karta hai.

    R_tesh

Example pattern mein `_` ek character represent karega.

---

# 24. DISTINCT

Duplicate values remove karne ke liye.

    SELECT DISTINCT city
    FROM users;

---

# 25. ORDER BY

Result ko sort karne ke liye.

## Ascending

    SELECT *
    FROM users
    ORDER BY age ASC;

ASC = Ascending

---

## Descending

    SELECT *
    FROM users
    ORDER BY age DESC;

DESC = Descending

---

# 26. LIMIT

Result ki number of rows limit karne ke liye.

    SELECT *
    FROM users
    LIMIT 5;

First 5 records.

---

# 27. OFFSET

Kuch rows skip karne ke liye.

    SELECT *
    FROM users
    LIMIT 5 OFFSET 10;

10 rows skip karega aur next 5 rows return karega.

---

# 28. AS — Alias

Column ya table ko temporary name dene ke liye.

    SELECT name AS username
    FROM users;

Table alias:

    SELECT u.name
    FROM users AS u;

---

# 29. Aggregate Functions

Multiple rows ke data par calculation karne ke liye.

Important functions:

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

---

## COUNT()

Rows count karne ke liye.

    SELECT COUNT(*)
    FROM users;

---

## SUM()

Total calculate karne ke liye.

    SELECT SUM(salary)
    FROM employees;

---

## AVG()

Average calculate karne ke liye.

    SELECT AVG(salary)
    FROM employees;

---

## MIN()

Minimum value.

    SELECT MIN(salary)
    FROM employees;

---

## MAX()

Maximum value.

    SELECT MAX(salary)
    FROM employees;

---

# 30. GROUP BY

Same values ko groups mein divide karne ke liye.

Example:

    SELECT city, COUNT(*)
    FROM users
    GROUP BY city;

Result concept:

    Chandigarh → 10
    Delhi → 15
    Mumbai → 8

---

# 31. HAVING

GROUP BY ke result par condition lagane ke liye.

Example:

    SELECT city, COUNT(*)
    FROM users
    GROUP BY city
    HAVING COUNT(*) > 5;

Important:

WHERE → Rows ko filter karta hai

HAVING → Groups ko filter karta hai

---

# 32. WHERE vs HAVING

| WHERE | HAVING |
|-------|--------|
| Rows filter karta hai | Groups filter karta hai |
| GROUP BY se pehle logically apply hota hai | GROUP BY ke baad logically apply hota hai |
| Normal conditions | Aggregate/group conditions |
| COUNT() etc. ke saath generally use nahi | Aggregate functions ke saath commonly use |

Example:

    SELECT city, COUNT(*)
    FROM users
    WHERE age >= 18
    GROUP BY city
    HAVING COUNT(*) > 5;

---

# 33. NULL

NULL ka meaning:

    Value unknown / missing / not available

NULL ka matlab:

    0 nahi hai
    Empty string nahi hai
    False nahi hai

Check NULL:

    SELECT *
    FROM users
    WHERE email IS NULL;

Check NOT NULL:

    SELECT *
    FROM users
    WHERE email IS NOT NULL;

IMPORTANT:

Wrong:

    WHERE email = NULL

Correct:

    WHERE email IS NULL

---

# 34. COALESCE

NULL ke case mein alternative value return karta hai.

    SELECT COALESCE(phone, 'Not Available')
    FROM users;

Agar phone NULL hai:

    Not Available

return karega.

---

# 35. CASE

SQL mein conditional logic ke liye.

Example:

    SELECT
        name,
        age,
        CASE
            WHEN age >= 18 THEN 'Adult'
            ELSE 'Minor'
        END AS category
    FROM users;

---

# 36. JOIN

Multiple tables se related data retrieve karne ke liye.

Main JOIN types:

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- CROSS JOIN
- SELF JOIN

---

# 37. INNER JOIN

Dono tables mein matching records return karta hai.

    SELECT users.name, orders.order_id
    FROM users
    INNER JOIN orders
    ON users.id = orders.user_id;

---

# 38. LEFT JOIN

Left table ke saare records + right table ke matching records.

    SELECT users.name, orders.order_id
    FROM users
    LEFT JOIN orders
    ON users.id = orders.user_id;

Agar order nahi hai to order columns mein NULL aa sakta hai.

---

# 39. RIGHT JOIN

Right table ke saare records + left table ke matching records.

    SELECT users.name, orders.order_id
    FROM users
    RIGHT JOIN orders
    ON users.id = orders.user_id;

---

# 40. CROSS JOIN

Dono tables ka Cartesian product return karta hai.

    SELECT *
    FROM users
    CROSS JOIN products;

Agar:

    Users = 5 rows
    Products = 10 rows

Result:

    5 × 10 = 50 rows

---

# 41. SELF JOIN

Table ko khud ke saath join karna.

Example:

    SELECT
        e.name AS employee,
        m.name AS manager
    FROM employees e
    LEFT JOIN employees m
    ON e.manager_id = m.id;

---

# 42. DCL — Data Control Language

DCL database permissions/access control ke liye use hota hai.

Main commands:

- GRANT
- REVOKE

---

# 43. GRANT

User ko permissions dene ke liye.

Example:

    GRANT SELECT, INSERT
    ON company.users
    TO 'user'@'localhost';

---

# 44. REVOKE

User se permissions remove karne ke liye.

Example:

    REVOKE INSERT
    ON company.users
    FROM 'user'@'localhost';

---

# 45. TCL — Transaction Control Language

TCL transactions ko manage karne ke liye use hota hai.

Main commands:

- COMMIT
- ROLLBACK
- SAVEPOINT

---

# 46. COMMIT

Transaction ke changes permanently save karta hai.

Example:

    START TRANSACTION;

    UPDATE users
    SET age = 25
    WHERE id = 1;

    COMMIT;

---

# 47. ROLLBACK

Uncommitted transaction ke changes ko undo karta hai.

Example:

    START TRANSACTION;

    UPDATE users
    SET age = 30
    WHERE id = 1;

    ROLLBACK;

Changes rollback ho jayenge.

---

# 48. SAVEPOINT

Transaction ke andar ek specific point create karta hai.

Example:

    START TRANSACTION;

    UPDATE users
    SET age = 25
    WHERE id = 1;

    SAVEPOINT point1;

    UPDATE users
    SET age = 30
    WHERE id = 2;

    ROLLBACK TO SAVEPOINT point1;

---

# 49. COMMIT vs ROLLBACK

| COMMIT | ROLLBACK |
|--------|----------|
| Changes save karta hai | Uncommitted changes undo karta hai |
| Transaction complete kar sakta hai | Transaction ko reverse karta hai |

---

# 50. DDL vs DML vs DQL vs DCL vs TCL

| Category | Full Form | Main Commands |
|----------|-----------|---------------|
| DDL | Data Definition Language | CREATE, ALTER, DROP, TRUNCATE, RENAME |
| DML | Data Manipulation Language | INSERT, UPDATE, DELETE |
| DQL | Data Query Language | SELECT |
| DCL | Data Control Language | GRANT, REVOKE |
| TCL | Transaction Control Language | COMMIT, ROLLBACK, SAVEPOINT |

---

# 51. DELETE vs TRUNCATE vs DROP

## DELETE

    DELETE FROM users
    WHERE id = 5;

Specific rows delete kar sakte hain.

WHERE use kar sakte hain.

Table structure remains.

---

## TRUNCATE

    TRUNCATE TABLE users;

Saare rows remove.

WHERE use nahi karte.

Table structure remains.

---

## DROP

    DROP TABLE users;

Table + data + structure remove.

---

# 52. SQL Command Execution Order

SQL query logically generally is order mein process hoti hai:

    FROM
    WHERE
    GROUP BY
    HAVING
    SELECT
    DISTINCT
    ORDER BY
    LIMIT

Example:

    SELECT city, COUNT(*) AS total
    FROM users
    WHERE age >= 18
    GROUP BY city
    HAVING COUNT(*) > 5
    ORDER BY total DESC
    LIMIT 10;

Important:

Query likhne ka order aur logical processing order same nahi hota.

---

# 53. Common SQL Query Examples

## Find all users

    SELECT *
    FROM users;

---

## Find users older than 18

    SELECT *
    FROM users
    WHERE age > 18;

---

## Find users from Chandigarh

    SELECT *
    FROM users
    WHERE city = 'Chandigarh';

---

## Find users between age 20 and 30

    SELECT *
    FROM users
    WHERE age BETWEEN 20 AND 30;

---

## Find users from multiple cities

    SELECT *
    FROM users
    WHERE city IN ('Delhi', 'Chandigarh');

---

## Find names starting with R

    SELECT *
    FROM users
    WHERE name LIKE 'R%';

---

## Sort users by age

    SELECT *
    FROM users
    ORDER BY age DESC;

---

## Count users

    SELECT COUNT(*)
    FROM users;

---

## Find average salary

    SELECT AVG(salary)
    FROM employees;

---

## Find highest salary

    SELECT MAX(salary)
    FROM employees;

---

## Find lowest salary

    SELECT MIN(salary)
    FROM employees;

---

## Total salary

    SELECT SUM(salary)
    FROM employees;

---

# 54. Interview Questions

## Q1. SQL commands ki main categories kya hain?

Five commonly used categories:

DDL
DML
DQL
DCL
TCL

---

## Q2. DDL kya hai?

DDL database structure/schema define aur modify karne ke liye use hota hai.

Examples:

    CREATE
    ALTER
    DROP
    TRUNCATE
    RENAME

---

## Q3. DML kya hai?

DML table ke data ko manipulate karne ke liye use hota hai.

Examples:

    INSERT
    UPDATE
    DELETE

---

## Q4. DQL kya hai?

DQL database se data retrieve karne ke liye use hota hai.

Main command:

    SELECT

---

## Q5. DCL kya hai?

DCL database users ke permissions/access control ke liye use hota hai.

Examples:

    GRANT
    REVOKE

---

## Q6. TCL kya hai?

TCL transactions ko manage karne ke liye use hota hai.

Examples:

    COMMIT
    ROLLBACK
    SAVEPOINT

---

## Q7. DELETE aur TRUNCATE mein difference?

DELETE rows ko delete karta hai aur WHERE ke saath specific rows delete kar sakta hai.

TRUNCATE table ke saare rows remove karta hai aur WHERE use nahi karta.

---

## Q8. DROP aur TRUNCATE mein difference?

DROP table ka structure aur data dono remove karta hai.

TRUNCATE data remove karta hai lekin table structure ko retain karta hai.

---

## Q9. WHERE aur HAVING mein difference?

WHERE individual rows ko filter karta hai.

HAVING grouped results ko filter karta hai, commonly aggregate functions ke saath.

---

## Q10. WHERE mein NULL ko kaise check karte hain?

Correct:

    WHERE column IS NULL

Not:

    WHERE column = NULL

---

## Q11. GROUP BY ka use kya hai?

Similar values ko groups mein divide karke aggregate calculations perform karne ke liye.

---

## Q12. ORDER BY ka use kya hai?

Result ko ascending ya descending order mein sort karne ke liye.

---

## Q13. DISTINCT ka use kya hai?

Duplicate values ko remove karke unique values return karne ke liye.

---

## Q14. JOIN kya hai?

JOIN multiple related tables ke data ko combine karne ke liye use hota hai.

---

## Q15. INNER JOIN kya return karta hai?

Dono tables ke matching records.

---

## Q16. LEFT JOIN kya return karta hai?

Left table ke saare records aur right table ke matching records.

---

## Q17. COMMIT kya karta hai?

Transaction ke changes permanently save karta hai.

---

## Q18. ROLLBACK kya karta hai?

Uncommitted transaction changes ko undo karta hai.

---

# 55. ⭐ Quick Revision

DDL
→ Structure define/modify

CREATE
→ Database/Table create

ALTER
→ Structure modify

DROP
→ Object completely remove

TRUNCATE
→ All rows remove, structure remains

RENAME
→ Object/table name change

DML
→ Data manipulate

INSERT
→ Data add

UPDATE
→ Data modify

DELETE
→ Data remove

DQL
→ Data retrieve

SELECT
→ Data read

WHERE
→ Rows filter

DISTINCT
→ Duplicate values remove

ORDER BY
→ Sort

GROUP BY
→ Group records

HAVING
→ Groups filter

LIMIT
→ Result rows limit

JOIN
→ Tables combine

DCL
→ Permissions

GRANT
→ Permission dena

REVOKE
→ Permission remove

TCL
→ Transactions manage

COMMIT
→ Changes save

ROLLBACK
→ Changes undo

SAVEPOINT
→ Transaction checkpoint

---

# ⭐ MOST IMPORTANT INTERVIEW ONE-LINERS

1. DDL is used to define and modify database structure.

2. DML is used to manipulate table data.

3. DQL is used to retrieve data.

4. DCL is used to manage permissions.

5. TCL is used to manage transactions.

6. CREATE creates database objects.

7. ALTER modifies existing object structure.

8. DROP removes the object completely.

9. TRUNCATE removes all rows but keeps table structure.

10. DELETE can remove selected rows using WHERE.

11. SELECT retrieves data.

12. WHERE filters rows.

13. GROUP BY creates groups.

14. HAVING filters groups.

15. ORDER BY sorts results.

16. DISTINCT removes duplicate results.

17. INNER JOIN returns matching records.

18. LEFT JOIN returns all left-table records plus matching right-table records.

19. COMMIT permanently saves a transaction's changes.

20. ROLLBACK undoes uncommitted transaction changes.

21. AUTO_INCREMENT is a column attribute, not a SQL command category.

22. NULL should be checked using IS NULL or IS NOT NULL.

23. WHERE is generally applied before GROUP BY logically.

24. HAVING is generally used after GROUP BY for grouped conditions.

25. DELETE, TRUNCATE and DROP have different effects and should not be treated as the same command.

---

# ⭐ FINAL INTERVIEW SUMMARY

SQL commands are commonly categorized as:

DDL:
CREATE, ALTER, DROP, TRUNCATE, RENAME

DML:
INSERT, UPDATE, DELETE

DQL:
SELECT

DCL:
GRANT, REVOKE

TCL:
COMMIT, ROLLBACK, SAVEPOINT

Sabse important commands jo interview aur real projects mein frequently use hote hain:

    SELECT
    INSERT
    UPDATE
    DELETE
    CREATE
    ALTER
    DROP
    TRUNCATE
    WHERE
    GROUP BY
    HAVING
    ORDER BY
    JOIN
    COMMIT
    ROLLBACK