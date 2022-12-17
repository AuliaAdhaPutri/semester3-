-- use classicmodels

-- no 1
select c.customerName, o.status
from orders as o
inner join customers as c
on c.customerNumber = o.customerNumber
where o.status like '%n %old';

select* from orders;
select*from customers;

-- no 2
select c.customerName, o.status, o.comments
from customers as c
inner join orders as o
on c.customerNumber = o.customerNumber
where o.comments like 'C%mer re%ed t%t DHL is used for this sh%ping';

-- no 3
select c.customerName, p.productName, o.status, o.shippedDate
from customers as c
inner join orders as o
on c.customerNumber = o.customerNumber
inner join products as p
inner join orderdetails as od
on p.productCode = od.productCode
where p.productName like '%ferrari%'
order by o.shippedDate desc;

select* from orders;
select*from products;

-- no 4 
-- select  11111, date(now()) , date_add(date(now()),interval 1 year), date_add(date(now()),interval 2 month), 'In process', null, customerNumber from customers where customerName like '%Anton%';
-- insert into orderDetails
-- select 11123, productCode, 50, MSRP, 1 from products where productName = "1934 Ford V8 Coupe"; 
-- query diatas untuk meghapus waktu pada tanggal

-- WHERE customerName LIKE '%anton%';
-- insert into orders (orderNumber, orderDate, requiredDate, shippedDate, `status`, comments, customerNumber)
-- value (7272, current_date, date_add(current_date, interval 1 year), '2004-11-13', 'in process', null, 465);

-- -- SELECT * FROM products
-- -- WHERE productName LIKE '%Ford V8%';
-- INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
-- VALUE (999, 'S18_2957' ,50, 62.46 ,2);



-- select*from orderdetails;
-- select*from customers;
-- select*from orders;
-- select*from products;


-- tugasnya :
-- 1. hapus orderNumber = 11111 dari table orders dan orderdetails
-- 2. hapus orderNumber = 999 dari table orders dan orderdetails

-- no 1
-- cara menghapus kolom yang punya foreign key atau constraint
alter table orders drop
constraint orders_ibfk_1;
 
alter table orders 
add constraint orders_ibfk_1
foreign key (customerNumber) references customers (customerNumber)
on delete cascade;
 
alter table orderdetails drop
constraint orderdetails_ibfk_1;
 
alter table orderdetails 
add constraint orderdetails_ibfk_1
foreign key (orderNumber) references orders (orderNumber)
on delete cascade; 

delete from orders 
where orderNumber = 999;
-- show create table orders;
select*from orders;
select*from orderdetails;
-- alter table payments drop
-- constraint payments_ibfk_1;
--  
-- alter table payments
-- add constraint payments_ibfk_1
-- foreign key (customerNumber) references customers (customerNumber)
-- on delete cascade;
--  
-- select * from customers
-- inner join orders on orders.customerNumber = customers.customerNumber
--  where orders.status = 'cancelled';
--  
--  select * from orders
--  where order.status = 'cancelled';
 
-- delete customers from customers
-- inner join orders on customers.customerNumber = orders.customerNumber
-- where orders.status = 'cancelled'