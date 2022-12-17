use classicmodels;

select c.customerName, count(o.comments) 'jumlah' from
customers as c
inner join orders as o
on c.customerNumber = o.customerNumber
group by c.customerName
order by `jumlah` desc
limit 1;

select*from orders;