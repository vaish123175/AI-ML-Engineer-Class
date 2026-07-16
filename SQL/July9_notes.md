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


### DROP
- Completely removes the table and its structure from the database.

---

# Primary Key and Foreign Key

## Primary Key
- Uniquely identifies each record in a table.
- Cannot contain duplicate values.
- Cannot contain `NULL` values.
- A table can have only **one Primary Key constraint**.
- The Primary Key may consist of one or multiple columns (composite key).


## Foreign Key
- Creates a relationship between two tables.
- References the Primary Key of another table.
- A table can have multiple Foreign Keys.


---

# DQL (Data Query Language)

## SELECT Statement

Used to retrieve data from a table.

---

## DISTINCT

Used to retrieve unique values and remove duplicates.

---

## WHERE Clause

Used to filter rows based on conditions.

---

## COUNT()

Used to count rows.

---

## LIMIT

Restricts the number of rows returned.

---

# Filtering with AND and OR

## AND

Returns rows only when all conditions are true.

## OR

Returns rows when at least one condition is true.

---

# Sorting Data

## ORDER BY

Used to sort records.

### Ascending Order (Default)

### Descending Order

---

## NOT Operator

Used to return the opposite of a condition.
!= is not operator

---

# Wildcards and LIKE Operator

Used for pattern matching.

## `%` Wildcard

Represents zero or more characters.

### Contains

'%john%'

### Starts With

'john%'

### Ends With

'%john'

## `_` Wildcard

Represents exactly one character.

'_ohn'

---

## NULL Values

Used to represent missing or unknown data.

---

## BETWEEN Operator

Used to filter values within a range.

---

## GROUP BY

Used to group rows that have the same values into summary rows.

### Important Notes
- Used with aggregate functions such as:
  - `COUNT()`
  - `SUM()`
  - `AVG()`
  - `MIN()`
  - `MAX()`
- Every non-aggregated column in the `SELECT` statement should appear in the `GROUP BY` clause.

---

## HAVING Clause

Used to filter grouped (aggregated) data.

### Important Notes
- `HAVING` is generally used with `GROUP BY`.
- `GROUP BY` can be used without `HAVING`.
- `HAVING` filters aggregated results.

---

## WHERE vs HAVING

| WHERE | HAVING |
|---------|---------|
| Filters rows before grouping | Filters groups after grouping |
| Works on individual rows | Works on aggregated data |
| Used before GROUP BY | Used after GROUP BY |

---

## SQL Order of Execution

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

## Aliasing

Aliases provide temporary names for columns or tables.

---

## Quick Revision

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
