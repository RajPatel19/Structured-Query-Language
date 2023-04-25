-- Case Statement
select *,(case when sal >=10000 then 'Grade A' when sal>=5000 then 'Grade B' Else 'Grade C' End) from emp

select *,(case when sal >=10000 then 'Grade A' when sal>=5000 then 'Grade B' when sal >=3000 THEN 
'Grade C' Else 'Grade D' End) from emp

select *, (case when deptno=10 then 'ADMIN' when Deptno=20 then 'HR' when deptno=30 then 'ANALYSTS'
else 'DEVELOPMENT' end) as 'DEPTNAME' from emp order by deptno

-- IIF Statement

with SQL01 as (
select *, iif(sal>=5000 or deptno=10,'Grade A', 'Grade B') as 'Grades' from emp) 
select * from SQL01 where Grades like 'Grade A'

select *, iif(sal>=5000,'Grade A',iif(sal>=3000,'Grade B','Grade C')) as 'Grades' from emp

select *, iif(sal>=5000,'Grade A',iif(sal>=3000,'Grade B',iif(sal>=1000,'Grade C','Grade D'))) as 'Grades' from emp

-- Stored procedure
-- Functions

declare @abcd int
set @abcd=10
print @abcd

declare @y int
set @y=10
select * from emp where deptno=@y

declare @z varchar(max)
set @z='ANALYST'
select * from emp where job like @z;

Begin
declare @x int
set @x=20
select * from emp where deptno=@x
End

Begin
declare @a int
set @a=7369
if exists (select * from emp where Empno=@a)
	print 'Records Available'
else
	print 'Records NA'
End

Begin
declare @b varchar(max)
set @b='SMITH'
if exists (select * from emp where ename like @b)
	print 'Records Available'
else
	print 'Records NA'
End

Begin
declare @C varchar(max), @d int
set @C='SMITH'
set @d=30
if exists (select * from emp where ename like @c)
	if exists (select * from emp where ename like @c and deptno=@d)
		print 'Records Available'
else
	print 'Records NA'
End

Begin
declare @g varchar(max)
set @g='SMITH'
if exists (select * from emp where ename like @g)
begin
	print 'Records Available'
	select * from emp where ename like @g
end
else
	print 'Records NA'
End

--Loops
Begin
Declare @i int =1
declare @n int=20
while @i<=@n
begin
	print @i
	set @i=@i+1
End
End

-- Print Even Number
begin
declare @i1 int =1
declare @n1 int=10
while @i1 <=@n1
begin
	if (@i1 % 2) =0
		print @i1
	set @i1=@i1+1
end
end

begin
declare @i2 int =1
declare @n2 int=10
while @i2 <=@n2
begin
	if (@i2 % 2) !=0
		print @i2
	set @i2=@i2+1
end
end

begin
declare @i3 int =0
declare @n3 int=10
while @i3 <=@n3
begin
	print @i3
	set @i3=@i3+2
end
end

-- Break
begin
declare @i4 int =0
declare @n4 int=10
while @i4 <=@n4
begin
	print @i4
	if @i4=5 
		break
	set @i4=@i4+1
end
end

-- Continue
begin
declare @i5 int =0
declare @n5 int=10
while @i5 <=@n5
begin
	set @i5=@i5+1	
	if @i5=5 
		continue
	print @i5	
end
end

select * from programmer

With ABC As 
(select Prof2,max(Salary) SALARY from programmer group by prof2) select * from Programmer where salary in 
(select salary from ABC)

-- Set Operators

select * from emp where deptno=10

select * from emp where Job like 'CLERK'

-- Union
select * from emp where deptno=10
union
select * from emp where Job like 'CLERK'
union
select * from emp where job like 'MANAGER'

select * from EMP_001 where job like 'MANAGER'
union
select * from emp where job like 'MANAGER'

-- Union ALL
select * from emp where deptno=10
union all
select * from emp where Job like 'CLERK'

-- Except

select * from emp where deptno=10
except
select * from emp where Job like 'CLERK'

-- Intersect

select * from emp where deptno=10
intersect
select * from emp where Job like 'CLERK'

select Prof1,count(Prof1) from Programmer group by prof1 having count(prof1)=1

select * from Programmer