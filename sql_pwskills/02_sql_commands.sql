USE sql_pwskills;

select now();
select curdate();
select curtime();

CREATE TABLE IF NOT EXISTS teachers (
    t_id INT,
    t_name CHAR(50),
    PRIMARY KEY (t_id)
);

create table if not exists pwstudents1 (
	studentid int,
	student_name char(50) not null,
	student_email varchar(100) unique,
	joining_date date default('2023-11-05'),
	short_desc text,
	marks decimal(3,2),
	teacher_id int,
	primary key (studentid),
	foreign key (teacher_id) references teachers(t_id)
);

describe pwstudents1;

-- ------------------------------------------------------------------
-- DML - insert, update, delete

-- insert into tablename(column names) value ();

insert into teachers value (1, 'Sahil garg');

insert into teachers value (2, 'Sahil garg');

insert into teachers (t_id) value (3);

insert into teachers values(4, 'Ekta'), (5, 'Krish');

select * from teachers;

-- UPDATE MY TEACHERS TABLES AND SET t_name VALUE AS NITIN WHERE t_id IS EQUAL TO 2
update teachers set t_name = 'nitin' where t_id = 2;

-- delete values from the teachers table whereever you find t_id as 3
delete from teachers where t_id = 3;

delete from teachers where t_id = 3 or t_id = 4;

-- -------------------------------------------------------
-- DQL - select

show databases;

show tables;

select * from teachers;

select t_id from teachers;

-- operations - from, join, where, group by, having, select, order by, limit

use sql_pwskills;

use mavenmovies;

select * from film;

select title, description from film limit 3;

select film_id , title from film order by film_id desc;

-- ------------------------------------------------------------------
-- comparison operator - < , > , >= , <= , = , !=

select film_id, title from film where film_id < 20;

select film_id, title from film where film_id != 5;

select customer_id, first_name from customer where first_name = 'SANDRA';

-- ------------------------------------------------------------------
-- logical operator - and or not

describe payment;

select * from payment where amount > 2.99 and payment_id = 100;

select * from payment where amount > 2.99 or customer_id = 100;

select * from payment where amount > 2.99 and customer_id = 100 or staff_id = 1;

-- ------------------------------------------------------------------
-- Arithmatic operator -- + - * / %

select * from payment;

select amount, 2*amount from payment;

select amount from payment where amount = 2*amount/2;
