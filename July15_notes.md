# SQL Notes - July 15

## Indexes

Indexes are used to **improve query performance** by allowing faster data retrieval when filtering.

### Types of Indexes

#### 1. Clustered Index

* Usually created on the **primary key**.
* Physically **sorts the table data**.
* Only **one clustered index** per table.

#### 2. Non-Clustered Index

* Created on **non-primary key columns**.
* Does not change physical order of table.
* Creates a **reference (pointer)** to the actual data.

---

# Keys

## 1. Natural Key

* A real-world, meaningful unique identifier.
* Naturally exists in the data.
* Example:

  * SSN
  * Passport Number

> Note: Not every primary key must be natural, but natural keys are inherently unique.

## 2. Surrogate Key

* A **system-generated key**.
* Has no business meaning.
* Example:

  * Auto-increment ID

---

# Query Optimization Techniques

## Best Practices

* **Select only required columns**

  ```sql
  SELECT name FROM customer;
  ```

  Avoid:

  ```sql
  SELECT * FROM customer;
  ```

* **Use WHERE before GROUP BY and HAVING**

  * Filters data early → improves performance.

* **Use JOINs instead of subqueries**

  * When combining data from multiple tables.

* **Avoid functions on indexed columns**
  ❌ Bad:

  ```sql
  WHERE YEAR(date_column) = 2023;
  ```

  ✅ Good:

  ```sql
  WHERE date_column BETWEEN '2023-01-01' AND '2023-12-31';
  ```

* **Use LIMIT**

  * Restrict number of rows returned.

  ```sql
  SELECT * FROM customer LIMIT 10;
  ```

* **Use CTEs**

  * Improves readability and structure.

* **Use EXPLAIN**

  * Helps understand how the query is executed.

  ```sql
  EXPLAIN SELECT * FROM customer;
  ```

* **Avoid large OFFSET in pagination**

  * Large offsets slow down queries.
  * Prefer key-based pagination.

* **Use maintenance commands**

  * Optimize and analyze tables regularly.
  * Example:

    ```sql
    ANALYZE TABLE table_name;
    OPTIMIZE TABLE table_name;
    ```

---

# Summary

* Indexes speed up data retrieval.
* Clustered = physical order, Non-clustered = logical reference.
* Keys help uniquely identify records.
* Optimization techniques improve performance and efficiency.
