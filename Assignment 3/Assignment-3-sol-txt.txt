select * from buildversion
select * from errorlog
select * from salesLT.address
select * from salesLT.customer 
select * from saleslt.customeraddress
select * from saleslt.product
select * from saleslt.productcategory
select * from salesLT.productdescription 
select * from salesLT.productmodel
select * from salesLT.productmodelproductdescription
select * from salesLT.salesorderdetail
select * from salesLT.salesorderheader

--Q1
select companyname,firstname,middlename,lastname from saleslt.customer 
where firstname like 'donna' and middlename like 'f.' and lastname like 'carreras'

--Q2

--Q3
select sc.companyname,count(sc.companyname) from saleslt.customer sc 
inner join saleslt.customeraddress sca 
on sc.customerid = sca.customerid
inner join saleslt.address sa
on sca.addressid = sa.addressid
group by sc.companyname

--Q4
select companyname from saleslt.customer where companyname like 'g%'

--Q5
select count(companyname) as 'no.of com with i' from saleslt.customer where companyname like 'i%'

--Q6
select c.customerid,concat(c.firstname,c.middlename,c.lastname) as 'full name',sod.orderqty,p.listprice from saleslt.customer c
inner join saleslt.salesorderheader so
on c.customerid = so.customerid
inner join saleslt.salesorderdetail sod
on so.salesorderid = sod.salesorderid
inner join saleslt.product p
on sod.productid = p.productid
where c.customerid = 29781

--Q7
select count(c.CustomerID) as 'customers who bought nothing' from salesLT.Customer c
full join salesLT.SalesOrderHeader soh 
on c.CustomerID = soh.CustomerID 
where soh.SalesOrderID is null


--Q8
select c.customerid,count(c.customerid) as 'productspurchased',c.firstname from saleslt.customer c
inner join saleslt.salesorderheader so
on c.customerid = so.customerid
inner join saleslt.salesorderdetail sod
on so.salesorderid = sod.salesorderid
inner join saleslt.product p
on sod.productid = p.productid
group by c.customerid,c.firstname order by productspurchased

--Q9
select top(1) c.customerid,count(c.customerid) as 'productspurchased',c.firstname from saleslt.customer c
inner join saleslt.salesorderheader so
on c.customerid = so.customerid
inner join saleslt.salesorderdetail sod
on so.salesorderid = sod.salesorderid
inner join saleslt.product p
on sod.productid = p.productid
group by c.customerid,c.firstname order by productspurchased

--Q10
select top(5) c.customerid,count(c.customerid) as 'productspurchased',c.firstname from saleslt.customer c
inner join saleslt.salesorderheader so
on c.customerid = so.customerid
inner join saleslt.salesorderdetail sod
on so.salesorderid = sod.salesorderid
inner join saleslt.product p
on sod.productid = p.productid
group by c.customerid,c.firstname order by productspurchased desc


--Q11
select firstname,companyname,emailaddress from saleslt.customer 
where companyname like 'associated bikes'

--Q12
select count(companyname) as 'no. of company associated',firstname from saleslt.customer
group by firstname

--Q13
select top(1) count(companyname) as 'noofcompany',firstname from saleslt.customer
group by firstname order by noofcompany desc

--Q14
select sc.companyname, sa.city from saleslt.customer sc 
inner join saleslt.customeraddress sca 
on sc.customerid = sca.customerid
inner join saleslt.address sa
on sca.addressid = sa.addressid
where sa.city like 'dallas'

--Q15
select count(sc.companyname) as 'noofcompany', sa.city from saleslt.customer sc 
inner join saleslt.customeraddress sca 
on sc.customerid = sca.customerid
inner join saleslt.address sa
on sca.addressid = sa.addressid
group by sa.city

--Q16
select top(1) count(sc.companyname) as 'noofcompany', sa.city from saleslt.customer sc 
inner join saleslt.customeraddress sca 
on sc.customerid = sca.customerid
inner join saleslt.address sa
on sca.addressid = sa.addressid
group by sa.city order by noofcompany desc

--Q17
select sc.firstname, sa.stateprovince from saleslt.customer sc 
inner join saleslt.customeraddress sca 
on sc.customerid = sca.customerid
inner join saleslt.address sa
on sca.addressid = sa.addressid
where sa.stateprovince like 'ontario'

--Q18
select count(distinct(countryregion)) as 'no of region' from saleslt.address

--Q19
select count(sc.firstname) as 'no. of peple from us' from saleslt.customer sc 
inner join saleslt.customeraddress sca 
on sc.customerid = sca.customerid
inner join saleslt.address sa
on sca.addressid = sa.addressid
where sa.countryregion like 'united states'

--Q20
select distinct AddressType from salesLT.CustomerAddress 

--Q21
select count(sod.orderqty) as 'orders < 10$' from saleslt.customer c
inner join saleslt.salesorderheader so
on c.customerid = so.customerid
inner join saleslt.salesorderdetail sod
on so.salesorderid = sod.salesorderid
inner join saleslt.product p
on sod.productid = p.productid
where p.listprice < 10

--Q22
select max(listprice) as 'maxlist price' from saleslt.product

--Q23
select distinct(color) from saleslt.product where color not like 'null'

--Q24
select p.name, pc.name from saleslt.productcategory pc
inner join saleslt.product p
on p.ProductCategoryID = pc.ProductCategoryID
where pc.name like 'road bikes'

--Q25
select count(c.title) as 'no of women buying shorts' from saleslt.customer c
inner join saleslt.salesorderheader soh
on c.customerid = soh.CustomerID
inner join saleslt.salesorderdetail sod
on soh.salesorderid = sod.SalesOrderID
inner join saleslt.product p
on sod.ProductID = p.ProductID
inner join saleslt.ProductCategory pc
on p.ProductCategoryID = pc.ProductCategoryID
where c.title like 'ms.' and pc.name like 'shorts'

--Q26
select count(p.name) as 'no. of silver Mbikes' from saleslt.productcategory pc
inner join saleslt.product p
on p.ProductCategoryID = pc.ProductCategoryID
where pc.name like 'mountain bikes' and p.color like 'silver'

--Q27
select count(p.color) as 'no. of bikes',p.color,pc.name from saleslt.productcategory pc
inner join saleslt.product p
on p.ProductCategoryID = pc.ProductCategoryID
group by p.color,pc.name having pc.name = 'road bikes'

--Q28
select distinct(p.color),pc.name from saleslt.productcategory pc
inner join saleslt.product p
on p.ProductCategoryID = pc.ProductCategoryID
where pc.name like 'gloves'

--Q29
select max(p.weight) as 'max M bike weight' from saleslt.productcategory pc
inner join saleslt.product p
on p.ProductCategoryID = pc.ProductCategoryID
inner join 
where pc.name like 'mountain bikes'

--Q30
select distinct(pm.name),pc.name from saleslt.productcategory pc
inner join saleslt.product p
on p.ProductCategoryID = pc.ProductCategoryID
inner join saleslt.ProductModel pm
on p.ProductModelID = pm.ProductModelID
where pc.name like 'mountain bikes'

--Q31
select top(1) pm.name,count(sod.OrderQty) as 'bikesold',pc.name from saleslt.productcategory pc
inner join saleslt.product p
on p.ProductCategoryID = pc.ProductCategoryID
inner join saleslt.Productmodel pm
on p.ProductModelID = pm.ProductModelID
inner join saleslt.SalesOrderDetail sod
on p.ProductID = sod.ProductID
group by pm.name,pc.name having pc.name like 'mountain bikes' 
order by bikesold desc

--Q32
select pc.name,p.Name from saleslt.productcategory pc
inner join saleslt.product p
on p.ProductCategoryID = pc.ProductCategoryID
where p.name like 'racing socks,l'

--Q33
select p.name,c.CompanyName,pc.Name,sod.OrderQty from saleslt.customer c
inner join saleslt.salesorderheader soh
on c.customerid = soh.CustomerID
inner join saleslt.salesorderdetail sod
on soh.salesorderid = sod.SalesOrderID
inner join saleslt.product p
on sod.ProductID = p.ProductID
inner join saleslt.ProductCategory pc
on p.ProductCategoryID = pc.ProductCategoryID
where p.name like 'Racing Socks, L' and c.CompanyName like 'Riding Cycles'

--Q34
select salesorderid,unitprice,orderqty from saleslt.SalesOrderDetail
where orderqty = 1

--Q35
select orderqty,ProductID from saleslt.SalesOrderDetail
where orderqty = (select max(orderqty) from saleslt.salesorderdetail)

--Q36 
select DATEDIFF(year,sellstartdate,sellenddate) as 'year they sold' from SalesLT.Product where ProductID = 820

--Q37
select p.name,c.CompanyName,concat(c.FirstName,c.MiddleName,c.LastName) as 'full name' from saleslt.customer c
inner join saleslt.salesorderheader soh
on c.customerid = soh.CustomerID
inner join saleslt.salesorderdetail sod
on soh.salesorderid = sod.SalesOrderID
inner join saleslt.product p
on sod.ProductID = p.ProductID
inner join saleslt.ProductCategory pc
on p.ProductCategoryID = pc.ProductCategoryID
where p.name like 'Racing Socks%'

--Q38
select salesorderid, datediff(day,orderdate,shipdate) as 'days to deliver' from saleslt.salesorderheader

--Q39
select p.ProductID,pd.description,pmpd.Culture from saleslt.ProductDescription pd
inner join saleslt.ProductModelProductDescription pmpd
on pd.ProductDescriptionID = pmpd.ProductDescriptionID
inner join saleslt.Product p
on pmpd.ProductModelID = p.ProductModelID
where p.ProductID = 736 and pmpd.Culture like 'fr    '   

--Q40
select p.Name,soh.SubTotal,soh.TotalDue from SalesLT.SalesOrderHeader soh 
inner join SalesLT.SalesOrderDetail sod on soh.SalesOrderID = sod.SalesOrderID
inner join SalesLT.Product p on sod.ProductID = p.ProductID
order by soh.SubTotal desc 

--Q41
select pc.name,a.city,sum(sod.OrderQty) as 'total order' from saleslt.Address a
inner join saleslt.CustomerAddress ca
on a.AddressID = ca.AddressID
inner join saleslt.salesorderheader soh
on ca.customerid = soh.CustomerID
inner join saleslt.salesorderdetail sod
on soh.salesorderid = sod.SalesOrderID
inner join saleslt.product p
on sod.ProductID = p.ProductID
inner join saleslt.ProductCategory pc
on p.ProductCategoryID = pc.ProductCategoryID
group by pc.name,a.city having pc.name like 'cranksets' and a.city like 'london'

--Q42
select concat(c.firstname,c.MiddleName,c.LastName) as 'full name',a.AddressLine1 from saleslt.Address a
inner join saleslt.CustomerAddress ca
on a.AddressID = ca.AddressID
inner join saleslt.Customer c
on ca.customerid = c.CustomerID
where a.AddressLine1 like '% Free Street'

--Q43

--Q44
select parentproductcategoryid,name from saleslt.ProductCategory
where parentproductcategoryid not like 'null'

--Q45
select parentproductcategoryid,name from saleslt.ProductCategory
where parentproductcategoryid = 1

--Q46
select distinct culture from saleslt.ProductModelProductDescription 

--Q47
select culture,count(culture) as 'no.ofcount' from saleslt.ProductModelProductDescription 
group by culture having culture like 'th    '

--Q48
select p.Name,pd.Description from SalesLT.Product p
inner join SalesLT.ProductModelProductDescription pmpd
on p.ProductModelID = pmpd.ProductModelID
inner join SalesLT.ProductDescription pd 
on pmpd.ProductDescriptionID = pd.ProductDescriptionID

--Q49
select count(unitpricediscount) as 'no. of unitpricediscount' from saleslt.salesorderdetail
where unitpricediscount <> 0.00

