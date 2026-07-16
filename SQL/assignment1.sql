-- Assignment 1

use sakila;
show tables;

-- 1. Get all customers whose first name starts with 'J' and who are active.
select * from customer 
where first_name like 'J%' AND active = 1;

-- 2. Find all films where the title contains the word 'ACTION' or the description contains 'WAR'.
select * from film
where title like '%ACTION%' OR description like '%WAR%';

-- 3. List all customers whose last name is not 'SMITH' and whose first name ends with 'a'.
select * from customer 
where last_name != 'SMITH' and first_name like '%a';

-- 4. Get all films where the rental rate is greater than 3.0 and the replacement cost is not null.
select film_id, title, rental_rate, replacement_cost from film
where rental_rate > 3.0 AND replacement_cost is NOT NULL;

-- 5. Count how many customers exist in each store who have active status = 1.
select store_id, count(*) as total_customers from customer 
where active = 1
group by store_id;

-- 6. Show distinct film ratings available in the film table.
select distinct rating from film;

-- 7. Find the number of films for each rental duration where the average length is more than 100 minutes.
select rental_duration, count(*) as film_count from film
group by rental_duration
having avg(length)>100;

-- 8. List payment dates and total amount paid per date, but only include days where more than 100 payments were made.
select payment_date, sum(amount) as total_paid from payment
group by date(payment_date)
having count(*) > 100;

-- 9. Find customers whose email address is null or ends with '.org'.
select customer_id, first_name, email from customer
where email is null
or email like '%.org';

-- 10. List all films with rating 'PG' or 'G', and order them by rental rate in descending order.
select title, rental_rate, rating from film
where rating = 'PG' or rating = 'G'
order by rental_rate desc;

-- 11. Count how many films exist for each length where the film title starts with 'T' and the count is more than 5.
select length, count(*) title from film
where title like 'T%'
group by title 
having count(*)>5;


-- 12. List all actors who have appeared in more than 10 films.
select first_name, last_name, actor.actor_id, count(*) as film_count from actor
join film_actor
on actor.actor_id=film_actor.actor_id
group by actor.actor_id, first_name, last_name
having count(*)>10;

-- 13. Find the top 5 films with the highest rental rates and longest lengths combined, ordering by rental rate first and length second.

select * from film;

select title, rental_rate, length from film
order by rental_rate desc, length desc
limit 5;

-- 14. Show all customers along with the total number of rentals they have made, ordered from most to least rentals.

select customer_id, first_name, last_name, count(*) as total_rentals
from customer
join rental using (customer_id)
group by customer_id, first_name, last_name
order by total_rentals desc;

-- 15. List the film titles that have never been rented.
select title from film
where film_id not in( 
select film_id from inventory
where inventory_id in (select inventory_id from rental));








