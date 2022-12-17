-- use classicmodels;

-- nim = H071211055

-- no 6 :
select p.productName, o.requiredDate
from products as p
inner join orderdetails as od
on p.productCode = od.productCode
inner join orders as o
on o.orderNumber = od.orderNumber 
where o.requiredDate < '2004-01-01';

-- nomor 6 pake many to many? karena dihubungkan sama table orderdetails? 

select*from products;
select*from orderdetails;
select*from orders;

-- no 11 :
select em.firstName, em.lastname, o.orderdate
from employees as em
inner join customers as c
on em.employeeNumber = c.salesRepEmployeeNumber
inner join orders as o
on c.customerNumber = o.customerNumber where o.orderDate between '2005-01-01' and '2005-12-31';


select*from employees;
select*from customers;
select*from orders