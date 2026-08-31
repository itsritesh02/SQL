# SQL CLAUSES — Complete Interview Notes

SQL Clauses ka use SQL query ke data ko filter, group, sort aur limit karne ke liye hota hai.

SQL mein commonly used clauses:

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. ORDER BY
6. LIMIT
7. OFFSET
8. DISTINCT
9. JOIN
10. ON
11. WITH

---

# 1. FROM CLAUSE

FROM clause batata hai ki data kis table se retrieve karna hai.

Syntax:

    SELECT column_name
    FROM table_name;

Example:

    SELECT *
    FROM employees;

Meaning:

employees table se data retrieve karo.

---

# 2. WHERE CLAUSE

WHERE clause rows ko condition ke according filter karta hai.

Syntax:

    SELECT *
    FROM employees
    WHERE condition;

Example:

    SELECT *
    FROM employees
    WHERE salary > 50000;

Sirf un employees ko return karega jinki salary 50000 se zyada hai.

---

# WHERE with AND

Dono conditions TRUE honi chahiye.

    SELECT *
    FROM employees
    WHERE age >= 18
    AND salary > 30000;

---

# WHERE with OR

At least ek condition TRUE honi chahiye.

    SELECT *
    FROM employees
    WHERE city = 'Delhi'
    OR city = 'Chandigarh';

---

# WHERE with IN

Multiple values check karne ke liye:

    SELECT *
    FROM employees
    WHERE city IN ('Delhi', 'Mumbai', 'Chandigarh');

---

# WHERE with BETWEEN

Range check karne ke liye:

    SELECT *
    FROM employees
    WHERE salary BETWEEN 30000 AND 60000;

BETWEEN generally dono boundary values ko include karta hai.

---

# WHERE with LIKE

Pattern matching:

    SELECT *
    FROM employees
    WHERE name LIKE 'R%';

R se start hone wale names.

---

# WHERE with NULL

NULL check:

    SELECT *
    FROM employees
    WHERE email IS NULL;

NOT NULL:

    SELECT *
    FROM employees
    WHERE email IS NOT NULL;

---

# 3. GROUP BY CLAUSE

GROUP BY same values ko groups mein divide karta hai.

Mostly aggregate functions ke saath use hota hai.

Aggregate Functions:

    COUNT()
    SUM()
    AVG()
    MIN()
    MAX()

Example:

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department;

Output:

    department | total_employees
    -----------|----------------
    IT         | 10
    HR         | 5
    Sales      | 8

---

# GROUP BY with SUM()

Department-wise total salary:

    SELECT
        department,
        SUM(salary) AS total_salary
    FROM employees
    GROUP BY department;

---

# GROUP BY with AVG()

Department-wise average salary:

    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department;

---

# GROUP BY with MAX()

Department-wise highest salary:

    SELECT
        department,
        MAX(salary) AS highest_salary
    FROM employees
    GROUP BY department;

---

# GROUP BY with MIN()

Department-wise lowest salary:

    SELECT
        department,
        MIN(salary) AS lowest_salary
    FROM employees
    GROUP BY department;

---

# GROUP BY Multiple Columns

Multiple columns ke according grouping:

    SELECT
        department,
        city,
        COUNT(*) AS total
    FROM employees
    GROUP BY department, city;

---

# 4. HAVING CLAUSE

HAVING grouped results ko filter karta hai.

HAVING mostly GROUP BY ke saath use hota hai.

Example:

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 5;

Meaning:

Sirf wahi departments return honge jahan employees 5 se zyada hain.

---

# HAVING with AVG()

    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 50000;

---

# WHERE vs HAVING

WHERE:

    Individual rows filter karta hai.

HAVING:

    Groups filter karta hai.

Example:

    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    WHERE salary > 30000
    GROUP BY department
    HAVING AVG(salary) > 50000;

Flow:

    WHERE
       ↓
    GROUP BY
       ↓
    HAVING

---

# 5. ORDER BY CLAUSE

ORDER BY result ko sort karne ke liye use hota hai.

Default sorting generally ASC hoti hai.

---

# ORDER BY ASC

Ascending order:

    SELECT *
    FROM employees
    ORDER BY salary ASC;

Meaning:

    Low → High

---

# ORDER BY DESC

Descending order:

    SELECT *
    FROM employees
    ORDER BY salary DESC;

Meaning:

    High → Low

---

# ORDER BY with Multiple Columns

    SELECT *
    FROM employees
    ORDER BY department ASC, salary DESC;

Pehle department sort hoga.

Same department ke andar salary descending sort hogi.

---

# ORDER BY Alias

    SELECT
        name,
        salary * 12 AS annual_salary
    FROM employees
    ORDER BY annual_salary DESC;

---

# 6. LIMIT CLAUSE

LIMIT result ki maximum rows specify karta hai.

Example:

    SELECT *
    FROM employees
    LIMIT 5;

Sirf first 5 rows return karega.

---

# LIMIT with ORDER BY

Top 5 highest salaries:

    SELECT *
    FROM employees
    ORDER BY salary DESC
    LIMIT 5;

---

# 7. OFFSET CLAUSE

OFFSET starting ki kuch rows skip karta hai.

Example:

    SELECT *
    FROM employees
    LIMIT 5 OFFSET 10;

Meaning:

    First 10 rows skip
    Next 5 rows return

---

# LIMIT + OFFSET — Pagination

Pagination ke liye commonly use hota hai.

Page 1:

    SELECT *
    FROM employees
    LIMIT 10 OFFSET 0;

Page 2:

    SELECT *
    FROM employees
    LIMIT 10 OFFSET 10;

Page 3:

    SELECT *
    FROM employees
    LIMIT 10 OFFSET 20;

Formula:

    OFFSET = (page_number - 1) * page_size

---

# 8. DISTINCT

DISTINCT duplicate values remove karta hai.

Example:

    SELECT DISTINCT city
    FROM employees;

Agar cities:

    Delhi
    Delhi
    Mumbai
    Mumbai
    Chandigarh

Result:

    Delhi
    Mumbai
    Chandigarh

---

# DISTINCT with Multiple Columns

    SELECT DISTINCT city, department
    FROM employees;

Yahan unique combination return hoga:

    city + department

---

# 9. JOIN CLAUSE

JOIN multiple tables ke related data ko combine karta hai.

Common JOIN types:

    INNER JOIN
    LEFT JOIN
    RIGHT JOIN
    FULL OUTER JOIN

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
        u.name,
        o.amount
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id;

---

# INNER JOIN

Sirf matching records return karta hai.

    SELECT *
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id;

---

# LEFT JOIN

Left table ke saare records return karta hai.

    SELECT *
    FROM users u
    LEFT JOIN orders o
    ON u.id = o.user_id;

Agar matching order nahi hai:

    order columns = NULL

---

# RIGHT JOIN

Right table ke saare records return karta hai.

    SELECT *
    FROM users u
    RIGHT JOIN orders o
    ON u.id = o.user_id;

---

# FULL OUTER JOIN

Dono tables ke all records return karta hai.

    SELECT *
    FROM users u
    FULL OUTER JOIN orders o
    ON u.id = o.user_id;

IMPORTANT:

MySQL mein FULL OUTER JOIN directly supported nahi hai. MySQL mein ise commonly LEFT JOIN + RIGHT JOIN + UNION se simulate kiya jata hai.

---

# 10. ON CLAUSE

ON clause JOIN ki matching condition define karta hai.

Example:

    SELECT *
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id;

Yahan:

    u.id = o.user_id

JOIN condition hai.

---

# ON vs WHERE

ON:

    Tables ko join karte waqt matching condition define karta hai.

WHERE:

    Final/combined rows ko filter karta hai.

Example:

    SELECT
        u.name,
        o.amount
    FROM users u
    LEFT JOIN orders o
    ON u.id = o.user_id
    WHERE o.amount > 1000;

---

# 11. WITH CLAUSE

WITH Common Table Expression (CTE) create karne ke liye use hota hai.

Complex queries ko readable banane ke liye useful hai.

Example:

    WITH high_salary AS (
        SELECT *
        FROM employees
        WHERE salary > 50000
    )
    SELECT *
    FROM high_salary;

Yahan:

    high_salary

ek temporary named result set/CTE hai jo query ke scope mein use hota hai.

---

# WITH + Aggregate

Example:

    WITH department_salary AS (
        SELECT
            department,
            AVG(salary) AS average_salary
        FROM employees
        GROUP BY department
    )
    SELECT *
    FROM department_salary
    WHERE average_salary > 50000;

---

# 12. CLAUSES IN A SELECT QUERY

Common SELECT query:

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    WHERE salary > 30000
    GROUP BY department
    HAVING COUNT(*) > 5
    ORDER BY total_employees DESC
    LIMIT 10;

Is query mein:

    FROM
    WHERE
    GROUP BY
    HAVING
    ORDER BY
    LIMIT

clauses use hui hain.

---

# 13. SQL QUERY WRITING ORDER

SQL query normally is order mein likhi jati hai:

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

Example:

    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    WHERE age >= 18
    GROUP BY department
    HAVING AVG(salary) > 40000
    ORDER BY avg_salary DESC
    LIMIT 5;

---

# 14. LOGICAL QUERY PROCESSING ORDER

SQL query logically generally is order mein process hoti hai:

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

IMPORTANT:

Query likhne ka order aur logical processing order different ho sakta hai.

---

# 15. WHERE vs GROUP BY vs HAVING

WHERE:

    Rows filter

GROUP BY:

    Rows ko groups mein divide

HAVING:

    Groups filter

Example:

    SELECT
        department,
        COUNT(*) AS total
    FROM employees
    WHERE salary > 30000
    GROUP BY department
    HAVING COUNT(*) > 5;

Process:

    Employees
        ↓
    salary > 30000
        ↓
    Group by department
        ↓
    Groups having count > 5

---

# 16. ORDER BY vs GROUP BY

GROUP BY:

    Similar rows ko group karta hai.

ORDER BY:

    Result ko sort karta hai.

Example:

    SELECT
        department,
        COUNT(*) AS total
    FROM employees
    GROUP BY department
    ORDER BY total DESC;

Pehle groups banenge.

Phir result sort hoga.

---

# 17. WHERE vs ORDER BY

WHERE:

    Data filter karta hai.

ORDER BY:

    Data sort karta hai.

Example:

    SELECT *
    FROM employees
    WHERE salary > 30000
    ORDER BY salary DESC;

Pehle matching rows filter hongi.

Phir salary ke according descending sort hongi.

---

# 18. GROUP BY vs DISTINCT

DISTINCT:

    Duplicate result values remove karta hai.

GROUP BY:

    Rows ko groups mein divide karta hai aur aggregate calculations ke saath commonly use hota hai.

Example DISTINCT:

    SELECT DISTINCT department
    FROM employees;

Example GROUP BY:

    SELECT
        department,
        COUNT(*)
    FROM employees
    GROUP BY department;

---

# 19. HAVING vs WHERE

Incorrect for aggregate filtering:

    SELECT department, COUNT(*)
    FROM employees
    WHERE COUNT(*) > 5
    GROUP BY department;

Correct:

    SELECT department, COUNT(*)
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 5;

---

# 20. JOIN + WHERE Example

    SELECT
        u.name,
        o.amount
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id
    WHERE o.amount > 1000;

Meaning:

Users aur orders ko join karo.

Phir amount 1000 se zyada wale orders return karo.

---

# 21. JOIN + GROUP BY Example

User-wise total order amount:

    SELECT
        u.id,
        u.name,
        SUM(o.amount) AS total_spent
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id
    GROUP BY u.id, u.name;

---

# 22. JOIN + GROUP BY + HAVING

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

# 23. JOIN + ORDER BY + LIMIT

Top 5 users by spending:

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

# 24. REAL-WORLD E-COMMERCE EXAMPLE

Products table:

    id
    name
    price
    category
    stock

Top 5 expensive products:

    SELECT *
    FROM products
    ORDER BY price DESC
    LIMIT 5;

---

# Products with stock

    SELECT *
    FROM products
    WHERE stock > 0;

---

# Category-wise product count

    SELECT
        category,
        COUNT(*) AS total_products
    FROM products
    GROUP BY category;

---

# Categories having more than 10 products

    SELECT
        category,
        COUNT(*) AS total_products
    FROM products
    GROUP BY category
    HAVING COUNT(*) > 10;

---

# Category-wise average price

    SELECT
        category,
        AVG(price) AS average_price
    FROM products
    GROUP BY category;

---

# Highest price per category

    SELECT
        category,
        MAX(price) AS highest_price
    FROM products
    GROUP BY category;

---

# 25. IMPORTANT CLAUSES SUMMARY

| Clause | Purpose |
|--------|---------|
| FROM | Data source/table |
| WHERE | Filter rows |
| GROUP BY | Create groups |
| HAVING | Filter groups |
| ORDER BY | Sort results |
| LIMIT | Limit rows |
| OFFSET | Skip rows |
| DISTINCT | Remove duplicate results |
| JOIN | Combine tables |
| ON | JOIN condition |
| WITH | Create CTE |

---

# 26. INTERVIEW QUESTIONS

## Q1. SQL Clause kya hota hai?

SQL Clause query ka specific part hota hai jo data ko retrieve, filter, group, sort ya limit karne ka kaam karta hai.

---

## Q2. SQL ke important clauses kaun se hain?

Important clauses:

    FROM
    WHERE
    GROUP BY
    HAVING
    ORDER BY
    LIMIT
    OFFSET
    JOIN
    ON
    WITH

---

## Q3. FROM clause ka use?

FROM batata hai ki data kis table/source se lena hai.

---

## Q4. WHERE clause ka use?

WHERE rows ko condition ke according filter karta hai.

---

## Q5. GROUP BY ka use?

Similar values ko groups mein divide karta hai, commonly aggregate functions ke saath.

---

## Q6. HAVING ka use?

HAVING grouped results ko filter karta hai.

---

## Q7. WHERE aur HAVING mein difference?

WHERE rows ko filter karta hai.

HAVING groups ko filter karta hai.

---

## Q8. ORDER BY ka use?

Result ko ascending ya descending order mein sort karta hai.

---

## Q9. LIMIT ka use?

Result ki rows ko limit karta hai.

---

## Q10. OFFSET ka use?

Starting ki specified rows skip karta hai.

---

## Q11. DISTINCT kya karta hai?

Duplicate result values ko remove karta hai.

---

## Q12. JOIN kya karta hai?

Related data ko multiple tables se combine karta hai.

---

## Q13. ON clause kya karta hai?

JOIN ke liye matching condition define karta hai.

---

## Q14. WITH clause kya hai?

WITH Common Table Expression (CTE) define karne ke liye use hota hai.

---

## Q15. GROUP BY aur ORDER BY mein difference?

GROUP BY:

    Data ko groups mein divide karta hai.

ORDER BY:

    Result ko sort karta hai.

---

## Q16. DISTINCT aur GROUP BY mein difference?

DISTINCT duplicate result values remove karta hai.

GROUP BY groups create karta hai aur aggregate calculations ke liye commonly use hota hai.

---

## Q17. LIMIT aur OFFSET ka use kaha hota hai?

LIMIT result rows ko restrict karta hai.

OFFSET starting rows ko skip karta hai.

Dono pagination mein commonly use hote hain.

---

## Q18. SQL query ka logical processing order kya hai?

Generally:

    FROM
    JOIN
    ON
    WHERE
    GROUP BY
    HAVING
    SELECT
    DISTINCT
    ORDER BY
    LIMIT
    OFFSET

---

# ⭐ QUICK REVISION

FROM
→ Data source

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
→ Duplicate values remove

JOIN
→ Tables combine

ON
→ JOIN condition

WITH
→ CTE

---

# ⭐ ONE-LINE INTERVIEW REVISION

1. FROM defines the source of data.

2. WHERE filters rows.

3. GROUP BY creates groups.

4. HAVING filters groups.

5. ORDER BY sorts the result.

6. LIMIT restricts the number of rows.

7. OFFSET skips rows.

8. DISTINCT removes duplicate result values.

9. JOIN combines related data from multiple tables.

10. ON defines the JOIN condition.

11. WITH defines a Common Table Expression.

12. WHERE is generally applied before GROUP BY.

13. HAVING is generally applied after GROUP BY.

14. ORDER BY is used for sorting.

15. LIMIT and OFFSET are commonly used for pagination.

16. GROUP BY is commonly used with aggregate functions.

17. HAVING is commonly used with aggregate conditions.

18. DISTINCT is useful when only unique result values are required.

---

# ⭐ MOST IMPORTANT INTERVIEW ANSWER

If interviewer asks:

"What are SQL Clauses?"

Answer:

SQL Clauses are parts of a SQL query that are used to perform specific operations such as selecting data, filtering rows, grouping records, filtering groups, sorting results and limiting output.

Common clauses are FROM, WHERE, GROUP BY, HAVING, ORDER BY, LIMIT, OFFSET, JOIN, ON and WITH.

Example:

    SELECT
        department,
        COUNT(*) AS total_employees,
        AVG(salary) AS average_salary
    FROM employees
    WHERE salary > 30000
    GROUP BY department
    HAVING COUNT(*) > 5
    ORDER BY average_salary DESC
    LIMIT 5;

Here:

    FROM   → Data source
    WHERE  → Row filtering
    GROUP BY → Grouping
    HAVING → Group filtering
    ORDER BY → Sorting
    LIMIT → Result limitation