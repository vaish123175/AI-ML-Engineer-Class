-- Assignment 2

-- 1. Identify if there are duplicates in Customer table. Don't use customer id to check the duplicates
select first_name, last_name, email, count(*) from customer 
group by first_name, last_name, email
having count(*)>1;

/*
This query groups customers by `first_name`, `last_name`, and `email`, then counts how many times each combination appears.
The `HAVING COUNT(*) > 1` condition displays only those combinations that occur more than once, indicating duplicate customer records.
 */

-- 2. Number of times letter 'a' is repeated in film descriptions
select  
sum(length(description) - length(replace(description, 'a',''))) as count_A
from film;
/*
This query counts how many times the letter **'a'** appears in all film descriptions by comparing the string length before and after removing `'a'`.
The `SUM()` function adds the counts from every film description to give the total number of occurrences of `'a'` in the `film` table.
 */

-- 3. Number of times each vowel is repeated in film descriptions 
select 
sum(length(lower(description)) - length(replace(lower(description), 'a',''))) as count_a,
sum(length(lower(description)) - length(replace(lower(description), 'e',''))) as count_e,
sum(length(lower(description)) - length(replace(lower(description), 'i',''))) as count_i,
sum(length(lower(description)) - length(replace(lower(description), 'o',''))) as count_o,
sum(length(lower(description)) - length(replace(lower(description), 'u',''))) as count_u
from film;
-- This query counts the total occurrences of each vowel (a, e, i, o, u) in all film descriptions.
-- LOWER() ensures both uppercase and lowercase vowels are counted, and SUM() adds the counts across all rows.

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

-- These queries calculate the total payment amount made by each customer based on different time periods.
-- GROUP BY is used with MONTH(), YEAR(), and WEEK() to summarize customer payments month-wise, year-wise, and week-wise.

-- 5. Check if any given year is a leap year or not. You need not consider any table from sakila database. Write within the select query with hardcoded date
select 
case 
    when 2024 % 400 = 0 then 'leap year'
    when 2024 % 100 = 0 then 'not leap year'
    when 2024 % 4 = 0 then 'leap year'
    else 'not leap year'
end as result;
-- This query checks whether the hardcoded year (2024) is a leap year using the leap year rules.
-- A year is a leap year if it is divisible by 400, or divisible by 4 but not by 100.

-- 6. Display number of days remaining in the current year from today.
select datediff(
    concat(year(curdate()), '-12-31'),
    curdate()
) as days_remaining;
-- This query calculates the number of days remaining from today until December 31 of the current year.
-- DATEDIFF() finds the difference between the last day of the year and the current date.

-- 7. Display quarter number(Q1,Q2,Q3,Q4) for the payment dates from payment table.
select payment_id, payment_date, concat('Q',quarter(payment_date)) as quarter
from payment;
-- This query displays the quarter (Q1, Q2, Q3, or Q4) for each payment based on its payment date.
-- QUARTER() extracts the quarter number from the date, and CONCAT() adds the prefix 'Q'.

