# SQL DATA TYPES — COMPLETE INTERVIEW NOTES

SQL Data Type define karta hai ki database table ke kisi column mein kis type ka data store hoga.

Example:

CREATE TABLE users (
    id BIGINT,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10,2),
    is_active BOOLEAN,
    dob DATE,
    created_at TIMESTAMP
);

---

# PART 1 — BASIC SQL DATA TYPES

## 1. Numeric Data Types

Numeric data types numbers store karne ke liye use hote hain.

### TINYINT

Small integer values ke liye.

Example:

    age TINYINT;

MySQL mein BOOLEAN/BOOL internally TINYINT(1) ka synonym hai.

Example:

    is_active TINYINT(1);

Usually:

    0 = FALSE
    1 = TRUE

---

### SMALLINT

TINYINT se larger range ke integers ke liye.

Example:

    quantity SMALLINT;

---

### MEDIUMINT

SMALLINT se larger aur INT se smaller range ke integers ke liye.

Example:

    value MEDIUMINT;

---

### INT / INTEGER

Normal whole numbers ke liye.

Example:

    id INT;
    age INT;
    quantity INT;

Values:

    10
    100
    5000
    -20

Common Uses:

- Age
- Quantity
- Count
- Normal IDs

---

### BIGINT

Very large integer values ke liye.

Example:

    user_id BIGINT;

Common Uses:

- Large IDs
- Large counters
- Very large numbers

Interview:

INT = Normal integer

BIGINT = Very large integer

---

# 2. Exact Numeric Types

## DECIMAL

Exact decimal values store karne ke liye.

Mostly:

- Salary
- Price
- Money
- Financial calculations

ke liye use hota hai.

Example:

    salary DECIMAL(10,2);

DECIMAL(10,2):

10 = Total digits

2 = Decimal ke baad digits

Example:

    12345678.99

---

## NUMERIC

NUMERIC generally DECIMAL ka synonym/alternative hai.

Example:

    price NUMERIC(10,2);

Interview:

DECIMAL/NUMERIC exact numeric values ke liye use hote hain.

---

# 3. Approximate Numeric Types

## FLOAT

Approximate decimal values ke liye.

Example:

    rating FLOAT;

Use:

- Measurements
- Scientific data
- Approximate calculations

---

## DOUBLE

FLOAT se higher precision approximate values ke liye.

Example:

    distance DOUBLE;

Interview:

DECIMAL = Exact

FLOAT / DOUBLE = Approximate

---

## REAL

REAL approximate numeric type hai.

MySQL mein REAL ka behavior SQL mode ke according FLOAT ya DOUBLE se related ho sakta hai.

Interview ke liye basic concept:

REAL = Approximate numeric value

---

# 4. String / Character Data Types

String data types text store karne ke liye use hote hain.

Main types:

- CHAR
- VARCHAR
- TEXT

---

## CHAR

Fixed-length string store karta hai.

Syntax:

    CHAR(n)

Example:

    gender CHAR(1);

    country_code CHAR(2);

Use:

- Fixed-length codes
- Country codes
- Status codes

Interview:

CHAR = Fixed Length

---

## VARCHAR

Variable-length string store karta hai.

Syntax:

    VARCHAR(n)

Example:

    name VARCHAR(100);

    email VARCHAR(150);

    username VARCHAR(50);

Common Uses:

- Name
- Email
- Username
- Address
- Phone
- Product name

Interview:

VARCHAR = Variable Length

---

# 5. TEXT Types

MySQL mein TEXT ke multiple variants hain.

- TINYTEXT
- TEXT
- MEDIUMTEXT
- LONGTEXT

---

## TINYTEXT

Small text ke liye.

Example:

    short_description TINYTEXT;

---

## TEXT

Normal large text ke liye.

Example:

    description TEXT;

---

## MEDIUMTEXT

TEXT se larger text ke liye.

Example:

    article MEDIUMTEXT;

---

## LONGTEXT

Very large text ke liye.

Example:

    content LONGTEXT;

---

# 6. CHAR vs VARCHAR

| CHAR | VARCHAR |
|------|---------|
| Fixed length | Variable length |
| Fixed-size values ke liye | Variable-size strings ke liye |
| CHAR(10) | VARCHAR(100) |
| Fixed-length behavior | Actual string length ke according |

Example:

    gender CHAR(1);

    name VARCHAR(100);

Interview Answer:

CHAR fixed-length string store karta hai, jabki VARCHAR variable-length string store karta hai.

---

# 7. VARCHAR vs TEXT

| VARCHAR | TEXT |
|---------|------|
| Maximum length define karte hain | Large text ke liye |
| VARCHAR(100) | TEXT |
| Names/emails ke liye | Articles/descriptions ke liye |
| Normal strings | Large content |

---

# 8. Date and Time Data Types

Important MySQL date/time types:

- DATE
- TIME
- DATETIME
- TIMESTAMP
- YEAR

---

## DATE

Only date store karta hai.

Format:

    YYYY-MM-DD

Example:

    dob DATE;

Value:

    2003-12-29

Use:

- DOB
- Joining date
- Order date
- Birthday

---

## TIME

Only time store karta hai.

Format:

    HH:MM:SS

Example:

    login_time TIME;

Value:

    14:30:00

---

## DATETIME

Date + time store karta hai.

Example:

    created_at DATETIME;

Value:

    2026-08-30 14:30:00

Use:

- Appointment
- Created time
- Updated time

---

## TIMESTAMP

Date + time store karta hai.

Example:

    created_at TIMESTAMP;

Commonly:

- created_at
- updated_at
- Audit timestamps

ke liye use hota hai.

---

## YEAR

Year store karne ke liye.

Example:

    birth_year YEAR;

Value:

    2003

Use:

- Birth year
- Manufacturing year

---

# 9. DATE vs DATETIME

| DATE | DATETIME |
|------|----------|
| Only date | Date + time |
| 2026-08-30 | 2026-08-30 14:30:00 |
| DOB ke liye useful | Created time ke liye useful |

---

# 10. DATETIME vs TIMESTAMP

| DATETIME | TIMESTAMP |
|----------|-----------|
| Date + time | Date + time |
| Wider date range | MySQL mein narrower range |
| Time-zone conversion generally nahi | Time-zone conversion behavior hota hai |
| Application date/time ke liye useful | Created/updated timestamps ke liye common |

Important:

Exact behavior database system ke according change ho sakta hai.

---

# 11. BOOLEAN / BOOL

True/False values represent karne ke liye.

Example:

    is_active BOOLEAN;

    is_admin BOOLEAN;

    is_verified BOOLEAN;

MySQL mein BOOLEAN/BOOL TINYINT(1) ka synonym hai.

Usually:

    TRUE = 1
    FALSE = 0

---

# 12. ENUM

Predefined values mein se ek value store karne ke liye.

Example:

    status ENUM('pending', 'approved', 'rejected');

Allowed:

    pending
    approved
    rejected

Interview:

ENUM = One value from predefined options

---

# 13. SET

Predefined values mein se multiple values store kar sakta hai.

Example:

    skills SET('Java', 'React', 'Node');

Possible:

    Java,React

Interview:

ENUM = One value

SET = Multiple values

Note:

Flexible many-to-many data ke liye separate related table often better design hoti hai.

---

# PART 2 — ADVANCED SQL DATA TYPES

# 14. Binary Data Types

Binary data ke liye:

- BINARY
- VARBINARY
- BLOB

use hote hain.

---

## BINARY

Fixed-length binary data.

Example:

    code BINARY(10);

---

## VARBINARY

Variable-length binary data.

Example:

    data VARBINARY(255);

---

# 15. BLOB Types

BLOB = Binary Large Object

MySQL mein:

- TINYBLOB
- BLOB
- MEDIUMBLOB
- LONGBLOB

---

## TINYBLOB

Small binary data.

Example:

    data TINYBLOB;

---

## BLOB

Binary data.

Example:

    file_data BLOB;

---

## MEDIUMBLOB

Larger binary data.

Example:

    file_data MEDIUMBLOB;

---

## LONGBLOB

Very large binary data.

Example:

    file_data LONGBLOB;

Practical Point:

Real-world applications mein large images/files ko database mein directly store karne ke bajay cloud/object storage mein rakhna aur database mein URL/path store karna often preferred hota hai.

---

# 16. JSON Data Type

JSON structured/semi-structured data store karne ke liye.

Example:

    profile JSON;

Data:

    {
        "name": "Ritesh",
        "age": 22,
        "skills": ["React", "Node", "MongoDB"]
    }

Use:

- Flexible attributes
- API-like data
- Semi-structured information

Important:

JSON relational database design ka complete replacement nahi hai.

---

# 17. Spatial Data Types

Location/geographical data ke liye spatial types use hote hain.

Important types:

- POINT
- LINESTRING
- POLYGON
- GEOMETRY

---

## POINT

Single geographic point.

Example:

    location POINT;

Use:

- GPS coordinates
- User location
- Store location

---

## LINESTRING

Multiple connected points ki line represent karta hai.

Use:

- Roads
- Routes
- Paths

---

## POLYGON

Closed geographical area represent karta hai.

Use:

- Areas
- Regions
- Boundaries

---

## GEOMETRY

General spatial data type.

Different geometric objects represent kar sakta hai.

---

# 18. UNSIGNED

UNSIGNED MySQL mein numeric types ke saath use hone wala attribute hai.

Ye negative values ko allow nahi karta.

Example:

    age INT UNSIGNED;

    quantity INT UNSIGNED;

Agar value negative nahi honi chahiye to UNSIGNED useful ho sakta hai.

Important:

UNSIGNED data type nahi hai.

Ye numeric column attribute hai.

---

# 19. AUTO_INCREMENT

AUTO_INCREMENT data type nahi hai.

Ye MySQL column attribute hai jo integer value ko automatically increase karta hai.

Example:

    id INT AUTO_INCREMENT PRIMARY KEY;

Automatically:

    1
    2
    3
    4
    5

Usually IDs ke liye use hota hai.

---

# 20. ZEROFILL

ZEROFILL MySQL ka display-related attribute hai.

Example:

    id INT ZEROFILL;

Modern applications mein formatting ke liye application logic generally better approach hoti hai.

Important:

ZEROFILL data type nahi hai.

---

# 21. Precision and Scale

DECIMAL(P,S) mein:

P = Precision

S = Scale

Example:

    DECIMAL(10,2)

Meaning:

10 = Total digits

2 = Decimal ke baad digits

Example:

    12345678.99

---

# 22. Signed vs Unsigned

Signed:

Positive aur negative values allow kar sakta hai.

Unsigned:

Negative values allow nahi karta.

Example:

    age INT UNSIGNED;

Age negative nahi honi chahiye.

---

# 23. Numeric Data Types Quick Comparison

| Type | Use |
|------|-----|
| TINYINT | Very small integers |
| SMALLINT | Small integers |
| MEDIUMINT | Medium range integers |
| INT | Normal integers |
| BIGINT | Very large integers |
| DECIMAL | Exact decimals |
| NUMERIC | Exact decimals |
| FLOAT | Approximate decimals |
| DOUBLE | Higher precision approximate values |
| REAL | Approximate numeric values |

---

# 24. String Data Types Quick Comparison

| Type | Use |
|------|-----|
| CHAR | Fixed-length strings |
| VARCHAR | Variable-length strings |
| TINYTEXT | Small text |
| TEXT | Large text |
| MEDIUMTEXT | Larger text |
| LONGTEXT | Very large text |

---

# 25. Binary Data Types Quick Comparison

| Type | Use |
|------|-----|
| BINARY | Fixed binary data |
| VARBINARY | Variable binary data |
| TINYBLOB | Small binary data |
| BLOB | Binary data |
| MEDIUMBLOB | Larger binary data |
| LONGBLOB | Very large binary data |

---

# 26. Date/Time Data Types Quick Comparison

| Type | Use |
|------|-----|
| DATE | Date only |
| TIME | Time only |
| DATETIME | Date + time |
| TIMESTAMP | Date + time/timestamps |
| YEAR | Year |

---

# 27. Special Data Types

| Type | Use |
|------|-----|
| BOOLEAN | True/False |
| ENUM | One predefined value |
| SET | Multiple predefined values |
| JSON | Structured JSON data |
| POINT | Geographic point |
| LINESTRING | Geographic line |
| POLYGON | Geographic area |
| GEOMETRY | General spatial data |

---

# 28. Real-World Users Table

    CREATE TABLE users (
        id BIGINT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(150) NOT NULL,
        password VARCHAR(255) NOT NULL,
        age INT UNSIGNED,
        salary DECIMAL(10,2),
        is_active BOOLEAN DEFAULT TRUE,
        gender ENUM('Male', 'Female', 'Other'),
        dob DATE,
        profile JSON,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

Explanation:

    id → BIGINT
    name → VARCHAR
    email → VARCHAR
    password → VARCHAR
    age → INT UNSIGNED
    salary → DECIMAL
    is_active → BOOLEAN
    gender → ENUM
    dob → DATE
    profile → JSON
    created_at → TIMESTAMP

---

# 29. E-Commerce Example

    CREATE TABLE products (
        id BIGINT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(150),
        description TEXT,
        price DECIMAL(10,2),
        stock INT UNSIGNED,
        is_available BOOLEAN,
        metadata JSON,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

Data Types:

    id → BIGINT
    name → VARCHAR
    description → TEXT
    price → DECIMAL
    stock → INT UNSIGNED
    is_available → BOOLEAN
    metadata → JSON
    created_at → TIMESTAMP

---

# 30. Which Data Type Should I Use?

Age:

    INT

Large ID:

    BIGINT

Product Name:

    VARCHAR

Email:

    VARCHAR

Username:

    VARCHAR

Password Hash:

    VARCHAR

Product Description:

    TEXT

Price:

    DECIMAL

Quantity:

    INT UNSIGNED

Active/Inactive:

    BOOLEAN

Date of Birth:

    DATE

Created Time:

    TIMESTAMP

Appointment Date + Time:

    DATETIME

Year:

    YEAR

Flexible Structured Data:

    JSON

GPS Location:

    POINT

---

# 31. Important Interview Differences

## INT vs BIGINT

INT:

- Normal integer values
- Commonly used

BIGINT:

- Very large integer values
- Large IDs/counters

---

## DECIMAL vs FLOAT

DECIMAL:

- Exact
- Money/financial data
- Precision important

FLOAT:

- Approximate
- Scientific/measurement use cases

Interview:

Money ke liye DECIMAL generally preferred hai.

---

## CHAR vs VARCHAR

CHAR:

- Fixed length

VARCHAR:

- Variable length

Interview:

CHAR fixed-length hota hai, VARCHAR variable-length hota hai.

---

## VARCHAR vs TEXT

VARCHAR:

- Normal strings
- Maximum length specify karte hain

TEXT:

- Large text content

---

## DATE vs DATETIME

DATE:

    2026-08-30

DATETIME:

    2026-08-30 14:30:00

DATE = Only Date

DATETIME = Date + Time

---

## DATETIME vs TIMESTAMP

DATETIME:

- Date + time
- Wider range in MySQL
- Generally literal date-time value

TIMESTAMP:

- Date + time
- Time-zone conversion behavior
- Created/updated timestamps ke liye common

---

## ENUM vs SET

ENUM:

    One predefined value

SET:

    Multiple predefined values

---

# 32. Common Mistakes

## Mistake 1

Money ke liye FLOAT use karna.

Better:

    DECIMAL(10,2)

---

## Mistake 2

Har string ke liye TEXT use karna.

Normal strings ke liye:

    VARCHAR

Large text ke liye:

    TEXT

---

## Mistake 3

AUTO_INCREMENT ko data type samajhna.

Wrong:

    AUTO_INCREMENT = Data Type

Correct:

    AUTO_INCREMENT = Column Attribute

---

## Mistake 4

BOOLEAN ko MySQL mein completely independent storage type samajhna.

MySQL mein:

    BOOLEAN = TINYINT(1) synonym

---

## Mistake 5

Har image ko database BLOB mein store karna.

Large files ke liye application architecture mein object/cloud storage + database URL/path often better hota hai.

---

# 33. Interview Questions

## Q1. SQL Data Type kya hota hai?

Data Type define karta hai ki database column mein kis type ka data store kiya ja sakta hai.

---

## Q2. SQL ke main data type categories kya hain?

Main categories:

- Numeric
- String
- Date/Time
- Boolean
- Binary
- JSON
- ENUM/SET
- Spatial

---

## Q3. CHAR aur VARCHAR mein difference?

CHAR fixed-length string store karta hai.

VARCHAR variable-length string store karta hai.

---

## Q4. Money ke liye kaunsa data type use karna chahiye?

Generally DECIMAL.

Reason:

Money mein exact precision important hoti hai.

---

## Q5. DECIMAL(10,2) ka meaning?

10 total digits hain.

2 digits decimal ke baad hain.

---

## Q6. INT aur BIGINT mein difference?

INT normal integer values ke liye.

BIGINT very large integer values ke liye.

---

## Q7. DATE aur DATETIME mein difference?

DATE:

Only date.

DATETIME:

Date + time.

---

## Q8. DATETIME aur TIMESTAMP mein difference?

Dono date + time store karte hain.

MySQL mein TIMESTAMP time-zone conversion behavior rakhta hai, jabki DATETIME generally date-time value ko literal form mein represent karta hai.

---

## Q9. BOOLEAN kya hai?

True/False values represent karne ke liye.

MySQL mein BOOLEAN TINYINT(1) ka synonym hai.

---

## Q10. ENUM kya hai?

ENUM predefined options mein se ek value store karne ke liye use hota hai.

Example:

    status ENUM('pending', 'approved', 'rejected');

---

## Q11. SET kya hai?

SET predefined options mein se multiple values store karne ke liye use hota hai.

---

## Q12. JSON Data Type kya hai?

JSON structured/semi-structured data store karne ke liye use hota hai.

---

## Q13. BLOB kya hai?

BLOB ka meaning Binary Large Object hai.

Binary data store karne ke liye use hota hai.

---

## Q14. UNSIGNED kya hai?

UNSIGNED negative numeric values ko allow nahi karta.

Example:

    age INT UNSIGNED;

---

## Q15. AUTO_INCREMENT kya hai?

AUTO_INCREMENT data type nahi hai.

Ye MySQL column attribute hai jo integer values ko automatically increment karta hai.

---

## Q16. Precision aur Scale kya hain?

Precision = Total digits

Scale = Decimal ke baad digits

Example:

    DECIMAL(10,2)

Precision = 10

Scale = 2

---

## Q17. FLOAT aur DOUBLE mein difference?

Dono approximate floating-point values store karte hain.

DOUBLE generally FLOAT se higher precision provide karta hai.

---

## Q18. JSON kab use karna chahiye?

Jab data semi-structured/flexible ho aur JSON querying ki requirement ho.

Lekin relational data ko unnecessarily JSON mein store nahi karna chahiye.

---

# 34. Quick Revision

TINYINT
→ Very small integer

SMALLINT
→ Small integer

MEDIUMINT
→ Medium range integer

INT
→ Normal integer

BIGINT
→ Very large integer

DECIMAL
→ Exact decimal

NUMERIC
→ Exact decimal

FLOAT
→ Approximate decimal

DOUBLE
→ Higher precision approximate decimal

REAL
→ Approximate numeric

CHAR
→ Fixed-length string

VARCHAR
→ Variable-length string

TINYTEXT
→ Small text

TEXT
→ Large text

MEDIUMTEXT
→ Larger text

LONGTEXT
→ Very large text

DATE
→ Date only

TIME
→ Time only

DATETIME
→ Date + time

TIMESTAMP
→ Date + time/timestamp

YEAR
→ Year

BOOLEAN
→ True/False

BINARY
→ Fixed binary data

VARBINARY
→ Variable binary data

TINYBLOB
→ Small binary data

BLOB
→ Binary large object

MEDIUMBLOB
→ Larger binary object

LONGBLOB
→ Very large binary object

ENUM
→ One predefined value

SET
→ Multiple predefined values

JSON
→ Structured/semi-structured JSON

POINT
→ Geographic point

LINESTRING
→ Geographic line

POLYGON
→ Geographic area

GEOMETRY
→ General spatial data

---

# ⭐ TOP INTERVIEW ONE-LINERS

1. CHAR is fixed-length, VARCHAR is variable-length.

2. DECIMAL is preferred for exact monetary values.

3. INT stores normal whole numbers.

4. BIGINT stores very large integer values.

5. DATE stores only date.

6. TIME stores only time.

7. DATETIME stores date and time.

8. TIMESTAMP is commonly used for created_at and updated_at.

9. BOOLEAN represents True/False values.

10. In MySQL, BOOLEAN is a synonym for TINYINT(1).

11. TEXT is used for large text.

12. ENUM stores one value from predefined options.

13. SET can store multiple predefined options.

14. BLOB stores binary data.

15. JSON stores structured/semi-structured JSON data.

16. DECIMAL is exact, FLOAT/DOUBLE are approximate.

17. AUTO_INCREMENT is an attribute, not a data type.

18. UNSIGNED is a numeric attribute, not a separate data type.

19. CHAR is useful for fixed-length values.

20. VARCHAR is commonly used for names, emails and usernames.

21. DATE is useful for DOB when time is not required.

22. TIMESTAMP is commonly used for record timestamps.

23. POINT is used for geographic locations.

24. ENUM is for one predefined option.

25. SET is for multiple predefined options.

---

# ⭐ MOST IMPORTANT FOR INTERVIEW

If interviewer asks:

"Explain SQL Data Types."

Answer:

SQL Data Types define what kind of data a column can store.

They can broadly be categorized into numeric, string, date/time, boolean, binary and special data types.

Numeric types include INT, BIGINT, DECIMAL, FLOAT and DOUBLE.

String types include CHAR, VARCHAR and TEXT.

Date/time types include DATE, TIME, DATETIME and TIMESTAMP.

BOOLEAN represents true/false values.

Special types include ENUM, SET, JSON and spatial types.

In practical applications, VARCHAR is commonly used for strings, INT/BIGINT for numbers and IDs, DECIMAL for money, DATE for dates, TIMESTAMP/DATETIME for timestamps and BOOLEAN for true/false values.