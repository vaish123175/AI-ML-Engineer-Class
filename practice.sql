use sakila;
show tables;
select * from actor;

-- select and where clause
SELECT * FROM actor
WHERE first_name = 'NICK';

-- distinct to display without duplicates
select distinct rating from film;

-- count to count total
select count(*) from film;

-- limit query to display particular numbers of rows including the null values
select * from film 
limit 10;

-- AND operator to satisfy both conditions
select * from film 
where length > 120
AND rating= 'PG';

-- OR operator it satisfies either condition 
select * from film 
where rating = 'PG'
OR rating='G';

-- ORDER BY can be done in ascending or descending

select * from film 
order by length;

-- by default it will order in ascending order

select * from film
order by length desc;

-- Alphabetical order
select * from actor 
order by first_name;

-- NOT operator
select * from film
where not rating= 'PG';

select * from film
where rating != 'PG';

-- Multiple conditions
select * from film 
where rating= 'G' and length> 150 and rental_rate=2.99;

-- Like operator it is used with % and _

-- starts with A
select * from actor 
where first_name like 'A%';

-- ends with A
select * from actor
where first_name like '%A';

-- contains AN
select * from actor
where first_name like '%AN%';

-- exactly four letters ending with N
select * from actor 
where first_name like '____N';

-- Null values
-- customers without an active status
select * from customer
where active is NULL;

select * from customer 
where active is NOT NULL;

-- Between operator, to display films between 90-120 mins
select * from film 
where length between 20 and 100;

-- group by 
select rating, count(*) as total_fims from film
group by rating;

-- having just like where condition
-- Show only ratings with more than 200 films.
select rating, count(*) as total_films from film
group by rating having count(*) >200;

-- Avg length grater than 100
select rating, avg(length) as avg_length
from film group by rating having avg(length)>100;

-- where filters individual rows before grouping whereas having filters grouped results after aggregation

-- Aliasing
select title, rental_rate as price from film;

-- SQL execution order
SELECT rating,
COUNT(*) AS total
FROM film
WHERE length > 90
GROUP BY rating
HAVING COUNT(*) > 100
ORDER BY total DESC
LIMIT 3;

/* FROM
↓
WHERE
↓
GROUP BY
↓
HAVING
↓
SELECT
↓
ORDER BY
↓
LIMIT */

-- Delete deletes only a row where as truncate deletes all the values and keeps the table whereas drop deletes the whole table

-- string functions- string functions are used to manipulate text characters
-- it is commonly used for formatting and aligning data 

-- LPAD() adds character to the left
select first_name, LPAD(first_name,10,' ') as padded_name
from actor limit 5;

-- RPAD() adds characters to the right of the text
select first_name, RPAD(first_name,10,'-') as padded_name
from actor limit 5;

-- substring returns the part of a string, index starts from 1 in SQL
-- substring(string, start_position, length)
select first_name, substring(first_name,1,3) as short_name
from actor limit 6;

-- concat()- combines two or more strings it is useful for full names, email ids and addresses
select concat(first_name,' ',last_name) as full_name
from actor limit 6;

-- email ids
select concat(lower(first_name),'.',lower(last_name),'@gmail.com') as email 
from actor;

-- reverse() - it reverses a string
select first_name, reverse(first_name) as reverse 
from actor limit 5;

-- length() returns the length of the characters in a string
select first_name, length(first_name) as length 
from actor limit 5;

-- locate() finds the position of a character or word
-- locate(search_string,string)
select first_name, locate('E', first_name) as loc
from actor limit 6;

-- substring with locate, instead of manually finding the position, we combine functions
select substring('john@gmail.com',locate('@','jhon@gmail.com')+1);

SELECT SUBSTRING(
'john@gmail.com',
1,
LOCATE('@','john@gmail.com')-1
);

-- upper and lower converts text into upper or lowercase
select upper(first_name)
from actor limit 5;

select lower(first_name)
from actor limit 5;

-- left and right returns characters from left and right
select left(first_name, 3)
from actor limit 5;

select right(first_name, 3)
from actor limit 5;

-- case statements works like if else

SELECT title,
CASE
WHEN rental_rate = 0.99 THEN 'Cheap'
WHEN rental_rate = 2.99 THEN 'Medium'
ELSE 'Expensive'
END AS Category FROM film LIMIT 10;

-- replace() replaces one string with another replace(string,old,new)
select replace(first_name,'E','e')
from actor limit 10;

-- regexp regular expression is used to search data based on patterns
-- starts with A
select * from actor
where first_name REGEXP '^A';
-- ends with n
select * from actor where first_name regexp 'N$';
-- contains AN
select * from actor where first_name regexp 'AN';

-- Mathematical functions used for numerical calculations
-- count is to count number of rows
SELECT COUNT(*)
FROM film;

-- sum() adds the values
SELECT SUM(length)
FROM film;

-- avg() calculates the avg
SELECT AVG(length)
FROM film;
 
-- rand() generates a random decimal number between 0 and 1
SELECT * FROM film
ORDER BY RAND() LIMIT 5;

-- floor() rounds down to the nearsest integer and ceil() 
SELECT FLOOR(10.95);

select ceil(10.2);




















