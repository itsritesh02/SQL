# SQL AGGREGATE FUNCTIONS — Complete Interview Notes

Aggregate Functions multiple rows ke data par calculation perform karke generally ek single result return karti hain.

Aggregate Functions ka use:

- Total calculate karne ke liye
- Average find karne ke liye
- Minimum/maximum value find karne ke liye
- Rows count karne ke liye
- Groups ke upar calculations karne ke liye

---

# MAIN AGGREGATE FUNCTIONS

SQL mein commonly ye Aggregate Functions use hoti hain:

1. COUNT()
2. SUM()
3. AVG()
4. MIN()
5. MAX()

---

# Example Table

Employees:

    id | name   | age | salary | department
    ---|--------|-----|--------|------------
    1  | Ritesh | 22  | 30000  | IT
    2  | Rahul  | 25  | 40000  | IT
    3  | Aman   | 28  | 50000  | HR
    4  | Rohit  | 30  | 60000  | HR
    5  | Sumit  | 24  | 35000  | IT

---

# 1. COUNT()

COUNT() rows ki number count karta hai.

Basic Syntax:

    SELECT COUNT(*)
    FROM employees;

Output:

    5

---

# COUNT(*)

COUNT(*) table ki rows count karta hai.

    SELECT COUNT(*)
    FROM employees;

Agar table mein 5 rows hain:

    Result = 5

COUNT(*) rows ko count karta hai, NULL columns ki wajah se row ko skip nahi karta.

---

# COUNT(column)

COUNT(column) specified column ki non-NULL values count karta hai.

Example:

    SELECT COUNT(salary)
    FROM employees;

Agar salary mein NULL values hain, to COUNT(salary) un NULL values ko count nahi karega.

---

# COUNT(DISTINCT column)

Unique values count karne ke liye:

    SELECT COUNT(DISTINCT department)
    FROM employees;

Agar departments:

    IT
    IT
    HR
    HR
    IT

Output:

    2

---

# 2. SUM()

SUM() numeric values ka total calculate karta hai.

Example:

    SELECT SUM(salary)
    FROM employees;

Calculation:

    30000
    + 40000
    + 50000
    + 60000
    + 35000

    = 215000

---

# SUM() with WHERE

IT department ki total salary:

    SELECT SUM(salary)
    FROM employees
    WHERE department = 'IT';

---

# 3. AVG()

AVG() average value calculate karta hai.

Example:

    SELECT AVG(salary)
    FROM employees;

Calculation:

    (30000 + 40000 + 50000 + 60000 + 35000) / 5

    = 43000

---

# AVG() with WHERE

IT employees ki average salary:

    SELECT AVG(salary)
    FROM employees
    WHERE department = 'IT';

---

# 4. MIN()

MIN() minimum value return karta hai.

Example:

    SELECT MIN(salary)
    FROM employees;

Output:

    30000

---

# MIN() with WHERE

IT department mein minimum salary:

    SELECT MIN(salary)
    FROM employees
    WHERE department = 'IT';

---

# 5. MAX()

MAX() maximum value return karta hai.

Example:

    SELECT MAX(salary)
    FROM employees;

Output:

    60000

---

# MAX() with WHERE

HR department mein maximum salary:

    SELECT MAX(salary)
    FROM employees
    WHERE department = 'HR';

---

# 6. Multiple Aggregate Functions

Ek query mein multiple aggregate functions use kar sakte hain.

Example:

    SELECT
        COUNT(*) AS total_employees,
        SUM(salary) AS total_salary,
        AVG(salary) AS average_salary,
        MIN(salary) AS minimum_salary,
        MAX(salary) AS maximum_salary
    FROM employees;

Output:

    total_employees = 5
    total_salary = 215000
    average_salary = 43000
    minimum_salary = 30000
    maximum_salary = 60000

---

# 7. Aggregate Functions with WHERE

WHERE pehle rows filter karta hai.

Example:

    SELECT AVG(salary)
    FROM employees
    WHERE department = 'IT';

Process:

    employees
        ↓
    WHERE department = 'IT'
        ↓
    AVG(salary)

---

# 8. Aggregate Functions with GROUP BY

GROUP BY ke saath aggregate functions ka use bahut common hai.

Example:

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department;

Output:

    department | total_employees
    -----------|----------------
    IT         | 3
    HR         | 2

---

# 9. SUM() with GROUP BY

Department-wise total salary:

    SELECT
        department,
        SUM(salary) AS total_salary
    FROM employees
    GROUP BY department;

Output:

    department | total_salary
    -----------|-------------
    IT         | 105000
    HR         | 110000

---

# 10. AVG() with GROUP BY

Department-wise average salary:

    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department;

---

# 11. MIN() with GROUP BY

Department-wise minimum salary:

    SELECT
        department,
        MIN(salary) AS minimum_salary
    FROM employees
    GROUP BY department;

---

# 12. MAX() with GROUP BY

Department-wise maximum salary:

    SELECT
        department,
        MAX(salary) AS maximum_salary
    FROM employees
    GROUP BY department;

---

# 13. Multiple Aggregate Functions with GROUP BY

    SELECT
        department,
        COUNT(*) AS total_employees,
        SUM(salary) AS total_salary,
        AVG(salary) AS average_salary,
        MIN(salary) AS minimum_salary,
        MAX(salary) AS maximum_salary
    FROM employees
    GROUP BY department;

Ye interview mein bahut important query hai.

---

# 14. HAVING with Aggregate Functions

HAVING grouped result ko filter karta hai.

Example:

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 2;

Meaning:

Sirf wahi departments return honge jahan employees 2 se zyada hain.

---

# 15. WHERE vs HAVING

WHERE:

    Rows ko filter karta hai.

HAVING:

    Groups ko filter karta hai.

Example:

    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    WHERE salary > 30000
    GROUP BY department
    HAVING AVG(salary) > 40000;

Logical flow:

    FROM
       ↓
    WHERE
       ↓
    GROUP BY
       ↓
    HAVING
       ↓
    SELECT

---

# 16. COUNT(*) vs COUNT(column)

COUNT(*):

    SELECT COUNT(*)
    FROM employees;

All rows count karta hai.

COUNT(column):

    SELECT COUNT(salary)
    FROM employees;

Salary ki non-NULL values count karta hai.

Important:

    COUNT(*) → Rows
    COUNT(column) → Non-NULL values

---

# 17. COUNT(DISTINCT)

Unique values count karne ke liye:

    SELECT COUNT(DISTINCT department)
    FROM employees;

---

# 18. SUM() and NULL

SUM() generally NULL values ko calculation se ignore karta hai.

Example:

    salary:

    30000
    40000
    NULL
    50000

SUM:

    120000

NULL ko numeric value ki tarah add nahi kiya jata.

---

# 19. AVG() and NULL

AVG() generally NULL values ko ignore karta hai.

Example:

    salary:

    30000
    40000
    NULL
    50000

AVG:

    (30000 + 40000 + 50000) / 3

    = 40000

NULL ko denominator mein count nahi kiya jata.

---

# 20. MIN() and NULL

MIN() generally NULL values ko ignore karta hai.

Example:

    30000
    NULL
    50000

Result:

    30000

---

# 21. MAX() and NULL

MAX() generally NULL values ko ignore karta hai.

Example:

    30000
    NULL
    50000

Result:

    50000

---

# 22. Aggregate Functions with DISTINCT

SUM(DISTINCT):

    SELECT SUM(DISTINCT salary)
    FROM employees;

AVG(DISTINCT):

    SELECT AVG(DISTINCT salary)
    FROM employees;

COUNT(DISTINCT):

    SELECT COUNT(DISTINCT department)
    FROM employees;

MIN(DISTINCT) / MAX(DISTINCT) generally DISTINCT ki zarurat nahi hoti because minimum/maximum same result deta hai.

---

# 23. Alias with Aggregate Functions

Readable result ke liye alias use karo.

    SELECT
        COUNT(*) AS total_users,
        AVG(age) AS average_age,
        MAX(age) AS maximum_age
    FROM users;

Output columns:

    total_users
    average_age
    maximum_age

---

# 24. Aggregate Functions with ORDER BY

Example:

    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
    ORDER BY average_salary DESC;

Highest average salary wala department top par aa jayega.

---

# 25. Aggregate Functions with LIMIT

Example:

    SELECT
        department,
        SUM(salary) AS total_salary
    FROM employees
    GROUP BY department
    ORDER BY total_salary DESC
    LIMIT 3;

Top 3 departments by total salary.

---

# 26. Find Total Number of Employees

    SELECT COUNT(*) AS total_employees
    FROM employees;

---

# 27. Find Total Salary

    SELECT SUM(salary) AS total_salary
    FROM employees;

---

# 28. Find Average Salary

    SELECT AVG(salary) AS average_salary
    FROM employees;

---

# 29. Find Minimum Salary

    SELECT MIN(salary) AS minimum_salary
    FROM employees;

---

# 30. Find Maximum Salary

    SELECT MAX(salary) AS maximum_salary
    FROM employees;

---

# 31. Find Department-wise Employee Count

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department;

---

# 32. Find Department-wise Total Salary

    SELECT
        department,
        SUM(salary) AS total_salary
    FROM employees
    GROUP BY department;

---

# 33. Find Department-wise Average Salary

    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department;

---

# 34. Find Departments Having More Than 5 Employees

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 5;

---

# 35. Find Departments with Average Salary Greater Than 50000

    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 50000;

---

# 36. Find Highest Salary in Each Department

    SELECT
        department,
        MAX(salary) AS highest_salary
    FROM employees
    GROUP BY department;

---

# 37. Find Lowest Salary in Each Department

    SELECT
        department,
        MIN(salary) AS lowest_salary
    FROM employees
    GROUP BY department;

---

# 38. Find Total Employees with Salary Above 50000

    SELECT COUNT(*) AS total
    FROM employees
    WHERE salary > 50000;

---

# 39. Find Average Salary of Employees Above 30000

    SELECT AVG(salary) AS average_salary
    FROM employees
    WHERE salary > 30000;

---

# 40. Find Total Salary of IT Department

    SELECT SUM(salary) AS total_salary
    FROM employees
    WHERE department = 'IT';

---

# 41. Find Maximum Salary in IT

    SELECT MAX(salary) AS maximum_salary
    FROM employees
    WHERE department = 'IT';

---

# 42. Find Minimum Salary in IT

    SELECT MIN(salary) AS minimum_salary
    FROM employees
    WHERE department = 'IT';

---

# 43. Aggregate Functions with JOIN

Example:

Users:

    id
    name

Orders:

    id
    user_id
    amount

Total order amount per user:

    SELECT
        u.id,
        u.name,
        SUM(o.amount) AS total_spent
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id
    GROUP BY u.id, u.name;

---

# 44. Count Orders per User

    SELECT
        u.id,
        u.name,
        COUNT(o.id) AS total_orders
    FROM users u
    LEFT JOIN orders o
    ON u.id = o.user_id
    GROUP BY u.id, u.name;

LEFT JOIN use karne se zero-order users bhi result mein aa sakte hain.

---

# 45. Users Spending More Than 10000

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

# 46. COUNT with JOIN

Example:

    SELECT
        u.name,
        COUNT(o.id) AS total_orders
    FROM users u
    LEFT JOIN orders o
    ON u.id = o.user_id
    GROUP BY u.id, u.name;

---

# 47. COUNT(*) vs COUNT(id) with LEFT JOIN

Important Interview Concept:

    COUNT(*)

LEFT JOIN ke baad left-side row ko count kar sakta hai even when matching child row nahi hai.

    COUNT(o.id)

NULL order IDs ko count nahi karega.

Isliye zero related records count karne ke liye LEFT JOIN ke saath commonly:

    COUNT(o.id)

use karna useful hota hai.

---

# 48. Aggregate Function Return

Normally aggregate function entire selected result set ko ek group maan kar calculation karta hai.

Example:

    SELECT COUNT(*)
    FROM employees;

Result:

    One row

With GROUP BY:

    SELECT department, COUNT(*)
    FROM employees
    GROUP BY department;

Result:

    One row per department

---

# 49. Aggregate vs Scalar Functions

## Aggregate Functions

Multiple rows par operation.

Examples:

    COUNT()
    SUM()
    AVG()
    MIN()
    MAX()

Usually result set/group ke liye calculation karti hain.

---

## Scalar Functions

Generally ek input value/row par operation karke corresponding value return karti hain.

Examples:

    UPPER()
    LOWER()
    LENGTH()
    ROUND()
    CONCAT()

Example:

    SELECT UPPER(name)
    FROM users;

---

# 50. Aggregate Function vs Scalar Function

| Aggregate | Scalar |
|-----------|--------|
| Multiple rows par calculation | Usually individual value/row par operation |
| Usually grouped/overall result | Row-wise result |
| COUNT() | UPPER() |
| SUM() | LOWER() |
| AVG() | LENGTH() |
| MIN() | ROUND() |
| MAX() | CONCAT() |

---

# 51. Important Rules

## Rule 1

Aggregate functions generally numeric columns ke saath SUM/AVG ke liye use hoti hain.

Example:

    SUM(salary)

---

## Rule 2

COUNT(*) rows count karta hai.

    COUNT(*)

---

## Rule 3

COUNT(column) NULL values ko generally ignore karta hai.

    COUNT(email)

---

## Rule 4

WHERE aggregation se pehle rows filter karta hai.

---

## Rule 5

HAVING grouping ke baad groups filter karta hai.

---

## Rule 6

GROUP BY ke saath aggregate functions ka use common hai.

---

## Rule 7

SELECT mein non-aggregated columns ko generally GROUP BY mein include karna chahiye, subject to DBMS rules.

Example:

    SELECT department, AVG(salary)
    FROM employees
    GROUP BY department;

---

# 52. Common Mistake

Incorrect:

    SELECT department, AVG(salary)
    FROM employees;

Agar department ko group nahi kiya gaya aur query mein non-aggregated column hai, to strict SQL modes/DBMS mein error ho sakta hai.

Correct:

    SELECT department, AVG(salary)
    FROM employees
    GROUP BY department;

---

# 53. Aggregate Function Query Flow

Example:

    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    WHERE salary > 30000
    GROUP BY department
    HAVING AVG(salary) > 40000
    ORDER BY average_salary DESC;

Logical concept:

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

---

# 54. Real-World E-Commerce Example

Products:

    id | name | price | category
    ---|------|-------|----------
    1  | Phone | 20000 | Mobile
    2  | Laptop | 60000 | Laptop
    3  | Tablet | 30000 | Tablet

Total product price:

    SELECT SUM(price)
    FROM products;

Average product price:

    SELECT AVG(price)
    FROM products;

Highest product price:

    SELECT MAX(price)
    FROM products;

Lowest product price:

    SELECT MIN(price)
    FROM products;

Total products:

    SELECT COUNT(*)
    FROM products;

---

# 55. Interview Questions

## Q1. Aggregate Function kya hoti hai?

Aggregate Function multiple rows ke data par calculation perform karke generally ek result return karti hai.

---

## Q2. Common Aggregate Functions kaun si hain?

    COUNT()
    SUM()
    AVG()
    MIN()
    MAX()

---

## Q3. COUNT(*) kya karta hai?

Table/result set ki rows count karta hai.

---

## Q4. COUNT(column) kya karta hai?

Specified column ki non-NULL values count karta hai.

---

## Q5. COUNT(*) aur COUNT(column) mein difference?

COUNT(*) rows count karta hai.

COUNT(column) generally NULL values ko ignore karta hai.

---

## Q6. COUNT(DISTINCT column) kya karta hai?

Column ki unique non-NULL values count karta hai.

---

## Q7. SUM() kya karta hai?

Numeric values ka total calculate karta hai.

---

## Q8. AVG() kya karta hai?

Numeric values ka average calculate karta hai.

---

## Q9. MIN() kya karta hai?

Minimum value return karta hai.

---

## Q10. MAX() kya karta hai?

Maximum value return karta hai.

---

## Q11. Aggregate functions mein NULL ka kya hota hai?

COUNT(column), SUM(), AVG(), MIN(), MAX() generally NULL values ko calculation mein ignore karte hain.

COUNT(*) row ko count karta hai even if individual columns contain NULL.

---

## Q12. Aggregate functions ke saath GROUP BY kyun use karte hain?

Data ko groups mein divide karke har group ke liye aggregate calculation karne ke liye.

---

## Q13. WHERE aur HAVING mein difference?

WHERE rows ko filter karta hai.

HAVING groups ko filter karta hai.

---

## Q14. Kya aggregate function WHERE mein directly use kar sakte hain?

Generally aggregate result ko filter karne ke liye HAVING use karte hain.

Example:

    HAVING COUNT(*) > 5

---

## Q15. Kya aggregate function SELECT mein use kar sakte hain?

Haan.

Example:

    SELECT AVG(salary)
    FROM employees;

---

## Q16. Kya aggregate function ORDER BY mein use kar sakte hain?

Haan.

Example:

    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
    ORDER BY avg_salary DESC;

---

## Q17. Aggregate aur Scalar Function mein difference?

Aggregate multiple rows/groups par calculation karti hai.

Scalar function generally individual values/rows par operation karti hai.

---

## Q18. Department-wise highest salary kaise find karoge?

    SELECT
        department,
        MAX(salary) AS highest_salary
    FROM employees
    GROUP BY department;

---

## Q19. Department-wise employee count kaise find karoge?

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department;

---

## Q20. 5 se zyada employees wale departments kaise find karoge?

    SELECT
        department,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 5;

---

# ⭐ QUICK REVISION

COUNT()
→ Number of rows/non-NULL values

SUM()
→ Total

AVG()
→ Average

MIN()
→ Minimum

MAX()
→ Maximum

GROUP BY
→ Groups create

HAVING
→ Groups filter

WHERE
→ Rows filter

---

# ⭐ ONE-LINE INTERVIEW REVISION

1. Aggregate functions perform calculations over multiple rows.

2. Main aggregate functions are COUNT(), SUM(), AVG(), MIN() and MAX().

3. COUNT(*) counts rows.

4. COUNT(column) generally ignores NULL values.

5. COUNT(DISTINCT column) counts unique non-NULL values.

6. SUM() calculates total.

7. AVG() calculates average.

8. MIN() returns minimum value.

9. MAX() returns maximum value.

10. GROUP BY is commonly used with aggregate functions.

11. WHERE filters rows before grouping.

12. HAVING filters groups after grouping.

13. Aggregate functions can be used with ORDER BY.

14. Aggregate functions can be used with JOIN.

15. NULL values are generally ignored by SUM(), AVG(), MIN() and MAX().

16. COUNT(*) counts rows regardless of NULL values in individual columns.

17. Aggregate functions normally return one result when no GROUP BY is used.

18. With GROUP BY, aggregate functions normally return one result per group.

19. COUNT(DISTINCT column) is useful for counting unique values.

20. HAVING is commonly used to filter aggregate results.

---

# ⭐ MOST IMPORTANT INTERVIEW ANSWER

If interviewer asks:

"What are Aggregate Functions in SQL?"

Answer:

Aggregate Functions are functions that perform calculations on multiple rows and return a single result for the complete result set or for each group.

The main aggregate functions are COUNT(), SUM(), AVG(), MIN() and MAX().

For example:

    SELECT
        department,
        COUNT(*) AS total_employees,
        SUM(salary) AS total_salary,
        AVG(salary) AS average_salary,
        MIN(salary) AS minimum_salary,
        MAX(salary) AS maximum_salary
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 2;

Here:

    COUNT() → Employees count
    SUM()   → Total salary
    AVG()   → Average salary
    MIN()   → Lowest salary
    MAX()   → Highest salary

GROUP BY department department-wise result banata hai aur HAVING grouped result ko filter karta hai.