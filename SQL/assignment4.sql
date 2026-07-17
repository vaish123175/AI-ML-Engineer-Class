-- Assignment 4

-- 1. List all customers along with the films they have rented.
select c.first_name, c.last_name, f.title from customer c
join rental r on c.customer_id = r.customer_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id;
-- Join customer, rental, inventory, and film tables to track rentals
-- Shows each customer’s name with the titles of films they rented

-- 2. List all customers and show their rental count, including those who haven't rented any films.
select c.first_name, c.last_name, count(r.rental_id) as total_r from customer c
left join rental r on c.customer_id = r.customer_id
group by c.customer_id;
-- Use LEFT JOIN to include all customers even if they have no rentals
-- COUNT(r.rental_id) gives total rentals, showing 0 for customers with no rentals

-- 3. Show all films along with their category. Include films that don't have a category assigned.
select f.title, c.name as category from film f
left join film_category fc on f.film_id = fc.film_id
left join category c on fc.category_id = c.category_id;
-- Use LEFT JOIN to include all films even if they don’t have a category
-- Joins film → film_category → category to display film title with its category

-- 4. Show all customers and staff emails from both customer and staff tables using a full outer join (simulate using LEFT + RIGHT + UNION).
select email from customer 
union select email from staff;
-- Combine emails from customer and staff tables using UNION
-- UNION removes duplicates and acts like a full outer join for a single column

-- 5. Find all actors who acted in the film "ACADEMY DINOSAUR".
select a.first_name, a.last_name from actor a
join film_actor fa on a.actor_id= fa.actor_id
join film f on fa.film_id= f.film_id
where f.title= 'ACADEMY DINOSAUR';
-- Join actor → film_actor → film to find actors in a specific movie
-- Filters results to only show actors from "ACADEMY DINOSAUR"

-- 6. List all stores and the total number of staff members working in each store, even if a store has no staff.
select s.store_id, count(st.staff_id) as total_staff from store s
left join staff st on s.store_id= st.store_id
group by s.store_id;
-- Use LEFT JOIN to include all stores even if no staff is assigned
-- COUNT(st.staff_id) gives total staff per store, showing 0 if none

-- 7. List the customers who have rented films more than 5 times. Include their name and total rental count.
with rental_count as( 
	select customer_id, count(*) as total from rental
    group by customer_id 
    )
select c.first_name, c.last_name, rc.total from customer c
join rental_count rc on c.customer_id = rc.customer_id
where rc.total>5;
-- Use CTE to calculate total rentals per customer
-- Join with customer table and filter customers with more than 5 rentals