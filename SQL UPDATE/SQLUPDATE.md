# SQL UPDATE — Complete Interview Notes

UPDATE SQL ka DML (Data Manipulation Language) command hai.

UPDATE ka use existing table ke records/data ko modify ya change karne ke liye hota hai.

IMPORTANT:

UPDATE existing rows ko modify karta hai.

---

# 1. BASIC UPDATE SYNTAX

    UPDATE table_name
    SET column_name = value
    WHERE condition;

Example:

    UPDATE employees
    SET salary = 50000
    WHERE id = 1;

Employee jiska id = 1 hai, uski salary 50000 ho jayegi.

---

# 2. UPDATE WITHOUT WHERE

Example:

    UPDATE employees
    SET salary = 50000;

IMPORTANT:

WHERE nahi lagane par table ki ALL rows update ho sakti hain.

Isliye UPDATE ke saath WHERE carefully use karo.

---

# 3. UPDATE MULTIPLE COLUMNS

Ek hi query mein multiple columns update kar sakte hain.

    UPDATE employees
    SET
        salary = 50000,
        city = 'Chandigarh'
    WHERE id = 1;

Yahan:

    salary → 50000
    city   → Chandigarh

---

# 4. UPDATE USING WHERE

Specific record update karne ke liye WHERE use karte hain.

    UPDATE employees
    SET salary = 60000
    WHERE id = 5;

Sirf id = 5 wala employee update hoga.

---

# 5. UPDATE USING COMPARISON OPERATORS

Example:

    UPDATE employees
    SET salary = 50000
    WHERE salary < 30000;

Jinki salary 30000 se kam hai unki salary 50000 ho jayegi.

Operators:

    =
    !=
    <>
    >
    <
    >=
    <=

---

# 6. UPDATE WITH AND

Multiple conditions:

    UPDATE employees
    SET salary = 60000
    WHERE department = 'IT'
    AND experience > 2;

Meaning:

IT department ke employees jinka experience 2 years se zyada hai unki salary 60000 hogi.

---

# 7. UPDATE WITH OR

    UPDATE employees
    SET bonus = 5000
    WHERE department = 'IT'
    OR department = 'HR';

IT ya HR department ke employees update honge.

---

# 8. UPDATE WITH IN

Multiple values ke liye IN:

    UPDATE employees
    SET bonus = 5000
    WHERE department IN ('IT', 'HR', 'Sales');

---

# 9. UPDATE WITH NOT IN

Specified values ko exclude karne ke liye:

    UPDATE employees
    SET bonus = 3000
    WHERE department NOT IN ('IT', 'HR');

---

# 10. UPDATE WITH BETWEEN

Range ke basis par update:

    UPDATE employees
    SET bonus = 5000
    WHERE salary BETWEEN 30000 AND 50000;

---

# 11. UPDATE WITH LIKE

Pattern ke according update:

    UPDATE employees
    SET status = 'Senior'
    WHERE name LIKE 'R%';

R se start hone wale names ka status Senior ho jayega.

---

# 12. UPDATE NULL VALUES

NULL value set karna:

    UPDATE employees
    SET phone = NULL
    WHERE id = 10;

---

# 13. UPDATE WHERE IS NULL

NULL records ko update karna:

    UPDATE employees
    SET phone = 'Not Available'
    WHERE phone IS NULL;

---

# 14. UPDATE USING CALCULATION

Existing value ke basis par update:

    UPDATE employees
    SET salary = salary + 5000
    WHERE department = 'IT';

IT employees ki existing salary mein 5000 add hoga.

Example:

    Old Salary = 30000
    New Salary = 35000

---

# 15. DECREASE VALUE

    UPDATE products
    SET price = price - 100
    WHERE category = 'Mobile';

---

# 16. PERCENTAGE INCREASE

Example:

    UPDATE employees
    SET salary = salary * 1.10
    WHERE department = 'IT';

Salary approximately 10% increase hogi.

Example:

    30000 × 1.10 = 33000

---

# 17. UPDATE STRING VALUE

    UPDATE users
    SET city = 'Chandigarh'
    WHERE id = 1;

---

# 18. UPDATE MULTIPLE RECORDS

Example:

    UPDATE employees
    SET status = 'Active'
    WHERE department = 'IT';

IT department ke multiple employees update ho sakte hain.

---

# 19. UPDATE WITH CASE

Different conditions ke according different values update kar sakte hain.

Example:

    UPDATE employees
    SET salary =
        CASE
            WHEN experience >= 5 THEN salary * 1.20
            WHEN experience >= 2 THEN salary * 1.10
            ELSE salary * 1.05
        END;

Meaning:

    5+ years → 20% increase
    2+ years → 10% increase
    Others   → 5% increase

---

# 20. UPDATE WITH CASE AND WHERE

    UPDATE employees
    SET salary =
        CASE
            WHEN experience >= 5 THEN salary * 1.20
            WHEN experience >= 2 THEN salary * 1.10
            ELSE salary
        END
    WHERE department = 'IT';

Sirf IT department update hoga.

---

# 21. UPDATE USING SUBQUERY

Ek query ke result ko use karke update kar sakte hain.

Example:

    UPDATE employees
    SET salary = salary * 1.10
    WHERE department_id IN (
        SELECT id
        FROM departments
        WHERE location = 'Delhi'
    );

---

# 22. UPDATE WITH EXISTS

Example:

    UPDATE employees e
    SET status = 'Has Orders'
    WHERE EXISTS (
        SELECT 1
        FROM orders o
        WHERE o.employee_id = e.id
    );

Note:

Exact syntax aur supported features DBMS ke according vary kar sakte hain.

---

# 23. UPDATE WITH JOIN

MySQL mein UPDATE with JOIN commonly use kiya ja sakta hai.

Example:

    UPDATE employees e
    JOIN departments d
    ON e.department_id = d.id
    SET e.bonus = 5000
    WHERE d.name = 'IT';

Meaning:

IT department ke employees ka bonus 5000 set hoga.

IMPORTANT:

UPDATE JOIN syntax database-specific ho sakta hai.

---

# 24. UPDATE USING PRIMARY KEY

Specific record update karne ka safest common approach:

    UPDATE users
    SET name = 'Ritesh'
    WHERE id = 1;

Primary key ke basis par ek specific row target karna easy hota hai.

---

# 25. UPDATE AND PRIMARY KEY

Primary key ko bhi update kar sakte hain, but generally avoid karna better hota hai unless required.

Example:

    UPDATE users
    SET id = 100
    WHERE id = 10;

Agar foreign key relationships hain, constraints ki wajah se update fail ho sakta hai.

---

# 26. UPDATE UNIQUE COLUMN

Unique column ko update karte time duplicate value se error aa sakta hai.

Example:

    UPDATE users
    SET email = 'new@example.com'
    WHERE id = 1;

Agar ye email already kisi aur user ke paas hai aur email UNIQUE hai, query fail ho sakti hai.

---

# 27. UPDATE DEFAULT VALUE

Column ko default value assign karna DBMS-specific ho sakta hai.

Example:

    UPDATE users
    SET status = DEFAULT
    WHERE id = 1;

Support/syntax database ke according check karna chahiye.

---

# 28. UPDATE WITH ORDER BY / LIMIT

Some DBMS, including MySQL, UPDATE mein ORDER BY/LIMIT support karte hain.

Example:

    UPDATE employees
    SET bonus = 1000
    ORDER BY salary DESC
    LIMIT 5;

Ye syntax database-specific hai.

Meaning:

Highest salary wale top 5 selected rows ko update karne ki koshish karega.

---

# 29. UPDATE AND NULL

IMPORTANT:

NULL check:

    WHERE phone IS NULL

NULL assign:

    SET phone = NULL

Example:

    UPDATE users
    SET phone = NULL
    WHERE id = 1;

---

# 30. UPDATE vs INSERT

INSERT:

    New rows add karta hai.

UPDATE:

    Existing rows modify karta hai.

Example INSERT:

    INSERT INTO users (name, age)
    VALUES ('Ritesh', 22);

Example UPDATE:

    UPDATE users
    SET age = 23
    WHERE name = 'Ritesh';

---

# 31. UPDATE vs DELETE

UPDATE:

    Existing data modify karta hai.

DELETE:

    Existing rows remove karta hai.

Example:

    UPDATE users
    SET status = 'Inactive'
    WHERE id = 1;

DELETE:

    DELETE FROM users
    WHERE id = 1;

---

# 32. UPDATE vs ALTER

UPDATE:

    Table ke existing data ko change karta hai.

ALTER:

    Table structure ko change karta hai.

UPDATE example:

    UPDATE users
    SET age = 25
    WHERE id = 1;

ALTER example:

    ALTER TABLE users
    ADD COLUMN phone VARCHAR(20);

---

# 33. UPDATE vs REPLACE

UPDATE:

    Existing matching rows modify karta hai.

REPLACE:

    MySQL-specific statement hai jo insert/replace behavior perform kar sakta hai aur existing row ko replace kar sakta hai based on unique/primary key conflicts.

Normal data modification ke liye UPDATE ko prefer karo.

---

# 34. UPDATE WITH TRANSACTION

Critical updates ke liye transaction useful hai.

Example:

    START TRANSACTION;

    UPDATE employees
    SET salary = salary + 5000
    WHERE department = 'IT';

    COMMIT;

Agar changes cancel karne hain:

    ROLLBACK;

---

# 35. COMMIT

COMMIT transaction ke changes ko permanently save karta hai.

    COMMIT;

---

# 36. ROLLBACK

ROLLBACK transaction ke uncommitted changes ko undo karta hai.

    ROLLBACK;

IMPORTANT:

Transaction behavior aur autocommit settings DBMS ke according differ kar sakti hain.

---

# 37. UPDATE RETURNING

Kuch databases UPDATE ke changed rows ko return karne ke liye RETURNING support karte hain.

Example in PostgreSQL:

    UPDATE employees
    SET salary = 50000
    WHERE id = 1
    RETURNING *;

IMPORTANT:

RETURNING support database-specific hai.

MySQL versions/features ka syntax PostgreSQL se different ho sakta hai.

---

# 38. Check Before UPDATE

Production mein update se pehle same WHERE condition ke saath SELECT karke affected rows verify karna safer approach hai.

Example:

    SELECT *
    FROM employees
    WHERE department = 'IT';

Then:

    UPDATE employees
    SET salary = salary + 5000
    WHERE department = 'IT';

---

# 39. IMPORTANT: WHERE Condition Verify Karo

Wrong:

    UPDATE employees
    SET salary = 50000;

Potential result:

    ALL employees update ho sakte hain.

Safer:

    UPDATE employees
    SET salary = 50000
    WHERE id = 1;

---

# 40. UPDATE with Multiple Conditions

Example:

    UPDATE employees
    SET salary = salary + 10000
    WHERE department = 'IT'
    AND experience >= 3
    AND status = 'Active';

---

# 41. E-COMMERCE EXAMPLES

Products table:

    id
    name
    price
    stock
    category

---

## Increase Mobile Prices

    UPDATE products
    SET price = price * 1.10
    WHERE category = 'Mobile';

---

## Update Out-of-Stock Products

    UPDATE products
    SET status = 'Out of Stock'
    WHERE stock = 0;

---

## Add Stock

    UPDATE products
    SET stock = stock + 10
    WHERE id = 5;

---

## Reduce Stock

    UPDATE products
    SET stock = stock - 1
    WHERE id = 5
    AND stock > 0;

---

## Update Product Price

    UPDATE products
    SET price = 25000
    WHERE id = 10;

---

# 42. USER EXAMPLES

Users table:

    id
    name
    email
    city
    status

---

## Change City

    UPDATE users
    SET city = 'Chandigarh'
    WHERE id = 1;

---

## Activate User

    UPDATE users
    SET status = 'Active'
    WHERE id = 1;

---

## Deactivate Users

    UPDATE users
    SET status = 'Inactive'
    WHERE last_login < '2026-01-01';

---

# 43. UPDATE QUERY STRUCTURE

Basic structure:

    UPDATE table_name
    SET column1 = value1,
        column2 = value2
    WHERE condition;

Example:

    UPDATE users
    SET
        name = 'Ritesh',
        city = 'Chandigarh'
    WHERE id = 1;

---

# 44. SQL UPDATE FLOW

Conceptually:

    UPDATE table
        ↓
    Find rows using WHERE
        ↓
    Apply SET values
        ↓
    Save changes

Without WHERE:

    UPDATE table
        ↓
    ALL eligible rows
        ↓
    Apply SET
        ↓
    Changes

---

# 45. Common UPDATE Mistakes

## Mistake 1 — WHERE missing

    UPDATE users
    SET city = 'Delhi';

Potentially all rows update ho sakti hain.

---

## Mistake 2 — Wrong WHERE

    UPDATE users
    SET city = 'Delhi'
    WHERE id > 0;

Agar sab IDs positive hain, almost all rows update ho sakti hain.

---

## Mistake 3 — NULL comparison

Wrong:

    WHERE phone = NULL

Correct:

    WHERE phone IS NULL

---

## Mistake 4 — Unique value duplicate

    UPDATE users
    SET email = 'existing@email.com'
    WHERE id = 5;

Agar email UNIQUE hai aur already exist karta hai, constraint violation ho sakta hai.

---

# 46. UPDATE with Aggregate Subquery

Example:

Average salary se kam salary wale employees ko average salary set karna:

    UPDATE employees
    SET salary = (
        SELECT AVG(salary)
        FROM employees
    )
    WHERE salary < (
        SELECT AVG(salary)
        FROM employees
    );

IMPORTANT:

Exact support aur behavior DBMS/version ke according vary kar sakta hai.

---

# 47. UPDATE INTERVIEW QUESTIONS

## Q1. UPDATE command kya hai?

UPDATE ek DML command hai jo existing table ke rows ko modify karne ke liye use hota hai.

---

## Q2. UPDATE ka basic syntax kya hai?

    UPDATE table_name
    SET column_name = value
    WHERE condition;

---

## Q3. UPDATE mein WHERE ka kya role hai?

WHERE decide karta hai ki kaun si rows update hongi.

---

## Q4. UPDATE without WHERE kya hota hai?

WHERE ke bina UPDATE table ki all rows ko update kar sakta hai.

---

## Q5. Kya UPDATE multiple columns ko update kar sakta hai?

Haan.

Example:

    UPDATE users
    SET
        name = 'Ritesh',
        age = 23
    WHERE id = 1;

---

## Q6. Kya UPDATE mein calculation kar sakte hain?

Haan.

Example:

    UPDATE employees
    SET salary = salary + 5000
    WHERE id = 1;

---

## Q7. UPDATE aur INSERT mein difference?

INSERT new rows add karta hai.

UPDATE existing rows modify karta hai.

---

## Q8. UPDATE aur DELETE mein difference?

UPDATE existing data modify karta hai.

DELETE rows remove karta hai.

---

## Q9. UPDATE aur ALTER mein difference?

UPDATE data modify karta hai.

ALTER table structure modify karta hai.

---

## Q10. UPDATE mein NULL kaise set karte hain?

    UPDATE users
    SET phone = NULL
    WHERE id = 1;

---

## Q11. NULL records kaise update karenge?

    UPDATE users
    SET phone = 'Not Available'
    WHERE phone IS NULL;

---

## Q12. UPDATE mein multiple conditions kaise use karte hain?

    UPDATE employees
    SET salary = 60000
    WHERE department = 'IT'
    AND experience > 2;

---

## Q13. Kya UPDATE mein CASE use kar sakte hain?

Haan.

Example:

    UPDATE employees
    SET salary =
        CASE
            WHEN experience >= 5 THEN salary * 1.20
            WHEN experience >= 2 THEN salary * 1.10
            ELSE salary
        END;

---

## Q14. UPDATE with JOIN kya hai?

JOIN ke through related table ki information use karke rows update karna.

Syntax database-specific hota hai.

---

## Q15. UPDATE ke saath transaction kyun use karte hain?

Critical changes ko safely manage karne ke liye.

Example:

    START TRANSACTION;

    UPDATE employees
    SET salary = salary + 5000
    WHERE department = 'IT';

    COMMIT;

Agar change cancel karna ho:

    ROLLBACK;

---

# ⭐ UPDATE vs INSERT vs DELETE

| Command | Purpose |
|---------|---------|
| INSERT | New rows add |
| UPDATE | Existing rows modify |
| DELETE | Rows remove |

---

# ⭐ UPDATE vs ALTER

| UPDATE | ALTER |
|--------|-------|
| Data change | Table structure change |
| DML | DDL |
| Existing rows modify | Columns/constraints etc. modify |
| WHERE commonly used | WHERE use nahi hota |

---

# ⭐ QUICK REVISION

UPDATE
→ Existing data modify

SET
→ New value assign

WHERE
→ Rows select/filter

AND
→ Multiple conditions

OR
→ Alternative conditions

IN
→ Multiple values

BETWEEN
→ Range

LIKE
→ Pattern matching

IS NULL
→ NULL rows check

CASE
→ Conditional update

COMMIT
→ Save transaction

ROLLBACK
→ Undo uncommitted transaction

---

# ⭐ ONE-LINE INTERVIEW REVISION

1. UPDATE is a DML command.

2. UPDATE modifies existing rows.

3. SET specifies the new values.

4. WHERE specifies which rows should be updated.

5. UPDATE without WHERE can update all rows.

6. Multiple columns can be updated in one UPDATE statement.

7. UPDATE can use arithmetic expressions.

8. UPDATE can use AND, OR, IN, BETWEEN and LIKE in its WHERE condition.

9. NULL is checked using IS NULL.

10. UPDATE can be combined with CASE for conditional changes.

11. UPDATE can use subqueries.

12. UPDATE with JOIN is supported with database-specific syntax.

13. Transactions can be used to safely manage important updates.

14. COMMIT saves transaction changes.

15. ROLLBACK undoes uncommitted transaction changes.

16. UPDATE modifies data, while ALTER modifies table structure.

17. UPDATE modifies existing rows, while INSERT adds new rows.

18. UPDATE modifies rows, while DELETE removes rows.

19. Primary key conditions are commonly useful for targeting a specific row.

20. Always verify the WHERE condition before running a critical UPDATE.

---

# ⭐ MOST IMPORTANT INTERVIEW ANSWER

If interviewer asks:

"What is UPDATE in SQL?"

Answer:

UPDATE is a DML command used to modify existing records in a database table.

The basic syntax is:

    UPDATE table_name
    SET column_name = value
    WHERE condition;

Example:

    UPDATE employees
    SET salary = salary + 5000
    WHERE department = 'IT';

This query increases the salary of employees in the IT department by 5000.

The WHERE clause is very important because without it, the UPDATE statement may modify all rows in the table.

---

# ⭐ REAL INTERVIEW EXAMPLE

Question:

"Increase the salary of all IT employees by 10%."

Answer:

    UPDATE employees
    SET salary = salary * 1.10
    WHERE department = 'IT';

---

Question:

"Update the salary of employee whose id is 10 to 50000."

Answer:

    UPDATE employees
    SET salary = 50000
    WHERE id = 10;

---

Question:

"Update multiple columns of a user."

Answer:

    UPDATE users
    SET
        name = 'Ritesh',
        city = 'Chandigarh',
        status = 'Active'
    WHERE id = 1;

---

# ⭐ GOLDEN RULE

UPDATE karne se pehle:

    1. Same WHERE condition ke saath SELECT chalao.
    2. Affected rows verify karo.
    3. Phir UPDATE execute karo.

Example:

    SELECT *
    FROM employees
    WHERE department = 'IT';

Then:

    UPDATE employees
    SET salary = salary + 5000
    WHERE department = 'IT';

Ye accidental mass update se bachne ka practical approach hai.