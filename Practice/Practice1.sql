create database SQLCLASSESTEST

use SQLCLASSES11to1PM

select * from emp 

CREATE TABLE EMP
       (EMPNO NUMERIC(4) NOT NULL,
        ENAME VARCHAR(10),
        JOB VARCHAR(9),
        MGR NUMERIC(4),
        HIREDATE DATE,
        SAL NUMERIC(7, 2),
        COMM NUMERIC(7, 2),
        DEPTNO NUMERIC(2));

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        '17-DEC-1980',  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        '20-FEB-1981', 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        '22-FEB-1981', 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        '2-APR-1981',  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        '28-SEP-1981', 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        '1-MAY-1981',  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        '9-JUN-1981',  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        '09-DEC-1982', 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        '17-NOV-1981', 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        '8-SEP-1981',  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        '12-JAN-1983', 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        '3-DEC-1981',   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        '3-DEC-1981',  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        '23-JAN-1982', 1300, NULL, 10);

select * from emp

select empno, ename, job ,mgr from EMP

select empno ,ename, job,sal ,sal*12 as 'Total Salary' from emp

select Top 10 * from emp

select count(*) from emp

select empno,ename,sal,comm, sal+comm as 'Total Salary' from emp

select Empno as 'Employee No' ,Ename as 'Employee Name' from emp

-- distinct 

select distinct Job from emp

select distinct * from emp

-- Clauses
-- Where

select * from emp where deptno=10

select * from emp where deptno=10 or deptno=20

select * from emp where job = 'CLERK' or job ='manager'

select * from emp where deptno=10 or job ='CLERK'

select * from emp where sal >=2000

select * from emp where sal >=2000 and sal <=4000

-- In , Not In
select * from emp where deptno in (10,30,20)

select * from emp where job in ('CLERK','MANAGER')

select * from emp where empno in (7369,7782)

select * from emp where deptno not in (10,30)

-- like , Not Like

select * from emp where ename like 'S%'

select * from emp where ename like '%H'

select * from emp where ename like '%O%'

select * from emp where ename not like 'S%'

select * from emp where deptno in (10, 20) and ename like '%o%'

select * from emp where Month(hiredate)=12

select * from emp where deptno <>10

select sum(sal) from emp -- Sum, Avg, Max, Min,Count






