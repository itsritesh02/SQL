# SQL Data Types – Interview Notes

SQL Data Types define karte hain ki database table ke kisi column mein kis type ka data store hoga.

---

## 1. Numeric Data Types

### INT / INTEGER

Whole numbers store karne ke liye use hota hai.

Example:

    age INT;
    salary INT;

Use cases:
- Age
- Quantity
- Normal IDs
- Counts

---

### BIGINT

Bahut bade whole numbers store karne ke liye.

Example:

    user_id BIGINT;

Use cases:
- Large IDs
- Very large numbers

---

### SMALLINT

Small range ke whole numbers ke liye.

Example:

    quantity SMALLINT;

---

### DECIMAL / NUMERIC

Exact decimal values store karne ke liye.

Mostly money, salary aur price ke liye use hota hai.

Example:

    salary DECIMAL(10,2);

DECIMAL(10,2) ka meaning:

- 10 = Total digits
- 2 = Decimal ke baad digits

Example:

    99999999.99

Interview Point:

Money ke liye generally DECIMAL prefer kiya jata hai because exact precision important hoti hai.

---

### FLOAT

Approximate decimal values ke liye use hota hai.

Example:

    rating FLOAT;

---

### DOUBLE

Approximate decimal values ke liye use hota hai aur FLOAT se higher precision provide kar sakta hai.

---

# 2. Character / String Data Types

## CHAR(n)

Fixed-length string store karta hai.

Example:

    gender CHAR(1);

Values:

    M
    F

Example:

    code CHAR(10);

CHAR fixed length ke data ke liye useful hai.

---

## VARCHAR(n)

Variable-length string store karta hai.

Example:

    name VARCHAR(100);
    email VARCHAR(150);

VARCHAR most commonly used string data type hai.

Use cases:

- Name
- Email
- Phone
- Address
- Username

Interview Point:

CHAR = Fixed Length

VARCHAR = Variable Length

---

## TEXT

Large amount of text store karne ke liye use hota hai.

Example:

    description TEXT;

Use cases:

- Product description
- Blog content
- Long messages
- Articles

---

# 3. Date & Time Data Types

## DATE

Sirf date store karta hai.

Example:

    dob DATE;

Format:

    2026-08-30

---

## TIME

Sirf time store karta hai.

Example:

    login_time TIME;

Format:

    14:30:00

---

## DATETIME

Date aur time dono store karta hai.

Example:

    created_at DATETIME;

Format:

    2026-08-30 14:30:00

---

## TIMESTAMP

Date aur time store karta hai.

Commonly record creation/update time ke liye use hota hai.

Example:

    created_at TIMESTAMP;

Format:

    2026-08-30 14:30:00

Interview Point:

DATE = Only Date

TIME = Only Time

DATETIME = Date + Time

TIMESTAMP = Date + Time

Exact behavior database system ke according different ho sakta hai.

---

# 4. Boolean Data Type

## BOOLEAN / BOOL

True ya False values store karne ke liye use hota hai.

Example:

    is_active BOOLEAN;

Values:

    TRUE
    FALSE

Common examples:

    is_verified BOOLEAN;
    is_admin BOOLEAN;
    is_active BOOLEAN;

---

# 5. Binary Data Types

## BINARY

Fixed-length binary data store karta hai.

Example:

    data BINARY(10);

---

## VARBINARY

Variable-length binary data store karta hai.

Example:

    data VARBINARY(255);

---

## BLOB

Large binary data store karne ke liye.

Example:

    image BLOB;

---

# CHAR vs VARCHAR

| CHAR | VARCHAR |
|------|---------|
| Fixed length | Variable length |
| Fixed-size data ke liye | Variable-size data ke liye |
| CHAR(10) | VARCHAR(100) |
| Extra unused space ho sakta hai | Actual data length ke according storage |

Example:

    gender CHAR(1);
    name VARCHAR(100);

Interview Answer:

CHAR fixed-length string store karta hai, jabki VARCHAR variable-length string store karta hai.

---

# VARCHAR vs TEXT

| VARCHAR | TEXT |
|---------|------|
| Maximum length define karte hain | Large text ke liye |
| VARCHAR(100) | TEXT |
| Names, emails etc. | Description, articles etc. |

---

# INT vs BIGINT

| INT | BIGINT |
|-----|--------|
| Normal integers | Very large integers |
| Less storage | More storage |
| Normal IDs/numbers | Large IDs/numbers |

---

# DECIMAL vs FLOAT

| DECIMAL | FLOAT |
|---------|-------|
| Exact value | Approximate value |
| Money ke liye preferred | Approximate calculations |
| Precision important | Scientific/measurement use cases |

Interview Answer:

Money ke liye DECIMAL use karna better hota hai because DECIMAL exact numeric values store karne ke liye designed hai.

---

# Common SQL Data Types

| Data Type | Use |
|-----------|-----|
| INT | Whole numbers |
| BIGINT | Large whole numbers |
| SMALLINT | Small whole numbers |
| DECIMAL | Exact decimal values |
| FLOAT | Approximate decimal values |
| DOUBLE | Higher precision approximate values |
| CHAR | Fixed-length string |
| VARCHAR | Variable-length string |
| TEXT | Large text |
| DATE | Date |
| TIME | Time |
| DATETIME | Date + Time |
| TIMESTAMP | Date + Time |
| BOOLEAN | True / False |
| BINARY | Fixed binary data |
| VARBINARY | Variable binary data |
| BLOB | Large binary data |

---

# Example Table

    CREATE TABLE users (
        id BIGINT,
        name VARCHAR(100),
        email VARCHAR(150),
        age INT,
        salary DECIMAL(10,2),
        is_active BOOLEAN,
        dob DATE,
        created_at TIMESTAMP
    );

Is table mein:

id → BIGINT

name → VARCHAR

email → VARCHAR

age → INT

salary → DECIMAL

is_active → BOOLEAN

dob → DATE

created_at → TIMESTAMP

---

# Interview Questions

## Q1. SQL Data Type kya hota hai?

Data Type define karta hai ki kisi database column mein kis type ka data store kiya ja sakta hai.

---

## Q2. CHAR aur VARCHAR mein difference?

CHAR fixed-length hota hai, jabki VARCHAR variable-length hota hai.

---

## Q3. VARCHAR ka use kahan hota hai?

VARCHAR variable-length strings ke liye use hota hai.

Examples:

- Name
- Email
- Username
- Address

---

## Q4. Money ke liye kaunsa data type use karna chahiye?

Generally DECIMAL use karna preferred hota hai because money ke case mein exact precision important hoti hai.

---

## Q5. DATE aur DATETIME mein difference?

DATE sirf date store karta hai.

Example:

    2026-08-30

DATETIME date aur time dono store karta hai.

Example:

    2026-08-30 14:30:00

---

## Q6. BOOLEAN ka use kya hai?

TRUE/FALSE values store karne ke liye.

Example:

    is_admin BOOLEAN;

---

## Q7. BIGINT ka use kab karte hain?

Jab normal INT ki range se bahut bade integer values store karne ki requirement ho.

---

## Q8. DECIMAL(10,2) ka kya meaning hai?

10 total digits represent karta hai aur 2 decimal point ke baad digits represent karta hai.

Example:

    12345678.99

---

## Q9. TEXT ka use kab karte hain?

Jab large amount of text store karna ho.

Example:

    description TEXT;

---

## Q10. SQL mein most commonly used string data type kaunsa hai?

VARCHAR commonly used string data type hai.

---

# Quick Revision

INT → Whole Number

BIGINT → Large Whole Number

SMALLINT → Small Whole Number

DECIMAL → Exact Decimal

FLOAT → Approximate Decimal

DOUBLE → Higher Precision Approximate Decimal

CHAR → Fixed-Length String

VARCHAR → Variable-Length String

TEXT → Large Text

DATE → Date Only

TIME → Time Only

DATETIME → Date + Time

TIMESTAMP → Date + Time

BOOLEAN → True / False

BINARY → Fixed Binary Data

VARBINARY → Variable Binary Data

BLOB → Large Binary Data

---

# ⭐ Interview One-Liners

1. CHAR is fixed-length, VARCHAR is variable-length.

2. DECIMAL is preferred for monetary values.

3. INT stores whole numbers.

4. BIGINT is used for very large integer values.

5. DATE stores only date.

6. TIME stores only time.

7. DATETIME stores date and time.

8. BOOLEAN stores True/False values.

9. TEXT is used for large text.

10. BLOB is used for large binary data.