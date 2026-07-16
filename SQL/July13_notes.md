# SQL Notes - July 13

## Cardinality

Cardinality describes the relationship between tables in a database. Tables are connected using **Primary Keys** and **Foreign Keys** to retrieve related data.

### Types of Relationships

1. **One-to-One (1:1)**
   One record in a table is related to only one record in another table.

2. **One-to-Many (1:N)**
   One record in a table can be related to multiple records in another table.

3. **Many-to-One (N:1)**
   Multiple records in one table are related to a single record in another table.

4. **Many-to-Many (N:N)**
   Multiple records in one table can be related to multiple records in another table. This relationship is usually implemented using a junction or bridge table.

---

# SQL Joins

Joins are used to combine data from multiple tables based on related columns.

## Inner Join

Returns only the matching records from both tables.

## Outer Join

Returns matching records along with non-matching records, depending on the join type.

## Left Join

Returns all records from the left table and matching records from the right table.

## Right Join

Returns all records from the right table and matching records from the left table.

## Full Outer Join

Returns all records from both tables, including matching and non-matching records.

## Cross Join

Generates all possible combinations of rows between two tables. It should be used only when such combinations are required.

## Self Join

A table is joined with itself to compare or retrieve related data within the same table.

---

# Set Operations

## Union

Combines the results of two queries and removes duplicate records.

## Union All

Combines the results of two queries and includes all records, including duplicates.

## Intersect

Returns only the records that are common between two query results.

---

# Subqueries

A subquery is a query written inside another query.

### Purpose

* Used for filtering data.
* Can be used in different clauses such as `SELECT` and `WHERE`.
* Helps break complex queries into smaller logical parts.

---

# Derived Table

A derived table is a temporary table created from a subquery.

### Key Points

* Exists only during query execution.
* Not permanently stored in the database.
* Used to simplify complex queries and calculations.

---

# Correlated Subquery

A correlated subquery is a subquery that depends on values from the outer query.

### Key Points

* The subquery is executed repeatedly for each row processed by the outer query.
* It references columns from the outer query.
* Often used for row-by-row comparisons and filtering.
