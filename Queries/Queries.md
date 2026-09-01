# SQL QUERIES — Complete Interview Notes

SQL Query ek instruction hoti hai jo database se data retrieve, insert, update, delete ya manipulate karne ke liye use hoti hai.

SQL Query ke through hum:

- Data retrieve kar sakte hain
- Data filter kar sakte hain
- Data sort kar sakte hain
- Data group kar sakte hain
- New data insert kar sakte hain
- Existing data update kar sakte hain
- Data delete kar sakte hain
- Multiple tables ko join kar sakte hain

---

# 1. BASIC SELECT QUERY

Table ka complete data:

    SELECT *
    FROM employees;

`*` ka meaning hai all columns.

---

# 2. SELECT SPECIFIC COLUMNS

Sirf required columns:

    SELECT name, salary
    FROM employees;

---

# 3. SELECT WITH WHERE

Condition ke according data retrieve karna:

    SELECT *
    FROM employees
    WHERE salary > 50000;

---

# 4. SELECT WITH AND

Dono conditions TRUE honi chahiye:

    SELECT *
    FROM employees
    WHERE salary > 30000
    AND department = 'IT';

---

# 5. SELECT WITH OR

Koi bhi ek condition TRUE:

    SELECT *
    FROM employees
    WHERE department = 'IT'
    OR department = 'HR';

---

# 6. SELECT WITH IN

Multiple values check:

    SELECT *
    FROM employees
    WHERE department IN ('IT', 'HR', 'Sales');

---

# 7. SELECT WITH NOT IN

Specified values ko exclude karna:

    SELECT *
    FROM employees
    WHERE department NOT IN ('IT', 'HR');

---

# 8. SELECT WITH BETWEEN

Range ke andar values:

    SELECT *
    FROM employees
    WHERE salary BETWEEN 30000 AND 60000;

BETWEEN generally starting aur ending values ko include karta hai.

---

# 9. SELECT WITH LIKE

Pattern matching:

    SELECT *
    FROM employees
    WHERE name LIKE 'R%';

`R%`

→ R se start hone wale names.

---

# LIKE PATTERNS

    'R%'     → R se start
    '%h'     → h par end
    '%it%'   → it contain
    '_a%'    → second character a

Example:

    SELECT *
    FROM users
    WHERE name LIKE '%it%';

---

# 10. SELECT NULL VALUES

NULL check:

    SELECT *
    FROM employees
    WHERE phone IS NULL;

NOT NULL:

    SELECT *
    FROM employees
    WHERE phone IS NOT NULL;

IMPORTANT:

Wrong:

    WHERE phone = NULL

Correct:

    WHERE phone IS NULL

---

# 11. DISTINCT QUERY

Duplicate values remove:

    SELECT DISTINCT department
    FROM employees;

---

# 12. ORDER BY

Ascending:

    SELECT *
    FROM employees
    ORDER BY salary ASC;

Descending:

    SELECT *
    FROM employees
    ORDER BY salary DESC;

---

# 13. LIMIT

Limited records:

    SELECT *
    FROM employees
    LIMIT 5;

---

# 14. OFFSET

Rows skip karna:

    SELECT *
    FROM employees
    LIMIT 5 OFFSET 10;

First 10 rows skip karke next 5 rows.

---

# 15. ALIAS

Column ka temporary readable name:

    SELECT
        name AS employee_name,
        salary AS employee_salary
    FROM employees;

Table alias:

    SELECT *
    FROM employees e;

---

# 16. AGGREGATE QUERIES

Common Aggregate Functions:

    COUNT()
    SUM()
    AVG()
    MIN()
    MAX()

---

# COUNT()

Total rows:

    SELECT COUNT(*)
    FROM employees;

---

# SUM()

Total salary:

    SELECT SUM(salary)
    FROM employees;

---

# AVG()

Average salary:

    SELECT AVG(salary)
    FROM employees;

---

# MIN()

Minimum salary:

    SELECT MIN(salary)
    FROM employees;

---

# MAX()

Maximum salary:

    SELECT MAX(salary)
    FROM employees;

---

# 17. GROUP BY QUERY

Department-wise employee count:

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department;

---

# 18. GROUP BY WITH SUM

    SELECT
        department,
        SUM(salary) AS total_salary
    FROM employees
    GROUP BY department;

---

# 19. GROUP BY WITH AVG

    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department;

---

# 20. GROUP BY WITH MIN/MAX

    SELECT
        department,
        MIN(salary) AS minimum_salary,
        MAX(salary) AS maximum_salary
    FROM employees
    GROUP BY department;

---

# 21. HAVING

Groups ko filter karna:

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 5;

---

# WHERE vs HAVING

WHERE:

    Rows filter karta hai.

HAVING:

    Groups filter karta hai.

Example:

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    WHERE salary > 30000
    GROUP BY department
    HAVING AVG(salary) > 50000;

---

# 22. INSERT QUERY

New record add karna:

    INSERT INTO employees
    (id, name, salary, department)
    VALUES
    (1, 'Ritesh', 40000, 'IT');

---

# INSERT MULTIPLE ROWS

    INSERT INTO employees
    (id, name, salary, department)
    VALUES
    (1, 'Ritesh', 40000, 'IT'),
    (2, 'Rahul', 45000, 'HR'),
    (3, 'Aman', 50000, 'Sales');

---

# 23. UPDATE QUERY

Existing record modify karna:

    UPDATE employees
    SET salary = 50000
    WHERE id = 1;

---

# UPDATE MULTIPLE COLUMNS

    UPDATE employees
    SET
        salary = 50000,
        department = 'IT'
    WHERE id = 1;

---

# UPDATE USING CALCULATION

Salary increase:

    UPDATE employees
    SET salary = salary + 5000
    WHERE department = 'IT';

---

# IMPORTANT

UPDATE without WHERE:

    UPDATE employees
    SET salary = 50000;

Potentially all rows update ho sakti hain.

---

# 24. DELETE QUERY

Specific row delete:

    DELETE FROM employees
    WHERE id = 1;

---

# DELETE MULTIPLE ROWS

    DELETE FROM employees
    WHERE department = 'IT';

---

# DELETE WITHOUT WHERE

    DELETE FROM employees;

Table ki all rows delete ho sakti hain.

Table structure generally remain karta hai.

---

# 25. TRUNCATE

Table ki all rows remove:

    TRUNCATE TABLE employees;

TRUNCATE table ke data ko quickly remove karne ke liye use hota hai.

Exact transactional/rollback behavior DBMS ke according differ kar sakta hai.

---

# DELETE vs TRUNCATE

DELETE:

    Rows delete karta hai.
    WHERE use kar sakte hain.
    Selective deletion possible.

TRUNCATE:

    Generally complete table data remove karta hai.
    WHERE use nahi hota.
    Table structure remain karta hai.

---

# 26. DROP

Table ko completely remove:

    DROP TABLE employees;

DROP:

    Table structure
    +
    Data

dono remove kar deta hai.

---

# DELETE vs TRUNCATE vs DROP

| Command | Data | Structure | WHERE |
|---------|------|-----------|-------|
| DELETE | Remove | Remain | Yes |
| TRUNCATE | Remove all | Remain | No |
| DROP | Remove | Remove | No |

---

# 27. INNER JOIN QUERY

Matching records:

    SELECT
        u.name,
        o.amount
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id;

---

# 28. LEFT JOIN QUERY

Left table ke all records:

    SELECT
        u.name,
        o.amount
    FROM users u
    LEFT JOIN orders o
    ON u.id = o.user_id;

Matching order na hone par order columns NULL ho sakte hain.

---

# 29. RIGHT JOIN QUERY

Right table ke all records:

    SELECT
        u.name,
        o.amount
    FROM users u
    RIGHT JOIN orders o
    ON u.id = o.user_id;

---

# 30. FULL OUTER JOIN

Dono tables ke all records:

    SELECT *
    FROM users u
    FULL OUTER JOIN orders o
    ON u.id = o.user_id;

IMPORTANT:

FULL OUTER JOIN support DBMS-specific hai.

MySQL mein direct FULL OUTER JOIN available nahi hai; commonly LEFT JOIN + RIGHT JOIN + UNION se simulate kiya jata hai.

---

# 31. JOIN + WHERE

    SELECT
        u.name,
        o.amount
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id
    WHERE o.amount > 1000;

---

# 32. JOIN + GROUP BY

User-wise total spending:

    SELECT
        u.id,
        u.name,
        SUM(o.amount) AS total_spent
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id
    GROUP BY u.id, u.name;

---

# 33. JOIN + GROUP BY + HAVING

10,000 se zyada spend karne wale users:

    SELECT
        u.id,
        u.name,
        SUM(o.amount) AS total_spent
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id
    GROUP BY u.id, u.name
    HAVING SUM(o.amount) > 10000;

---

# 34. JOIN + ORDER BY + LIMIT

Top 5 spending users:

    SELECT
        u.id,
        u.name,
        SUM(o.amount) AS total_spent
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id
    GROUP BY u.id, u.name
    ORDER BY total_spent DESC
    LIMIT 5;

---

# 35. SUBQUERY

Ek query ke andar doosri query.

Example:

    SELECT *
    FROM employees
    WHERE salary > (
        SELECT AVG(salary)
        FROM employees
    );

Meaning:

Average salary se zyada salary wale employees.

---

# 36. SUBQUERY WITH IN

    SELECT *
    FROM employees
    WHERE department_id IN (
        SELECT id
        FROM departments
        WHERE location = 'Delhi'
    );

---

# 37. EXISTS

Check karta hai ki subquery at least ek matching row return karti hai ya nahi.

Example:

    SELECT *
    FROM users u
    WHERE EXISTS (
        SELECT 1
        FROM orders o
        WHERE o.user_id = u.id
    );

Meaning:

Sirf wahi users return honge jinke orders exist karte hain.

---

# 38. NOT EXISTS

    SELECT *
    FROM users u
    WHERE NOT EXISTS (
        SELECT 1
        FROM orders o
        WHERE o.user_id = u.id
    );

Users jinke orders nahi hain.

---

# 39. CASE QUERY

Conditional result:

    SELECT
        name,
        salary,
        CASE
            WHEN salary >= 60000 THEN 'High'
            WHEN salary >= 40000 THEN 'Medium'
            ELSE 'Low'
        END AS salary_level
    FROM employees;

---

# 40. COALESCE

NULL ke place par alternative value:

    SELECT
        name,
        COALESCE(phone, 'Not Available') AS phone
    FROM users;

Agar phone NULL hai:

    Not Available

show hoga.

---

# 41. UNION

Do SELECT queries ke results combine karta hai aur duplicate rows remove karta hai.

    SELECT name
    FROM employees

    UNION

    SELECT name
    FROM managers;

---

# 42. UNION ALL

Do results combine karta hai aur duplicates ko retain karta hai.

    SELECT name
    FROM employees

    UNION ALL

    SELECT name
    FROM managers;

---

# UNION vs UNION ALL

UNION:

    Duplicate rows remove.

UNION ALL:

    Duplicate rows keep.

UNION ALL generally duplicate-removal ka extra work nahi karta.

---

# 43. CTE / WITH

Complex query ko readable banane ke liye:

    WITH high_salary AS (
        SELECT *
        FROM employees
        WHERE salary > 50000
    )
    SELECT *
    FROM high_salary;

---

# 44. DISTINCT COUNT

Unique departments count:

    SELECT COUNT(DISTINCT department)
    FROM employees;

---

# 45. SECOND HIGHEST SALARY

Common interview query:

    SELECT MAX(salary) AS second_highest
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    );

IMPORTANT:

Duplicate salary values aur NULLs ke case mein requirements ke according query adjust karni pad sakti hai.

---

# 46. SECOND HIGHEST DISTINCT SALARY

Another common approach:

    SELECT DISTINCT salary
    FROM employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1;

This syntax is commonly supported by MySQL/PostgreSQL/SQLite-style systems.

---

# 47. HIGHEST SALARY

    SELECT MAX(salary) AS highest_salary
    FROM employees;

---

# 48. LOWEST SALARY

    SELECT MIN(salary) AS lowest_salary
    FROM employees;

---

# 49. EMPLOYEE WITH HIGHEST SALARY

    SELECT *
    FROM employees
    WHERE salary = (
        SELECT MAX(salary)
        FROM employees
    );

Agar multiple employees ki same highest salary hai, multiple rows return ho sakti hain.

---

# 50. EMPLOYEE WITH SECOND HIGHEST SALARY

    SELECT *
    FROM employees
    WHERE salary = (
        SELECT MAX(salary)
        FROM employees
        WHERE salary < (
            SELECT MAX(salary)
            FROM employees
        )
    );

---

# 51. Nth HIGHEST SALARY

Window functions use karna robust approach hai.

Example:

    SELECT *
    FROM (
        SELECT
            e.*,
            DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
        FROM employees e
    ) x
    WHERE salary_rank = 3;

Yahan:

    salary_rank = 1 → Highest
    salary_rank = 2 → Second highest
    salary_rank = 3 → Third highest

DENSE_RANK same salary ko same rank deta hai.

---

# 52. DUPLICATE RECORDS

Duplicate email find karna:

    SELECT
        email,
        COUNT(*) AS total
    FROM users
    GROUP BY email
    HAVING COUNT(*) > 1;

---

# 53. REMOVE DUPLICATES

Duplicate delete karna database-specific aur potentially risky operation hai.

Safe approach:

    1. First duplicates identify karo.
    2. Backup/check karo.
    3. Unique identifier ke basis par rows select karo.
    4. Phir DELETE execute karo.

Direct DELETE blindly run nahi karna chahiye.

---

# 54. DEPARTMENT WITH HIGHEST AVERAGE SALARY

    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
    ORDER BY avg_salary DESC
    LIMIT 1;

---

# 55. DEPARTMENT WITH HIGHEST TOTAL SALARY

    SELECT
        department,
        SUM(salary) AS total_salary
    FROM employees
    GROUP BY department
    ORDER BY total_salary DESC
    LIMIT 1;

---

# 56. EMPLOYEES ABOVE AVERAGE SALARY

    SELECT *
    FROM employees
    WHERE salary > (
        SELECT AVG(salary)
        FROM employees
    );

---

# 57. EMPLOYEES BELOW AVERAGE SALARY

    SELECT *
    FROM employees
    WHERE salary < (
        SELECT AVG(salary)
        FROM employees
    );

---

# 58. DEPARTMENT-WISE EMPLOYEE COUNT

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department;

---

# 59. DEPARTMENT WITH MORE THAN 5 EMPLOYEES

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 5;

---

# 60. TOP 5 HIGHEST SALARIES

    SELECT *
    FROM employees
    ORDER BY salary DESC
    LIMIT 5;

---

# 61. TOP 5 LOWEST SALARIES

    SELECT *
    FROM employees
    ORDER BY salary ASC
    LIMIT 5;

---

# 62. EMPLOYEES WHOSE NAME STARTS WITH R

    SELECT *
    FROM employees
    WHERE name LIKE 'R%';

---

# 63. EMPLOYEES WHOSE NAME ENDS WITH N

    SELECT *
    FROM employees
    WHERE name LIKE '%n';

---

# 64. EMPLOYEES WHOSE NAME CONTAINS 'it'

    SELECT *
    FROM employees
    WHERE name LIKE '%it%';

---

# 65. EMPLOYEES BETWEEN AGE 20 AND 30

    SELECT *
    FROM employees
    WHERE age BETWEEN 20 AND 30;

---

# 66. EMPLOYEES NOT IN IT DEPARTMENT

    SELECT *
    FROM employees
    WHERE department <> 'IT';

OR:

    SELECT *
    FROM employees
    WHERE department != 'IT';

---

# 67. TOTAL ACTIVE USERS

    SELECT COUNT(*) AS active_users
    FROM users
    WHERE status = 'Active';

---

# 68. USERS WITH NO ORDERS

Using LEFT JOIN:

    SELECT
        u.id,
        u.name
    FROM users u
    LEFT JOIN orders o
    ON u.id = o.user_id
    WHERE o.id IS NULL;

---

# 69. USERS WITH AT LEAST ONE ORDER

    SELECT DISTINCT
        u.id,
        u.name
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id;

---

# 70. USER-WISE ORDER COUNT

    SELECT
        u.id,
        u.name,
        COUNT(o.id) AS total_orders
    FROM users u
    LEFT JOIN orders o
    ON u.id = o.user_id
    GROUP BY u.id, u.name;

---

# 71. USER-WISE TOTAL SPENDING

    SELECT
        u.id,
        u.name,
        COALESCE(SUM(o.amount), 0) AS total_spent
    FROM users u
    LEFT JOIN orders o
    ON u.id = o.user_id
    GROUP BY u.id, u.name;

---

# 72. TOP 5 USERS BY SPENDING

    SELECT
        u.id,
        u.name,
        SUM(o.amount) AS total_spent
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id
    GROUP BY u.id, u.name
    ORDER BY total_spent DESC
    LIMIT 5;

---

# 73. SQL QUERY WITH ALL COMMON CLAUSES

    SELECT
        department,
        COUNT(*) AS total_employees,
        AVG(salary) AS average_salary
    FROM employees
    WHERE salary > 30000
    GROUP BY department
    HAVING COUNT(*) > 2
    ORDER BY average_salary DESC
    LIMIT 5;

Query flow:

    FROM
       ↓
    WHERE
       ↓
    GROUP BY
       ↓
    HAVING
       ↓
    SELECT
       ↓
    ORDER BY
       ↓
    LIMIT

---

# 74. SQL QUERY WRITING ORDER

SQL query normally likhi jati hai:

    SELECT
    FROM
    JOIN
    ON
    WHERE
    GROUP BY
    HAVING
    ORDER BY
    LIMIT
    OFFSET

---

# 75. LOGICAL QUERY PROCESSING ORDER

Conceptually SQL engine query ko generally:

    FROM
       ↓
    JOIN
       ↓
    ON
       ↓
    WHERE
       ↓
    GROUP BY
       ↓
    HAVING
       ↓
    SELECT
       ↓
    DISTINCT
       ↓
    ORDER BY
       ↓
    LIMIT
       ↓
    OFFSET

ke flow mein process karta hai.

---

# 76. DDL QUERIES

DDL = Data Definition Language

Common commands:

    CREATE
    ALTER
    DROP
    TRUNCATE

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100)
    );

---

# 77. DML QUERIES

DML = Data Manipulation Language

Common commands:

    INSERT
    UPDATE
    DELETE

Examples:

    INSERT INTO users ...

    UPDATE users ...

    DELETE FROM users ...

---

# 78. DQL

DQL = Data Query Language

Commonly:

    SELECT

Example:

    SELECT *
    FROM users;

---

# 79. DCL

DCL = Data Control Language

Common commands:

    GRANT
    REVOKE

Example:

    GRANT SELECT
    ON employees
    TO user_name;

Exact syntax database-specific ho sakta hai.

---

# 80. TCL

TCL = Transaction Control Language

Common commands:

    COMMIT
    ROLLBACK
    SAVEPOINT

Example:

    START TRANSACTION;

    UPDATE employees
    SET salary = salary + 5000
    WHERE department = 'IT';

    COMMIT;

---

# ⭐ MOST IMPORTANT SQL INTERVIEW QUERIES

## 1. Highest Salary

    SELECT MAX(salary)
    FROM employees;

---

## 2. Second Highest Salary

    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    );

---

## 3. Average Salary

    SELECT AVG(salary)
    FROM employees;

---

## 4. Employees Above Average Salary

    SELECT *
    FROM employees
    WHERE salary > (
        SELECT AVG(salary)
        FROM employees
    );

---

## 5. Duplicate Emails

    SELECT email, COUNT(*)
    FROM users
    GROUP BY email
    HAVING COUNT(*) > 1;

---

## 6. Department-wise Count

    SELECT department, COUNT(*)
    FROM employees
    GROUP BY department;

---

## 7. Department-wise Maximum Salary

    SELECT
        department,
        MAX(salary)
    FROM employees
    GROUP BY department;

---

## 8. Top 5 Salaries

    SELECT *
    FROM employees
    ORDER BY salary DESC
    LIMIT 5;

---

## 9. Employees Starting with R

    SELECT *
    FROM employees
    WHERE name LIKE 'R%';

---

## 10. Users Without Orders

    SELECT u.*
    FROM users u
    LEFT JOIN orders o
    ON u.id = o.user_id
    WHERE o.id IS NULL;

---

# ⭐ COMMON SQL INTERVIEW QUESTIONS

## Q1. SQL Query kya hoti hai?

SQL Query database ko instruction deti hai jisse data retrieve, insert, update, delete ya manipulate kiya ja sakta hai.

---

## Q2. SELECT ka use?

Database se data retrieve karne ke liye.

---

## Q3. WHERE ka use?

Rows ko condition ke according filter karne ke liye.

---

## Q4. GROUP BY ka use?

Rows ko groups mein divide karne ke liye, commonly aggregate functions ke saath.

---

## Q5. HAVING ka use?

Grouped results ko filter karne ke liye.

---

## Q6. ORDER BY ka use?

Result ko sort karne ke liye.

---

## Q7. LIMIT ka use?

Result ki rows ko limit karne ke liye.

---

## Q8. JOIN ka use?

Multiple related tables ka data combine karne ke liye.

---

## Q9. Subquery kya hoti hai?

Ek SQL query ke andar another SQL query ko subquery kehte hain.

---

## Q10. UNION aur UNION ALL mein difference?

UNION duplicate rows remove karta hai.

UNION ALL duplicates ko retain karta hai.

---

## Q11. DELETE, TRUNCATE aur DROP mein difference?

DELETE:

    Selected rows delete.

TRUNCATE:

    Generally all rows remove.

DROP:

    Table structure + data remove.

---

## Q12. Primary Key ka use?

Table ki rows ko uniquely identify karne ke liye.

---

## Q13. Foreign Key ka use?

Tables ke beech relationship aur referential integrity maintain karne ke liye.

---

## Q14. WHERE aur HAVING mein difference?

WHERE rows filter karta hai.

HAVING groups filter karta hai.

---

## Q15. JOIN aur UNION mein difference?

JOIN:

    Columns/tables ko horizontally combine karta hai based on relationship.

UNION:

    Compatible SELECT results ko vertically combine karta hai.

---

# ⭐ QUICK REVISION

SELECT
→ Data retrieve

INSERT
→ New data add

UPDATE
→ Existing data modify

DELETE
→ Rows remove

CREATE
→ Object/table create

ALTER
→ Structure modify

DROP
→ Object remove

TRUNCATE
→ All table rows remove

WHERE
→ Rows filter

GROUP BY
→ Groups create

HAVING
→ Groups filter

ORDER BY
→ Sort

LIMIT
→ Rows limit

OFFSET
→ Rows skip

DISTINCT
→ Duplicate results remove

JOIN
→ Tables combine

ON
→ JOIN condition

UNION
→ Results combine, duplicates remove

UNION ALL
→ Results combine, duplicates retain

WITH
→ CTE

---

# ⭐ GOLDEN INTERVIEW RULES

1. SELECT data retrieve karta hai.

2. WHERE rows filter karta hai.

3. GROUP BY groups create karta hai.

4. HAVING groups filter karta hai.

5. ORDER BY result sort karta hai.

6. LIMIT result rows restrict karta hai.

7. JOIN related tables ko combine karta hai.

8. ON JOIN ki matching condition define karta hai.

9. COUNT() rows/values count karta hai.

10. SUM() total calculate karta hai.

11. AVG() average calculate karta hai.

12. MIN() minimum value return karta hai.

13. MAX() maximum value return karta hai.

14. UPDATE ke saath WHERE carefully use karo.

15. DELETE ke saath WHERE carefully use karo.

16. NULL ke liye `= NULL` nahi, `IS NULL` use karo.

17. Aggregate result ko filter karne ke liye commonly HAVING use hota hai.

18. UNION duplicates remove karta hai.

19. UNION ALL duplicates retain karta hai.

20. Subquery ek query ke andar another query hoti hai.

---

# ⭐ MOST IMPORTANT INTERVIEW QUERY

Question:

"Find the second highest salary."

Answer:

    SELECT MAX(salary) AS second_highest
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    );

---

# ⭐ MOST IMPORTANT JOIN QUERY

Question:

"Find each user's total order amount."

Answer:

    SELECT
        u.id,
        u.name,
        COALESCE(SUM(o.amount), 0) AS total_spent
    FROM users u
    LEFT JOIN orders o
    ON u.id = o.user_id
    GROUP BY u.id, u.name;

---

# ⭐ MOST IMPORTANT GROUP BY QUERY

Question:

"Find departments having more than 5 employees."

Answer:

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 5;

---

# ⭐ FINAL SQL QUERY CHEAT SHEET

    SELECT column1, column2
    FROM table_name
    JOIN another_table
    ON condition
    WHERE condition
    GROUP BY column
    HAVING aggregate_condition
    ORDER BY column DESC
    LIMIT number
    OFFSET number;

Remember:

    SELECT
    FROM
    JOIN
    ON
    WHERE
    GROUP BY
    HAVING
    ORDER BY
    LIMIT
    OFFSET

Ye SQL interviews ke liye sabse important query structure hai.