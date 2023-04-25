select * from emp

select * from dept

select * from salgrade

-- Clauses
-- Where 

-- Operators 
-- In, Not In
-- like , Not Like
-- Between , Not Between
select * from emp where sal between 2000 and 4000
select * from emp where sal >=2000 and sal <=4000

select * from emp where sal not between 2000 and 4000
select * from emp where sal <2000 or sal>4000

select * from emp where hiredate between '01-Jan-1980' and '31-Dec-1980' -- YYYY-MM-DD
-- Is null, Is not Null

select * from emp where comm is null
select * from emp where comm is not null

select * from EMP where deptno in (10,20,30)

-- Group By 

select Deptno, Sum(Sal) as 'Total Salary', Avg(Sal) as 'Avg of Sal' from emp group by DEPTNO
select Job, Sum(sal) as 'Total Sal', Avg(Sal) as 'Avg Sal' from emp group by JOB
-- Aggregate Function are Min, Max, Count, Sum, Avg
select category,sum(sales) as 'Total Sales',Sum(profit) as 'Total Profit' from SalesOrder group by category 
select category,[sub-category], sum(sales) as 'Total Sales',Sum(profit) as 'Total Profit' from SalesOrder group by category ,[Sub-Category]
-- Order By 
select Category,[sub-category] as SubCategory, sum(sales) as 'Total Sales',Sum(profit) as 'Total Profit' from SalesOrder 
group by category ,[Sub-Category] order by category desc

select Category,[sub-category] as 'SubCategory', sum(sales) as 'Total Sales',Sum(profit) as 'Total Profit' from SalesOrder 
group by category ,[Sub-Category] order by category asc ,[Sub-Category] desc

-- asc  ascending [Default]
-- desc descending 

-- Having
select Category,[sub-category] as 'SubCategory', sum(sales) as 'Total Sales',Sum(profit) as 'Total Profit' from SalesOrder  
group by category ,[Sub-Category]  having sum(sales)>=100000 order by category asc ,[Sub-Category] desc

select Category,[sub-category] as 'SubCategory', sum(sales) as 'Total Sales',Sum(profit) as 'Total Profit' 
from SalesOrder  group by category ,[Sub-Category] having sum(sales)>=100000 order by category asc ,[Sub-Category] desc

-- Data types
create table Sampl01(
	Ename varchar(50), sal numeric(10,2)) -- 8 digits + 2 decimals

insert into Sampl01 values ('A1101',10000)

select * from Sampl01

create table sample02(
 idno smallint,
 rollnumber int)

 insert into sample02 values(40000,31234567878)

-- Constraints

create table Cons_001 (Eid char(5),Ename varchar(50),sal numeric(10))

insert into Cons_001 values('A1101','SCOTT',10000)
insert into Cons_001 values('A1101','JAMES',20000)

-- Unique 

create table Cons_002 (Eid char(5) unique,Ename varchar(50),sal numeric(10))

insert into Cons_002 values('A1101','SCOTT',10000)
insert into Cons_002 values('A1101','JAMES',20000)
insert into Cons_002 values(NULL,'BLAKE',20000)

select * from Cons_002

-- Not Null

create table Cons_003 (Eid char(5) Not Null,Ename varchar(50),sal numeric(10))

insert into Cons_003 values('A1101','SCOTT',10000)
insert into Cons_003 values('A1101','JAMES',20000)
insert into Cons_003 values(NULL,'BLAKE',20000)

-- primary Key

create table Cons_004 (Eid char(5) primary key,Ename varchar(50),sal numeric(10))

insert into Cons_004 values('A1101','SCOTT',10000)
insert into Cons_004 values('A1101','JAMES',20000)
insert into Cons_004 values(NULL,'BLAKE',20000)

create table Cons_005 (Eid char(5) primary key,Ename varchar(50) Not Null,sal numeric(10) Not Null)

-- Check

create table Cons_006 (Eid char(5) primary key,Ename varchar(50),sal numeric(10) check(sal>=10000))

insert into Cons_006 values('A1101','SCOTT',10000)
insert into Cons_006 values('A1101','JAMES',20000)
insert into Cons_006 values(NULL,'BLAKE',20000)

-- Default 

create table Cons_007 (Eid char(5) primary key,Ename varchar(50),sal numeric(10) check(sal>=10000),loc varchar(15)
Default 'Bengaluru')

insert into Cons_007 values('A1101','SCOTT',10000,'Mumbai')
insert into Cons_007(Eid,Ename,Sal) values('A1102','SCOTT',10000)
insert into Cons_007(Eid,Ename,Sal) values('A1103','ALLEN',10000)

select * from Cons_007

-- Unique 
-- Not Null
-- primary key
-- Check
-- Default 
-- Foreign Key References

-- Cons_007 as Base table
select * from Cons_007
create table payrollcalc (eid char(5) references cons_007(Eid), TotalSal Numeric(12))

insert into payrollcalc values ('A1104',15000)

sp_help payrollcalc

sp_help Cons_007

alter table cons_007 drop constraint CK__Cons_007__sal__35BCFE0A

create table AllConstraints(
	Eid char(5),
	Ename varchar(50),
	DoJ Date,
	Sal numeric(10,2),
	constraint ALLC_EID_PK primary Key (Eid),
	constraint ALLC_Ename_UQ unique (Ename),
	constraint ALLC_Doj_Check check (Doj >='01-Jan-2020'))

sp_help AllConstraints

alter table AllConstraints drop constraint ALLC_EID_PK

Alter table cons_002 add Email varchar(100)

Alter table cons_002 drop column email

create table AllConstraints_001(
	Eid char(5),
	Ename varchar(50),
	DoJ Date,
	Sal numeric(10,2),
	emailid varchar(100),
	constraint ALLC01_EID_EMAIL_PK primary Key (Eid, emailid)
)