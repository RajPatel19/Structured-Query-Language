select * from automobile_data

--Sub-Tasks-1:  Data Cleaning.
--Data cleaning for [normalized-losses] 
select count(*) from automobile_data

select [normalized-losses] from automobile_data where [normalized-losses] like '?'

update automobile_data set [normalized-losses] = 0 where [normalized-losses] like '?'

alter table automobile_data alter column [normalized-losses] int

update automobile_data set [normalized-losses] = 122 where [normalized-losses] = 0

select avg([normalized-losses]) from automobile_data where [normalized-losses] <> 0 


--Data cleaning for bore
select bore from automobile_data where bore is NULL

update automobile_data set bore = 3.32 where bore is NULL

select avg(bore) from automobile_data where bore is not NULL


--Data cleaning for stroke
select stroke from automobile_data where stroke is NULL

update automobile_data set stroke = 3.25 where stroke is NULL

select avg(stroke) from automobile_data where stroke is not NULL


--Data cleaning for horsepower
select horsepower from automobile_data where horsepower is null

select avg(horsepower) from automobile_data where horsepower is not NULL

update automobile_data set horsepower = 104  where horsepower is NULL


--Data Cleaning for peak-rpm
select [peak-rpm] from automobile_data where [peak-rpm] is null

select avg([peak-rpm]) from automobile_data where [peak-rpm] is not NULL

update automobile_data set [peak-rpm] = 5125  where [peak-rpm] is NULL


--Data cleaning for price 
select price from automobile_data where price is null

select avg(price) from automobile_data where price is not NULL

update automobile_data set price = 13207  where price is NULL


select is null from automobile_data 


--Sub-Tasks: 2. Data Analysis
select * from automobile_data

--Q1
select distinct make from automobile_data 

--Q2
select count(make) as 'No. of nissan cars' from automobile_data where make like 'nissan'

--Q3
select top(1) make,count(make) as 'No._of_car_sold' from automobile_data group by make order by 'No._of_car_sold' desc

--Q4
select top(1) symboling,count(symboling) as 'count_of_safe_cars' from automobile_data 
group by symboling
order by symboling

--Q5
select top(1) symboling,make from automobile_data 
group by symboling,make
order by symboling 

--Q6
select distinct [fuel-type] from automobile_data

--Q7
select count([fuel-type]) as 'cars with diesel'  from automobile_data where [fuel-type] like 'diesel'

--Q8
select [fuel-type],count([fuel-type]) as 'cars with fuels' from automobile_data 
group by [fuel-type]

--Q9
select make,[body-style],count([body-style]) as 'no. of cars' from automobile_data
group by make,[body-style] having make like 'nissan' and [body-style] like 'sedan'

--Q10
select * from automobile_data
select max(price) as 'max_price' from automobile_data

--Q11
select make,price from automobile_data where price = (select max(price) from automobile_data)

--Q12
select top(1) [body-style], price from automobile_data 
group by [body-style],price having (price = max(price) and [body-style] like 'sedan') 
order by price desc 

--Q13
select top(1) [body-style], price,make from automobile_data 
group by [body-style],price,make having (price = max(price) and [body-style] like 'hatchback') 
order by price desc 

--Q14
select [engine-size],[compression-ratio] from automobile_data 
where [compression-ratio]  = (select min([compression-ratio]) from automobile_data) 

--Q15
select max(horsepower) as 'max_horsepower' from automobile_data 

--Q16
select make,horsepower from automobile_data 
where horsepower = (select max(horsepower) from automobile_data)


