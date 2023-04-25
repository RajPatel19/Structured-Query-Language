CREATE TABLE EMPLOYEE(
	EMP_ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME CHAR(100),
	LAST_NAME CHAR(100),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(100)
);


INSERT INTO EMPLOYEE(EMP_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
values (001,'Anika', 'Arora', 100000, '02-14-2020 09:00:00', 'HR'),
(002,'Veena', 'Verma', 80000, '06-15-2011 09:00:00', 'Admin'),
(003,'Vishal', 'Singhal', 300000,'02-16-2020 09:00:00', 'HR'),
(004,'Sushanth', 'Singh', 500000,'02-17-2020 09:00:00', 'Admin'),
(005,'Bhupal', 'Bhati', 500000, '06-18-2011 09:00:00', 'Admin'),
(006,'Dheeraj', 'Diwan', 200000,'06-19-2011 09:00:00', 'Account'),
(007,'Karan', 'Kumar', 75000,'01-14-2020 09:00:00', 'Account'),
(008,'Chandrika', 'Chauhan', 90000,'04-15-2011 09:00:00','Admin')

 select * from employee


CREATE TABLE EMP_BONUS (
	EMP_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (EMP_REF_ID) REFERENCES EMPLOYEE(EMP_ID)
	ON DELETE CASCADE
);


INSERT INTO EMP_BONUS 
	(EMP_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '02-16-2020'),
		(002, 3000, '06-16-2011'),
		(003, 4000, '02-16-2020'),
		(001, 4500, '02-16-2020'),
		(002, 3500, '06-16-2011');


CREATE TABLE EMP_TITLE (
	EMP_REF_ID INT,
	EMP_TITLE CHAR(25),
	AFFECTIVE_FROM DATETIME,
	FOREIGN KEY (EMP_REF_ID) REFERENCES EMPLOYEE(EMP_ID)
    ON DELETE CASCADE
);


INSERT INTO EMP_TITLE 
 (EMP_REF_ID, EMP_TITLE, AFFECTIVE_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

 SELECT * FROM EMPLOYEE
 SELECT * FROM EMP_BONUS
 SELECT * FROM EMP_TITLE


 -- TASKA TO BE PERFORMED
 
 --Q1
 select first_name as employee_name from employee
 
 --Q2
 select upper(last_name) as last_name from employee 

 --Q3
 select distinct department from employee

 --Q4
 select substring(last_name,1,3) from employee

 --Q5
 select distinct department, len(department) as lenth_department from employee

 --Q6
 select concat(first_name,' ' ,last_name)full_name from employee 

 --Q7
 select * from employee order by first_name asc

 --Q8
 select * from employee order by first_name asc,department desc

 --Q9
 select * from employee where first_name like 'veena' or first_name like 'karan'

 --Q10
 select * from employee where department like 'admin' 

 --Q11
 select * from employee where first_name like '%v%' or first_name like '%v' or first_name like 'v%'

 --Q12
 select * from employee where salary between 100000 and 500000

 --Q13
 select * from employee where month(joining_date) = 02 and year(joining_date) = 2020

 --Q14
 select first_name,salary from employee where salary between 50000 and 100000 
 
 --Q16
 select * from employee e
 inner join emp_title t
 on e.emp_id = t.emp_ref_id 
 where t.emp_title = 'manager'

 select * from EMPLOYEE
 select * from emp_title
 select * from emp_bonus

 --Q17
 select department,count(*) as numbers from employee group by department having count(department) > 1

 --Q18
 select * from employee where emp_id%2 = 1

 --Q19
select * into employee1 from employee
select * from employee1

--Q20
select top(2) salary from employee order by salary desc 

--Q21
select first_name , last_name,salary from employee 
where salary =
(select salary from employee
group by salary 
having count(salary)>1) 

--Q22
select max(salary) from employee 
where salary < (select max(salary) from employee)

--Q23
select top 50 percent * from employee

--Q24
select department from employee
group by department having count(department)<4

--Q25
select department, count(department) as 'No. of emp working' from employee
group by department

--Q26
select concat(first_name,'',last_name)name,salary,department from employee
where salary in 
(select max(salary) from employee group by department)

--Q27
select concat(first_name,'',last_name)name,salary,department from employee
where salary = (select max(salary) from employee)

--Q28
select department , avg(salary) as 'avg salary' from employee group by department

--Q29
select * from emp_bonus
select concat(e.first_name,'',e.last_name)name , b.bonus_amount
from employee e 
inner join emp_bonus b
on e.emp_id = b.emp_ref_id
where bonus_amount = (select max(bonus_amount) from emp_bonus)

--Q30
select first_name , emp_title from employee
inner join emp_title
on emp_id = emp_ref_id