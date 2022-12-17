-- use classicmodels;

-- no 1 :
 
select od.orderNumber, o.status, o.shippedDate, od.quantityOrdered
from orderdetails as od
inner join orders as o
on o.orderNumber = od.orderNumber
where o.status = 'cancelled' and shippedDate is not null
limit 3;

select*from orders;
select*from orderdetails;

-- no 2

select c.customerName, o.status, o.comments
from customers as c
inner join orders as o
on c.customerNumber = o.customerNumber
where  o.comments like 'C%mer re%ed t%t DHL is used for this sh%ping'; -- nda bisa pake = kenapa ya?

select* from customers;
select* from orders;


-- no 3
select c.customerName, p.productName, py.paymentDate, o.status
from customers as c
inner join orders as o
on c.customerNumber = o.customerNumber
inner join payments as py
on o.customerNumber = py.customerNumber
inner join products as p
inner join orderdetails as od
on p.productCode = od.productCode
where p.productName like '1992 f%ri 360 s%er r%d';

select* from customers;
select customerNumber from orders;
select*from products;
select*from payments;

