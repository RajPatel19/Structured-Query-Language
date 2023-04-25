create database Intel_Assgn

use Intel_Assgn;

CREATE TABLE studies
(
PNAME		varchar(20),
INSTITUTE	varchar(20),
COURSE		varchar(20),
COURSE_FEE	int 
)

SELECT * FROM studies

INSERT INTO studies values
('ANAND','SABHARI','PGDCA',4500 ),
('ALTAF','COIT','DCA',7200 ),
('JULIANA','BDPS','MCA',22000 ),
('KAMALA','PRAGATHI','DCA',5000 ),
('MARY','SABHARI','PGDCA ',4500 ),
('NELSON','PRAGATHI','DAP',6200 ),
('PATRICK','PRAGATHI','DCAP',5200 ),
('QADIR','APPLE','HDCA',14000 ),
('RAMESH','SABHARI','PGDCA',4500 ),
('REBECCA','BRILLIANT','DCAP',11000 ),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000 ),
('VIJAYA','BDPS','DCA',48000);

CREATE TABLE software (
PNAME		varchar(20),
TITLE		varchar(20),
DEVELOPIN	varchar(20),
SCOST		decimal(10,2),
DCOST		int,
SOLD		int
)

SELECT * FROM software

INSERT INTO software values
('MARY','README','CPP',300, 1200, 84), 
('ANAND','PARACHUTES','BASIC',399.95, 6000, 43 ),
('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 ),
('JULIANA','INVENTORY','COBOL',3000, 3500, 0 ),
('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
('MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4), 
('MARY','CODE GENERATOR','C',4500, 20000, 23),
('PATTRICK','README','CPP',300, 1200, 84),
('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 ),
('QADIR','VACCINES','C',1900, 3100, 21 ),
('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4),
('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
('REMITHA','PC UTILITIES','C',725, 5000, 51 ),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
('VIJAYA','TSR EDITOR','C',900, 700, 6);

CREATE TABLE programmer
(
PNAME varchar(20),
DOB date,
DOJ date,
GENDER varchar(2),
PROF1 varchar(20),
PROF2 varchar(20),
SALARY int
)

SELECT * FROM programmer

INSERT INTO programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 ),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 ),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 ),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 ),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 ),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 ),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 ),
( 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 ),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 ),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 ),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 ),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 ),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);

--1. Find out the selling cost AVG for packages developed in Pascal.
select AVG(SCOST) AVERAGE_COST from software
where DEVELOPIN = 'pascal'

select AVG(SCOST) AVERAGE_COST from software
GROUP BY DEVELOPIN HAVING DEVELOPIN =  'pascal'

--2. Display Names, Ages of all Programmers.					
select PNAME,DOB,DATEDIFF(YY,DOB,GETDATE())'AGE' from programmer

--3. Display the Names of those who have done the DAP Course.
select * from studies
where COURSE = 'DAP'

--4. Display the Names and Date of Births of all Programmers Born in January.
select PNAME,DOB from programmer
where MONTH(DOB)='01'

--5. What is the Highest Number of copies sold by a Package?
select * from software where SOLD =(select MAX(SOLD) from software)

--6. Display lowest course Fee.
select * from studies where COURSE_FEE= (select MIN(COURSE_FEE) from studies)

--7. How many programmers done the PGDCA Course?
SELECT COUNT(PNAME)'No_of_programmer' FROM studies
WHERE COURSE = 'PGDCA'

--8. How much revenue has been earned thru sales of Packages Developed in C.
select (SCOST*SOLD)'total revenue' from software where DEVELOPIN = 'c'

--9. Display the Details of the Software Developed by Ramesh.
select * from software where PNAME = 'ramesh'

--10. How many Programmers Studied at Sabhari?
select * from studies s
inner join programmer p
on s.PNAME = p.PNAME
where INSTITUTE = 'sabhari'

--11. Display details of Packages whose sales crossed the 2000 Mark.
SELECT TITLE,SUM(SCOST*SOLD) FROM software
GROUP BY TITLE HAVING SUM(SCOST*SOLD)>2000

--12. Display the Details of Packages for which Development Cost have been recovered.			
select * ,(DCOST/SCOST)'no_of_pack'  from software
where SCOST*SOLD>DCOST*SOLD

--13. What is the cost of the costliest software development in Basic?
select TITLE from software where SCOST = (select MAX(SCOST) from software 
where DEVELOPIN = 'basic')


--14. How many Packages Developed in DBASE?
select COUNT(DEVELOPIN) from software
where DEVELOPIN = 'dbase'

--15. How many programmers studied in Pragathi?
select * from studies s
inner join programmer p
on s.PNAME = p.PNAME
where INSTITUTE = 'Pragathi'

--16. How many Programmers Paid 5000 to 10000 for their course?
select COUNT(PNAME)'no_of_prog' from studies
where COURSE_FEE between 5000 and 10000

--17. What is AVG Course Fee
select AVG(COURSE_FEE) from studies

--18. Display the details of the Programmers Knowing C.
select * from programmer
where PROF1 = 'c' or PROF2 ='c'

--19. How many Programmers know either COBOL or PASCAL.
select COUNT(*) from programmer
where PROF1 = 'cobol' or PROF2 = 'pascal'

--20. How many Programmers Don’t know PASCAL and C
select COUNT(*) from programmer
where PROF1 not in ('pascal','c') and PROF2 not in ('pascal','c')

--21. How old is the Oldest Male Programmer.							
select max(DATEDIFF(YY,DOB,GETDATE()))'age' from programmer where GENDER = 'm'

--22. What is the AVG age of Female Programmers?
select PNAME,DOB,DATEDIFF(YY,DOB,GETDATE())'AGE' from programmer
where GENDER = 'f'

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
select PNAME,DATEDIFF(YY,DOJ,GETDATE())'Experience' from programmer
order by PNAME desc

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month?
select PNAME from programmer where DATEPART(MM,DOB)= DATEPART(MM,GETDATE())


--25. How many Female Programmers are there?
select COUNT(*)'Female Programmers' from programmer where GENDER = 'f'

--26. What are the Languages studied by Male Programmers.
select distinct(PROF1) from programmer where GENDER = 'm'

--27. What is the AVG Salary?
select AVG(SALARY*12) from programmer

--28. How many people draw salary 2000 to 4000?
select COUNT(*)'no_of_people' from programmer
where SALARY between 2000 and 4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL.
select * from programmer where PROF1 not in ('clipper','cobol','pascal') and PROF2 not in ('clipper','cobol','pascal')


--30. Display the Cost of Package Developed By each Programmer.
select PNAME,sum(DCOST) from software group by PNAME

--31. Display the sales values of the Packages Developed by the each Programmer.
select PNAME,SUM(SCOST*SOLD)'sales value' from software
group by PNAME

--32. Display the Number of Packages sold by Each Programmer.
select PNAME,sum(sold) from software group by PNAME

--33. Display the sales cost of the packages Developed by each Programmer Language wise.
select DEVELOPIN,SUM(SCOST*SOLD)'total scost' from software group by DEVELOPIN


--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
select DEVELOPIN,AVG(DCOST)'dcost',AVG(SCOST)'scost' ,SUM(SCOST*SOLD)/SUM(SOLD)'price per copy'  from software
where SOLD>1 group by DEVELOPIN

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
select PNAME,MAX(DCOST)costliest,MIN(DCOST)cheapest from software group by PNAME

--36. Display each institute name with number of Courses, Average Cost per Course.
select INSTITUTE,COUNT(COURSE)COURSE,AVG(COURSE_FEE)'AVG_COURSE_FEE' from studies group by INSTITUTE


--37. Display each institute Name with Number of Students.
select INSTITUTE,COUNT(PNAME)'Number of Students' from studies group by INSTITUTE


--38. Display Names of Male and Female Programmers. Gender also.
select PNAME,GENDER from programmer order by GENDER desc


--39. Display the Name of Programmers and Their Packages.
select PNAME,DEVELOPIN from software

--40. Display the Number of Packages in Each Language Except C and C++.
select DEVELOPIN,COUNT(*)'Number of Packages' from software
where DEVELOPIN not in ('c','c++') group by DEVELOPIN

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
select DEVELOPIN ,count(*)'Number of Packages' from software
where DCOST<1000 group by DEVELOPIN

--42. Display AVG Difference between SCOST, DCOST for Each Package.
select TITLE,ABS(AVG(SCOST)-AVG(DCOST)) from software
group by TITLE

--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
select PNAME,SUM(SCOST)sum_of_sold,SUM(DCOST)sum_of_dcost,sum(SCOST*SOLD)'amount to Be Recovered' from software
where (SCOST*SOLD)<DCOST group by PNAME


--44. Display Highest, Lowest and Average Salaries for those earning more than 2000.
select MAX(SALARY)max_salary,MIN(SALARY)min_salary,AVG(SALARY)avg_salary from programmer
where SALARY>2000

--45. Who is the Highest Paid C Programmers?
select PNAME from programmer where SALARY=(select max(SALARY) from programmer where PROF1 = 'c' or PROF2 = 'c')


--46. Who is the Highest Paid Female COBOL Programmer?
select PNAME from programmer where SALARY= (select MAX(SALARY) from programmer where PROF1='cobol' or PROF2 = 'cobol') and GENDER = 'f'

--47. Display the names of the highest paid programmers for each Language.
--select PNAME from programmer where SALARY=
select s.PNAME,max(SALARY) from programmer p
inner join software s on s.PNAME=p.PNAME
group by s.PNAME

--48. Who is the least experienced Programmer.
select PNAME from programmer p where 0= (select COUNT(DOJ) from programmer s where p.DOJ<s.DOJ)

--49. Who is the most experienced male programmer knowing PASCAL.
select PNAME from programmer where GENDER = 'm' and (PROF1 = 'pascal' or PROF2 = 'pascal') and doj =
(select MIN(DOJ) from programmer where GENDER = 'm' and (PROF1='pascal' or PROF2='pascal'))


--50. Which Language is known by only one Programmer?
GO
CREATE VIEW PROF_VW AS 
SELECT PROF1 PROF FROM PROGRAMMER WHERE PROF1 NOT IN 
(SELECT PROF2 FROM PROGRAMMER)GROUP BY PROF1 HAVING COUNT(PNAME)=1
UNION 
SELECT PROF2 PROF FROM PROGRAMMER WHERE PROF2 NOT IN 
(SELECT PROF1 FROM PROGRAMMER)GROUP BY PROF2 HAVING COUNT(PNAME)=1
SELECT * FROM PROF_VW

--51. Who is the Above Programmer Referred in 50?
SELECT PNAME
FROM  programmer ,PROF_VW
WHERE PROF1 = PROF_VW.PROF OR
PROF2= PROF_VW.PROF

--52. Who is the Youngest Programmer knowing DBASE?
SELECT PNAME FROM programmer WHERE (PROF1 = 'DBASE' OR PROF2 = 'DBASE') AND MONTH(DOB)<=ALL
(SELECT MONTH(DOB)
FROM PROGRAMMER WHERE PROF1='DBASE'OR PROF2='DBASE')

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?-
SELECT PNAME FROM programmer WHERE GENDER = 'F' AND
PROF1 NOT IN ('C','C++','ORACLE','DBASE') AND PROF2 NOT IN ('C','C++','ORACLE','DBASE')

--54. Which Institute has most number of Students?
SELECT INSTITUTE FROM studies
GROUP BY INSTITUTE HAVING COUNT(PNAME)>=ALL
(SELECT COUNT(PNAME) FROM studies GROUP BY INSTITUTE)

--55. What is the Costliest course?
SELECT COURSE FROM studies WHERE COURSE_FEE >=ALL (SELECT COURSE_FEE FROM studies)

--56. Which course has been done by the most of the Students?
SELECT COURSE FROM studies WHERE COURSE >=ALL (SELECT COUNT(COURSE) FROM studies)

SELECT COURSE FROM STUDIES
GROUP BY COURSE HAVING COUNT(PNAME)>=ALL
(SELECT COUNT(PNAME)
FROM STUDIES
GROUP BY COURSE)

--57. Which Institute conducts costliest course.
SELECT INSTITUTE FROM studies WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM studies)

--58. Display the name of the Institute and Course, which has below AVG course fee.
SELECT INSTITUTE, COURSE FROM studies WHERE COURSE_FEE <= (SELECT AVG(COURSE_FEE) FROM studies)

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee,
SELECT COURSE FROM studies
WHERE (COURSE_FEE>=1000 AND COURSE_FEE <= (SELECT AVG(COURSE_FEE) FROM studies)) OR 
(COURSE_FEE>= (SELECT AVG(COURSE_FEE) FROM studies) AND COURSE_FEE <=1000)

--60. Which package has the Highest Development cost?
SELECT TITLE FROM software WHERE DCOST >= (SELECT MAX(DCOST) FROM software)


--61. Which course has below AVG number of Students?
SELECT COURSE FROM studies GROUP BY COURSE HAVING COUNT(PNAME) 
< 
(SELECT AVG(COUNT(PNAME)) FROM studies GROUP BY COURSE)


--62. Which Package has the lowest selling cost?
SELECT TITLE FROM software WHERE SCOST = (SELECT MIN(SCOST) FROM software)

--63. Who Developed the Package that has sold the least number of copies?
SELECT PNAME FROM software WHERE SOLD = (SELECT MIN(SOLD) FROM software)

--64. Which language has used to develop the package, which has the highest sales amount?
SELECT DEVELOPIN FROM software WHERE SCOST*SOLD = (SELECT MAX(SCOST*SOLD) FROM software)

--65. How many copies of package that has the least difference between development and selling cost where sold.
SELECT SOLD FROM software WHERE DCOST-SCOST <=ALL (SELECT DCOST-SCOST FROM software)

--66. Which is the costliest package developed in PASCAL.
SELECT TITLE FROM software WHERE DEVELOPIN = 'PASCAL' AND SCOST >=ALL (SELECT SCOST FROM software WHERE DEVELOPIN = 'PASCAL')

--67. Which language was used to develop the most number of Packages.
SELECT DEVELOPIN FROM software GROUP BY DEVELOPIN HAVING COUNT(TITLE) >=ALL
(SELECT COUNT(TITLE) FROM software GROUP BY DEVELOPIN)


--68. Which programmer has developed the highest number of Packages?
SELECT PNAME FROM software GROUP BY PNAME HAVING COUNT(TITLE) >=ALL
(SELECT COUNT(TITLE) FROM software GROUP BY PNAME)

--69. Who is the Author of the Costliest Package?
SELECT PNAME,TITLE FROM software WHERE DCOST = (SELECT MAX(DCOST) FROM software)

--70. Display the names of the packages, which have sold less than the AVG number of copies.
SELECT TITLE FROM software WHERE SOLD < (SELECT AVG(SOLD) FROM software)

--71. Who are the authors of the Packages, which have recovered more than double the Development cost?
SELECT PNAME FROM software WHERE SCOST*SOLD > 2*DCOST

--72. Display the programmer Name and the cheapest packages developed by them in each language.
GO
CREATE VIEW CHEAP_VW AS
SELECT DEVELOPIN,MIN(SCOST)MIN FROM software GROUP BY DEVELOPIN

SELECT PNAME,TITLE FROM software,CHEAP_VW WHERE software.DEVELOPIN = CHEAP_VW.DEVELOPIN AND
SCOST= CHEAP_VW.MIN

--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
SELECT DEVELOPIN,MAX(SOLD)'MAX',MIN(SOLD)'MIN' FROM software GROUP BY DEVELOPIN

--74. Who is the youngest male Programmer born in 1965?
select PNAME,DATEDIFF(YY,DOB,GETDATE())'Age' from programmer where GENDER ='m' and YEAR(DOB)='1965'


--75. Who is the oldest Female Programmer who joined in 1992?
select PNAME, DATEDIFF(YY,DOJ,GETDATE())'age' from programmer where GENDER ='f' and YEAR(DOJ)='1992'

--76. In which year was the most number of Programmers born.
SELECT YEAR(DOB)'YEAR',COUNT(YEAR(DOB))'NO OF PROGRAMMER' FROM programmer
GROUP BY YEAR(DOB) HAVING COUNT(YEAR(DOB))>=ALL
(SELECT COUNT(YEAR(DOB)) FROM programmer GROUP BY YEAR(DOB))

--77. In which month did most number of programmers join?
SELECT MONTH(DOJ)'MONTH',COUNT(MONTH(DOJ))'NO OF PROGRAMMER' FROM programmer
GROUP BY MONTH(DOJ) HAVING COUNT(MONTH(DOJ))>=ALL
(SELECT COUNT(MONTH(DOJ)) FROM programmer GROUP BY MONTH(DOJ))


--78. In which language are most of the programmer’s proficient.
SELECT PROF1 FROM PROGRAMMER
GROUP BY PROF1 HAVING COUNT(PNAME)>=ALL(SELECT COUNT(PNAME) FROM PROGRAMMER
GROUP BY PROF1)
UNION
SELECT PROF2 FROM PROGRAMMER
GROUP BY PROF2 HAVING COUNT(PNAME)>=ALL(SELECT COUNT(PNAME) FROM PROGRAMMER
GROUP BY PROF2)

--79. Who are the male programmers earning below the AVG salary of Female Programmers?
select PNAME from programmer where GENDER ='m' and SALARY < (select AVG(SALARY) from programmer where GENDER ='f')

--80. Who are the Female Programmers earning more than the Highest Paid?
select PNAME from programmer where GENDER = 'f' and SALARY > (select MAX(SALARY) from programmer where GENDER = 'm')

--81. Which language has been stated as the proficiency by most of the Programmers?
SELECT PROF1 FROM PROGRAMMER
GROUP BY PROF1 HAVING COUNT(PNAME)>=ALL(SELECT COUNT(PNAME) FROM PROGRAMMER
GROUP BY PROF1)
union
SELECT PROF2 FROM PROGRAMMER
GROUP BY PROF2 HAVING COUNT(PNAME)>=ALL(SELECT COUNT(PNAME) FROM PROGRAMMER
GROUP BY PROF2)

--82. Display the details of those who are drawing the same salary.
select a.* from programmer a, programmer b
where a.SALARY=b.SALARY and a.PNAME<>b.PNAME

--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
select s.* from software s,programmer p where s.PNAME = p.PNAME and GENDER ='m' and SALARY > 3000


--84. Display the details of the packages developed in Pascal by the Female Programmers.
select p.* from programmer p , software s where p.PNAME = s.PNAME and
GENDER = 'F' and DEVELOPIN ='pascal'

--85. Display the details of the Programmers who joined before 1990.
select * from programmer where YEAR(DOJ)<'1990'


--86. Display the details of the Software Developed in C By female programmers of Pragathi.
select s.* from software s, studies st, programmer p where p.PNAME = s.PNAME and s.PNAME = st.PNAME and DEVELOPIN = 'c'
and GENDER ='F' and INSTITUTE = 'pragathi' 


--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
select INSTITUTE,s.PNAME,COUNT(TITLE)'number of packages',COUNT(SOLD)'No. of Copies Sold',SUM(SCOST*SOLD)'total sales' from software s,studies st
where s.PNAME = st.PNAME group by INSTITUTE,s.PNAME


--88. Display the details of the software developed in DBASE by Male Programmers,
--	who belong to the institute in which most number of Programmers studied.
select s.* from software s,programmer p,studies st
where s.PNAME = p.PNAME and p.PNAME = st.PNAME and GENDER = 'M' and DEVELOPIN = 'dbase' and
INSTITUTE = (select INSTITUTE from studies group by INSTITUTE having COUNT(PNAME) >=all (select COUNT(pname) from studies group by INSTITUTE))


--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.
SELECT s.* FROM PROGRAMMER p,SOFTWARE s WHERE p.PNAME = s.PNAME and
GENDER = 'M' and YEAR(DOB)<1965 or
GENDER = 'F' and YEAR(DOB)>1975

--90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers.
select s.PNAME from software s
inner join programmer p on s.PNAME = p.PNAME
where PROF1<>DEVELOPIN and PROF2<>DEVELOPIN

--91. Display the details of the software developed by the male students of Sabhari.
select s.* from software s, programmer p, studies st where s.PNAME = p.PNAME and s.PNAME = st.PNAME and GENDER='m' and INSTITUTE = 'sabhari'

--92. Display the names of the programmers who have not developed any packages.
select pname from programmer where PNAME not in (select PNAME from software)

--93. What is the total cost of the Software developed by the programmers of Apple?
select SUM(DCOST)'total cost' from software s, studies st
where s.PNAME = st.PNAME and INSTITUTE = 'apple'


--94. Who are the programmers who joined on the same day?
go
create view doj_vs as
select DOJ from programmer
group by doj having COUNT(DOJ)>1

select p.DOJ,PNAME from programmer p,doj_vs
where p.DOJ = doj_vs.DOJ


--95. Who are the programmers who have the same Prof2?
go
CREATE VIEW PROF2_VW AS
SELECT PROF2
FROM PROGRAMMER
GROUP BY PROF2
HAVING COUNT(PNAME)>1

SELECT PROGRAMMER.PROF2,PNAME
FROM PROF2_VW,PROGRAMMER
WHERE PROGRAMMER.PROF2 = PROF2_VW.PROF2;

--96. Display the total sales value of the software, institute wise.
select INSTITUTE,SUM(SCOST*SOLD)'TOTAL SALES' from software s, studies st
where s.PNAME = st.PNAME
group by INSTITUTE

--97. In which institute does the person who developed the costliest package studied.
select INSTITUTE from software s,studies st
where s.PNAME = st.PNAME and DCOST=(select MAX(DCOST) from software)

--98. Which language listed in prof1, prof2 has not been used to develop any package.
SELECT PROF1 'LANGUAGE' FROM PROGRAMMER
WHERE PROF1 NOT IN (SELECT DEVELOPIN FROM SOFTWARE)
UNION
SELECT PROF2 'LANGUAGE' FROM PROGRAMMER
WHERE PROF2 NOT IN(SELECT DEVELOPIN FROM SOFTWARE)

--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
select SALARY,COURSE from software s ,studies st, programmer p
where s.PNAME = st.PNAME and st.PNAME = p.PNAME and SOLD = (select MAX(SOLD) from software)

--100. What is the AVG salary for those whose software sales is more than 50,000/-.
select AVG(SALARY)'AVERAGE SALARY' from programmer p,software s where p.PNAME = s.PNAME and SCOST*SOLD > 50000

--101. How many packages were developed by students, who studied in institute that charge the lowest course fee?
select COUNT(TITLE)'NO.OF PACKAGES' from software s,studies st where s.PNAME =st.PNAME and COURSE_FEE = (select MIN(COURSE_FEE) from studies)

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?
select COUNT(TITLE)'No_of_pack',INSTITUTE from software s,studies st
where s.PNAME = st.PNAME and s.PNAME in (select PNAME from software where DCOST = (select MIN(DCOST) from software))group by INSTITUTE

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer?
select count(title) 'NO.OF PACKAGES' from software s,programmer p
where s.PNAME=p.PNAME and GENDER = 'f' and SALARY > (select MAX(SALARY) from programmer where GENDER = 'm') 

--104. How many packages are developed by the most experienced programmer form BDPS.
SELECT COUNT(TITLE) "NO.OF PACKAGES" FROM SOFTWARE s,PROGRAMMER p,STUDIES st
WHERE s.PNAME = p.PNAME AND p.PNAME = st.PNAME AND
INSTITUTE = 'BDPS' AND DOJ = (SELECT MIN(DOJ) FROM PROGRAMMER p,STUDIES st
WHERE p.PNAME = st.PNAME AND INSTITUTE='BDPS');


--105. List the programmers (form the software table) and the institutes they studied.
select s.PNAME, st.INSTITUTE from software s
inner join studies st on s.PNAME = st.PNAME


--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.
select PROF1,COUNT(distinct p.PNAME)'No_of_prog' from programmer p
inner join software s on s.PNAME = p.PNAME
group by PROF1

--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.
select programmer.PNAME,COUNT(TITLE) 'no_of_package' from software
inner join programmer
on software.PNAME = programmer.PNAME
group by programmer.PNAME
