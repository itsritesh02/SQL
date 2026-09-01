# SQL ALTER — Complete Interview Notes

ALTER ek DDL (Data Definition Language) command hai.

ALTER ka use existing database object, mainly table, ki structure/schema ko modify karne ke liye hota hai.

ALTER se hum:

- New column add kar sakte hain
- Column remove kar sakte hain
- Column ka datatype change kar sakte hain
- Column rename kar sakte hain
- Table rename kar sakte hain
- Constraints add/remove kar sakte hain

IMPORTANT:

ALTER existing table ke structure ko change karta hai.

---

# 1. BASIC ALTER SYNTAX

    ALTER TABLE table_name
    action;

Example:

    ALTER TABLE employees
    ADD COLUMN phone VARCHAR(15);

---

# 2. ADD COLUMN

Existing table mein new column add karna:

    ALTER TABLE employees
    ADD COLUMN phone VARCHAR(15);

Before:

    id
    name
    salary

After:

    id
    name
    salary
    phone

---

# 3. ADD MULTIPLE COLUMNS

Kuch DBMS multiple columns ko ek statement mein add karne dete hain.

Example:

    ALTER TABLE employees
    ADD COLUMN phone VARCHAR(15),
    ADD COLUMN city VARCHAR(50);

Syntax DBMS ke according vary kar sakta hai.

---

# 4. DROP COLUMN

Existing column remove karna:

    ALTER TABLE employees
    DROP COLUMN phone;

IMPORTANT:

DROP COLUMN se column aur uska stored data remove ho sakta hai.

Production mein carefully use karo.

---

# 5. MODIFY COLUMN DATATYPE

MySQL mein:

    ALTER TABLE employees
    MODIFY COLUMN salary DECIMAL(10,2);

Column ka datatype/definition change kar sakte hain.

IMPORTANT:

Syntax database-specific hai.

---

# 6. CHANGE COLUMN

MySQL mein column rename + definition change kar sakte hain:

    ALTER TABLE employees
    CHANGE COLUMN phone mobile_number VARCHAR(20);

Old:

    phone

New:

    mobile_number

---

# 7. RENAME COLUMN

PostgreSQL / MySQL 8+ style:

    ALTER TABLE employees
    RENAME COLUMN phone TO mobile_number;

Column ka name change hoga.

Datatype same reh sakta hai.

---

# 8. RENAME TABLE

Table ka name change:

    ALTER TABLE employees
    RENAME TO staff;

Old:

    employees

New:

    staff

IMPORTANT:

Exact syntax DBMS ke according vary kar sakta hai.

---

# 9. ADD PRIMARY KEY

Existing table mein Primary Key add karna:

    ALTER TABLE employees
    ADD PRIMARY KEY (id);

IMPORTANT:

Column values unique honi chahiye aur NULL restrictions satisfy karni chahiye.

---

# 10. DROP PRIMARY KEY

MySQL example:

    ALTER TABLE employees
    DROP PRIMARY KEY;

Database-specific behavior/syntax ho sakta hai.

---

# 11. ADD UNIQUE CONSTRAINT

    ALTER TABLE users
    ADD CONSTRAINT unique_email
    UNIQUE (email);

Ab duplicate email values prevent ki ja sakti hain.

---

# 12. DROP UNIQUE CONSTRAINT

Syntax database-specific hai.

MySQL example:

    ALTER TABLE users
    DROP INDEX unique_email;

Exact syntax DBMS ke according check karna chahiye.

---

# 13. ADD FOREIGN KEY

    ALTER TABLE orders
    ADD CONSTRAINT fk_orders_users
    FOREIGN KEY (user_id)
    REFERENCES users(id);

Yahan:

    orders.user_id
          ↓
    users.id

---

# 14. DROP FOREIGN KEY

MySQL example:

    ALTER TABLE orders
    DROP FOREIGN KEY fk_orders_users;

Foreign Key constraint remove hogi.

Column automatically delete nahi hota.

---

# 15. ADD NOT NULL

Existing column ko NOT NULL banana DBMS-specific syntax ho sakta hai.

PostgreSQL example:

    ALTER TABLE employees
    ALTER COLUMN name SET NOT NULL;

IMPORTANT:

Existing column mein NULL values hain to constraint add karne se pehle unhe handle karna padega.

---

# 16. DROP NOT NULL

PostgreSQL example:

    ALTER TABLE employees
    ALTER COLUMN name DROP NOT NULL;

Column ko NULL allow karne ke liye.

---

# 17. ADD DEFAULT

PostgreSQL example:

    ALTER TABLE employees
    ALTER COLUMN status SET DEFAULT 'Active';

New rows ke liye default value use ho sakti hai.

IMPORTANT:

Existing rows automatically update hona DBMS/operation ke behavior par depend kar sakta hai.

---

# 18. DROP DEFAULT

PostgreSQL example:

    ALTER TABLE employees
    ALTER COLUMN status DROP DEFAULT;

Default value remove ho jayegi.

---

# 19. ADD CHECK CONSTRAINT

Example:

    ALTER TABLE employees
    ADD CONSTRAINT check_salary
    CHECK (salary > 0);

Ab salary 0 ya negative value ko constraint reject kar sakta hai.

---

# 20. DROP CHECK CONSTRAINT

Constraint name ke through remove kar sakte hain.

Example:

    ALTER TABLE employees
    DROP CONSTRAINT check_salary;

Exact syntax DBMS-specific ho sakta hai.

---

# 21. ADD FOREIGN KEY WITH CASCADE

    ALTER TABLE orders
    ADD CONSTRAINT fk_orders_users
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE;

Parent user delete hone par related orders automatically delete ho sakte hain.

IMPORTANT:

CASCADE carefully use karo.

---

# 22. ADD FOREIGN KEY WITH SET NULL

    ALTER TABLE orders
    ADD CONSTRAINT fk_orders_users
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE SET NULL;

Child ka user_id NULL ho sakta hai.

Iske liye user_id ko NULL allow karna chahiye.

---

# 23. ADD INDEX

MySQL example:

    ALTER TABLE employees
    ADD INDEX idx_department (department);

Index searching/filtering ko improve karne mein help kar sakta hai.

---

# 24. DROP INDEX

MySQL example:

    ALTER TABLE employees
    DROP INDEX idx_department;

Index remove hoga.

IMPORTANT:

Index syntax database-specific ho sakta hai.

---

# 25. CHANGE DATATYPE

Example:

    ALTER TABLE users
    MODIFY COLUMN age BIGINT;

VARCHAR se INT ya INT se BIGINT jaise changes possible hain, lekin existing data compatible hona chahiye.

---

# 26. CHANGE VARCHAR SIZE

Example:

    ALTER TABLE users
    MODIFY COLUMN name VARCHAR(200);

Old:

    VARCHAR(100)

New:

    VARCHAR(200)

---

# 27. RENAME COLUMN EXAMPLE

Before:

    employee_name

Query:

    ALTER TABLE employees
    RENAME COLUMN employee_name TO name;

After:

    name

---

# 28. ADD COLUMN WITH DEFAULT

    ALTER TABLE users
    ADD COLUMN status VARCHAR(20)
    DEFAULT 'Active';

New rows mein status ka default:

    Active

ho sakta hai.

---

# 29. ADD COLUMN WITH NOT NULL

    ALTER TABLE users
    ADD COLUMN country VARCHAR(50) NOT NULL;

IMPORTANT:

Agar existing rows hain, kuch DBMS mein direct NOT NULL column add karna fail ho sakta hai unless a suitable default/value strategy use ki jaye.

---

# 30. ADD COLUMN WITH DEFAULT + NOT NULL

Example:

    ALTER TABLE users
    ADD COLUMN status VARCHAR(20)
    NOT NULL
    DEFAULT 'Active';

Existing/new rows ko satisfy karne ke liye default strategy useful ho sakti hai.

Exact behavior DBMS-specific hai.

---

# 31. ALTER TABLE + PRIMARY KEY

Example:

    CREATE TABLE users (
        id INT,
        name VARCHAR(100)
    );

Primary Key add:

    ALTER TABLE users
    ADD PRIMARY KEY (id);

---

# 32. ALTER TABLE + UNIQUE

    ALTER TABLE users
    ADD CONSTRAINT uq_users_email
    UNIQUE (email);

---

# 33. ALTER TABLE + FOREIGN KEY

    ALTER TABLE orders
    ADD CONSTRAINT fk_orders_users
    FOREIGN KEY (user_id)
    REFERENCES users(id);

---

# 34. ALTER TABLE + CHECK

    ALTER TABLE employees
    ADD CONSTRAINT chk_salary
    CHECK (salary > 0);

---

# 35. ALTER vs UPDATE

ALTER:

    Table structure/schema modify karta hai.

UPDATE:

    Existing rows ka data modify karta hai.

Example ALTER:

    ALTER TABLE employees
    ADD COLUMN phone VARCHAR(15);

Example UPDATE:

    UPDATE employees
    SET salary = 50000
    WHERE id = 1;

---

# 36. ALTER vs INSERT

ALTER:

    Table structure modify.

INSERT:

    New rows add.

Example:

    ALTER TABLE users
    ADD COLUMN phone VARCHAR(15);

    INSERT INTO users (id, name, phone)
    VALUES (1, 'Ritesh', '9876543210');

---

# 37. ALTER vs DELETE

ALTER:

    Structure change.

DELETE:

    Rows remove.

Example:

    ALTER TABLE users
    DROP COLUMN phone;

DELETE:

    DELETE FROM users
    WHERE id = 1;

---

# 38. ALTER vs TRUNCATE

ALTER:

    Table structure modify karta hai.

TRUNCATE:

    Table ke rows remove karta hai.

Example:

    ALTER TABLE users
    ADD COLUMN phone VARCHAR(15);

    TRUNCATE TABLE users;

---

# 39. ALTER vs DROP

ALTER:

    Existing object ki structure modify.

DROP:

    Object ko completely remove.

Example:

    ALTER TABLE users
    ADD COLUMN phone VARCHAR(15);

DROP:

    DROP TABLE users;

---

# 40. DDL COMMANDS

ALTER DDL ka part hai.

Common DDL commands:

    CREATE
    ALTER
    DROP
    TRUNCATE

---

# 41. ALTER TABLE COMPLETE EXAMPLE

Create table:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        email VARCHAR(100)
    );

Add phone:

    ALTER TABLE users
    ADD COLUMN phone VARCHAR(15);

Rename phone:

    ALTER TABLE users
    RENAME COLUMN phone TO mobile_number;

Add unique:

    ALTER TABLE users
    ADD CONSTRAINT uq_users_email
    UNIQUE (email);

Change name size:

    ALTER TABLE users
    MODIFY COLUMN name VARCHAR(200);

Remove mobile number:

    ALTER TABLE users
    DROP COLUMN mobile_number;

IMPORTANT:

`MODIFY COLUMN` syntax MySQL-specific style hai.

---

# 42. ALTER TABLE FOR E-COMMERCE

Initial table:

    CREATE TABLE products (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        price DECIMAL(10,2)
    );

Add stock:

    ALTER TABLE products
    ADD COLUMN stock INT;

Add category:

    ALTER TABLE products
    ADD COLUMN category VARCHAR(50);

Add check:

    ALTER TABLE products
    ADD CONSTRAINT chk_price
    CHECK (price >= 0);

Add index:

    ALTER TABLE products
    ADD INDEX idx_category (category);

---

# 43. ALTER TABLE FOR USERS

Initial:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        email VARCHAR(100)
    );

Add status:

    ALTER TABLE users
    ADD COLUMN status VARCHAR(20)
    DEFAULT 'Active';

Rename name:

    ALTER TABLE users
    RENAME COLUMN name TO full_name;

Add unique email:

    ALTER TABLE users
    ADD CONSTRAINT uq_email
    UNIQUE (email);

---

# 44. ALTER TABLE FOR ORDERS

Initial:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT,
        amount DECIMAL(10,2)
    );

Add Foreign Key:

    ALTER TABLE orders
    ADD CONSTRAINT fk_orders_users
    FOREIGN KEY (user_id)
    REFERENCES users(id);

---

# 45. MULTIPLE ALTER OPERATIONS

Some DBMS allow multiple changes in one ALTER statement.

Example MySQL style:

    ALTER TABLE users
    ADD COLUMN phone VARCHAR(15),
    ADD COLUMN city VARCHAR(50),
    ADD INDEX idx_city (city);

IMPORTANT:

Multiple alteration syntax DBMS-specific ho sakti hai.

Interview mein apne target DBMS ka syntax mention karna best hai.

---

# 46. ALTER TABLE AND DATA LOSS

Some ALTER operations data loss cause kar sakti hain.

Example:

    ALTER TABLE users
    MODIFY COLUMN name VARCHAR(10);

Agar existing name 10 characters se bada hai, truncation/error ka risk ho sakta hai depending on DBMS/settings.

Isliye production mein:

    Backup
       ↓
    Check existing data
       ↓
    ALTER
       ↓
    Verify

---

# 47. ALTER TABLE IN PRODUCTION

Production database mein ALTER carefully execute karna chahiye.

Before ALTER:

    1. Backup/check required
    2. Existing data verify
    3. Dependency check
    4. Constraint/index impact check
    5. Migration plan
    6. Test on staging

---

# 48. DATABASE MIGRATION

Real applications mein schema changes ko manually random SQL chalane ke bajay migrations ke through manage kiya jata hai.

Examples:

    Sequelize Migrations
    Prisma Migrations
    Flyway
    Liquibase

Migration ka purpose:

    Schema changes
          ↓
    Version controlled
          ↓
    Repeatable
          ↓
    Trackable

---

# 49. ALTER AND INDEX

Index add:

    ALTER TABLE users
    ADD INDEX idx_email (email);

Index useful ho sakta hai:

    WHERE
    JOIN
    ORDER BY

queries mein.

Lekin unnecessary indexes:

    Extra storage
    +
    INSERT/UPDATE overhead

create kar sakte hain.

---

# 50. ALTER AND CONSTRAINTS

ALTER ke through constraints add/remove kar sakte hain.

Common constraints:

    PRIMARY KEY
    FOREIGN KEY
    UNIQUE
    CHECK
    NOT NULL
    DEFAULT

---

# ⭐ IMPORTANT ALTER SYNTAX CHEAT SHEET

## Add Column

    ALTER TABLE table_name
    ADD COLUMN column_name datatype;

## Drop Column

    ALTER TABLE table_name
    DROP COLUMN column_name;

## Rename Column

    ALTER TABLE table_name
    RENAME COLUMN old_name TO new_name;

## Rename Table

    ALTER TABLE old_table
    RENAME TO new_table;

## Add Primary Key

    ALTER TABLE table_name
    ADD PRIMARY KEY (column_name);

## Add Unique

    ALTER TABLE table_name
    ADD CONSTRAINT constraint_name
    UNIQUE (column_name);

## Add Foreign Key

    ALTER TABLE table_name
    ADD CONSTRAINT constraint_name
    FOREIGN KEY (column_name)
    REFERENCES parent_table(parent_column);

## Add Check

    ALTER TABLE table_name
    ADD CONSTRAINT constraint_name
    CHECK (condition);

---

# ⭐ ALTER vs OTHER COMMANDS

| Command | Main Purpose |
|---------|--------------|
| CREATE | Object create |
| ALTER | Structure modify |
| DROP | Object remove |
| TRUNCATE | All rows remove |
| INSERT | New rows add |
| UPDATE | Existing rows modify |
| DELETE | Rows remove |
| SELECT | Data retrieve |

---

# ⭐ INTERVIEW QUESTIONS

## Q1. ALTER command kya hai?

ALTER ek DDL command hai jo existing database object, especially table, ki structure ko modify karne ke liye use hota hai.

---

## Q2. ALTER TABLE ka use kya hai?

ALTER TABLE se:

    Add column
    Drop column
    Rename column
    Modify column
    Add constraints
    Drop constraints
    Rename table

jaise structural changes kiye ja sakte hain.

---

## Q3. ALTER aur UPDATE mein difference?

ALTER:

    Table structure modify karta hai.

UPDATE:

    Table ke existing data ko modify karta hai.

---

## Q4. ALTER aur DROP mein difference?

ALTER:

    Existing table ko modify karta hai.

DROP:

    Table/object ko completely remove karta hai.

---

## Q5. ALTER aur TRUNCATE mein difference?

ALTER:

    Structure change.

TRUNCATE:

    Table ki rows remove.

---

## Q6. Existing table mein column kaise add karenge?

    ALTER TABLE users
    ADD COLUMN phone VARCHAR(15);

---

## Q7. Column kaise delete karenge?

    ALTER TABLE users
    DROP COLUMN phone;

---

## Q8. Column rename kaise karenge?

Example:

    ALTER TABLE users
    RENAME COLUMN phone TO mobile_number;

---

## Q9. Foreign Key kaise add karenge?

    ALTER TABLE orders
    ADD CONSTRAINT fk_orders_users
    FOREIGN KEY (user_id)
    REFERENCES users(id);

---

## Q10. Primary Key kaise add karenge?

    ALTER TABLE users
    ADD PRIMARY KEY (id);

---

## Q11. UNIQUE constraint kaise add karenge?

    ALTER TABLE users
    ADD CONSTRAINT uq_email
    UNIQUE (email);

---

## Q12. CHECK constraint kaise add karenge?

    ALTER TABLE employees
    ADD CONSTRAINT chk_salary
    CHECK (salary > 0);

---

## Q13. Kya ALTER DDL command hai?

Haan.

ALTER Data Definition Language (DDL) ka part hai.

---

## Q14. Kya ALTER se data change ho sakta hai?

ALTER primarily schema/structure change karta hai.

Lekin kuch structural changes existing data ko affect kar sakte hain, especially datatype changes, dropping columns, or constraints.

---

## Q15. Kya ALTER se table rename kar sakte hain?

Haan.

Example:

    ALTER TABLE employees
    RENAME TO staff;

Exact syntax DBMS-specific ho sakta hai.

---

# ⭐ REAL INTERVIEW QUESTIONS

## Question:

"Existing users table mein phone column add karo."

Answer:

    ALTER TABLE users
    ADD COLUMN phone VARCHAR(15);

---

## Question:

"Users table se phone column remove karo."

Answer:

    ALTER TABLE users
    DROP COLUMN phone;

---

## Question:

"Employee table mein salary ke liye CHECK constraint add karo."

Answer:

    ALTER TABLE employees
    ADD CONSTRAINT chk_salary
    CHECK (salary > 0);

---

## Question:

"Orders table mein user_id Foreign Key add karo."

Answer:

    ALTER TABLE orders
    ADD CONSTRAINT fk_orders_users
    FOREIGN KEY (user_id)
    REFERENCES users(id);

---

## Question:

"Users table ka email UNIQUE karo."

Answer:

    ALTER TABLE users
    ADD CONSTRAINT uq_users_email
    UNIQUE (email);

---

# ⭐ QUICK REVISION

ALTER
→ Table structure modify

ADD COLUMN
→ New column add

DROP COLUMN
→ Column remove

RENAME COLUMN
→ Column name change

RENAME TABLE
→ Table name change

MODIFY COLUMN
→ Column definition/datatype change

PRIMARY KEY
→ Unique row identification

FOREIGN KEY
→ Table relationship

UNIQUE
→ Duplicate values prevent

CHECK
→ Condition enforce

DEFAULT
→ Default value

INDEX
→ Search/query performance help

---

# ⭐ ONE-LINE INTERVIEW REVISION

1. ALTER is a DDL command.

2. ALTER is mainly used to modify database structure.

3. ALTER TABLE is used to modify an existing table.

4. ADD COLUMN adds a new column.

5. DROP COLUMN removes a column.

6. RENAME COLUMN changes a column name.

7. RENAME TABLE changes a table name.

8. ALTER can be used to add constraints.

9. ALTER can be used to remove constraints.

10. ALTER can be used to modify column definitions.

11. ALTER is different from UPDATE because UPDATE changes row data.

12. ALTER is different from DELETE because DELETE removes rows.

13. ALTER is different from DROP because DROP removes the database object.

14. ALTER is different from TRUNCATE because TRUNCATE removes rows but keeps the table structure.

15. ALTER syntax varies between database systems.

---

# ⭐ GOLDEN INTERVIEW ANSWER

Question:

"What is ALTER in SQL?"

Answer:

ALTER is a DDL command used to modify the structure or schema of an existing database object, especially a table. We can use ALTER TABLE to add, remove, rename or modify columns and to add or remove constraints and indexes.

Example:

    ALTER TABLE users
    ADD COLUMN phone VARCHAR(15);

This adds a new `phone` column to the existing `users` table.

---

# ⭐ MOST IMPORTANT DIFFERENCE

    ALTER
       ↓
    Structure change

    UPDATE
       ↓
    Existing data change

    INSERT
       ↓
    New data

    DELETE
       ↓
    Rows remove

    TRUNCATE
       ↓
    All rows remove

    DROP
       ↓
    Object completely remove

---

# ⭐ GOLDEN RULE

ALTER chalane se pehle:

    1. Existing data check karo.
    2. Dependencies check karo.
    3. Constraints/indexes check karo.
    4. Production mein migration use karo.
    5. Risky schema changes ko test karo.
    6. Data-loss possibility verify karo.

ALTER = "Table ki body/structure ko change karna."