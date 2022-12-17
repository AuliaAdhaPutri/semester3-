-- union,intersect, dan except;

-- use classicmodels;

-- select concat(customers.contactFirstName, customers.contactLastName),
-- concat(employees.firstname, employees.lastName)
-- from customers
-- inner join employees
-- on employees.employeeNumber = customers.salesRepEmployeeNumber
-- where 
-- (select status, 

select concat(c.contactFirstName, c.contactLastName) as 'fullName', 'Customers' as 'Status'
from customers as c
union
select concat(e.firstname, e.lastName) as 'fullname', 'Employees' as'Status'
from employees as e;