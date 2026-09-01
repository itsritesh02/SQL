# SQL FOREIGN KEY (FK) — Complete Interview Notes

Foreign Key (FK) ek column ya columns ka set hota hai jo ek table ko doosri table ke Primary Key (ya UNIQUE key) se relate karta hai.

Foreign Key ka main purpose:

- Tables ke beech relationship create karna
- Referential Integrity maintain karna
- Invalid related data ko prevent karna

---

# 1. FOREIGN KEY BASIC CONCEPT

Example:

Users table:

    id | name
    ---|------
    1  | Ritesh
    2  | Rahul
    3  | Aman

Orders table:

    id | user_id | amount
    ---|---------|-------
    101| 1       | 5000
    102| 2       | 3000
    103| 1       | 2000

Yahan:

    users.id
        ↑
        |
    orders.user_id

orders.user_id ek Foreign Key hai.

Ye users table ke id ko reference karta hai.

---

# 2. FOREIGN KEY SYNTAX

Table create karte time:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT,
        amount DECIMAL(10,2),

        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

Yahan:

    user_id
    ↓
    Foreign Key

    users(id)
    ↓
    Referenced Key

---

# 3. PARENT TABLE AND CHILD TABLE

Foreign Key relationship mein:

Parent Table:

    users

Child Table:

    orders

Example:

    users.id
       ↓
    orders.user_id

Parent table mein referenced key hoti hai.

Child table mein Foreign Key hoti hai.

---

# 4. PRIMARY KEY + FOREIGN KEY

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100)
    );

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT,
        amount DECIMAL(10,2),

        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

Relationship:

    users.id → orders.user_id

---

# 5. FOREIGN KEY WITH CONSTRAINT NAME

Foreign Key ko custom name de sakte hain.

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT,
        amount DECIMAL(10,2),

        CONSTRAINT fk_orders_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

Constraint name:

    fk_orders_user

---

# 6. ADD FOREIGN KEY AFTER TABLE CREATION

Existing table mein Foreign Key add kar sakte hain.

    ALTER TABLE orders
    ADD CONSTRAINT fk_orders_user
    FOREIGN KEY (user_id)
    REFERENCES users(id);

---

# 7. DROP FOREIGN KEY

Foreign Key constraint remove karne ke liye syntax DBMS-specific hota hai.

MySQL example:

    ALTER TABLE orders
    DROP FOREIGN KEY fk_orders_user;

Constraint remove hoga.

Column delete nahi hoga.

---

# 8. FOREIGN KEY AND REFERENTIAL INTEGRITY

Referential Integrity ka meaning:

Child table ka Foreign Key value parent table mein valid referenced value honi chahiye, subject to NULL/constraint rules.

Example:

Users:

    id
    1
    2
    3

Valid:

    INSERT INTO orders (id, user_id, amount)
    VALUES (101, 1, 5000);

Invalid:

    INSERT INTO orders (id, user_id, amount)
    VALUES (102, 99, 5000);

Agar users.id = 99 exist nahi karta, Foreign Key constraint violation ho sakta hai.

---

# 9. FOREIGN KEY AND NULL

Foreign Key column NULL ho sakta hai agar column par NOT NULL constraint nahi laga hai.

Example:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT NULL,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

Ye possible hai:

    INSERT INTO orders (id, user_id)
    VALUES (101, NULL);

NULL ka meaning ho sakta hai ki order kisi user se currently associated nahi hai.

---

# 10. FOREIGN KEY + NOT NULL

Agar relationship mandatory banana hai:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT NOT NULL,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

Ab user_id NULL nahi ho sakta.

---

# 11. ON DELETE CASCADE

Parent row delete hone par related child rows automatically delete ho sakti hain.

Example:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
    );

Agar:

    DELETE FROM users
    WHERE id = 1;

To user id = 1 ke related orders bhi automatically delete ho sakte hain.

IMPORTANT:

CASCADE carefully use karo because multiple related rows delete ho sakti hain.

---

# 12. ON DELETE SET NULL

Parent row delete hone par child table ka Foreign Key NULL ho jayega.

Example:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT NULL,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE SET NULL
    );

Agar user delete hota hai:

    users.id = 1

Related orders:

    user_id = 1

become:

    user_id = NULL

Iske liye child Foreign Key column NULL allow karna chahiye.

---

# 13. ON DELETE RESTRICT

Parent row ko delete karne se prevent karta hai jab related child records exist karte hain.

Example:

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE RESTRICT

Agar user ke orders exist karte hain, user ko delete karna fail ho sakta hai.

---

# 14. ON DELETE NO ACTION

NO ACTION parent delete/update ko related records ke according restrict kar sakta hai.

Exact timing/behavior DBMS ke implementation par depend kar sakta hai.

---

# 15. ON UPDATE CASCADE

Parent key update hone par related Foreign Key values automatically update ho sakti hain.

Example:

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON UPDATE CASCADE

Agar parent key change hoti hai:

    users.id
    1 → 10

To related:

    orders.user_id
    1 → 10

ho sakta hai.

IMPORTANT:

Primary Key values ko unnecessarily change karna generally avoid kiya jata hai.

---

# 16. ON DELETE vs ON UPDATE

ON DELETE:

    Parent record delete hone par kya hoga?

ON UPDATE:

    Referenced key update hone par kya hoga?

Example:

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE

---

# 17. COMMON ACTIONS

Foreign Key ke saath commonly:

    CASCADE
    SET NULL
    RESTRICT
    NO ACTION

use kiye ja sakte hain.

---

# 18. FOREIGN KEY RELATIONSHIP EXAMPLE

Customers:

    id
    name

Orders:

    id
    customer_id
    amount

Relationship:

    Customers
        |
        | 1
        |
        | N
        ↓
    Orders

Ek customer ke multiple orders ho sakte hain.

---

# 19. ONE-TO-MANY RELATIONSHIP

Foreign Key ka very common use:

One-to-Many relationship.

Example:

    One User
       ↓
    Many Orders

users:

    id

orders:

    user_id

---

# 20. ONE-TO-ONE RELATIONSHIP

Foreign Key ke saath UNIQUE constraint use karke one-to-one relationship model kiya ja sakta hai.

Example:

    CREATE TABLE user_profiles (
        id INT PRIMARY KEY,
        user_id INT UNIQUE,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

Ek user ke maximum ek profile row hogi.

---

# 21. MANY-TO-MANY RELATIONSHIP

Many-to-Many relationship ke liye usually junction/bridge table use hoti hai.

Example:

Students:

    id
    name

Courses:

    id
    name

Student_Courses:

    student_id
    course_id

Example:

    CREATE TABLE student_courses (
        student_id INT,
        course_id INT,

        PRIMARY KEY (student_id, course_id),

        FOREIGN KEY (student_id)
        REFERENCES students(id),

        FOREIGN KEY (course_id)
        REFERENCES courses(id)
    );

Relationship:

    Students
       ↕
    Student_Courses
       ↕
    Courses

---

# 22. COMPOSITE FOREIGN KEY

Multiple columns milkar Foreign Key bana sakte hain.

Example:

    FOREIGN KEY (student_id, course_id)
    REFERENCES student_courses(student_id, course_id);

Referenced columns ko parent table mein appropriate candidate key/unique constraint ke through uniquely identify hona chahiye, DBMS rules ke according.

---

# 23. FOREIGN KEY AND UNIQUE KEY

Foreign Key usually parent table ki Primary Key ko reference karti hai.

Lekin many DBMS mein Foreign Key parent table ki suitable UNIQUE/Candidate Key ko bhi reference kar sakti hai.

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        email VARCHAR(100) UNIQUE
    );

Child:

    CREATE TABLE accounts (
        id INT PRIMARY KEY,
        user_email VARCHAR(100),

        FOREIGN KEY (user_email)
        REFERENCES users(email)
    );

Exact requirements DBMS ke according vary kar sakte hain.

---

# 24. FOREIGN KEY DOES NOT HAVE TO BE PRIMARY KEY IN CHILD

Important:

Child table mein Foreign Key column ko Primary Key hona zaroori nahi hai.

Example:

    orders:

    id        → PRIMARY KEY
    user_id   → FOREIGN KEY

Multiple orders same user_id rakh sakte hain.

Example:

    order_id | user_id
    ---------|--------
    101      | 1
    102      | 1
    103      | 1

---

# 25. FOREIGN KEY CAN HAVE DUPLICATE VALUES

Foreign Key automatically UNIQUE nahi hoti.

Example:

    user_id

    1
    1
    1
    2
    2

Ye valid ho sakta hai.

Isi wajah se one-to-many relationship possible hoti hai.

---

# 26. FOREIGN KEY vs PRIMARY KEY

| PRIMARY KEY | FOREIGN KEY |
|-------------|-------------|
| Row ko uniquely identify karta hai | Tables ko relate karta hai |
| Unique hota hai | Duplicate values allowed |
| NULL allowed nahi | NULL allowed ho sakta hai |
| Usually one primary key constraint per table | Multiple FK constraints possible |
| Parent table mein commonly referenced | Child table mein commonly present |

IMPORTANT:

Ek table mein multiple columns ka composite Primary Key ho sakta hai.

---

# 27. FOREIGN KEY vs UNIQUE KEY

| FOREIGN KEY | UNIQUE KEY |
|-------------|------------|
| Relationship create karta hai | Duplicate values prevent karta hai |
| Parent key ko reference karta hai | Column values unique rakhta hai |
| Child table mein commonly use | Same table mein uniqueness enforce |
| Duplicate values allowed ho sakti hain | Duplicate values allowed nahi |

---

# 28. FOREIGN KEY WITH JOIN

Foreign Key ka data retrieve karne ke liye JOIN use karte hain.

Example:

    SELECT
        u.name,
        o.amount
    FROM users u
    INNER JOIN orders o
    ON u.id = o.user_id;

Relationship:

    u.id = o.user_id

---

# 29. FOREIGN KEY AND INDEX

Foreign Key columns par index performance ke liye useful ho sakta hai.

Kuch database systems automatically index create/require kar sakte hain, while others may not.

Production systems mein Foreign Key columns ke indexing behavior ko DBMS ke according check karna chahiye.

---

# 30. FOREIGN KEY INSERT RULE

Parent record pehle exist karna chahiye agar child Foreign Key non-NULL value ko reference kar rahi hai.

Correct:

    INSERT INTO users (id, name)
    VALUES (1, 'Ritesh');

    INSERT INTO orders (id, user_id)
    VALUES (101, 1);

Incorrect:

    INSERT INTO orders (id, user_id)
    VALUES (102, 99);

Agar user 99 exist nahi karta, FK violation ho sakta hai.

---

# 31. FOREIGN KEY DELETE RULE

Agar child rows parent ko reference kar rahi hain, parent ko delete karna action rule par depend karega.

Example:

    users
       ↓
    orders

Agar:

    users.id = 1

aur:

    orders.user_id = 1

exists karta hai, to user delete karne par:

    CASCADE
    SET NULL
    RESTRICT
    NO ACTION

mein se configured rule apply hoga.

---

# 32. CASCADE EXAMPLE

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT NOT NULL,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
    );

User delete:

    DELETE FROM users
    WHERE id = 1;

Related orders:

    user_id = 1

automatically delete ho sakte hain.

---

# 33. SET NULL EXAMPLE

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT NULL,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE SET NULL
    );

User delete hone par:

    user_id → NULL

---

# 34. RESTRICT EXAMPLE

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE RESTRICT
    );

Agar related orders exist karte hain:

    DELETE FROM users
    WHERE id = 1;

delete fail ho sakta hai.

---

# 35. REAL-WORLD E-COMMERCE DESIGN

Users:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100)
    );

Orders:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT NOT NULL,
        amount DECIMAL(10,2),

        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

Products:

    CREATE TABLE products (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        price DECIMAL(10,2)
    );

Order Items:

    CREATE TABLE order_items (
        id INT PRIMARY KEY,
        order_id INT NOT NULL,
        product_id INT NOT NULL,
        quantity INT NOT NULL,

        FOREIGN KEY (order_id)
        REFERENCES orders(id),

        FOREIGN KEY (product_id)
        REFERENCES products(id)
    );

Relationships:

    users
      ↓
    orders
      ↓
    order_items
      ↑
    products

---

# 36. SELF-REFERENCING FOREIGN KEY

Table khud ko reference kar sakti hai.

Example:

Employees:

    id
    name
    manager_id

    CREATE TABLE employees (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        manager_id INT,

        FOREIGN KEY (manager_id)
        REFERENCES employees(id)
    );

Example:

    id | name   | manager_id
    ---|--------|-----------
    1  | Ritesh | NULL
    2  | Rahul  | 1
    3  | Aman   | 1

Ritesh manager hai.

Rahul aur Aman Ritesh ko reference kar rahe hain.

---

# 37. FOREIGN KEY CONSTRAINT ERROR

Example:

    INSERT INTO orders (id, user_id)
    VALUES (101, 999);

Agar:

    users.id = 999

exist nahi karta, database Foreign Key constraint error de sakta hai.

Reason:

    Referential Integrity violation

---

# 38. FOREIGN KEY CONSTRAINT NAME

Recommended naming style:

    fk_child_parent

Example:

    fk_orders_users

or:

    fk_orders_user_id

Example:

    CONSTRAINT fk_orders_users
    FOREIGN KEY (user_id)
    REFERENCES users(id)

---

# 39. FOREIGN KEY IN EXISTING TABLE

Example:

    ALTER TABLE orders
    ADD CONSTRAINT fk_orders_users
    FOREIGN KEY (user_id)
    REFERENCES users(id);

IMPORTANT:

Existing data valid hona chahiye.

Agar existing child rows invalid parent IDs contain karti hain, constraint add karna fail ho sakta hai.

---

# 40. FOREIGN KEY AND DATA INTEGRITY

Foreign Key database ko invalid relationships se protect karne mein help karti hai.

Without FK:

    orders.user_id = 999

possible ho sakta hai even if user 999 exist nahi karta.

With FK:

    Invalid reference
          ↓
    Constraint violation

---

# 41. FOREIGN KEY INTERVIEW QUESTIONS

## Q1. Foreign Key kya hoti hai?

Foreign Key ek column ya columns ka set hota hai jo child table ko parent table ki referenced key se relate karta hai aur referential integrity maintain karne mein help karta hai.

---

## Q2. Foreign Key ka main purpose kya hai?

Foreign Key ka main purpose:

    1. Tables ke beech relationship create karna
    2. Referential integrity maintain karna
    3. Invalid references ko prevent karna

---

## Q3. Foreign Key kis key ko reference karti hai?

Commonly Primary Key ko.

Suitable UNIQUE/Candidate Key ko bhi reference kiya ja sakta hai, DBMS rules ke according.

---

## Q4. Kya Foreign Key mein duplicate values ho sakti hain?

Haan.

Example:

    user_id
    1
    1
    2
    2

Valid ho sakta hai.

---

## Q5. Kya Foreign Key NULL ho sakti hai?

Haan, agar Foreign Key column par NOT NULL constraint nahi hai.

---

## Q6. Kya Foreign Key automatically UNIQUE hoti hai?

Nahi.

Foreign Key automatically unique nahi hoti.

---

## Q7. Primary Key aur Foreign Key mein difference?

Primary Key:

    Row ko uniquely identify karti hai.

Foreign Key:

    Tables ke beech relationship create karti hai.

---

## Q8. ON DELETE CASCADE kya karta hai?

Parent row delete hone par related child rows automatically delete ho sakti hain.

---

## Q9. ON DELETE SET NULL kya karta hai?

Parent row delete hone par related child Foreign Key values NULL ho jati hain, provided column NULL allow karta ho.

---

## Q10. ON DELETE RESTRICT kya karta hai?

Related child records hone par parent row ko delete karne se prevent karta hai.

---

## Q11. ON UPDATE CASCADE kya karta hai?

Referenced parent key update hone par related child Foreign Key values automatically update kar sakta hai.

---

## Q12. One-to-Many relationship Foreign Key se kaise banate hain?

Parent table ki Primary Key ko child table mein Foreign Key ke roop mein store karte hain.

Example:

    users.id
       ↓
    orders.user_id

Ek user ke multiple orders ho sakte hain.

---

## Q13. Many-to-Many relationship kaise implement karte hain?

Junction/bridge table use karke.

Example:

    students
       ↕
    student_courses
       ↕
    courses

---

## Q14. Foreign Key child table mein Primary Key ho sakti hai?

Haan, possible hai, especially one-to-one relationship design mein.

Lekin Foreign Key ka Primary Key hona compulsory nahi hai.

---

## Q15. Foreign Key constraint remove kaise karte hain?

Syntax DBMS-specific hai.

MySQL example:

    ALTER TABLE orders
    DROP FOREIGN KEY fk_orders_users;

---

# ⭐ FOREIGN KEY QUICK REVISION

Foreign Key
→ Tables ko relate karti hai

Parent Table
→ Referenced table

Child Table
→ Foreign Key wali table

REFERENCES
→ Parent key specify karta hai

PRIMARY KEY
→ Common referenced key

UNIQUE
→ Alternative referenced key in supported DBMS/design

ON DELETE CASCADE
→ Parent delete → Child delete

ON DELETE SET NULL
→ Parent delete → FK NULL

ON DELETE RESTRICT
→ Related child rows ho to parent delete prevent

ON UPDATE CASCADE
→ Parent key update → Child FK update

---

# ⭐ FOREIGN KEY VS PRIMARY KEY

Primary Key:

    Unique
    NOT NULL
    Row identification
    Parent side commonly

Foreign Key:

    Relationship
    Duplicate allowed
    NULL may be allowed
    Child side commonly

---

# ⭐ MOST IMPORTANT INTERVIEW ANSWER

If interviewer asks:

"What is a Foreign Key?"

Answer:

A Foreign Key is a column or set of columns in one table that references a key in another table, commonly the Primary Key. It is used to establish relationships between tables and maintain referential integrity.

Example:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

Here:

    users.id
        ↓
    Parent Key

    orders.user_id
        ↓
    Foreign Key

This ensures that a non-NULL user_id in orders generally refers to an existing user.

---

# ⭐ REAL INTERVIEW EXAMPLES

## Question:

"Create users and orders tables using Foreign Key."

Answer:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100)
    );

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT NOT NULL,
        amount DECIMAL(10,2),

        CONSTRAINT fk_orders_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

---

## Question:

"Delete user and automatically delete their orders."

Answer:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT NOT NULL,

        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
    );

---

## Question:

"One user can have many orders. How?"

Answer:

    users.id
       ↓
    orders.user_id

`orders.user_id` Foreign Key hoga.

Same user_id multiple orders mein aa sakta hai.

Example:

    order_id | user_id
    ---------|--------
    101      | 1
    102      | 1
    103      | 1

Isse One-to-Many relationship create hoti hai.

---

# ⭐ GOLDEN RULES

1. Foreign Key relationship create karti hai.

2. Parent table ki key ko child table reference karti hai.

3. Foreign Key automatically UNIQUE nahi hoti.

4. Foreign Key mein duplicate values allowed ho sakti hain.

5. Foreign Key NULL ho sakti hai unless NOT NULL specified ho.

6. Foreign Key invalid parent references ko prevent karne mein help karti hai.

7. Primary Key commonly Foreign Key ka referenced key hoti hai.

8. ON DELETE CASCADE carefully use karna chahiye.

9. ON DELETE SET NULL ke liye child FK column NULL allow karna chahiye.

10. One-to-Many relationship mein child table ki Foreign Key duplicate ho sakti hai.

11. Many-to-Many ke liye junction table commonly use hoti hai.

12. Foreign Key constraints referential integrity maintain karne mein important hain.