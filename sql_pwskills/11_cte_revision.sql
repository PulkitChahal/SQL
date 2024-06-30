use mavenmovies;

-- write a query to count the number of film rentals for each customer and the containing query then retrieves thos customers who have rented exactly 30 films?
select * from customer;
select * from rental;

select first_name, last_name from customer where (select count(*) from rental where rental.customer_id = customer.customer_id) = 30;

-- write a query to find all customers whose total payments for all film rentals are between 100 and 150 dollars?
select first_name, last_name from customer where (select count(*) from payment where customer.customer_id = payment.customer_id and amount between 1 and 150);