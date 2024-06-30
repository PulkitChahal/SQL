use mavenmovies;
-- Subquery -- non-correlated subqueries
select avg(amount) from payment;

select payment_id, amount from payment where amount > (select avg(amount) from payment);

select * from film;
select * from language;

select film_id, title from film where language_id in (select language_id from language where name like '%e%');

select film_id, title, name from film inner join language on film.language_id = language.language_id where name like '%e%';

select film_id, title, name, language.language_id from film inner join language on film.language_id = language.language_id where name like '%e%';

-- Find the films that have a higher rental rate than any film in th 'Action' genere. Display the title and renatl rate.
select * from film; -- title, rental_rate
select category_id from category where name = 'Action';

select film_id from film_category where category_id = (select category_id from category where name = 'Action');

select max(rental_rate) from film where film_id in (select film_id from film_category where category_id = (select category_id from category where name = 'Action'));

select * from film where rental_rate > (select max(rental_rate) from film where film_id in (select film_id from film_category where category_id = (select category_id from category where name = 'Action')));

-- Retrieve the films that have a replacement cost higher than the average replacement cost of films in the 'Drama' genre. Display the title and replacement cost.
select * from film;
select * from film_category;
select title, replacement_cost from film where replacement_cost > (select avg(replacement_cost) from film where film_id in (select film_id from film_category where category_id = (select category_id from category where name = 'Drama')));

-- Retrieve the titles of films that have a rental duration greater than the average rental duration of all films.
select * from film;
select avg(rental_duration) from film;
select title, rental_duration from film where rental_duration > (select avg(rental_duration) from film);

-- List the names of actors who have not appeared in any films. Display the actor's first name and last name.
select * from film;
select * from actor;
select * from film_actor;
select film_id, title from film;
select actor_id, first_name, last_name from actor;
select actor_id, film_id from film_actor;

select first_name, last_name from actor where actor_id in (select actor_id from film_actor where film_id not in (select film_id from film));
-- or
select first_name, last_name from actor where actor_id not in (select actor_id from film_actor);

-- List the first and last names of customers who have made payments.
select first_name , last_name from customer where customer_id in (select distinct customer_id from payment);

-- Find the titles of films that are available in the inventory.
select title from film where film_id in (select distinct film_id from inventory);