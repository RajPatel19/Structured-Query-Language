create table #EMP (Empno varchar(20), Ename varchar(30))

select * from #EMP

-- Aggregate Functions -- Sum, Avg, Max, Min, Count
select sum(sal) as 'Total Sal', avg(Sal) as 'Avg Sal' from EMP

select deptno,sum(sal) as 'Total Sal' , Avg(sal) as ' Avg Sal' from emp group by deptno

select STDEV(Sal) as 'Std Deviation',var(Sal) as 'Variance' from emp

select Deptno, CHECKSUM_AGG(cast(DEPTNO as int)) from emp group by DEPTNO

select Sal * Comm from emp
select CHECKSUM(sal) from emp

select COUNT_BIG(sal) from emp

-- Date & Time 

select GETDATE()

select SYSDATETIME()

--Datepart

select hiredate,
 DATEPART(Year,HIREDATE) as 'Year',
 Datepart(Week,Hiredate) as WeekNum,
 Datepart(Weekday, Hiredate) as 'Weekday',
 Year(Hiredate) as 'Year01',
 Day(Hiredate) as 'Day',
 Month(Hiredate) as 'Month' 
 from emp
 
 select Hiredate,
 DateName(YY,Hiredate) as 'Year',
 DateName(Weekday,Hiredate) as 'Weekday',
 DateName(Month,hiredate) as 'Month' from emp

 select CURRENT_TIMESTAMP

 select GETUTCDATE()

 select GETDATE()

 select SYSDATETIME()

 select GETUTCDATE()
 select sysutcdatetime()

 select SYSDATETIMEOFFSET()

 select hiredate,
 datediff(YY,hiredate,getdate())  as ' No of Years',
 datediff(MONTH,hiredate,getdate()) as ' No of Months',
  datediff(Day,hiredate,getdate()) as ' No of Days',
   datediff(Week,hiredate,getdate()) as ' Weeks' from emp

   select Hiredate,Dateadd(YY,2,hiredate) as 'Years Added',
   Dateadd(MONTH,2,hiredate) as 'Month Added',
   Dateadd(DAY,2,hiredate) as 'Days Added',
   Dateadd(WEEK,2,hiredate) as 'Weeks Added' from emp

   select Hiredate, Eomonth(Hiredate,0),Eomonth(Hiredate,1) from emp
   -- switchoffset
   create table TEST01(dt datetimeoffset)

   insert into TEST01 values('2022-08-13 21:43:00 +5:30')

   select switchoffset(dt,'-08:00') from TEST01
   -- TodateTimeoffset

select TODATETIMEOFFSET(getdate(),-180) result
select TODATETIMEOFFSET('2022-08-13 09:00:00','+13:00')

select DATEFROMPARTS(2022,08,13)

select TIMEFROMPARTS(10,10,20,10,3)

select DATETIME2FROMPARTS(2022,08,13,21,59,10,2,4)
   
select DATETIMEOFFSETFROMPARTS(2022,08,13,21,59,10,0,5,30,0) 

select DATETIMEOFFSETFROMPARTS(2022,08,13,21,59,10,0,-8,00,0) 

select isdate('82638')

-- String Functions

select Ename,UPPER(Ename),Lower(Ename), Reverse(Ename) from emp

select ltrim(ename),rtrim(Ename) from emp

select ltrim('     abcd    '),rtrim('     abcd     ')

select substring(Ename, 2, 4) from emp

select cast(Sal as varchar) + Ename from emp

select cast(hiredate as datetimeoffset) from emp

select convert(datetime,hiredate) from emp

select convert(varchar,hiredate,101) + Ename from emp

-- 101 mm/dd/yyyyy
-- 102 yyyy.mm.dd
-- 103 dd/mm/yyyyy
-- 104 dd.mm.yyyy

select choose(4,100,200,300,400,500)

select hiredate,choose(month(hiredate),'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec') from emp

select comm,isnull(comm,10) from emp

select comm, isnumeric(comm) from emp

select sal, iif(sal>=3000,'Grade A','Grade B') from emp

select sal, iif(sal>=3000,'Grade A',iif(sal>=2000,'Grade B','Grade C')) from emp


-- System Functions

select Ename, TRY_CAST(Ename as datetime) from emp

select Ename, try_convert(int,ENAME) from EMP

select Ename, convert(int, Ename) from emp

select TRY_PARSE('13 Aug 2022' as Date) 

select Try_Parse('ABCD' as int) 
