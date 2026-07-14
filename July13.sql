## July 13 notes

/* 1. Cardinality (Table Relationships)
It tells how tables are related
types
1:1 one to one - one row to one
1:M one to many - one row to many rows
M:1 many to one - many rows to one row
M:M many to many - many rows to many rows
*/

/* 2. SQL joins - used to combine tables
Inner join - only matching data */
select * from customer
inner join rental 
on customer.customer_id = rental.customer_id;

-- Left join - all from left+ matching from right
select * from customer
left join rental 
on customer.customer_id = rental.customer_id;

-- Right join- all from right + matching from left

-- Full outer join- all data from both tables

-- Cross join- all combinations if 3 rows * 4 rows= 12 rows

-- self join- table joins itself
select a.name, b.name from employee a
join employee b
on a.manager_id = b.employee_id;

/* 3. Union/Intersect
Union- combines results( removes duplicates) */
select name from table1
union
select name from table2;

-- Union all - keeps duplicates
select name from table1
union all
select name from table2;

-- Intersect- common rows in both 

/* 4. subquery - query inside query
In where*/
select title 
from film
where film_id in (
    select film_id from inventory
);

-- In select
select title,
(select avg(length) from film) as avg_length
from film;

/* 5. Derived table - subquery used as table and it exists only during the execution */
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
