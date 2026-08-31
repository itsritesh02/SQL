# SQL CONSTRAINTS — Complete Interview Notes

SQL Constraints wo rules hote hain jo table ke data par restrictions/rules apply karte hain.

Constraints ka main purpose:

- Data accuracy maintain karna
- Data integrity maintain karna
- Invalid data ko prevent karna
- Duplicate data ko prevent karna
- Tables ke relationships maintain karna

---

# Main SQL Constraints

SQL mein commonly ye constraints use hote hain:

1. PRIMARY KEY
2. FOREIGN KEY
3. UNIQUE
4. NOT NULL
5. CHECK
6. DEFAULT

---

# 1. PRIMARY KEY

PRIMARY KEY table ke har record ko uniquely identify karti hai.

Rules:

- Duplicate values allowed nahi.
- NULL allowed nahi.
- Ek table mein normally ek PRIMARY KEY constraint hota hai.
- Single ya multiple columns par ho sakti hai.

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        email VARCHAR(150)
    );

Data:

    id | name
    ---|------
    1  | Ritesh
    2  | Rahul
    3  | Aman

Yahan:

    id → PRIMARY KEY

---

## PRIMARY KEY with AUTO_INCREMENT

MySQL mein IDs ke liye commonly AUTO_INCREMENT use hota hai.

    CREATE TABLE users (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100),
        email VARCHAR(150)
    );

Automatically:

    1
    2
    3
    4

IMPORTANT:

AUTO_INCREMENT constraint nahi hai.

Ye column attribute hai.

---

# 2. FOREIGN KEY

FOREIGN KEY ek table ke column ko doosre table ki referenced key se connect karti hai.

Iska main purpose:

- Tables ke beech relationship
- Referential integrity

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100)
    );

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

Yahan:

    users.id → PRIMARY KEY
    orders.user_id → FOREIGN KEY

---

# FOREIGN KEY Example

Users:

    id | name
    ---|-------
    1  | Ritesh
    2  | Rahul

Orders:

    id | user_id
    ---|--------
    101 | 1
    102 | 1
    103 | 2

User 1 ke multiple orders ho sakte hain.

---

# ON DELETE CASCADE

Parent record delete hone par related child records bhi delete ho sakte hain.

Example:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
    );

Agar:

    users.id = 1

delete hota hai, to us user ke related orders bhi delete ho sakte hain.

IMPORTANT:

CASCADE carefully use karna chahiye.

---

# ON DELETE SET NULL

Parent record delete hone par child table ka foreign key NULL ho sakta hai.

Example:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT NULL,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE SET NULL
    );

Important:

Foreign key column NULL allow karna chahiye.

---

# ON DELETE RESTRICT

Agar child records exist karte hain to parent record delete karne se prevent kar sakta hai.

Example:

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE RESTRICT

---

# ON UPDATE CASCADE

Parent key update hone par related foreign key values automatically update ho sakti hain.

Example:

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON UPDATE CASCADE

---

# 3. UNIQUE

UNIQUE constraint duplicate values ko prevent karta hai.

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        email VARCHAR(150) UNIQUE
    );

Data:

    id | email
    ---|----------------
    1  | abc@gmail.com
    2  | xyz@gmail.com

Same email dobara insert karne par constraint violation ho sakta hai.

---

# Multiple UNIQUE Constraints

Ek table mein multiple UNIQUE constraints ho sakte hain.

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        email VARCHAR(150) UNIQUE,
        phone VARCHAR(15) UNIQUE
    );

Yahan:

    id → PRIMARY KEY
    email → UNIQUE
    phone → UNIQUE

---

# UNIQUE with Multiple Columns

Multiple columns ke combination par UNIQUE constraint laga sakte hain.

Example:

    CREATE TABLE employees (
        id INT PRIMARY KEY,
        department_id INT,
        employee_code VARCHAR(20),

        UNIQUE (department_id, employee_code)
    );

Yahan same department mein same employee_code duplicate nahi ho sakta.

---

# 4. NOT NULL

NOT NULL ensure karta hai ki column mein NULL value store na ho.

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(150) NOT NULL
    );

Ab:

    name = NULL

allowed nahi hoga.

---

# NOT NULL Example

Correct:

    INSERT INTO users (name, email)
    VALUES ('Ritesh', 'ritesh@gmail.com');

Incorrect:

    INSERT INTO users (name, email)
    VALUES (NULL, 'ritesh@gmail.com');

NOT NULL constraint violation ho sakta hai.

---

# NOT NULL vs Empty String

Important:

NULL aur empty string same nahi hote.

NULL:

    NULL

Empty string:

    ''

Example:

    name = ''

NOT NULL constraint ko technically violate nahi karta because empty string NULL nahi hai.

---

# 5. CHECK

CHECK constraint condition enforce karta hai.

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        age INT,
        CHECK (age >= 18)
    );

Ab:

    age = 20

Allowed.

    age = 15

Constraint violation ho sakta hai.

---

# CHECK Multiple Conditions

Example:

    CREATE TABLE employees (
        id INT PRIMARY KEY,
        age INT,
        salary DECIMAL(10,2),

        CHECK (age >= 18),
        CHECK (salary >= 0)
    );

---

# CHECK with IN

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        status VARCHAR(20),

        CHECK (status IN ('active', 'inactive'))
    );

Allowed:

    active
    inactive

Not allowed:

    deleted

---

# CHECK with Range

Example:

    CREATE TABLE products (
        id INT PRIMARY KEY,
        price DECIMAL(10,2),

        CHECK (price > 0)
    );

Price zero ya negative nahi hona chahiye.

---

# 6. DEFAULT

DEFAULT constraint/column definition ka use tab hota hai jab INSERT ke time value provide nahi ki jati.

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        is_active BOOLEAN DEFAULT TRUE
    );

Agar is_active provide nahi kiya:

    is_active = TRUE

automatically use ho sakta hai.

---

# DEFAULT Example

    INSERT INTO users (name)
    VALUES ('Ritesh');

Agar:

    is_active BOOLEAN DEFAULT TRUE

hai to:

    is_active = TRUE

store hoga.

---

# DEFAULT with Number

    CREATE TABLE products (
        id INT PRIMARY KEY,
        stock INT DEFAULT 0
    );

Agar stock provide nahi kiya:

    stock = 0

---

# DEFAULT with Date/Time

MySQL:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

Record insert hone par current timestamp automatically set ho sakta hai.

---

# 7. Combining Multiple Constraints

Ek column par multiple constraints apply kar sakte hain.

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY AUTO_INCREMENT,

        name VARCHAR(100) NOT NULL,

        email VARCHAR(150) NOT NULL UNIQUE,

        age INT CHECK (age >= 18),

        is_active BOOLEAN DEFAULT TRUE
    );

Yahan:

    id
    → PRIMARY KEY
    → AUTO_INCREMENT

    name
    → NOT NULL

    email
    → NOT NULL
    → UNIQUE

    age
    → CHECK

    is_active
    → DEFAULT

---

# 8. Named Constraints

Constraint ko custom name bhi de sakte hain.

Example:

    CREATE TABLE users (
        id INT,

        CONSTRAINT pk_users
        PRIMARY KEY (id)
    );

---

# Named UNIQUE Constraint

    CREATE TABLE users (
        id INT PRIMARY KEY,
        email VARCHAR(150),

        CONSTRAINT uq_users_email
        UNIQUE (email)
    );

---

# Named FOREIGN KEY

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT,

        CONSTRAINT fk_orders_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

Naming useful hai because later constraint ko identify/drop karna easy hota hai.

---

# Named CHECK Constraint

    CREATE TABLE users (
        id INT PRIMARY KEY,
        age INT,

        CONSTRAINT chk_users_age
        CHECK (age >= 18)
    );

---

# 9. Adding Constraints with ALTER TABLE

Existing table mein bhi constraints add kar sakte hain.

---

## Add PRIMARY KEY

    ALTER TABLE users
    ADD PRIMARY KEY (id);

---

## Add UNIQUE

    ALTER TABLE users
    ADD CONSTRAINT uq_email
    UNIQUE (email);

---

## Add FOREIGN KEY

    ALTER TABLE orders
    ADD CONSTRAINT fk_user
    FOREIGN KEY (user_id)
    REFERENCES users(id);

---

## Add CHECK

    ALTER TABLE users
    ADD CONSTRAINT chk_age
    CHECK (age >= 18);

---

# 10. Remove Constraints

Constraints ko ALTER TABLE ke through remove kiya ja sakta hai.

---

## Drop PRIMARY KEY

    ALTER TABLE users
    DROP PRIMARY KEY;

---

## Drop UNIQUE Constraint

MySQL mein UNIQUE constraint ke corresponding index ko drop karna common syntax hai:

    ALTER TABLE users
    DROP INDEX uq_email;

Agar unnamed unique index hai to actual index name check karna pad sakta hai.

---

## Drop FOREIGN KEY

    ALTER TABLE orders
    DROP FOREIGN KEY fk_user;

---

## Drop CHECK

    ALTER TABLE users
    DROP CHECK chk_age;

MySQL version ke according syntax/behavior verify karna important hai.

---

# 11. PRIMARY KEY vs UNIQUE

| PRIMARY KEY | UNIQUE |
|-------------|--------|
| Row ko uniquely identify karta hai | Duplicate values prevent karta hai |
| NULL allowed nahi | MySQL mein NULL values generally allowed ho sakti hain |
| Table mein normally one PRIMARY KEY constraint | Multiple UNIQUE constraints possible |
| Main identifier | Additional uniqueness |

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        email VARCHAR(150) UNIQUE
    );

---

# 12. FOREIGN KEY vs PRIMARY KEY

| PRIMARY KEY | FOREIGN KEY |
|-------------|-------------|
| Record ko uniquely identify karta hai | Tables ke beech relationship |
| Unique | Duplicate values ho sakti hain |
| NULL allowed nahi | NULL allowed ho sakta hai |
| Parent table mein commonly | Child table mein commonly |

---

# 13. NOT NULL vs UNIQUE

| NOT NULL | UNIQUE |
|----------|--------|
| NULL prevent karta hai | Duplicate values prevent karta hai |
| Multiple same values allowed | Duplicate values generally allowed nahi |
| Example: name | Example: email |

Example:

    name VARCHAR(100) NOT NULL

    email VARCHAR(150) UNIQUE

---

# 14. CHECK vs NOT NULL

NOT NULL:

    Value missing nahi honi chahiye.

CHECK:

    Value given condition ko satisfy kare.

Example:

    age INT NOT NULL

    age INT CHECK (age >= 18)

Dono combine:

    age INT NOT NULL CHECK (age >= 18)

---

# 15. DEFAULT vs NOT NULL

DEFAULT:

Agar value nahi di gayi to default value provide karta hai.

NOT NULL:

NULL value ko prevent karta hai.

Example:

    status VARCHAR(20)
    NOT NULL
    DEFAULT 'active'

Yahan:

- Value missing ho to default active
- Explicit NULL generally allowed nahi

---

# 16. Constraint Types Summary

| Constraint | Purpose |
|------------|---------|
| PRIMARY KEY | Unique row identification |
| FOREIGN KEY | Table relationship |
| UNIQUE | Duplicate values prevent |
| NOT NULL | NULL values prevent |
| CHECK | Condition enforce |
| DEFAULT | Default value provide |

---

# 17. Real-World E-Commerce Example

    CREATE TABLE users (
        id BIGINT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(150) NOT NULL UNIQUE,
        age INT CHECK (age >= 18),
        is_active BOOLEAN DEFAULT TRUE,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE products (
        id BIGINT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        price DECIMAL(10,2) CHECK (price > 0),
        stock INT DEFAULT 0 CHECK (stock >= 0)
    );

    CREATE TABLE orders (
        id BIGINT PRIMARY KEY AUTO_INCREMENT,
        user_id BIGINT NOT NULL,
        total_amount DECIMAL(10,2) CHECK (total_amount >= 0),

        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

---

# 18. Constraint Order — Practical Example

    CREATE TABLE employees (
        id INT PRIMARY KEY AUTO_INCREMENT,

        name VARCHAR(100)
        NOT NULL,

        email VARCHAR(150)
        NOT NULL
        UNIQUE,

        age INT
        CHECK (age >= 18),

        salary DECIMAL(10,2)
        CHECK (salary >= 0),

        department_id INT,

        status VARCHAR(20)
        DEFAULT 'active',

        FOREIGN KEY (department_id)
        REFERENCES departments(id)
    );

---

# 19. Data Integrity

Constraints data integrity maintain karne mein important role play karte hain.

Main types:

## Entity Integrity

Primary Key ensure karta hai ki har record uniquely identifiable ho.

## Referential Integrity

Foreign Key ensure karta hai ki relationship valid rahe.

## Domain Integrity

CHECK, NOT NULL, data types etc. valid values maintain karne mein help karte hain.

---

# 20. Constraint Violation

Agar data constraint ko break karta hai to database error de sakta hai.

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY
    );

Insert:

    INSERT INTO users (id)
    VALUES (1);

Again:

    INSERT INTO users (id)
    VALUES (1);

Error:

Duplicate Primary Key value.

---

# 21. Foreign Key Violation

Agar parent table mein ID exist nahi karti:

    users:

    id
    --
    1
    2

Aur:

    INSERT INTO orders (user_id)
    VALUES (10);

Agar user_id = 10 users table mein exist nahi karta, to Foreign Key constraint violation ho sakta hai.

---

# 22. CHECK Constraint Violation

Constraint:

    CHECK (age >= 18)

Insert:

    INSERT INTO users (age)
    VALUES (15);

Constraint violation ho sakta hai.

---

# 23. Common Interview Questions

## Q1. SQL Constraint kya hai?

Constraint ek rule hai jo table ke data par restrictions apply karta hai aur data integrity maintain karne mein help karta hai.

---

## Q2. SQL ke main constraints kaun se hain?

Common constraints:

- PRIMARY KEY
- FOREIGN KEY
- UNIQUE
- NOT NULL
- CHECK
- DEFAULT

---

## Q3. PRIMARY KEY constraint kya karta hai?

Har row ko uniquely identify karta hai aur NULL/duplicate values allow nahi karta.

---

## Q4. FOREIGN KEY constraint kya karta hai?

Tables ke beech relationship establish karta hai aur referential integrity maintain karta hai.

---

## Q5. UNIQUE constraint kya karta hai?

Column ya columns ke combination mein duplicate values prevent karta hai.

---

## Q6. NOT NULL kya karta hai?

Column mein NULL value store hone se prevent karta hai.

---

## Q7. CHECK constraint kya karta hai?

Column ki value ko specified condition satisfy karne ke liye enforce karta hai.

---

## Q8. DEFAULT constraint kya karta hai?

Agar INSERT ke time value provide nahi ki gayi ho to default value use karta hai.

---

## Q9. Kya ek column par multiple constraints laga sakte hain?

Haan.

Example:

    email VARCHAR(150)
    NOT NULL
    UNIQUE

---

## Q10. Kya table mein multiple UNIQUE constraints ho sakte hain?

Haan.

Example:

    email UNIQUE
    phone UNIQUE

---

## Q11. Kya Foreign Key mein duplicate values ho sakti hain?

Haan.

Example:

Multiple orders same user_id ko reference kar sakte hain.

---

## Q12. Kya Foreign Key NULL ho sakti hai?

Haan, agar column NULL allow karta hai aur relationship optional hai.

---

## Q13. Primary Key aur Unique Key mein difference?

Primary Key main unique identifier hoti hai aur NULL allowed nahi hota.

UNIQUE additional uniqueness enforce karta hai aur MySQL mein NULL handling different hoti hai.

---

## Q14. CHECK aur NOT NULL mein difference?

NOT NULL NULL values prevent karta hai.

CHECK specific condition enforce karta hai.

---

## Q15. DEFAULT aur NOT NULL mein difference?

DEFAULT missing value ke case mein default value provide karta hai.

NOT NULL NULL values ko prevent karta hai.

---

## Q16. ON DELETE CASCADE kya hai?

Parent record delete hone par related child records automatically delete ho sakte hain.

---

## Q17. Referential Integrity kya hai?

Referential Integrity ensure karti hai ki Foreign Key ka relationship valid parent record ko reference kare.

---

# ⭐ QUICK REVISION

PRIMARY KEY
→ Unique row identification

FOREIGN KEY
→ Tables relationship

UNIQUE
→ Duplicate values prevent

NOT NULL
→ NULL prevent

CHECK
→ Condition enforce

DEFAULT
→ Default value

ON DELETE CASCADE
→ Parent delete → Related child rows delete

ON DELETE SET NULL
→ Parent delete → FK NULL

ON DELETE RESTRICT
→ Dependent rows hone par parent deletion prevent

ON UPDATE CASCADE
→ Parent key update → Related FK update

---

# ⭐ MOST IMPORTANT DIFFERENCES

PRIMARY KEY
→ Unique + NOT NULL

FOREIGN KEY
→ Relationship

UNIQUE
→ No duplicate values

NOT NULL
→ No NULL

CHECK
→ Condition

DEFAULT
→ Automatic default value

---

# ⭐ INTERVIEW ONE-LINERS

1. Constraint is a rule applied to table data.

2. Constraints help maintain data integrity.

3. PRIMARY KEY uniquely identifies each row.

4. PRIMARY KEY cannot contain NULL.

5. A table normally has one PRIMARY KEY constraint.

6. FOREIGN KEY establishes a relationship between tables.

7. FOREIGN KEY can contain duplicate values.

8. FOREIGN KEY can be NULL when the relationship is optional.

9. UNIQUE prevents duplicate values.

10. A table can have multiple UNIQUE constraints.

11. NOT NULL prevents NULL values.

12. CHECK enforces a condition.

13. DEFAULT provides a value when one is not supplied.

14. AUTO_INCREMENT is an attribute, not a constraint.

15. ON DELETE CASCADE can delete related child records.

16. ON DELETE SET NULL sets the child foreign key to NULL when supported and configured.

17. CHECK is useful for domain/business rules such as age >= 18.

18. NOT NULL and CHECK can be used together.

19. Referential integrity is mainly maintained using Foreign Keys.

20. Constraints are important for maintaining data quality and consistency.

---

# ⭐ FINAL INTERVIEW ANSWER

If interviewer asks:

"What are SQL Constraints?"

Answer:

SQL Constraints are rules applied to table columns to maintain data accuracy, consistency and integrity.

The main constraints are PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK and DEFAULT.

PRIMARY KEY uniquely identifies each row and does not allow NULL or duplicate values.

FOREIGN KEY establishes relationships between tables and maintains referential integrity.

UNIQUE prevents duplicate values.

NOT NULL prevents NULL values.

CHECK enforces a condition on the data.

DEFAULT provides a default value when no value is supplied during insertion.

For example:

    CREATE TABLE users (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(150) UNIQUE,
        age INT CHECK (age >= 18),
        status VARCHAR(20) DEFAULT 'active'
    );

This table uses multiple constraints together to maintain valid and consistent data.