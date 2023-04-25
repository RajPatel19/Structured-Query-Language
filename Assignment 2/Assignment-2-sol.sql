create database institute

create table subject_table
(subject_id int primary key,
subject_name varchar(20) unique);

insert into subject_table(subject_id,subject_name) values
(1,'mathematics'),
(2,'physics'),
(3,'networking'),
(4,'biology'),
(5,'chemistry')

create table teacher_table(
teacher_id int primary key,
T_fname varchar(20) not null,
T_lname varchar(20) not null,
T_subject_id int,
foreign key (T_subject_id) references subject_table (subject_id),
teaching_since date);

insert into teacher_table(teacher_id,T_fname,T_lname,T_subject_id,teaching_since) values
(101,'anish','oberoi',3,'09-19-2016'),
(102, 'vaishnavi','roy',1,'05-26-2015'),
(103,'shiva','rathore',2,'12-21-2012'),
(104,'kiran','sharma',2,'02-01-2018'),
(105,'sneha','tiwari',4,'09-19-2014')

select * from teacher_table

create table student_table(
student_id int primary key,
student_name varchar(20) not null,
st_teacher_id int,
foreign key (st_teacher_id) references teacher_table(teacher_id),
st_age int check(st_age>15),
doa date)

insert into student_table(student_id,student_name,st_teacher_id,st_age,doa) values
(201,'ved',101,17,'05-12-2018'),
(202,'aaron',102,17,'05-15-2019'),
(203,'karan',103,16,'06-22-2018'),
(204 ,'siri',105,18,'07-10-2019'),
(205,'keerti',103,22,'05-11-2019')

select * from student_table

--Q1
--done

--Q2
--done

--Q3
--done

--Q4
select * from student_table where st_age = 17

--Q5
select T_fname from teacher_table where T_fname like 's%'

--Q6
select student_name,st_age from student_table where st_age between 17 and 20

--Q7
select student_id,st_teacher_id,st_age from student_table where st_teacher_id = 103 and st_age = 16

--Q8
select * from student_table where st_teacher_id<>103

--Q9
select T_fname,T_lname from teacher_table where T_subject_id = 1

--Q10
select T_lname from teacher_table where T_lname like '%i%' or T_lname like 'i%' or T_lname like '%i'   

--Q11
select student_name,st_teacher_id,doa from student_table where st_teacher_id = 105

--Q12
select * from student_table s
inner join teacher_table t
on s.st_teacher_id = t.teacher_id
inner join subject_table st
on t.t_subject_id = st.subject_id
where st.subject_name like 'physics'

--Q13
select s.student_name,t.T_fname,t.T_lname from student_table s
inner join teacher_table t
on s.st_teacher_id = t.teacher_id

--Q14
select st.st_teacher_id from student_table st 
inner join teacher_table tt 
on st.st_teacher_id <> tt.teacher_id

--Q15
update student_table set st_teacher_id = 103 where student_id = 205
select * from student_table

--Q16
select * into student_bkp from student_table
select * into teacher_bkp from teacher_table
select * into subject_bkp from subject_table

--Q17
insert into subject_bkp (subject_id,subject_name)values
(6,'data science'),
(7,'data analytics'),
(8,'reservoir'),
(9,'production'),
(10,'drilling');

insert into teacher_bkp(teacher_id,T_fname,T_lname,T_subject_id,teaching_since)values
(111,'chandana','borha',10,'04-27-2019'),
(112,'monika','singh',9,'06-22-2016'),
(113,'dhara','patel',8,'02-15-2020'),
(114,'shailly','patel',7,'09-16-2017'),
(115,'setu','patel',6,'08-2-2018');

insert into student_bkp(student_id,student_name,st_teacher_id,st_age,doa) values
(211,'om',115,22,'05-22-2019'),
(212,'rohan',114,21,'06-2-2020'),
(213,'jeet',113,19,'07-25-2018'),
(214,'nikunj',112,17,'08-17-2017'),
(215,'raj',111,21,'07-20-2019');


--Q18
merge student_bkp as t
using student_table as s
on t.student_id = s.student_id
when not matched by source then delete;

merge teacher_bkp as t
using teacher_table as s
on t.teacher_id = s.teacher_id
when not matched by source then delete;

merge subject_bkp as t
using subject_table as s
on t.subject_id = s.subject_id
when not matched by source then delete;

--Q19
insert into subject_table (subject_id,subject_name)values
(6,'operating system'),
(7,'english'),
(8,'java'),
(9,'python'),
(10,'machine learning');

insert into teacher_table(teacher_id,T_fname,T_lname,T_subject_id,teaching_since)values
(106,'shubham','mehta',9,'04-27-2019'),
(107,'karthik','prasad',8,'06-22-2016'),
(108,'shiv','acharya',10,'07-21-2007'),
(109,'kiara','advani',7,'04-19-2018'),
(110,'shreya','mishra',8,'04-16-2015');

insert into student_table(student_id,student_name,st_teacher_id,st_age,doa) values
(206,'shray',110,18,'05-22-2019'),
(207,'amit',107,17,'05-18-2018'),
(208,'sirisha',105,16,'06-13-2019'),
(209,'satwik',108,19,'09-13-2019'),
(210,'manisha',106,18,'05-10-2018');

--Q20
insert into subject_bkp (subject_id,subject_name)values
(6,'operating system'),
(7,'english'),
(8,'java'),
(9,'python'),
(10,'machine learning');

insert into teacher_bkp(teacher_id,T_fname,T_lname,T_subject_id,teaching_since)values
(106,'shubham','mehta',9,'04-27-2019'),
(107,'karthik','prasad',8,'06-22-2016'),
(108,'shiv','acharya',10,'07-21-2007'),
(109,'kiara','advani',7,'04-19-2018'),
(110,'shreya','mishra',8,'04-16-2015');

insert into student_bkp(student_id,student_name,st_teacher_id,st_age,doa) values
(206,'shray',110,18,'05-22-2019'),
(207,'amit',107,17,'05-18-2018'),
(208,'sirisha',105,16,'06-13-2019'),
(209,'satwik',108,19,'09-13-2019'),
(210,'manisha',106,18,'05-10-2018');

--Q21
create table exam(
exam_id int, 
exam_subject_id int foreign key references subject_table(subject_id),
exam_date date)

insert into exam
values(301,10,'08-24-2019'),
(302,2,'08-26-2019'),
(303,9,'08-28-2019'),
(304,8,'08-30-2019'),
(306,4,'09-03-2019')


create table t_exam(
texam_id int, 
exam_subject_id int foreign key references subject_table(subject_id),
texam_date date)

insert into t_exam
values(301,10,'08-21-2019'),
(302,2,'08-23-2019'),
(303,9,'08-25-2019'),
(304,8,'08-27-2019'),
(305,7,'08-29-2019'),
(306,4,'08-31-2019')

select * from t_exam
select * from exam

merge t_exam as t
using exam as e
on t.texam_id = e.exam_id
when matched 
then update set t.exam_subject_id = e.exam_subject_id, t.texam_date = e.exam_date
when not matched by target
then insert(texam_id,exam_subject_id,texam_date) values (e.exam_id,e.exam_subject_id,e.exam_date)
when not matched by source
then delete ;

--Q22
select student_name,doa from student_table where month(doa) = 9 and year(doa) = 2019

--Q23
update student_table set st_teacher_id =109 where student_name like 'sirisha'

--Q24
select count(doa) as 'doa in 2109' from student_table where year(doa) = 2019 

--Q25
select count(st.subject_name) as 'physics' from student_table s
inner join teacher_table t
on s.st_teacher_id = t.teacher_id
inner join subject_table st
on t.t_subject_id = st.subject_id
where st.subject_name like 'physics'


--Q26
select min(doa) as 'oldest student'  from student_table

--Q27
select * from student_bkp
select * from student_table
select * from teacher_bkp
select * from teacher_table

select top(1) t.T_fname,s.st_age from student_bkp s
inner join teacher_bkp t on s.st_teacher_id = t.teacher_id
group by s.st_age,t.T_fname 
having s.st_age = min(s.st_age) 
order by s.st_age


--Q28
select concat(T_fname,' ',T_lname) as 'full name' from teacher_table 

--Q29
alter table teacher_table add salary int;

--Q30
update teacher_table set salary = 2000 where teacher_id % 2 = 0 ; 
select * from teacher_table

update teacher_table set salary = 2500 where teacher_id % 2 <> 0 ; 
select * from teacher_table

select * from teacher_table
--Q31
select sum(salary) as 'total salary cost' from teacher_table

--Q32
select sum(salary) as 'total salary cost' from teacher_table

--Q33
select sum(t.salary) as 'total amount',st.subject_name from student_table s
inner join teacher_table t
on s.st_teacher_id = t.teacher_id
inner join subject_table st
on t.t_subject_id = st.subject_id
group by st.subject_name

--Q34
select top (1) st.subject_name,sum(t.salary) 'max salary' from student_table s
inner join teacher_table t
on s.st_teacher_id = t.teacher_id
inner join subject_table st
on t.t_subject_id = st.subject_id
group by st.subject_name,t.salary order by t.salary desc


--Q35
select count(*) as 'NO. of teacher not teaching' from teacher_table t 
left join  student_table s on s.st_teacher_id = t.teacher_id
where s.student_id is NULL


--Q36
select sum(t.salary) as 'total amount saved' from teacher_table t 
left join  student_table s on s.st_teacher_id = t.teacher_id
where s.student_id is NULL 

--Q37
select max(datediff(yy,teaching_since,getdate())) as 'exp' from teacher_table

--Q38
select top(1) T_fname,max(datediff(yy,teaching_since,getdate())) as 'experience' from teacher_table group by T_fname order by experience desc

--Q39
select count(teaching_since) from teacher_table where month(teaching_since) = 9

--Q40
select concat(t_fname,' ',T_lname),teaching_since as 'full name' from teacher_table where year(teaching_since) = 2018

--Q41
select count(teaching_since) as 'no. of teacher joined',month(teaching_since) as 'month of joining' from teacher_table 
group by month(teaching_since)

--Q42
select top(3) datediff(yy,teaching_since,getdate()) as 'experience',T_fname from teacher_table order by experience desc 

--Q43
select max(datediff(yy,teaching_since,getdate())) as 'experience' from teacher_table 
where datediff(yy,teaching_since,getdate()) < (select max(datediff(yy,teaching_since,getdate())) from teacher_table)

--Q44


--Q45
select avg(t.salary) as 'avg salary for subject' , s.subject_name from subject_table s
inner join teacher_table t on s.subject_id = t.T_subject_id
group by s.subject_name

--Q46
create table admins(
admin_id int,
admin_name varchar(40),
ad_student_id int,
stu_fee int);

insert into admins(admin_id,admin_name,ad_student_id,stu_fee) values
(103,'Shiva Rathore',205,7000),
(107,'Karthik Prasad',204,6000), 
(112,'Renu Devi',209,7500),
(113,'Vani Balakrishnan',201,6600), 
(103,'Shiva Rathore',203,5500),
(114,'Malavika Iyer',206,6200), 
(107,'Karthik Prasad',202,5000),
(112,'Renu Devi',207,7500), 
(113,'Vani Balakrishnan',210,6400),
(103,'Shiva Rathore',208,6000) 

select * from admins

--Q47
select admin_name, count(ad_student_id) as 'admission taken' from admins group by admin_name

--Q48
select count(distinct(t.teacher_id)) as 'NO. teachers who was admin' from teacher_table t
inner join admins a on t.teacher_id = a.admin_id 

--Q49
select distinct(t.teacher_id),concat(t.T_fname,' ',t.T_lname) as 'Names of Teachers who where admin' from teacher_table t
inner join admins a on t.teacher_id = a.admin_id

--Q50
select s.student_name,a.stu_fee from student_table s
inner join admins a on s.student_id = a.ad_student_id
order by a.stu_fee desc

--Q51
select top(2) s.student_name,a.stu_fee from student_table s
inner join admins a on s.student_id = a.ad_student_id
order by a.stu_fee desc



