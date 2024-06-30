use mavenmovies;

-- Retrieve the titles of films that have a rental rate greater than $4.00
select title, rental_rate from film where rental_rate > 4;

-- List the customer names and emails of those who live in the address with the ID 300.
select first_name, last_name, email, address_id from customer where address_id = 300;

-- Find the films with a length between 120 and 150 minutes (inclusive). Display the title and length.
select title, length from film where length between 120 and 150;

-- ------------------------------------------------------------------
-- wildcard operator - like - _ % - text data

-- Retrieve the first and last names of customers whose last name starts with the letter 'S' .
select first_name, last_name from customer where last_name like 'S%';
select first_name, last_name from customer where last_name like '%S';
select first_name, last_name from customer where last_name like '%S%';
select first_name, last_name from customer where last_name like 'S%S';
select first_name, last_name from customer where last_name like '%S%S%';
select first_name, last_name from customer where last_name like '%ES%';
select first_name, last_name from customer where last_name like '%es%';

-- Retrieve the first and lastname of customer whose first name should end with e and start with a?
select first_name, last_name from customer where first_name like 'A%E';

-- Retrieve the first and lastname of customer whose first name where letter a is on second position?
select first_name, last_name from customer where first_name like '_A%';

-- Retrieve the first and lastname of customer whose first name have letter a is on second position and e on 4th position?
select first_name, last_name from customer where first_name like '_a_e%';

-- Retrieve the first and lastname of customer whose first name have letter a is on second position and last name have letter e on 4th position?
select first_name, last_name from customer where first_name like '_a%' and last_name like '___e%';

-- ------------------------------------------------------------------
-- constraints -- set of rules
-- not null, default, unique, primary key, foreign key, candidate key, super key, composite key, check, artifical key

use sql_pwskills;

create table if not exists pwstudents2 (
	studentid int,
	student_name char(50) not null,
    adhaar_card int, -- candidate key - which can become primary key
	student_email varchar(100) unique,
	joining_date date default('2023-11-05'),
    age int check(age>=18),
    short_desc text,
	marks decimal(3,2), -- 000.00
	teacher_id int,
	primary key (studentid),
	foreign key (teacher_id) references teachers(t_id)
);

use mavenmovies;

select * from address;

select concat(address_id, ' ', city_id) as composite_key from address;
select concat(district, address) from address;
select concat(district, ' ', address) from address;