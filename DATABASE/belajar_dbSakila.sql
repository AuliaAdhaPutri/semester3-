use sakila;

select*from actor;

-- select concat(ac.first_name,' ',ac.last_name) as 'NamaArtis'
-- from actor as ac
-- where concat(ac.first_name,' ',ac.last_name) like 'A%'

select count(actor_id) from actor as a
group by actor_id;


select * from orderdetails;
select customerNumber, checkNumber, paymentDate, amount 
from payments
where amount = (select max(amount) from payments);

select max(items) as max_item
from (select orderNumber, count(orderNumber) as items from orderdetails
group by orderNumber) as hasil;

select max(orderNumber) from orderdetails;
select count(orderNumber) from orderdetails;

select orderNumber, count(orderNumber) as items from orderdetails
group by orderNumber