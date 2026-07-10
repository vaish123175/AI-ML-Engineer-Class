# SQL Basics Notes

## TRUNCATE vs DELETE vs DROP

### TRUNCATE
- Removes all records from a table.
- Does **not** require a `WHERE` clause.
- Faster than `DELETE` because it removes all rows at once.
- Table structure remains intact.

```sql
TRUNCATE TABLE employees;
```

### DELETE
- Removes records from a table.
- Can be used with a `WHERE` clause to delete specific rows.
- Table structure remains intact.

```sql
DELETE FROM employees
WHERE employee_id = 101;
```

### DROP
- Completely removes the table and its structure from the database.

```sql
DROP TABLE employees;
```

---

# Primary Key and Foreign Key

## Primary Key
- Uniquely identifies each record in a table.
- Cannot contain duplicate values.
- Cannot contain `NULL` values.
- A table can have only **one Primary Key constraint**.
- The Primary Key may consist of one or multiple columns (composite key).

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);
```

## Foreign Key
- Creates a relationship between two tables.
- References the Primary Key of another table.
- A table can have multiple Foreign Keys.

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);
```

---

# DQL (Data Query Language)

## SELECT Statement

Used to retrieve data from a table.

```sql
SELECT * FROM employees;
```

### Retrieve Specific Columns

```sql
SELECT employee_name, salary
FROM employees;
```

---

# DISTINCT

Used to retrieve unique values and remove duplicates.

```sql
SELECT DISTINCT department
FROM employees;
```

---

# WHERE Clause

Used to filter rows based on conditions.

```sql
SELECT *
FROM employees
WHERE salary > 50000;
```

---

# COUNT()

Used to count rows.

```sql
SELECT COUNT(*)
FROM employees;
```

---

# LIMIT

Restricts the number of rows returned.

```sql
SELECT *
FROM employees
LIMIT 5;
```

---

# Filtering with AND and OR

## AND

Returns rows only when all conditions are true.

```sql
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 50000;
```

## OR

Returns rows when at least one condition is true.

```sql
SELECT *
FROM employees
WHERE department = 'IT'
OR department = 'HR';
```

---

# Sorting Data

## ORDER BY

Used to sort records.

### Ascending Order (Default)

```sql
SELECT *
FROM employees
ORDER BY salary;
```

### Descending Order

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

---

# NOT Operator

Used to return the opposite of a condition.

```sql
SELECT *
FROM employees
WHERE NOT department = 'IT';
```

or

```sql
SELECT *
FROM employees
WHERE department != 'IT';
```

---

# Wildcards and LIKE Operator

Used for pattern matching.

## `%` Wildcard

Represents zero or more characters.

### Contains

```sql
SELECT *
FROM employees
WHERE employee_name LIKE '%john%';
```

### Starts With

```sql
SELECT *
FROM employees
WHERE employee_name LIKE 'john%';
```

### Ends With

```sql
SELECT *
FROM employees
WHERE employee_name LIKE '%john';
```

## `_` Wildcard

Represents exactly one character.

```sql
SELECT *
FROM employees
WHERE employee_name LIKE '_ohn';
```

---

# NULL Values

Used to represent missing or unknown data.

```sql
SELECT *
FROM employees
WHERE manager_id IS NULL;
```

```sql
SELECT *
FROM employees
WHERE manager_id IS NOT NULL;
```

---

# BETWEEN Operator

Used to filter values within a range.

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 30000 AND 60000;
```

---

# GROUP BY

Used to group rows that have the same values into summary rows.

```sql
SELECT department,
       COUNT(*) AS total_employees
FROM employees
GROUP BY department;
```

### Important Notes
- Used with aggregate functions such as:
  - `COUNT()`
  - `SUM()`
  - `AVG()`
  - `MIN()`
  - `MAX()`
- Every non-aggregated column in the `SELECT` statement should appear in the `GROUP BY` clause.

---

# HAVING Clause

Used to filter grouped (aggregated) data.

```sql
SELECT department,
       COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
```

### Important Notes
- `HAVING` is generally used with `GROUP BY`.
- `GROUP BY` can be used without `HAVING`.
- `HAVING` filters aggregated results.

---

# WHERE vs HAVING

| WHERE | HAVING |
|---------|---------|
| Filters rows before grouping | Filters groups after grouping |
| Works on individual rows | Works on aggregated data |
| Used before GROUP BY | Used after GROUP BY |

Example:

```sql
SELECT department,
       COUNT(*) AS total_employees
FROM employees
WHERE salary > 30000
GROUP BY department
HAVING COUNT(*) > 5;
```

---

# SQL Order of Execution

SQL executes clauses in the following order:

```text
FROM
→ WHERE
→ GROUP BY
→ HAVING
→ SELECT
→ ORDER BY
→ LIMIT
```

---

# Aliasing

Aliases provide temporary names for columns or tables.

```sql
SELECT department,
       COUNT(*) AS total_employees
FROM employees
GROUP BY department;
```

Aliases can also be used in `HAVING` in some SQL dialects:

```sql
SELECT department,
       COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING total_employees > 5;
```

---

# Quick Revision

- `SELECT` → Retrieve data
- `DISTINCT` → Remove duplicates
- `WHERE` → Filter rows
- `COUNT()` → Count records
- `LIMIT` → Restrict number of rows
- `AND` → All conditions must be true
- `OR` → Any condition can be true
- `ORDER BY` → Sort data
- `NOT` / `!=` → Opposite condition
- `LIKE` → Pattern matching
- `%` → Multiple characters
- `_` → Single character
- `IS NULL` → Check for NULL values
- `BETWEEN` → Range filtering
- `GROUP BY` → Group records
- `HAVING` → Filter grouped data
- `PRIMARY KEY` → Unique identifier
- `FOREIGN KEY` → Creates relationships between tables
- `TRUNCATE` → Remove all rows
- `DELETE` → Remove selected rows
- `DROP` → Remove entire table
