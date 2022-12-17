-- use classicmodels;

-- Materi SubQuery
 
(select officeCode
from offices
where contry = 'USA');


select customerNumber, checkNumber, amount
from payments
where amount =
	(select max(amount) from payments);
    
select customerNumber, checkNumber, amount
from payments
where amount > 
	(select avg(amount) from payments) 
order by amount;


select
	customerNumber
    customerName,
    (select count(*) from payments where customers.customerNumber = payments.customerNumber) as 'Total Transaksi'
    from customers;

select*from payments;
    
    
-- penggunaan in/not in
-- digunakan untuk menemukan data dalam subquery yang kita lakukan

-- Penggunaan in
select employeeNumber, firstName, lastName
from employees
where employeeNumber in (
select employeeNumber from employees 
where officeCode = '1'
);
--  penggunaan not in

select employeeNumber, firstName, lastName
from employees
where employeeNumber not in (
select employeeNumber from employees 
where officeCode = '1'
);

-- exists/not exists

-- mengemabalikan data, jika dia mengembalikan data maka dia bernilai false begitupun jika dia tidak mengembalikan data berarti dia mengembaikan nilai true

--  SELECT customerNumber, customerName
-- FROM customers cust -- cust ini bisa juga nda pake as bisa langsung
-- WHERE EXISTS (
--  SELECT customers.customerNumber, customers.customerName,
-- COUNT(payments.checkNumber) AS orderNumber
--  FROM customers
--  LEFT JOIN payments ON customers.customerNumber =
-- payments.customerNumber
--  WHERE customers.customerNumber = cust.customerNumber
--  GROUP BY customers.customerNumber
--  HAVING orderNumber > 6);
--  
--  -- correlated subquery
-- SELECT productname, buyprice
-- FROM products as p1
-- WHERE buyprice >
--  (SELECT AVG(buyprice)
--  FROM products
--  WHERE productline = p1.productline);

-- no 1 latihan :
select *from employees
where employees.employeeNumber in
	(select employeeNumber 
    from employees 
    where employees.jobTitle = 'Sales Rep');
   
select concat(firstName, lastName) as 'Nama Lengkap', o.country as 'Negara'
from employees as e
inner join offices as o
on e.officeCode = o.officeCode
where e.officeCode not in 
	(select officeCode from offices where country ='USA');
    
select c.customerName , p.amount 
from customers as c
inner join payments as p
on c.customerNumber = p.customerNumber
where p.amount > 
(select avg(amount)
from payments p2
where p2.customerNumber = c.customerNumber);





