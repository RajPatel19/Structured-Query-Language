-- Joins
-- Inner Join
-- Left Join
-- Right Join
-- Full Outer join
-- Self Join
-- other Join

-- Anti Join

-- Inner Join or Equi join or Join --> Only Matched Rows 
select * from emp
select * from dept

select * from EMP Inner join DEPT on EMP.deptno=DEPT.DEPTNO
select X1.EMPNO,X1.ENAME,X2.DNAME,X2.LOC from EMP x1 inner join DEPT x2 on X1.deptno=X2.DEPTNO

-- Left Join or Left Outer Join

select * from Emp left join dept on emp.deptno=dept.DEPTNO
select * from Emp left outer join dept on emp.deptno=dept.DEPTNO

insert into Emp values(1122,'SQL01','MANAGER',7902,'1992-01-01',12000,100,60)

-- Right join or Right Outer join

select * from Emp right join dept on emp.deptno=dept.DEPTNO
select * from Emp right outer join dept on emp.deptno=dept.DEPTNO

-- Full Outer Join

select * from Emp Full outer join dept on emp.deptno=dept.DEPTNO

-- Method 1 

Sp_help EMP

-- Method 2 
select * from sys.tables 

select * from sys.all_columns where object_id=645577338

-- Method 3

select * from INFORMATION_SCHEMA.COLUMNS where table_name like 'EMP'


-- Multiple Table Joins

select C.customerName,C.City,C.Country,o.orderdate,od.quantity ,
p.productname, p.price, p.unit,ct.categoryname,ct.description,
s.shippername, s.phone  from customers c 
join orders o on c.customerid=o.customerid
join orderdetails od on od.orderid=o.orderid
join products p on p.productid=od.productid
join categories ct on ct.categoryid=p.categoryid
join shippers s on s.shipperid=o.shipperid


-- self Join
-- other join

select * from emp ,dept

-- Self Join
select E1.EMPNO,E1.ENAME,E1.MGR,E2.ENAME from emp E1 inner join Emp E2 on E1.MGR=E2.EMPNO

-- Other Join

select * from emp E,salgrade S where e.sal >=s.LOSAL and e.sal <=s.hisal 

select * from SALGRADE

select * from emp where 1=2

-- Insert Into

select * into EMP_001 from (select * from emp where 1=2) as T1

select * From EMP_001

insert into EMP_001 select * from emp where deptno=10

select * from EMP_001

create table EMP_002 (Ename varchar(50),Sal Numeric(30))

insert into EMP_002 select Ename, Sal from EMP

select * into EMP_003 from (select * from emp where 1=2) as T1

select * from EMP_003

--city varchar(10) to varchar(20) and address varchar(10) to varchar(20) in a table

alter table customers alter column city varchar(20)
alter table customers alter column address varchar(50)

create table EMP_004 (EmpId varchar(10), Sal numeric(20), Name varchar(40))

insert into EMP_004 (EmpId) values(7566)

select * from EMP_004

select * from emp

update T   
Set T.Sal=t2.sal,
T.name=t2.ename
From EMP_004 T inner join EMp T2 on t2.empno=T.EmpId

select * into EMP_005 from (select * from Emp where 1=2 ) as t2

select * from EMp_005

insert into Emp_005(EMPNO) values (7566)

select * from EMP_005

update T1
set T1.ENAME=E.Ename,
T1.SAL=E.sal,
T1.Job=E.job,
T1.DEPTNO=E.DEPTNO,
T1.Comm=E.COMM
from EMp_005 T1 inner join Emp E on T1.EMPNO=E.EMPNO

-- Delete Join
Delete T2
from Emp_005 T2 inner join emp e on e.empno=T2.empno
where e.comm is null


-- Merge 

-- Target Table
CREATE TABLE Products_01
(
   ProductID INT PRIMARY KEY,
   ProductName VARCHAR(100),
   Rate int
) 
GO

INSERT INTO Products_01
VALUES
   (1, 'Tea', 10.00),
   (2, 'Coffee', 20.00),
   (3, 'Muffin', 30.00),
   (4, 'Biscuit', 40.00)
GO

select * from Products_01

-- Source Table 

CREATE TABLE UpdatedProducts
(
   ProductID INT PRIMARY KEY,
   ProductName VARCHAR(100),
   Rate int
) 
GO

INSERT INTO UpdatedProducts
VALUES
   (1, 'Tea', 10.00),
   (2, 'Coffee', 25.00),
   (3, 'Muffin', 35.00),
   (5, 'Pizza', 60.00)
GO

select * from products_01
select * from updatedproducts

merge products_01 As Target
using updatedproducts as source
on (target.ProductID=source.productid)
-- when records are matched , update the records if there is any chnages
when Matched --and target.productname <>source.productname or target.rate <>source.rate
then update set target.productname=source.productname , target.rate=source.rate
when Not Matched by target
then Insert (productID, productname, rate) values(source.productid,source.productname, source.rate)
when not matched by source
then delete;


select * from Products_01


