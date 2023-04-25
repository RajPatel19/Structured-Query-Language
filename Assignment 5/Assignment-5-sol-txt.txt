create table employees(
employee_number int primary key,
last_name varchar(20),
first_name varchar(20),
salary int,
dept_id int);

select * from employees

insert into employees(employee_number,last_name,first_name,salary,dept_id) values
(1001,'smith','john',62000,500),
(1002,'anderson','jane',57500,500),
(1003,'everest','brad',71000,501),
(1004,'horvath','jack',42000,501),
(1005,'smith','aaron',44000,503),
(1006,'stone','scarlett',45000,501),
(1007,'horvath','daniel',46000,502),
(1008,'johnson','emma',48000,502);

create table suppliers(
supplier_id int primary key,
supplier_name varchar(20),
city varchar(20),
state varchar(20));

select * from suppliers

insert into suppliers(supplier_id,supplier_name,city,state) values
(100,'microsoft','redmond','washington'),
(200,'google','mountain view','california'),
(300,'oracle','redwood city','california'),
(400,'kimberly-clark','irving','texas'),
(500,'tyson foods','springdale','arkansas'),
(600,'sc johnson','racine','wisconsin'),
(700,'dole food company','westlake village','california'),
(800,'flowers food','thomasville','georgia'),
(900,'electronic arts','redwood city','california');


create table customers(
customer_id int primary key,
last_name varchar(20),
first_name varchar(20),
favourite_website varchar(20));

select * from customers

insert into customers(customer_id,last_name,first_name,favourite_website) values
(4000,'jackson','joe','techonthenet.com'),
(5000,'smith','jane','digminecraft.com'),
(6000,'ferguson','samantha','bigactivities.com'),
(7000,'reynolds','allen','checkyourmath.com'),
(8000,'anderson','paige',null),
(9000,'johnson','derek','techonthenet.com');

create table orders(
order_id int primary key,
customer_id int,
order_date date);

select * from orders 

insert into orders(order_id,customer_id,order_date) values
(1,7000,'04-18-2016'),
(2,5000,'04-18-2016'),
(3,8000,'04-19-2016'),
(4,4000,'04-20-2016'),
(5,6000,'05-01-2016');

--Q1
select * from employees where salary >= 52000

--Q2
select city,state from suppliers where state like 'california' 

--Q3
select c.customer_id,c.last_name,o.order_date from customers c
inner join orders o 
on c.customer_id = o.customer_id

--Q4
select c.customer_id,c.last_name from customers c
inner join orders o 
on c.customer_id = o.customer_id

--Q5
select count(employee_number)as 'no. of emp in dept',dept_id  from employees
group by dept_id

--Q6
select first_name, salary, dept_id from employees where salary > (select avg(salary) from employees) 

--Q7
select first_name,trim(first_name) as 'aft trim' from employees

--Q8
select concat(first_name,' ',last_name) as 'full name',salary from employees  

--Q9
--the question has some error

--Q10
select count(*) as 'no of sup from wton' from suppliers 
where state like 'washington'

--Q11
update orders set customer_id = 6000 where order_id = 5 

select * from orders

--Q12
select * from customers c 
full join orders o on c.customer_id = o.customer_id
where o.order_id is null


--Q13
select max(salary)as 'max salary',min(salary) as 'min salary',dept_id from employees
group by dept_id 

--Q14
select salary as 'max salary',dept_id from employees
where salary = (select max(salary) from employees)

--Q15
select salary as 'max salary',dept_id from employees
where salary = (select min(salary) from employees)

--Q16
select top (1) count(*) as 'no.ofsupp', state from suppliers group by state
order by [no.ofsupp] desc

--Q17
select * from employees where first_name like 'j%'
select * from customers where first_name like 'j%'

--Q18
select top(1) count(*) as 'noofemp',dept_id from employees
group by dept_id order by noofemp desc 

--Q19
select top(1) count(*)as 'nooforder', month(order_date) as 'month' from orders
group by month(order_date) order by nooforder desc

--Q20
select * from customers c
inner join orders o 
on c.customer_id = o.customer_id
where day(order_date) = 1 and month(order_date) = 5 and year(order_date) = 2016
