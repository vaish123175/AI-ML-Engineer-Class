## July 13 notes

/* 1. Cardinality (Table Relationships)
It tells how tables are related
types
1:1 one to one - One record in the first table is related to only one record in the second table.
1:M one to many - One record in one table can have multiple related records in another table
M:1 many to one - Many records in one table belong to one record in another table.
M:M many to many - Many records in one table can relate to many records in another table.
A separate middle table is required.
*/

/* 2. SQL joins - A JOIN is used to combine data from two or more tables using a related column.
Usually the relationship is created using Primary Key and Foreign Key
Why do we use joins?
Because databases store information in separate tables to avoid repetition.
Example:
Customer details are stored separately from rental details.
To see:
"Customer name + rental information"
we need a JOIN.
Types:
Inner join - Returns only records that have matching values in both tables. */
select * from customer
inner join rental 
on customer.customer_id = rental.customer_id;

-- Left join - Returns all records from the left table and matching records from the right table. If there is no match, it shows NULL.
select * from customer
left join rental 
on customer.customer_id = rental.customer_id;

-- Right join- Returns all records from the right table and matching records from the left table.
select name, rental_id
from customer
right join rental
on customer.customer_id = rental.customer_id;

/* Full outer join- returns all records from both tables It includes:
Matching records
Non-matching records from both sides
MySQL does not directly support FULL OUTER JOIN. we need to use union 
*/

-- Cross join- Creates every possible combination between two tables. It does not need a matching column. if 3 rows * 4 rows= 12 rows

-- self join- A table joins with itself. Used when rows in the same table have relationships.
select f1.title, f2.title, f1.length
from film f1
join film f2
on f1.length = f2.length
and f1.film_id < f2.film_id;

/* Bridge table - it is a table used to connect two tables in a many-to-many relationship
Tables involved: film, actor, film_actor (bridge table) */

/* Cartesian product = every row of table A combines with every row of table B, same as cross join
*/
select c.first_name, s.first_name
from customer c
cross join staff s;

/* 3. Union/Intersect
Union- UNION combines results of two SELECT queries into one result. Duplicate values are removed */
select first_name from customer
union
select first_name from staff;

-- Union all - keeps duplicates
select first_name from customer
union all
select first_name from staff;

/* Intersect- common rows in both, Returns only records that exist in both tables.
Mysql does not support intersect directly so we use join or in instead 
what happens in the below code is Matches names from both tables and Returns only common names*/
select distinct c.first_name
from customer c
join staff s
on c.first_name = s.first_name;

/* 4. subquery - query inside query,  Used for filtering or getting temporary results.
In where- Used for filtering data. */
select title 
from film
where film_id in (
    select film_id from inventory
);
-- Subquery runs FIRST → gives result → main query uses it

-- In select- Used to display an additional calculated value.
select title,
(select avg(length) from film) as avg_length
from film;


/* 5. Derived table - A temporary table created from a subquery. 
It exists only while the query is running.
It is not stored permanently.
Example:
Main query
     |
Temporary table
     |
Subquery result
After execution finishes, the derived table disappears. */
select avg(length)
from (
    select length from film
) as temp;

/* 6. Correlated subquery - subquery runs for each row and the inner query depends on outer query */
select first_name
from customer c
where exists (
    select 1
    from rental r
    where r.customer_id = c.customer_id
);
-- Unlike a normal subquery, the inner query does not run once. It runs for every customer.

/* Summary
cardinality → relationship between tables
join → combine tables
union → combine results
subquery → query inside query
derived → temporary table
correlated → runs again and again per row 

trick
join = connect
union = stack
subquery = inside */
