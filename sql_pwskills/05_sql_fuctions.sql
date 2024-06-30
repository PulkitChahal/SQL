-- SQL pre defined functions mathematical functions, strings, datetime

select amount + 1 as amount_after_adding from payment;

select sum(amount) from payment; -- summming all the column values and giving single output

select avg(amount) from payment; -- averaging all the column values and giving single output

select count(amount) from payment; -- counting all the values in column
select count(*) from payment; -- counting all the values in column

select min(amount) from payment; -- minimum

select max(amount) from payment; -- maximum

-- ------------------------------------------------------------------
-- String functions - concat, length, upper, lower, substr

select concat(first_name, ' ', last_name)as full_name from actor; -- concat to join multiple strings together

select concat(first_name, ' ', last_name)as full_name,
length(concat(first_name, ' ', last_name)) as length from actor; -- length to find number of char in text

select lower(first_name) from actor; -- upper, lower to convert text into upper or lower case letters

select upper('SaHil');

select address from address;
select substr(address, 3, 10) from address; -- substr(text data, starting point, no.of char)
select substr('Sahil Garg', 3, 5);

-- ------------------------------------------------------------------
-- datetime functions - month, year, day, monthname, datediff

select rental_date, month(rental_date) from rental;

select rental_date, year(rental_date) from rental;

select rental_date, day(rental_date) from rental;

select rental_date, monthname(rental_date) from rental;

select retrun_date, rental_date, datediff(retrun_date, rental_date) from rental; -- datediff is used to find difference between dates

-- ------------------------------------------------------------------
-- What smallest rental_duration?
select min(rental_duration) from film;

-- What is the highest replacement cost among all the films?
select max(replacement_cost) from film;

-- Display all the films whose title length is greater than 10 characters?
select title, length(title) from film where length(title) > 10;

-- Provide the count of unique ratings of films provided?
select distinct(rating) from film;
select count(distinct(rating)) from film;

-- Diplay the list of first 4 cities which start and end with 'a'
select * from city where city like 'a%a' limit 4;

-- ------------------------------------------------------------------
-- operations - from, join, where, group by, having, select, order by, limit

-- Group by

select * from film;
select rating, avg(rental_duration) from film group by rating;

select rating, avg(rental_duration) from film where rating = 'PG';

select rating, count(rental_duration) from film group by rating;
select rating, sum(rental_duration) from film group by rating;

select actor_id, count(film_id) as num_of_films from film_actor group by actor_id order by num_of_films desc;

-- ------------------------------------------------------------------
-- List the total sales amount for each customer in the database
select customer_id, sum(amount) as total_amount from payment group by customer_id order by total_amount desc;

select distinct customer_id from payment;
select customer_id from payment group by customer_id;

select customer_id, sum(amount) as total_amount from payment group by customer_id having total_amount > 100;

SELECT 
    customer_id, SUM(amount) AS total_amount
FROM
    payment
WHERE
    staff_id = 2
GROUP BY customer_id
HAVING total_amount > 100;