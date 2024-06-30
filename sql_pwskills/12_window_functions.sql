use mavenmovies;

-- recursive cte
with recursive even_no (n) as (
select 10 -- anchor
union all
select n+2 from even_no where n < 20 -- recursive
)
select * from even_no;

CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES emp(emp_id)
);

INSERT INTO emp (emp_id, emp_name, manager_id) VALUES
    (1, 'John Doe', NULL), -- Top-level employee
    (2, 'Alice Smith', 1), -- Employee managed by John Doe
    (3, 'Bob Johnson', 1), -- Employee managed by John Doe
    (4, 'Charlie Brown', 2), -- Employee managed by Alice Smith
    (5, 'Diana Williams', 2), -- Employee managed by Alice Smith
    (6, 'Eva Garcia', 3), -- Employee managed by Bob Johnson
    (7, 'Franklin Wang', 3); -- Employee managed by Bob Johnson1
    
with recursive emp_hirarchy as (
select emp_id, emp_name, manager_id, 0 as level from emp where manager_id is null
union all
select e.emp_id, e.emp_name, e.manager_id, level+1 from emp e join emp_hirarchy eh on e.manager_id = eh.emp_id)
select * from emp_hirarchy;

-- window function

-- calculate the average rental duration for films and display both the individual average duration for each film and the overall average duration.
select * from film;
select film_id, rating, title, rental_duration, avg(rental_duration) over(), avg(rental_duration) over(partition by rating) from film;

-- assign the ranks based on ratings alog with rental_durations
select film_id, rating, title, rental_duration, rank() over (
partition by rating order by rental_duration)as rankings from film;
select rating, count(distinct rankings) from ranked group by rating;