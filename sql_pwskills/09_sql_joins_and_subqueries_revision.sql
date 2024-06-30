use mavenmovies;

-- inner join

select count(*) from film;
select count(*) from film_actor;
select * from film as f inner join film_actor as fa on f.film_id = fa.film_id;

-- ----------------------------------------------------------------
-- left join

select * from film as f left join film_actor as fa on f.film_id = fa.film_id where actor_id is null;

-- ----------------------------------------------------------------
-- right join

select * from film as f right join film_actor as fa on f.film_id = fa.film_id where title is null;

-- ----------------------------------------------------------------
-- cross join

select * from film cross join film_actor;

-- ----------------------------------------------------------------
-- full outer join

-- select count(*) from film as f full outer join film_actor as fa on f.film_id = fa.film_id;
select * from film as f left join film_actor as fa on f.film_id = fa.film_id union select * from film as f right join film_actor as fa on f.film_id = fa.film_id;

-- ----------------------------------------------------------------
-- natural join

select * from film natural join film_category;

-- ----------------------------------------------------------------
-- self join
select * from film as f join film on f.film_id = f.language_id;

-- ----------------------------------------------------------------
-- non - correlated queries

select* from payment;
-- give the customer id who is spending more than average
select avg(amount) from payment;
select distinct customer_id from payment where amount > 4.2;

select distinct customer_id from payment where amount > (select avg(amount) from payment);

-- retrieve the film title, desc and release year for the film that has the longest duration
select * from film;
select title, description, release_year from film where length = (select max(length) from film);

-- ----------------------------------------------------------------
-- scalar subquery

-- show the title, rental_rate and diff from average rental rate for each film
select title, rental_rate, rental_rate - (select avg(rental_rate) from film) as average_rental_diff from film;

-- ----------------------------------------------------------------
-- multirow subquery

-- write a query to generate a list of customer ID's along with the number of film rentals and the total payments;
select * from payment;
select c.first_name, c.last_name, tot_re-- ntals, tot_payments from customer c inner join (select customer_id, count(customer_id) as tot_retals, sum(amount) as tot_payments from payment group by customer_id) a on c.customer_id = a.customer_id;