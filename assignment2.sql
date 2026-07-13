-- Assignment 2

-- 1. Identify if there are duplicates in Customer table. Don't use customer id to check the duplicates
select first_name, last_name, email, count(*) from customer 
group by first_name, last_name, email
having count(*)>1;

-- 2. Number of times letter 'a' is repeated in film descriptions
select  
sum(length(description) - length(replace(description, 'a',''))) as count_A
from film;

-- 3. Number of times each vowel is repeated in film descriptions 
select 
sum(length(lower(description)) - length(replace(lower(description), 'a',''))) as count_a,
sum(length(lower(description)) - length(replace(lower(description), 'e',''))) as count_e,
sum(length(lower(description)) - length(replace(lower(description), 'i',''))) as count_i,
sum(length(lower(description)) - length(replace(lower(description), 'o',''))) as count_o,
sum(length(lower(description)) - length(replace(lower(description), 'u',''))) as count_u
from film;

-- 4. Display the payments made by each customer
       -- 1. Month wise
       -- 2. Year wise
       -- 3. Week wise
-- month wise
select customer_id, month(payment_date) as month, sum(amount) as total_amount
from payment 
group by customer_id, month(payment_date);

-- year wise
select customer_id, year(payment_date) as year, sum(amount) as total_amount
from payment
group by customer_id, year(payment_date);

-- week wise
select customer_id, week(payment_date) as week, sum(amount) as total_paid
from payment
group by customer_id, week(payment_date);

-- 5. Check if any given year is a leap year or not. You need not consider any table from sakila database. Write within the select query with hardcoded date
select 
case 
    when 2024 % 400 = 0 then 'leap year'
    when 2024 % 100 = 0 then 'not leap year'
    when 2024 % 4 = 0 then 'leap year'
    else 'not leap year'
end as result;

-- 6. Display number of days remaining in the current year from today.
select datediff(
    concat(year(curdate()), '-12-31'),
    curdate()
) as days_remaining;

-- 7. Display quarter number(Q1,Q2,Q3,Q4) for the payment dates from payment table.
select payment_id, payment_date, quarter(payment_date) as quarter
from payment;


