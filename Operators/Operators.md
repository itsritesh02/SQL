# SQL OPERATORS — Complete Interview Notes

SQL Operators ka use values, columns aur expressions par operations perform karne ke liye hota hai.

Operators ka use:

- Conditions check karne ke liye
- Data filter karne ke liye
- Calculations ke liye
- Multiple conditions combine karne ke liye
- Values compare karne ke liye

---

# TYPES OF SQL OPERATORS

SQL mein commonly ye operators use hote hain:

1. Arithmetic Operators
2. Comparison Operators
3. Logical Operators
4. Bitwise Operators
5. Assignment Operators
6. Special Operators
7. String Operators

---

# 1. ARITHMETIC OPERATORS

Arithmetic operators mathematical calculations ke liye use hote hain.

Common operators:

    +
    -
    *
    /
    %

---

## Addition (+)

Do values ko add karta hai.

    SELECT 10 + 20 AS result;

Output:

    30

Example:

    SELECT salary + 5000 AS updated_salary
    FROM employees;

---

## Subtraction (-)

    SELECT 50 - 20 AS result;

Output:

    30

Example:

    SELECT salary - 1000 AS salary_after_deduction
    FROM employees;

---

## Multiplication (*)

    SELECT 10 * 5 AS result;

Output:

    50

Example:

    SELECT price * quantity AS total
    FROM products;

---

## Division (/)

    SELECT 20 / 5 AS result;

Output:

    4

Example:

    SELECT salary / 12 AS monthly_salary
    FROM employees;

---

## Modulus (%)

Division ka remainder return karta hai.

    SELECT 10 % 3 AS result;

Output:

    1

Example:

    SELECT 15 % 2 AS result;

Output:

    1

---

# 2. COMPARISON OPERATORS

Comparison operators do values ko compare karte hain.

Common operators:

    =
    !=
    <>
    >
    <
    >=
    <=

---

## Equal To (=)

    SELECT *
    FROM employees
    WHERE age = 25;

Age exactly 25 wale employees.

---

## Not Equal (!=)

    SELECT *
    FROM employees
    WHERE age != 25;

Age 25 ko exclude karega.

---

## Not Equal (<>)

SQL mein `<>` bhi not equal ke liye use hota hai.

    SELECT *
    FROM employees
    WHERE age <> 25;

---

## Greater Than (>)

    SELECT *
    FROM employees
    WHERE salary > 50000;

---

## Less Than (<)

    SELECT *
    FROM employees
    WHERE salary < 50000;

---

## Greater Than or Equal To (>=)

    SELECT *
    FROM employees
    WHERE salary >= 50000;

---

## Less Than or Equal To (<=)

    SELECT *
    FROM employees
    WHERE salary <= 50000;

---

# 3. LOGICAL OPERATORS

Logical operators multiple conditions ko combine karne ke liye use hote hain.

Main operators:

    AND
    OR
    NOT

---

# AND

AND mein saari conditions TRUE honi chahiye.

Example:

    SELECT *
    FROM employees
    WHERE age >= 18
    AND salary > 30000;

Dono conditions true honi chahiye.

---

## AND Example

    SELECT *
    FROM users
    WHERE city = 'Chandigarh'
    AND age >= 18;

Meaning:

    City = Chandigarh
    AND
    Age >= 18

---

# OR

OR mein kam se kam ek condition TRUE honi chahiye.

Example:

    SELECT *
    FROM users
    WHERE city = 'Delhi'
    OR city = 'Chandigarh';

Delhi ya Chandigarh ke users.

---

## OR Example

    SELECT *
    FROM employees
    WHERE salary > 50000
    OR experience > 3;

Agar koi bhi condition TRUE hai, row result mein aa sakti hai.

---

# NOT

NOT condition ko reverse karta hai.

Example:

    SELECT *
    FROM users
    WHERE NOT city = 'Delhi';

Delhi ko exclude karega.

---

# 4. SPECIAL OPERATORS

Important special operators:

    IN
    NOT IN
    BETWEEN
    NOT BETWEEN
    LIKE
    NOT LIKE
    IS NULL
    IS NOT NULL
    EXISTS
    NOT EXISTS

---

# IN

Multiple possible values ko check karne ke liye.

Example:

    SELECT *
    FROM users
    WHERE city IN ('Delhi', 'Mumbai', 'Chandigarh');

Ye equivalent hai:

    WHERE city = 'Delhi'
    OR city = 'Mumbai'
    OR city = 'Chandigarh';

---

# NOT IN

Specified values ko exclude karta hai.

    SELECT *
    FROM users
    WHERE city NOT IN ('Delhi', 'Mumbai');

---

# BETWEEN

Range ke andar value check karta hai.

    SELECT *
    FROM employees
    WHERE salary BETWEEN 30000 AND 60000;

BETWEEN generally lower aur upper boundary dono ko include karta hai.

---

# NOT BETWEEN

Range ko exclude karta hai.

    SELECT *
    FROM employees
    WHERE salary NOT BETWEEN 30000 AND 60000;

---

# LIKE

Pattern matching ke liye LIKE use hota hai.

Example:

    SELECT *
    FROM users
    WHERE name LIKE 'R%';

R se start hone wale names.

---

# NOT LIKE

Pattern ko exclude karta hai.

    SELECT *
    FROM users
    WHERE name NOT LIKE 'R%';

---

# LIKE WILDCARDS

LIKE ke saath mainly:

    %
    _

use hote hain.

---

## % Wildcard

Zero ya multiple characters match karta hai.

Example:

    WHERE name LIKE 'R%'

Meaning:

R se start.

Examples:

    Ritesh
    Rahul
    Raj

---

## % at End

    WHERE name LIKE 'R%'

Starts with R.

---

## % at Beginning

    WHERE name LIKE '%h'

Ends with h.

---

## % on Both Sides

    WHERE name LIKE '%it%'

Name ke andar "it" kahin bhi ho.

---

# _ Wildcard

Exactly one character represent karta hai.

Example:

    WHERE name LIKE 'R_tesh'

Yahan `_` ek character match karega.

---

# IS NULL

NULL values check karne ke liye.

Correct:

    SELECT *
    FROM users
    WHERE phone IS NULL;

---

# IS NOT NULL

NULL values ko exclude karne ke liye.

    SELECT *
    FROM users
    WHERE phone IS NOT NULL;

IMPORTANT:

NULL ko check karne ke liye:

    IS NULL

use karo.

Ye incorrect hai:

    = NULL

---

# EXISTS

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

Sirf wahi users return honge jinke orders exist karte hain.

---

# NOT EXISTS

Matching record exist nahi karta ho.

Example:

    SELECT *
    FROM users u
    WHERE NOT EXISTS (
        SELECT 1
        FROM orders o
        WHERE o.user_id = u.id
    );

Meaning:

Jinke orders nahi hain.

---

# 5. STRING OPERATORS

SQL dialect ke according string concatenation ka syntax change ho sakta hai.

MySQL mein:

    CONCAT()

Example:

    SELECT CONCAT(first_name, ' ', last_name) AS full_name
    FROM users;

---

# String Concatenation

MySQL:

    SELECT CONCAT('Hello', ' ', 'Ritesh');

Output:

    Hello Ritesh

---

# 6. BITWISE OPERATORS

Bitwise operators binary bits par operation perform karte hain.

Common operators:

    &
    |
    ^
    ~

---

# Bitwise AND (&)

    SELECT 5 & 3;

Binary:

    5 = 101
    3 = 011

Result:

    001 = 1

---

# Bitwise OR (|)

    SELECT 5 | 3;

Binary:

    101
    011
    ---
    111

Result:

    7

---

# Bitwise XOR (^)

XOR mein bits different hone par 1 aata hai.

    SELECT 5 ^ 3;

Binary:

    101
    011
    ---
    110

Result:

    6

---

# Bitwise NOT (~)

Bits ko invert karta hai.

    SELECT ~5;

Exact result DBMS aur integer representation par depend kar sakta hai.

---

# 7. ASSIGNMENT OPERATORS

Assignment syntax DBMS ke according different ho sakta hai.

MySQL mein SET ke saath assignment:

    SET @x = 10;

Example:

    SET @salary = 50000;

---

# 8. COMBINING OPERATORS

Multiple operators ek query mein use kar sakte hain.

Example:

    SELECT *
    FROM employees
    WHERE age >= 18
    AND salary > 30000
    AND city IN ('Delhi', 'Chandigarh');

Yahan use hua:

    >=
    AND
    >
    IN

---

# 9. OPERATOR PRECEDENCE

SQL expression mein operators ki priority hoti hai.

Generally:

    1. Parentheses
    2. Arithmetic operators
    3. Comparison operators
    4. NOT
    5. AND
    6. OR

Example:

    SELECT *
    FROM employees
    WHERE age > 18
    AND salary > 30000
    OR city = 'Delhi';

Is type ki condition mein clarity ke liye parentheses use karna better hai.

Better:

    SELECT *
    FROM employees
    WHERE (age > 18 AND salary > 30000)
    OR city = 'Delhi';

---

# 10. PARENTHESES

Conditions ko clearly group karne ke liye parentheses use kar sakte hain.

Example:

    SELECT *
    FROM employees
    WHERE age >= 18
    AND (city = 'Delhi' OR city = 'Chandigarh');

Meaning:

    Age >= 18

AND

    City Delhi OR Chandigarh

---

# 11. Arithmetic + Comparison

Example:

    SELECT *
    FROM products
    WHERE price * quantity > 10000;

Meaning:

    price × quantity > 10000

---

# 12. AND + OR

Example:

    SELECT *
    FROM employees
    WHERE (age >= 18 AND salary >= 50000)
    OR city = 'Delhi';

---

# 13. IN + NOT

Example:

    SELECT *
    FROM users
    WHERE NOT city IN ('Delhi', 'Mumbai');

Better readability ke liye commonly:

    WHERE city NOT IN ('Delhi', 'Mumbai');

---

# 14. BETWEEN + AND

Important:

BETWEEN ke andar `AND` range define karta hai.

Example:

    WHERE salary BETWEEN 30000 AND 60000;

Yahan AND logical AND nahi hai.

Ye BETWEEN syntax ka part hai.

---

# 15. Comparison with Strings

Example:

    SELECT *
    FROM users
    WHERE name = 'Ritesh';

String values ko generally quotes mein likhte hain.

---

# 16. Comparison with Dates

Example:

    SELECT *
    FROM orders
    WHERE order_date >= '2026-01-01';

---

# 17. NULL and Operators

NULL ke saath normal comparison operators ka behavior different hota hai.

Example:

    salary = NULL

Ye NULL check karne ka correct method nahi hai.

Correct:

    salary IS NULL

Similarly:

    salary IS NOT NULL

---

# 18. SQL Operator Examples

## Example 1

Age greater than 18:

    SELECT *
    FROM users
    WHERE age > 18;

---

## Example 2

Age between 18 and 30:

    SELECT *
    FROM users
    WHERE age BETWEEN 18 AND 30;

---

## Example 3

Delhi or Chandigarh:

    SELECT *
    FROM users
    WHERE city IN ('Delhi', 'Chandigarh');

---

## Example 4

Name starts with R:

    SELECT *
    FROM users
    WHERE name LIKE 'R%';

---

## Example 5

Salary greater than 50,000 and experience greater than 2:

    SELECT *
    FROM employees
    WHERE salary > 50000
    AND experience > 2;

---

## Example 6

Salary greater than 50,000 OR city Delhi:

    SELECT *
    FROM employees
    WHERE salary > 50000
    OR city = 'Delhi';

---

## Example 7

Email is missing:

    SELECT *
    FROM users
    WHERE email IS NULL;

---

## Example 8

Email exists:

    SELECT *
    FROM users
    WHERE email IS NOT NULL;

---

# 19. Operator Summary

| Type | Operators |
|------|-----------|
| Arithmetic | +, -, *, /, % |
| Comparison | =, !=, <>, >, <, >=, <= |
| Logical | AND, OR, NOT |
| Special | IN, NOT IN, BETWEEN, NOT BETWEEN |
| Pattern | LIKE, NOT LIKE |
| NULL | IS NULL, IS NOT NULL |
| Existence | EXISTS, NOT EXISTS |
| Bitwise | &, |, ^, ~ |
| Assignment | = in assignment contexts |

---

# 20. Comparison Operators Summary

| Operator | Meaning |
|----------|---------|
| = | Equal |
| != | Not equal |
| <> | Not equal |
| > | Greater than |
| < | Less than |
| >= | Greater than or equal |
| <= | Less than or equal |

---

# 21. Logical Operators Summary

| Operator | Meaning |
|----------|---------|
| AND | All conditions true |
| OR | At least one condition true |
| NOT | Condition reverse |

---

# 22. Special Operators Summary

| Operator | Purpose |
|----------|---------|
| IN | Multiple values check |
| NOT IN | Values exclude |
| BETWEEN | Range check |
| NOT BETWEEN | Range exclude |
| LIKE | Pattern matching |
| NOT LIKE | Pattern exclude |
| IS NULL | NULL check |
| IS NOT NULL | Non-NULL check |
| EXISTS | Matching row exists |
| NOT EXISTS | Matching row doesn't exist |

---

# 23. IMPORTANT DIFFERENCES

## IN vs OR

IN:

    WHERE city IN ('Delhi', 'Mumbai', 'Chandigarh');

OR:

    WHERE city = 'Delhi'
    OR city = 'Mumbai'
    OR city = 'Chandigarh';

IN multiple values ke liye cleaner syntax hai.

---

# BETWEEN vs Comparison

BETWEEN:

    WHERE salary BETWEEN 30000 AND 60000;

Equivalent idea:

    WHERE salary >= 30000
    AND salary <= 60000;

---

# LIKE vs =

`=` exact matching ke liye:

    WHERE name = 'Ritesh';

LIKE pattern matching ke liye:

    WHERE name LIKE 'Rit%';

---

# AND vs OR

AND:

    Sabhi conditions TRUE honi chahiye.

OR:

    At least one condition TRUE honi chahiye.

---

# WHERE NULL vs IS NULL

Wrong:

    WHERE email = NULL;

Correct:

    WHERE email IS NULL;

---

# 24. REAL-WORLD E-COMMERCE EXAMPLES

## Products above ₹1000

    SELECT *
    FROM products
    WHERE price > 1000;

---

## Products between ₹500 and ₹2000

    SELECT *
    FROM products
    WHERE price BETWEEN 500 AND 2000;

---

## Products from selected categories

    SELECT *
    FROM products
    WHERE category IN ('Mobile', 'Laptop', 'Tablet');

---

## Products starting with "iPhone"

    SELECT *
    FROM products
    WHERE name LIKE 'iPhone%';

---

## Products with stock

    SELECT *
    FROM products
    WHERE stock > 0;

---

## Out of stock products

    SELECT *
    FROM products
    WHERE stock = 0;

---

## Products with price and stock condition

    SELECT *
    FROM products
    WHERE price > 1000
    AND stock > 0;

---

# 25. INTERVIEW QUESTIONS

## Q1. SQL Operators kya hote hain?

SQL Operators symbols/keywords hote hain jo values aur expressions par operations perform karne ke liye use hote hain.

---

## Q2. SQL operators ke main types kya hain?

Common types:

- Arithmetic
- Comparison
- Logical
- Bitwise
- Special
- String
- Assignment

---

## Q3. Arithmetic operators kaun se hain?

    +
    -
    *
    /
    %

---

## Q4. Comparison operators kaun se hain?

    =
    !=
    <>
    >
    <
    >=
    <=

---

## Q5. Logical operators kaun se hain?

    AND
    OR
    NOT

---

## Q6. AND aur OR mein difference?

AND mein all conditions TRUE honi chahiye.

OR mein at least one condition TRUE honi chahiye.

---

## Q7. IN operator kya karta hai?

IN multiple values ke against value match karta hai.

Example:

    WHERE city IN ('Delhi', 'Mumbai');

---

## Q8. BETWEEN kya karta hai?

BETWEEN specified range mein values check karta hai aur generally boundaries include karta hai.

---

## Q9. LIKE operator kya hai?

LIKE pattern matching ke liye use hota hai.

---

## Q10. % aur _ wildcard mein difference?

`%` zero ya multiple characters match karta hai.

`_` exactly one character match karta hai.

---

## Q11. NULL ko kaise check karte hain?

    IS NULL

ya:

    IS NOT NULL

---

## Q12. `= NULL` kyun use nahi karte?

NULL unknown/missing value ko represent karta hai aur normal equality comparison se NULL test nahi kiya jata.

Use:

    IS NULL

---

## Q13. EXISTS kya karta hai?

EXISTS check karta hai ki subquery at least one row return karti hai ya nahi.

---

## Q14. UNION kya operator hai?

UNION set operation hai jo multiple SELECT results combine karta hai aur duplicate rows remove karta hai.

---

## Q15. UNION ALL kya karta hai?

Multiple SELECT results combine karta hai aur duplicate rows ko retain karta hai.

---

# ⭐ QUICK REVISION

Arithmetic:

    +
    -
    *
    /
    %

Comparison:

    =
    !=
    <>
    >
    <
    >=
    <=

Logical:

    AND
    OR
    NOT

Special:

    IN
    NOT IN
    BETWEEN
    NOT BETWEEN
    LIKE
    NOT LIKE
    IS NULL
    IS NOT NULL
    EXISTS
    NOT EXISTS

Bitwise:

    &
    |
    ^
    ~

---

# ⭐ ONE-LINE INTERVIEW REVISION

1. Operators perform operations on values and expressions.

2. Arithmetic operators perform mathematical calculations.

3. Comparison operators compare two values.

4. AND requires all conditions to be true.

5. OR requires at least one condition to be true.

6. NOT reverses a condition.

7. IN checks a value against multiple values.

8. NOT IN excludes specified values.

9. BETWEEN checks a range and generally includes both boundaries.

10. LIKE performs pattern matching.

11. `%` matches zero or more characters.

12. `_` matches exactly one character.

13. IS NULL checks for NULL.

14. IS NOT NULL checks for non-NULL values.

15. EXISTS checks whether a subquery returns at least one row.

16. NOT EXISTS checks whether no matching row exists.

17. `=` checks equality.

18. `!=` and `<>` are commonly used for not equal.

19. `>` means greater than.

20. `<` means less than.

21. `>=` means greater than or equal.

22. `<=` means less than or equal.

23. `%` arithmetic operator returns remainder when used as modulus.

24. Parentheses can be used to control condition grouping.

25. Operator precedence determines the order in which expressions are evaluated.

---

# ⭐ MOST IMPORTANT INTERVIEW ANSWER

If interviewer asks:

"What are SQL Operators?"

Answer:

SQL Operators are symbols or keywords used to perform operations on values, columns and expressions.

The main types are Arithmetic, Comparison, Logical, Special, Bitwise and String-related operators.

Arithmetic operators such as +, -, *, / and % perform calculations.

Comparison operators such as =, >, <, >= and <= compare values.

Logical operators such as AND, OR and NOT combine or reverse conditions.

Special operators such as IN, BETWEEN, LIKE, IS NULL and EXISTS are used for filtering and special conditions.

Example:

    SELECT *
    FROM employees
    WHERE salary >= 50000
    AND city IN ('Delhi', 'Chandigarh')
    AND name LIKE 'R%';

This query uses:

    >=
    AND
    IN
    LIKE

to filter employee records.