-- July 14th 

-- 1. Subquery- A subquery is used when the main query depends on another query’s result.
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM rental
);
-- Inner query gets customer_ids
-- Outer query filters customers
-- Works fine, but can be slow for large data

--  Correlated Subquery
SELECT first_name, last_name
FROM customer c
WHERE EXISTS (
    SELECT 1
    FROM rental r
    WHERE r.customer_id = c.customer_id
);
-- Runs subquery for each customer
-- Slower than JOIN/CTE
-- Used when condition depends on outer query

-- 2. CTE (common table expression) - Temporary named result used within one query
WITH rentals AS (
    SELECT customer_id FROM rental
)
SELECT first_name
FROM customer
WHERE customer_id IN (SELECT customer_id FROM rentals);
-- We create a temporary result called rentals, Then reuse it in the main query
-- Cleaner than subquery, but scope is limited at the query level
-- Reusable inside same query
-- Exists only for that query

-- 3. Recursive CTE - Calls itself, Works like a loop, It is used for loops like numbers or hierarchy.
WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM numbers WHERE n < 5
)
SELECT * FROM numbers;
-- Starts from 1, Keeps adding 1 until 5

-- 4. Temporary Table - Stores data temporarily for session use
CREATE TEMPORARY TABLE temp_customers AS
SELECT customer_id, first_name FROM customer;

SELECT * FROM temp_customers;
-- Scope is incresed from query level to session level, Exists for session and it is removed after that session
-- Stores data physically
-- Faster for repeated use
-- can use many times
-- but it only exists in the local memory

-- 5.View - virtual table, View is a saved SQL query with a name.It does not store data, it shows data from table.
CREATE VIEW active_customers AS
SELECT customer_id, first_name, last_name
FROM customer;

-- use it
SELECT * FROM active_customers;

-- we are creating a view and it stores the query and not actual data
-- it will always show the customer_id, first_name, last_name from the custonmer table
-- scope is beyond the session , it can be accessed by others who have permission
-- can hide data (abstraction) 
-- Simplifies queries and can be reused anytime


-- 6.Stored procedures - Stored procedure is a saved SQL program. We can execute it anytime with one command.
DELIMITER //

CREATE PROCEDURE getCustomers()
BEGIN
    SELECT * FROM customer;
END //

DELIMITER ;

CALL getCustomers();
-- We are creating a stored procedure named getCustomers. It is like saving a SQL command with a name.
-- BEGIN starts the procedure block 
-- CALL is used to execute the procedure.It runs the stored SQL and shows result.
-- It is also a physical schema, it is not storing any data it just runs queries when executed

-- 7. Dynamic SQL - SQL query that is created at runtime. It helps create flexible and changeable queries.
SET @query = 'SELECT * FROM customer';
PREPARE stmt FROM @query;
EXECUTE stmt;
-- first the SQL query is stored in a variable and is not executed yet
-- PREPARE converts the text into executable SQL and EXECUTE runs the query
-- Flexible and Reusable
-- Handles changing conditions

-- 8. Metadata ( data dictionary)- Metadata is data about database structure.It tells about tables, columns, and types.
SHOW TABLES;
DESCRIBE customer;
-- shows table info and column details




