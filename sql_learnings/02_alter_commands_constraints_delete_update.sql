use sql_learnings;

select * from amazon_orders;

alter table amazon_orders modify order_date datetime;

insert into amazon_orders values(5, '2022-10-01 12:05:12', 'Shoes', 132.5, 'UPI');

select * from amazon_orders;

alter table amazon_orders add username varchar(20);

insert into amazon_orders values(6, '2022-10-01 12:05:12', null, 132.5, 'UPI', 'Ankit');
insert into amazon_orders values(7 , '2022-10-01 12:05:12', 'null', 132.5, 'UPI', 'Ankit');

alter table amazon_orders add category varchar(20);

select * from amazon_orders;

alter table amazon_orders drop column category;

select * from amazon_orders;
