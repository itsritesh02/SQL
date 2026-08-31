# SQL KEYS — Complete Interview Notes

SQL Keys ka use table ke records ko uniquely identify karne, tables ke beech relationship banane aur data integrity maintain karne ke liye hota hai.

SQL mein commonly ye Keys use hoti hain:

1. Primary Key
2. Foreign Key
3. Candidate Key
4. Super Key
5. Alternate Key
6. Composite Key
7. Unique Key

---

# 1. Primary Key

Primary Key table ke har record ko uniquely identify karti hai.

Rules:

- Duplicate values allowed nahi hoti.
- NULL values allowed nahi hoti.
- Ek table mein normally ek PRIMARY KEY constraint hota hai.
- Primary key single column ya multiple columns se ban sakti hai.

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        email VARCHAR(150)
    );

Data:

    id | name
    ---|-------
    1  | Ritesh
    2  | Rahul
    3  | Aman

Yahan `id` Primary Key hai.

---

# 2. PRIMARY KEY with AUTO_INCREMENT

MySQL mein IDs ke liye commonly AUTO_INCREMENT use hota hai.

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100),
        email VARCHAR(150)
    );

Data automatically:

    1
    2
    3
    4

Important:

AUTO_INCREMENT ek key nahi hai.

Ye column attribute hai.

---

# 3. Foreign Key

Foreign Key ek table ke column ko doosre table ki Primary Key ya suitable UNIQUE key se relate karti hai.

Iska main purpose tables ke beech relationship aur referential integrity maintain karna hai.

Example:

Users table:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100)
    );

Orders table:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT,
        FOREIGN KEY (user_id)
        REFERENCES users(id)
    );

Yahan:

    users.id → Primary Key
    orders.user_id → Foreign Key

Relationship:

    users
       |
       | 1
       |
       | N
    orders

Ek user ke multiple orders ho sakte hain.

---

# 4. Candidate Key

Candidate Key wo column ya column combination hai jo table ke record ko uniquely identify kar sakta hai aur minimal bhi hota hai.

Example:

    id
    email
    phone

Agar teeno unique hain, to ye candidate keys ho sakti hain.

Inmein se ek ko Primary Key choose kiya ja sakta hai.

Example:

    id → Primary Key
    email → Alternate Key
    phone → Alternate Key

---

# 5. Super Key

Super Key column ya columns ka koi bhi combination hai jo row ko uniquely identify kar sake.

Example:

    id

Agar `id` unique hai:

    {id} → Super Key

Agar id unique hai to:

    {id, name}
    {id, email}
    {id, name, email}

bhi Super Keys ho sakti hain.

Lekin extra columns ki wajah se ye minimal nahi hain.

---

# 6. Candidate Key vs Super Key

Super Key:

- Unique identification karta hai.
- Extra attributes ho sakte hain.

Candidate Key:

- Unique identification karta hai.
- Minimal hona chahiye.
- Extra unnecessary attributes nahi hone chahiye.

Example:

    {id} → Candidate Key
    {id, name} → Super Key

---

# 7. Alternate Key

Candidate Keys mein se jo key Primary Key select nahi hoti, use Alternate Key kehte hain.

Example:

Table:

    id
    email
    phone

Suppose:

    id → Primary Key
    email → Candidate Key
    phone → Candidate Key

To:

    email → Alternate Key
    phone → Alternate Key

---

# 8. Composite Key

Jab two ya more columns milkar ek record ko uniquely identify karte hain, to Composite Key kehte hain.

Example:

    CREATE TABLE enrollment (
        student_id INT,
        course_id INT,
        enrollment_date DATE,
        PRIMARY KEY (student_id, course_id)
    );

Yahan:

    student_id + course_id

milkar unique record identify karte hain.

Important:

Composite Key mein ek se zyada columns hote hain.

---

# 9. Unique Key

UNIQUE constraint column mein duplicate values ko prevent karta hai.

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        email VARCHAR(150) UNIQUE
    );

Ab same email normally multiple rows mein insert nahi ki ja sakti.

Example:

    user 1 → abc@gmail.com
    user 2 → abc@gmail.com

Second value reject ho jayegi.

---

# 10. PRIMARY KEY vs UNIQUE KEY

| Primary Key | Unique Key |
|-------------|------------|
| Row ko uniquely identify karti hai | Duplicate values prevent karta hai |
| NULL allowed nahi | MySQL mein NULL handling alag hoti hai; multiple NULLs generally allowed |
| Table mein normally one PRIMARY KEY constraint | Multiple UNIQUE constraints ho sakte hain |
| Main identifier | Additional uniqueness enforce karne ke liye |

Example:

    CREATE TABLE users (
        id INT PRIMARY KEY,
        email VARCHAR(150) UNIQUE,
        phone VARCHAR(15) UNIQUE
    );

Yahan:

    id → Primary Key
    email → Unique Key
    phone → Unique Key

---

# 11. Natural Key

Natural Key real-world meaningful data se banti hai.

Example:

    email
    passport_number
    employee_code

Example:

    employee_code VARCHAR(20) UNIQUE

Agar employee code business mein naturally unique hai, to ye Natural Key ho sakti hai.

---

# 12. Surrogate Key

Surrogate Key artificially/system-generated identifier hoti hai.

Example:

    id INT AUTO_INCREMENT PRIMARY KEY

Yahan `id` ka real-world meaning nahi hai.

Ye sirf record identify karne ke liye hai.

Common examples:

    id
    user_id
    product_id

---

# 13. Natural Key vs Surrogate Key

| Natural Key | Surrogate Key |
|-------------|---------------|
| Real-world data | Artificial identifier |
| Business meaning hota hai | Usually business meaning nahi |
| Example: email | Example: user_id |
| Change ho sakti hai | Usually stable rakhi jati hai |

---

# 14. Foreign Key with ON DELETE

Foreign Key ke saath referential actions define kar sakte hain.

Example:

    CREATE TABLE orders (
        id INT PRIMARY KEY,
        user_id INT,
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
    );

---

# 15. ON DELETE CASCADE

Agar parent record delete hota hai, related child records bhi delete ho sakte hain.

Example:

    User
      |
      └── Orders

User delete:

    User → Deleted
    Related Orders → Deleted

Carefully use karna chahiye because accidental deletion ho sakti hai.

---

# 16. ON DELETE SET NULL

Parent record delete hone par Foreign Key column ko NULL set kiya ja sakta hai.

Example:

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE SET NULL

Iske liye `user_id` NULL allow karna chahiye.

---

# 17. ON DELETE RESTRICT

Parent record ko delete/update karne se prevent kar sakta hai jab dependent child records exist karte hain.

Example:

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE RESTRICT

---

# 18. ON UPDATE CASCADE

Parent key update hone par related Foreign Key values automatically update ho sakti hain.

Example:

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON UPDATE CASCADE

---

# 19. Primary Key Example

    CREATE TABLE employees (
        employee_id INT PRIMARY KEY,
        name VARCHAR(100),
        email VARCHAR(150)
    );

Yahan:

    employee_id → Primary Key

Har employee ka employee_id unique hoga.

---

# 20. Foreign Key Example

    CREATE TABLE departments (
        id INT PRIMARY KEY,
        name VARCHAR(100)
    );

    CREATE TABLE employees (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        department_id INT,
        FOREIGN KEY (department_id)
        REFERENCES departments(id)
    );

Relationship:

    departments.id
          ↑
          |
    employees.department_id

---

# 21. Composite Primary Key Example

    CREATE TABLE order_items (
        order_id INT,
        product_id INT,
        quantity INT,

        PRIMARY KEY (order_id, product_id)
    );

Yahan:

    order_id + product_id

milkar unique record identify karte hain.

---

# 22. Multiple Keys Example

    CREATE TABLE users (
        id INT PRIMARY KEY AUTO_INCREMENT,
        email VARCHAR(150) UNIQUE,
        phone VARCHAR(15) UNIQUE,
        name VARCHAR(100)
    );

Yahan:

    id → Primary Key
    email → Unique Key
    phone → Unique Key

---

# 23. Key Relationships

One-to-One:

    User → Profile

One-to-Many:

    User → Orders

Many-to-Many:

    Students → Courses

Many-to-many mein usually junction/bridge table use hoti hai.

Example:

    students
         |
         |
    student_courses
         |
         |
      courses

---

# 24. Junction Table Example

    CREATE TABLE students (
        id INT PRIMARY KEY,
        name VARCHAR(100)
    );

    CREATE TABLE courses (
        id INT PRIMARY KEY,
        name VARCHAR(100)
    );

    CREATE TABLE student_courses (
        student_id INT,
        course_id INT,

        PRIMARY KEY (student_id, course_id),

        FOREIGN KEY (student_id)
        REFERENCES students(id),

        FOREIGN KEY (course_id)
        REFERENCES courses(id)
    );

Yahan:

    student_id → Foreign Key
    course_id → Foreign Key

Aur:

    student_id + course_id → Composite Primary Key

---

# 25. Primary Key Rules

Primary Key:

- Unique honi chahiye.
- NULL nahi ho sakti.
- Ek table mein normally ek PRIMARY KEY constraint hota hai.
- Single ya multiple columns ki ho sakti hai.
- Stable identifier choose karna generally better hai.

---

# 26. Foreign Key Rules

Foreign Key:

- Tables ke beech relationship establish karti hai.
- Parent table ki referenced key ko point karti hai.
- Referential integrity maintain karne mein help karti hai.
- Same type/compatible definition rakhna important hai.
- NULL allowed ho sakta hai, agar relationship optional ho.

---

# 27. Unique Key Rules

UNIQUE:

- Duplicate values prevent karta hai.
- Multiple UNIQUE constraints ho sakte hain.
- NULL handling DBMS-specific hai.
- MySQL mein UNIQUE column generally multiple NULL values allow kar sakta hai.

Example:

    email VARCHAR(150) UNIQUE

---

# 28. Key Summary Table

| Key | Purpose |
|-----|---------|
| Primary Key | Row ko uniquely identify karna |
| Foreign Key | Tables ke beech relationship |
| Candidate Key | Possible minimal unique key |
| Super Key | Row ko uniquely identify karne wala any attribute set |
| Alternate Key | Candidate key jo Primary Key nahi bani |
| Composite Key | Multiple columns se bani key |
| Unique Key | Duplicate values prevent karna |
| Natural Key | Real-world meaningful identifier |
| Surrogate Key | Artificial/system-generated identifier |

---

# 29. Most Important Differences

## Primary Key vs Foreign Key

| Primary Key | Foreign Key |
|-------------|-------------|
| Record ko uniquely identify karti hai | Tables ko connect karti hai |
| Unique | Duplicate values allowed ho sakti hain |
| NULL allowed nahi | NULL allowed ho sakta hai |
| Parent table mein commonly | Child table mein commonly |

---

## Primary Key vs Candidate Key

Candidate Keys:

    Possible unique keys

Primary Key:

    Selected candidate key

Example:

    id
    email

Dono candidate keys ho sakti hain.

Agar:

    id → Primary Key

To email alternate key ho sakti hai.

---

## Super Key vs Candidate Key

Super Key:

    Unique + Extra columns allowed

Candidate Key:

    Unique + Minimal

Example:

    {id} → Candidate Key

    {id, name} → Super Key

---

## Primary Key vs Unique Key

Primary Key:

- Main identifier
- NULL not allowed
- Normally one per table

Unique:

- Additional uniqueness
- Multiple UNIQUE constraints possible
- MySQL mein NULL handling different hoti hai

---

# 30. Interview Questions

## Q1. Primary Key kya hai?

Primary Key table ke har record ko uniquely identify karti hai.

---

## Q2. Kya Primary Key NULL ho sakti hai?

Nahi.

Primary Key NULL allow nahi karti.

---

## Q3. Ek table mein kitni Primary Keys ho sakti hain?

Ek table mein normally ek PRIMARY KEY constraint hota hai.

Lekin wo multiple columns se milkar Composite Primary Key ho sakta hai.

---

## Q4. Foreign Key kya hai?

Foreign Key ek table ke column ko doosre table ki referenced key se connect karti hai aur referential integrity maintain karne mein help karti hai.

---

## Q5. Kya Foreign Key mein duplicate values ho sakti hain?

Haan.

Example:

Multiple orders same user_id ko reference kar sakte hain.

---

## Q6. Kya Foreign Key NULL ho sakti hai?

Haan, agar column NULL allow karta hai aur relationship optional hai.

---

## Q7. Candidate Key kya hai?

Candidate Key ek minimal column/column combination hai jo row ko uniquely identify kar sakta hai.

---

## Q8. Alternate Key kya hai?

Candidate Keys mein se jo Primary Key select nahi hoti, use Alternate Key kehte hain.

---

## Q9. Composite Key kya hai?

Jab multiple columns milkar record ko uniquely identify karte hain, use Composite Key kehte hain.

---

## Q10. Super Key kya hai?

Koi bhi column/column combination jo row ko uniquely identify kar sake, Super Key hai.

---

## Q11. Unique Key kya hai?

UNIQUE constraint duplicate values ko prevent karta hai.

---

## Q12. Primary Key aur Unique Key mein difference?

Primary Key main row identifier hoti hai aur NULL allowed nahi hota.

UNIQUE additional uniqueness enforce karta hai aur MySQL mein NULL handling Primary Key se different hoti hai.

---

## Q13. Natural Key kya hai?

Real-world meaningful unique identifier ko Natural Key kehte hain.

Example:

    email
    employee_code

---

## Q14. Surrogate Key kya hai?

System-generated/artificial identifier ko Surrogate Key kehte hain.

Example:

    id INT AUTO_INCREMENT PRIMARY KEY

---

## Q15. Composite Primary Key kya hai?

Jab Primary Key multiple columns se milkar bani ho.

Example:

    PRIMARY KEY (student_id, course_id)

---

## Q16. ON DELETE CASCADE kya karta hai?

Parent record delete hone par related child records automatically delete kar sakta hai.

---

## Q17. Many-to-Many relationship mein kya use karte hain?

Junction/bridge table use karte hain.

Example:

    students
    student_courses
    courses

---

# ⭐ QUICK REVISION

Primary Key
→ Row ko uniquely identify karta hai

Foreign Key
→ Tables ko connect karta hai

Candidate Key
→ Possible minimal unique key

Super Key
→ Any unique identifying attribute set

Alternate Key
→ Candidate Key jo Primary Key nahi bani

Composite Key
→ Multiple columns ki key

Unique Key
→ Duplicate values prevent karta hai

Natural Key
→ Real-world identifier

Surrogate Key
→ Artificial/system-generated identifier

---

# ⭐ ONE-LINE INTERVIEW REVISION

1. Primary Key uniquely identifies each row.

2. Primary Key cannot contain NULL.

3. A table normally has one PRIMARY KEY constraint.

4. Composite Primary Key can contain multiple columns.

5. Foreign Key creates/maintains a relationship between tables.

6. Foreign Key can contain duplicate values.

7. Foreign Key can be NULL when the relationship is optional.

8. Candidate Key is a minimal unique identifier.

9. Primary Key is selected from Candidate Keys.

10. Alternate Key is a Candidate Key that was not selected as Primary Key.

11. Super Key can contain extra attributes.

12. Candidate Key must be minimal.

13. Composite Key contains multiple columns.

14. UNIQUE prevents duplicate values.

15. A table can have multiple UNIQUE constraints.

16. Natural Key has real-world meaning.

17. Surrogate Key is system-generated/artificial.

18. AUTO_INCREMENT is an attribute, not a key.

19. ON DELETE CASCADE can delete related child records.

20. Many-to-Many relationships generally use a junction table.

---

# ⭐ MOST IMPORTANT INTERVIEW ANSWER

If interviewer asks:

"Explain SQL Keys."

Answer:

SQL Keys are used to uniquely identify records, maintain data integrity and establish relationships between tables.

The main keys are Primary Key, Foreign Key, Candidate Key, Super Key, Alternate Key, Composite Key and Unique Key.

Primary Key uniquely identifies a row and cannot contain NULL.

Foreign Key connects one table with another table and helps maintain referential integrity.

Candidate Key is a minimal unique key, and the selected Candidate Key becomes the Primary Key.

A Candidate Key that is not selected as Primary Key is called an Alternate Key.

A Composite Key contains multiple columns.

A Super Key can uniquely identify a row but may contain extra attributes.

UNIQUE constraint prevents duplicate values in a column or column combination.