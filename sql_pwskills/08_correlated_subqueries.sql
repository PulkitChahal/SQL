use mavenmovies;
-- Correlated queries

-- Retrieve the titles of films that have a rental rate higher than the average rental rate?
select title from film where rental_rate > (select avg(rental_rate) from film);

-- Retrieve the titles of films that have a rental rate higher than the average rental rate of films release in the same year?
select title from film as f where rental_rate > (select avg(rental_rate) from film where release_year = f.release_year);
-- or
select title from film f where rental_rate > (select avg(rental_rate) from film where release_year = f.release_year);

-- List customers who have made more than five payments. Display their first_name, last_name?
select customer_id, count(*) from payment group by customer_id having count(*) > 5;
-- or
select first_name, last_name from customer where (select count(*) from payment where payment.customer_id = customer.customer_id) >5;
-- or
select first_name, last_name , count(*) from customer join payment on customer.customer_id = payment.customer_id group by first_name, last_name having count(*) > 5;

-- Find films with a rental rate higher than the average rental rate for all films. Display the title and rental rate.
select title, rental_rate from film where rental_rate > (select avg(rental_rate) from film);

-- Retrieve the names of actors who have appeared in at least two films. Display their first name and last name.
select actor_id , count(film_id) from film_actor group by actor_id having count(film_id)  > 2;

select first_name, last_name from actor a where (select count(film_id) from film_actor fa where a.actor_id = fa.actor_id) >= 2;

-- Write a query to count the number of film rentals for each customer and the containing query then retrieves those customers name who have rented exactly 30 films.
select first_name, last_name from customer where (select count(rental_id) from rental where rental.customer_id = customer.customer_id) = 30;

-- Write a query to find all customers whose total payments for all film rentals are between 100 and 150 dollars.
select first_name, last_name from customer c where (select sum(amount) from payment p where c.customer_id = p.customer_id) between 100 and 150;

-- Write a query to generate a list of customer IDs along with the number of film rentals and the total payments.
select c.first_name, c.last_name , tot_rentals , tot_payments from customer c inner join ( select customer_id , count(customer_id) as tot_rentals , sum(amount) as tot_payments
 from payment group by customer_id) a 
 on c.customer_id = a.customer_id;