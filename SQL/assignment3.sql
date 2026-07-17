-- Assignment 3

-- 1. display all customer details who have made more than 5 payments.
select * from customer 
where customer_id IN( 
	select customer_id from payment
    group by customer_id
    having count(*) > 5 );
-- This query finds customers who made more than 5 payments by counting payments per customer.
-- Then it returns full details of those customers from the customer table.

-- 2. Find the names of actors who have acted in more than 10 films.
select first_name, last_name from actor
where actor_id IN(
	select actor_id from film_actor
    group by actor_id
    having count(film_id) > 10
    );
-- This query finds actors who have acted in more than 10 films by counting films per actor.
-- Then it returns the first and last names of those actors from the actor table.

-- 3. Find the names of customers who never made a payment.
select first_name, last_name from customer 
where customer_id not in(
	select customer_id from payment
    );
-- This query finds customers who never made any payment by excluding those present in the payment table.
-- It returns the first and last names of customers whose IDs are not found in the payment records. I think there are none
    
-- 4. List all films whose rental rate is higher than the average rental rate of all films.
select title from film
where rental_rate > ( select avg(rental_rate) from film);
-- This query finds films whose rental rate is higher than the average rental rate of all films.
-- It first calculates the average rental rate and then selects films with a higher value.

-- 5. List the titles of films that were never rented.
create temporary table rented_films_1 as 
select distinct inventory.film_id from inventory
join rental on inventory.inventory_id = rental.inventory_id;

select title from film
where film_id not in(select film_id from rented_films_1);
-- This query first stores all rented film IDs in a temporary table.
-- Then it selects film titles that are not present in that table, meaning they were never rented.

-- 6. Display the customers who rented films in the same month as customer with ID 5.
with months_cte as(
	select month(rental_date) as m from rental
    where customer_id =5 
    )
select distinct customer_id from rental
where month(rental_date) in (select m from months_cte);
-- This query first finds the months in which customer 5 rented films using a CTE.
-- Then it returns customers who also rented films in those same months.

-- 7. Find all staff members who handled a payment greater than the average payment amount.
create view avg_payment_view as 
select avg(amount) as avg_amount from payment;
select distinct staff_id from payment 
where amount > (select avg_amount from avg_payment_view);
-- This query first creates a view to store the average payment amount.
-- Then it finds staff members who handled payments greater than that average amount.

-- 8. Show the title and rental duration of films whose rental duration is greater than the average.
with avg_cte as( 
	select avg(rental_duration) as avg_dur from film )
select title, rental_duration from film
where rental_duration > (select avg_dur from avg_cte);
-- This query first calculates the average rental duration using a CTE.
-- Then it selects films whose rental duration is greater than that average.
    
-- 9. Find all customers who have the same address as customer with ID 1.
create view customer_address_view as 
select customer_id, address_id from customer;
select * from customer 
where address_id = ( select address_id from customer_address_view
	where customer_id=1 );
-- This query first creates a view to store customer IDs with their address IDs.
-- Then it finds all customers who have the same address as customer with ID 1.

-- 10. List all payments that are greater than the average of all payments.
delimiter $$
create procedure get_payment_above_avg()
begin 
	select * from payment 
    where amount > ( select avg(amount) from payment );
end $$
delimiter ;

call get_payment_above_avg();
-- This stored procedure finds all payments that are greater than the average payment amount.
-- It calculates the average payment using a subquery and returns payments higher than that value.