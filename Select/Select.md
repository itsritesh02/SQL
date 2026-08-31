# SQL SELECT — Complete Interview Notes

SELECT SQL ka sabse important command hai.

SELECT ka use database table se data retrieve/read/fetch karne ke liye hota hai.

Basic Syntax:

    SELECT column_name
    FROM table_name;

Example:

    SELECT name
    FROM users;

---

# 1. SELECT *

Table ke saare columns retrieve karne ke liye:

    SELECT *
    FROM users;

Example Table:

    id | name   | age | city
    ---|--------|-----|-----------
    1  | Ritesh | 22  | Chandigarh
    2  | Rahul  | 25  | Delhi

Query:

    SELECT *
    FROM users;

Output:

    id | name   | age | city
    ---|--------|-----|-----------
    1  | Ritesh | 22  | Chandigarh
    2  | Rahul  | 25  | Delhi

---

# 2. SELECT Specific Columns

Sirf required columns retrieve karne ke liye:

    SELECT name, email
    FROM users;

Multiple columns comma se separate karte hain.

Example:

    SELECT id, name, age
    FROM users;

---

# 3. SELECT Single Column

    SELECT name
    FROM users;

---

# 4. SELECT with WHERE

WHERE ka use records filter karne ke liye hota hai.

Example:

    SELECT *
    FROM users
    WHERE age > 18;

Sirf un users ko return karega jinki age 18 se greater hai.

---

# 5. SELECT with Comparison Operators

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
    WHERE age != 22;

    SELECT *
    FROM users
    WHERE age >= 18;

    SELECT *
    FROM users
    WHERE age < 30;

---

# 6. SELECT with AND

Multiple conditions ko combine karne ke liye AND.

    SELECT *
    FROM users
    WHERE age >= 18
    AND city = 'Chandigarh';

Dono conditions TRUE honi chahiye.

---

# 7. SELECT with OR

Agar conditions mein se koi ek TRUE ho.

    SELECT *
    FROM users
    WHERE city = 'Chandigarh'
    OR city = 'Delhi';

---

# 8. SELECT with NOT

Condition ko reverse karta hai.

    SELECT *
    FROM users
    WHERE NOT city = 'Delhi';

---

# 9. SELECT with BETWEEN

Range ke andar values find karne ke liye.

    SELECT *
    FROM users
    WHERE age BETWEEN 18 AND 30;

BETWEEN generally boundary values ko include karta hai.

18 aur 30 bhi result mein aa sakte hain.

---

# 10. SELECT with IN

Multiple values match karne ke liye.

    SELECT *
    FROM users
    WHERE city IN ('Delhi', 'Chandigarh', 'Mumbai');

Ye multiple OR conditions ka short form hai.

Equivalent:

    WHERE city = 'Delhi'
    OR city = 'Chandigarh'
    OR city = 'Mumbai';

---

# 11. SELECT with NOT IN

Specified values ko exclude karne ke liye.

    SELECT *
    FROM users
    WHERE city NOT IN ('Delhi', 'Mumbai');

---

# 12. SELECT with LIKE

Pattern matching ke liye LIKE use hota hai.

---

## Starts With

    SELECT *
    FROM users
    WHERE name LIKE 'R%';

Meaning:

R se start hone wale names.

Examples:

    Ritesh
    Rahul
    Raj

---

## Ends With

    SELECT *
    FROM users
    WHERE name LIKE '%h';

Meaning:

h se end hone wale names.

---

## Contains

    SELECT *
    FROM users
    WHERE name LIKE '%it%';

Meaning:

Name ke andar "it" kahin bhi ho.

---

# 13. LIKE Wildcards

## %

% zero ya multiple characters represent karta hai.

Examples:

    'R%'

R se start.

    '%h'

h se end.

    '%it%'

it contain karta hai.

---

## _

Underscore exactly one character represent karta hai.

Example:

    SELECT *
    FROM users
    WHERE name LIKE 'R_tesh';

_ ek character represent karega.

---

# 14. SELECT DISTINCT

Duplicate values ko remove karke unique values return karta hai.

Example:

    SELECT DISTINCT city
    FROM users;

Agar city:

    Delhi
    Delhi
    Chandigarh
    Mumbai
    Mumbai

Output:

    Delhi
    Chandigarh
    Mumbai

---

# 15. SELECT with ORDER BY

Data ko sort karne ke liye ORDER BY.

## Ascending

    SELECT *
    FROM users
    ORDER BY age ASC;

ASC:

    Small → Large
    A → Z

---

## Descending

    SELECT *
    FROM users
    ORDER BY age DESC;

DESC:

    Large → Small
    Z → A

---

# 16. ORDER BY Multiple Columns

Multiple columns ke according sort kar sakte hain.

    SELECT *
    FROM users
    ORDER BY city ASC, age DESC;

Pehle city ascending sort hoga.

Same city ke andar age descending sort hogi.

---

# 17. SELECT with LIMIT

Result ki rows limit karne ke liye.

    SELECT *
    FROM users
    LIMIT 5;

Sirf first 5 rows return karega.

---

# 18. LIMIT with OFFSET

Rows skip karke data retrieve kar sakte hain.

    SELECT *
    FROM users
    LIMIT 5 OFFSET 10;

Meaning:

    10 rows skip
    Next 5 rows return

---

# 19. SELECT with Alias — AS

Column ko temporary/custom name dene ke liye AS.

    SELECT name AS username
    FROM users;

Output column:

    username

---

## Table Alias

    SELECT u.name, u.email
    FROM users AS u;

Yahan:

    u → users table ka alias

---

# 20. SELECT with Calculations

SELECT ke andar calculations bhi kar sakte hain.

Example:

    SELECT price, quantity,
           price * quantity AS total
    FROM products;

Example:

    price = 500
    quantity = 2

Output:

    total = 1000

---

# 21. SELECT Arithmetic Operators

Common operators:

    +
    -
    *
    /
    %

Example:

    SELECT price + 100 AS new_price
    FROM products;

    SELECT price * 2 AS double_price
    FROM products;

    SELECT price / 2 AS half_price
    FROM products;

---

# 22. SELECT with Aggregate Functions

Important aggregate functions:

    COUNT()
    SUM()
    AVG()
    MIN()
    MAX()

---

# 23. COUNT()

Rows count karne ke liye.

    SELECT COUNT(*)
    FROM users;

---

## COUNT(column)

    SELECT COUNT(email)
    FROM users;

COUNT(column) generally NULL values ko count nahi karta.

---

# 24. SUM()

Total calculate karne ke liye.

    SELECT SUM(salary)
    FROM employees;

---

# 25. AVG()

Average calculate karne ke liye.

    SELECT AVG(salary)
    FROM employees;

---

# 26. MIN()

Minimum value.

    SELECT MIN(salary)
    FROM employees;

---

# 27. MAX()

Maximum value.

    SELECT MAX(salary)
    FROM employees;

---

# 28. SELECT with GROUP BY

Similar records ko groups mein divide karne ke liye.

Example:

    SELECT city, COUNT(*) AS total_users
    FROM users
    GROUP BY city;

Output:

    city          | total_users
    --------------|------------
    Chandigarh    | 10
    Delhi         | 15
    Mumbai        | 8

---

# 29. SELECT with HAVING

GROUP BY ke baad groups ko filter karne ke liye.

Example:

    SELECT city, COUNT(*) AS total_users
    FROM users
    GROUP BY city
    HAVING COUNT(*) > 5;

Sirf wahi cities return hongi jahan users 5 se zyada hain.

---

# 30. WHERE vs HAVING

WHERE:

    Rows filter karta hai.

HAVING:

    Groups filter karta hai.

Example:

    SELECT city, COUNT(*) AS total
    FROM users
    WHERE age >= 18
    GROUP BY city
    HAVING COUNT(*) > 5;

Processing concept:

    WHERE
       ↓
    GROUP BY
       ↓
    HAVING

---

# 31. SELECT with NULL

NULL check karne ke liye:

    SELECT *
    FROM users
    WHERE email IS NULL;

NOT NULL:

    SELECT *
    FROM users
    WHERE email IS NOT NULL;

Wrong:

    WHERE email = NULL

Correct:

    WHERE email IS NULL

---

# 32. COALESCE()

NULL value ke replacement ke liye.

    SELECT
        name,
        COALESCE(phone, 'Not Available') AS phone
    FROM users;

Agar phone NULL hai:

    Not Available

return hoga.

---

# 33. CASE

Conditional logic ke liye CASE use hota hai.

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

# 34. Multiple WHEN

    SELECT
        name,
        age,
        CASE
            WHEN age < 18 THEN 'Minor'
            WHEN age BETWEEN 18 AND 60 THEN 'Adult'
            ELSE 'Senior'
        END AS category
    FROM users;

---

# 35. SELECT with JOIN

Multiple tables se data retrieve karne ke liye JOIN use hota hai.

Example:

Users:

    id
    name

Orders:

    id
    user_id
    amount

Query:

    SELECT
        users.name,
        orders.amount
    FROM users
    INNER JOIN orders
    ON users.id = orders.user_id;

---

# 36. INNER JOIN with Alias

Better readable query:

    SELECT
        u.name,
        o.amount
    FROM users AS u
    INNER JOIN orders AS o
    ON u.id = o.user_id;

---

# 37. LEFT JOIN

Left table ke saare records return karta hai.

    SELECT
        u.name,
        o.amount
    FROM users AS u
    LEFT JOIN orders AS o
    ON u.id = o.user_id;

Agar user ka order nahi hai:

    o.amount → NULL

---

# 38. RIGHT JOIN

Right table ke saare records return karta hai.

    SELECT
        u.name,
        o.amount
    FROM users AS u
    RIGHT JOIN orders AS o
    ON u.id = o.user_id;

---

# 39. SELECT with Subquery

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

# 40. IN with Subquery

    SELECT *
    FROM employees
    WHERE department_id IN (
        SELECT id
        FROM departments
        WHERE location = 'Delhi'
    );

---

# 41. EXISTS

Check karta hai ki subquery at least one row return karti hai ya nahi.

Example:

    SELECT *
    FROM users u
    WHERE EXISTS (
        SELECT 1
        FROM orders o
        WHERE o.user_id = u.id
    );

Meaning:

Sirf wahi users jinke orders exist karte hain.

---

# 42. NOT EXISTS

Jo related record exist nahi karta.

    SELECT *
    FROM users u
    WHERE NOT EXISTS (
        SELECT 1
        FROM orders o
        WHERE o.user_id = u.id
    );

Meaning:

Un users ko return karega jinke orders nahi hain.

---

# 43. UNION

Do SELECT queries ke results combine karta hai.

Example:

    SELECT name
    FROM employees

    UNION

    SELECT name
    FROM managers;

UNION duplicate rows remove karta hai.

Important:

Dono SELECT queries mein compatible number/type of columns hone chahiye.

---

# 44. UNION ALL

Do SELECT results combine karta hai aur duplicates bhi retain karta hai.

    SELECT name
    FROM employees

    UNION ALL

    SELECT name
    FROM managers;

Difference:

    UNION
    → Duplicates remove

    UNION ALL
    → Duplicates retain

---

# 45. SELECT with DISTINCT and Multiple Columns

    SELECT DISTINCT city, department
    FROM employees;

Yahan unique combination:

    city + department

return hoga.

---

# 46. SELECT with Date

Example:

    SELECT *
    FROM users
    WHERE dob = '2003-12-29';

---

# 47. SELECT with Date Range

    SELECT *
    FROM orders
    WHERE order_date BETWEEN '2026-01-01' AND '2026-01-31';

---

# 48. SELECT with Current Date

MySQL:

    SELECT CURDATE();

Current date return karta hai.

---

# 49. SELECT with Current Date and Time

    SELECT NOW();

Current date + time return karta hai.

---

# 50. SELECT String Functions

Common string functions:

    UPPER()
    LOWER()
    LENGTH()
    CONCAT()
    SUBSTRING()
    TRIM()

---

## UPPER()

    SELECT UPPER(name)
    FROM users;

---

## LOWER()

    SELECT LOWER(name)
    FROM users;

---

## LENGTH()

    SELECT LENGTH(name)
    FROM users;

---

## CONCAT()

    SELECT CONCAT(first_name, ' ', last_name) AS full_name
    FROM users;

---

# 51. SELECT Numeric Functions

Common functions:

    ROUND()
    CEIL()
    FLOOR()
    ABS()

Example:

    SELECT ROUND(price, 2)
    FROM products;

---

# 52. SELECT with DISTINCT Count

Unique cities count:

    SELECT COUNT(DISTINCT city)
    FROM users;

---

# 53. Second Highest Salary

One common interview query:

    SELECT MAX(salary) AS second_highest
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    );

---

# 54. Highest Salary

    SELECT MAX(salary)
    FROM employees;

---

# 55. Employees with Highest Salary

    SELECT *
    FROM employees
    WHERE salary = (
        SELECT MAX(salary)
        FROM employees
    );

---

# 56. Find Duplicate Emails

    SELECT email, COUNT(*) AS total
    FROM users
    GROUP BY email
    HAVING COUNT(*) > 1;

---

# 57. Find Users from Chandigarh

    SELECT *
    FROM users
    WHERE city = 'Chandigarh';

---

# 58. Find Users Older Than 25

    SELECT *
    FROM users
    WHERE age > 25;

---

# 59. Find Top 5 Highest Salaries

    SELECT *
    FROM employees
    ORDER BY salary DESC
    LIMIT 5;

---

# 60. Find Top 3 Products by Price

    SELECT *
    FROM products
    ORDER BY price DESC
    LIMIT 3;

---

# 61. Find Number of Users in Each City

    SELECT city, COUNT(*) AS total
    FROM users
    GROUP BY city;

---

# 62. Cities Having More Than 10 Users

    SELECT city, COUNT(*) AS total
    FROM users
    GROUP BY city
    HAVING COUNT(*) > 10;

---

# 63. SQL SELECT Clause Order

Basic query:

    SELECT
        columns
    FROM
        table
    WHERE
        condition
    GROUP BY
        columns
    HAVING
        condition
    ORDER BY
        columns
    LIMIT
        number;

Example:

    SELECT city, COUNT(*) AS total
    FROM users
    WHERE age >= 18
    GROUP BY city
    HAVING COUNT(*) > 5
    ORDER BY total DESC
    LIMIT 10;

---

# 64. Logical Query Processing Order

SQL query ko logically generally is order mein process kiya jata hai:

    FROM
    JOIN
    WHERE
    GROUP BY
    HAVING
    SELECT
    DISTINCT
    ORDER BY
    LIMIT

IMPORTANT:

Query likhne ka order aur logical processing order different hota hai.

---

# 65. SELECT Query Examples

## Example 1 — All Users

    SELECT *
    FROM users;

---

## Example 2 — Specific Columns

    SELECT name, email
    FROM users;

---

## Example 3 — Filter

    SELECT *
    FROM users
    WHERE age >= 18;

---

## Example 4 — Sort

    SELECT *
    FROM users
    ORDER BY age DESC;

---

## Example 5 — Top Records

    SELECT *
    FROM users
    ORDER BY age DESC
    LIMIT 5;

---

## Example 6 — Unique Cities

    SELECT DISTINCT city
    FROM users;

---

## Example 7 — Count Users

    SELECT COUNT(*)
    FROM users;

---

## Example 8 — Group Users

    SELECT city, COUNT(*) AS total
    FROM users
    GROUP BY city;

---

## Example 9 — Filter Groups

    SELECT city, COUNT(*) AS total
    FROM users
    GROUP BY city
    HAVING COUNT(*) > 5;

---

## Example 10 — Join

    SELECT
        u.name,
        o.amount
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id;

---

# 66. SELECT — Interview Questions

## Q1. SELECT command kya hai?

SELECT SQL command database se data retrieve/read karne ke liye use hota hai.

---

## Q2. SELECT * kya karta hai?

Table ke saare columns retrieve karta hai.

---

## Q3. SELECT specific columns kaise karte hain?

    SELECT name, email
    FROM users;

---

## Q4. WHERE ka use kya hai?

WHERE rows ko condition ke according filter karta hai.

---

## Q5. DISTINCT kya karta hai?

Duplicate result values ko remove karta hai.

---

## Q6. ORDER BY kya karta hai?

Result ko ascending ya descending order mein sort karta hai.

---

## Q7. LIMIT kya karta hai?

Result mein maximum rows ki number limit karta hai.

---

## Q8. OFFSET kya karta hai?

Result ki starting mein specified number of rows skip karta hai.

---

## Q9. WHERE aur HAVING mein difference?

WHERE individual rows ko filter karta hai.

HAVING grouped results ko filter karta hai.

---

## Q10. GROUP BY ka use?

Similar values ko groups mein divide karke aggregate calculations karne ke liye.

---

## Q11. COUNT(*) aur COUNT(column) mein difference?

COUNT(*) rows count karta hai.

COUNT(column) NULL values ko generally count nahi karta.

---

## Q12. LIKE kya hai?

LIKE pattern matching ke liye use hota hai.

---

## Q13. % wildcard kya karta hai?

Zero ya multiple characters match karta hai.

---

## Q14. _ wildcard kya karta hai?

Exactly one character match karta hai.

---

## Q15. NULL ko SELECT mein kaise check karte hain?

    WHERE column IS NULL

---

## Q16. UNION aur UNION ALL mein difference?

UNION duplicates remove karta hai.

UNION ALL duplicates retain karta hai.

---

## Q17. Alias kya hota hai?

Column ya table ko query ke result/query ke scope mein temporary name dena.

Example:

    SELECT name AS username
    FROM users;

---

## Q18. Aggregate functions kya hain?

Common aggregate functions:

    COUNT()
    SUM()
    AVG()
    MIN()
    MAX()

---

## Q19. Subquery kya hai?

Ek SQL query ke andar doosri SQL query ko subquery kehte hain.

---

## Q20. EXISTS kya karta hai?

Check karta hai ki subquery se at least ek matching row exist karti hai ya nahi.

---

# ⭐ SELECT QUICK REVISION

SELECT
→ Data retrieve

FROM
→ Table/source

WHERE
→ Rows filter

DISTINCT
→ Duplicate results remove

ORDER BY
→ Sort

ASC
→ Ascending

DESC
→ Descending

LIMIT
→ Rows limit

OFFSET
→ Rows skip

GROUP BY
→ Groups create

HAVING
→ Groups filter

COUNT()
→ Count

SUM()
→ Total

AVG()
→ Average

MIN()
→ Minimum

MAX()
→ Maximum

JOIN
→ Tables combine

LIKE
→ Pattern matching

IN
→ Multiple values match

BETWEEN
→ Range

IS NULL
→ NULL check

CASE
→ Conditional logic

COALESCE
→ NULL replacement

UNION
→ Results combine + duplicates remove

UNION ALL
→ Results combine + duplicates retain

EXISTS
→ Matching row existence check

---

# ⭐ MOST IMPORTANT SELECT INTERVIEW ONE-LINERS

1. SELECT is used to retrieve data from a database.

2. SELECT * returns all columns from the selected table.

3. WHERE filters individual rows.

4. DISTINCT removes duplicate values from the result.

5. ORDER BY sorts query results.

6. ASC means ascending order.

7. DESC means descending order.

8. LIMIT restricts the number of returned rows.

9. OFFSET skips a specified number of rows.

10. GROUP BY groups rows having the same values.

11. HAVING filters grouped results.

12. COUNT(*) counts rows.

13. COUNT(column) generally ignores NULL values.

14. SUM() calculates the total.

15. AVG() calculates the average.

16. MIN() returns the minimum value.

17. MAX() returns the maximum value.

18. LIKE is used for pattern matching.

19. % matches zero or more characters.

20. _ matches exactly one character.

21. BETWEEN generally includes both boundary values.

22. IN checks whether a value matches any value in a list.

23. IS NULL is used to check NULL values.

24. JOIN combines related data from multiple tables.

25. UNION removes duplicate rows.

26. UNION ALL keeps duplicate rows.

27. CASE is used for conditional logic.

28. COALESCE can return a fallback value when an expression is NULL.

29. A subquery is a query inside another query.

30. EXISTS checks whether the subquery returns at least one row.

---

# ⭐ MOST IMPORTANT INTERVIEW ANSWER

If interviewer asks:

"What is SELECT in SQL?"

Answer:

SELECT is the most commonly used SQL command for retrieving data from database tables.

It can be used with clauses such as WHERE, GROUP BY, HAVING, ORDER BY and LIMIT to filter, group, sort and restrict the result.

Example:

    SELECT city, COUNT(*) AS total_users
    FROM users
    WHERE age >= 18
    GROUP BY city
    HAVING COUNT(*) > 5
    ORDER BY total_users DESC
    LIMIT 10;

This query first filters users based on age, groups them by city, filters groups having more than 5 users, sorts the result in descending order and finally returns the top 10 results.