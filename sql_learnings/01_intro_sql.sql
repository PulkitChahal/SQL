create database sql_learnings;

use sql_learnings;

create table amazon_orders (
	order_id integer,
    order_date date,
    product_name varchar(100),
    total_price decimal(6,2),
    payment_method varchar(20)
);

insert into amazon_orders values(1, '2022-10-01', 'Baby Milk', 30.5, 'UPI');
insert into amazon_orders values(2, '2022-10-02', 'Baby Powder', 130, 'Credit Card');

select * from amazon_orders;

select product_name, order_date, total_price from amazon_orders;