use mavenmovies; 

-- Arithmatic operator -- + - * / %

select * from payment;

select amount, 2*amount from payment;

select amount from payment where amount = 2*amount/2;

select amount, amount %2 from payment;

select amount, amount*2 as doubled_amount from payment;

-- ------------------------------------------------------------------
-- comparison operator - < > = !=

select * from film;

select * from film where replacement_cost <= 20;

select * from film where rating != 'PG';
-- OR case to use not equal to <> and !=
select * from film where rating <> 'PG';

-- ------------------------------------------------------------------
-- logical operator -- and , or , not , in , between

select * from film where rating != 'PG' or replacement_cost > 20;

select * from film where rating != 'PG' and replacement_cost > 20;

select * from film where not rating != 'PG';

select * from film where length between 86 and 100;

select * from film where length in (80, 90, 100);

select * from film where length = 80 or length = 90 or length = 100;

-- ------------------------------------------------------------------
-- constraints -- set of rules
-- not null, default, unique, primary key, foreign key, candidate key, super key, composite key, check, artifical key

use sql_pwskills;

create table if not exists pwstudents1 (
	studentid int,
	student_name char(50) not null,
	student_email varchar(100) unique,
	joining_date date default('2023-11-05'),
	short_desc text,
	marks decimal(3,2), -- 000.00
	teacher_id int,
	primary key (studentid),
	foreign key (teacher_id) references teachers(t_id)
);

describe pwstudents1;