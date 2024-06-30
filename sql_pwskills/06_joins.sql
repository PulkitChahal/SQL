-- operations - from, join, where, group by, having, select, order by, limit

-- Joins - inner join, left join, right join, full join

-- T1					t2
-- stid name age      stid tid subject
-- 1	abc		12		2	3	maths
-- 2	bdc		23		4	3	maths	
-- 3	ojn		25		5	4	science
-- 4	ljn		26

-- inner join - stid
-- T1					t2
-- stid name age      stid tid subject
-- 2	bdc		23		2	3	maths
-- 4	ljn		26		4	3	maths	

select * from actor;
select * from actor_award;
select * from actor inner join actor_award on actor.actor_id = actor_award.actor_id;

-- T1					t2
-- stid name age      stid tid subject
-- 1	abc		12		2	3	maths
-- 2	bdc		23		4	3	maths	
-- 3	ojn		25		5	4	science
-- 4	ljn		26

-- left join - stid
-- T1					t2
-- stid name age      stid tid subject
-- 1	abc		12	   nul  nul  nul
-- 2	bdc		23		2	3	maths
-- 3	ojn		25	   nul  nul  nul
-- 4	ljn		26		4	3	maths

select * from actor left join actor_award on actor.actor_id = actor_award.actor_id;

-- T1					t2
-- stid name age      stid tid subject
-- 1	abc		12		2	3	maths
-- 2	bdc		23		4	3	maths	
-- 3	ojn		25		5	4	science
-- 4	ljn		26

-- right join - stid
-- T1					t2
-- stid name age      stid tid subject
-- 2	bdc		23		2	3	maths
-- 4	ljn		26		4	3	maths	
-- nul	nul	nul			5	4	science

select * from actor right join actor_award on actor.actor_id = actor_award.actor_id;

-- ------------------------------------------------------------------
-- Display all the citites in India?
select * from country;
select * from city;
select city, country from city inner join country on city.country_id = country.country_id where country.country = 'India';

-- Display all the citites with there postal code in India?
select * from country;
select * from city;
select * from address;
SELECT 
    postal_code, city, country
FROM
    address
        INNER JOIN
    city ON address.city_id = city.city_id
        INNER JOIN
    country ON city.country_id = country.country_id
WHERE
    country.country = 'India';
    
-- Display the names of actors and the names of film they have acted in?
select * from actor; -- name of actor
select * from film_actor; -- common connection
select * from film; -- title

SELECT 
    CONCAT(first_name, ' ', last_name) AS actor_name, title
FROM
    actor
        INNER JOIN
    film_actor ON actor.actor_id = film_actor.actor_id
        INNER JOIN
    film ON film_actor.film_id = film.film_id;
    
-- Display the names of actors and total number of films they have acted in?
select
	CONCAT(first_name, ' ', last_name) AS actor_name, count(title) as count_of_movies
from 
	actor
		left join
	film_actor on actor.actor_id = film_actor.actor_id
		left join
	film on film_actor.film_id = film.film_id
group by actor_name
order by count_of_movies;