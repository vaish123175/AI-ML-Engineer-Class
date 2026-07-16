-- July 15

/* Indexes- Indexes are used to speed up data retrieval, especially when filtering data using conditions.
Instead of scanning the entire table, indexes allow direct access to required rows.
*/
CREATE INDEX idx_lastname ON customer(last_name);
/*
Types of indexes
1.Clustered Index
Usually created on the Primary Key.
Physically sorts the data in the table.
Only one clustered index per table.
Improves performance for range-based queries. */

-- customer_id is primary key → clustered index 
SELECT * FROM customer ORDER BY customer_id;

/* 2. Non-Clustered Index
Created on non-primary key columns.
Does not change physical order of data.
Stores a reference (pointer/ID) to actual rows.
Multiple non-clustered indexes can exist.
*/
CREATE INDEX idx_email ON customer(email); 
SELECT email FROM customer WHERE email LIKE '%@gmail.com';

/* Keys
Natural Key
A real-world unique identifier.
Exists naturally in the data.
Example:
SSN
Passport Number

Note: Not every primary key is natural, but natural keys are inherently unique.

Surrogate Key
A system-generated key.
Has no business meaning.
Used when natural key is not suitable.
Example:
Auto-increment ID
*/
-- customer_id is surrogate key 
SELECT * FROM customer WHERE customer_id = 1;

/* Query Optimization Techniques
1. Select Only Required Columns */
SELECT first_name, last_name
FROM customer;

-- Avoid:
SELECT * FROM customer;

-- 2. Use WHERE Before GROUP BY and having
SELECT customer_id, COUNT(*) AS total_rentals
FROM rental
WHERE rental_date > '2005-01-01'
GROUP BY customer_id;

-- 3. Use JOIN Instead of Subquery
-- Subquery:
SELECT first_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id FROM rental
);
-- JOIN:
SELECT DISTINCT c.first_name
FROM customer c
JOIN rental r 
ON c.customer_id = r.customer_id;

-- 4. Avoid Functions on Indexed Columns
SELECT * FROM rental
WHERE YEAR(rental_date) = 2005;
-- instead use between:
SELECT * FROM rental
WHERE rental_date BETWEEN '2005-01-01' AND '2005-12-31';

-- 5. Use LIMIT
SELECT * FROM film
LIMIT 5;

-- 6. Use CTE for Readability
WITH rental_count AS (
    SELECT customer_id, COUNT(*) AS total
    FROM rental
    GROUP BY customer_id
)
SELECT * FROM rental_count
WHERE total > 20;

-- 7. Use EXPLAIN
EXPLAIN SELECT * FROM customer
WHERE last_name = 'Smith';
-- Shows how MySQL will execute the query
-- It does NOT run the query, It gives execution plan

-- 8. Avoid Large OFFSET
-- Slow:
SELECT * FROM customer
LIMIT 10 OFFSET 1000;
-- Reads first 1000 rows, Skips them and Returns next 10
-- Waste of work → slow for large data
-- Better (key-based pagination):
SELECT * FROM customer
WHERE customer_id > 1000
LIMIT 10;
-- Directly jumps to needed rows using index, No skipping

-- 9. Maintenance Commands
ANALYZE TABLE customer;
-- Updates table statistics and Helps optimizer choose better execution plan
OPTIMIZE TABLE customer;
-- Reorganizes table storage, Removes fragmentation and Improves the performance
