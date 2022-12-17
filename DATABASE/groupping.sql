-- materi fungsi and groupping

-- use classicmodels;

-- show tables;

select avg(amount) as 'rata-rata pembayaran'
from payments order by amount asc limit 5; -- avg dari banyak data ke satu data nilai (rata-rata)
-- all secara default

-- sum menjumlahkan

-- select sum(quantityOrdered) from orderdetails 
-- order by quantityOrdered asc limit 1  ;

-- count menghitung jumlah data dari suatu tabel
-- select count(*) from orders;

-- select quantityOrdered from orderdetails
-- order by quantityOrdered asc;

select count(distinct quantityOrdered)
from orderdetails;

select concat(customerName, ' ' ) as nama
from customers
limit 5;

-- select productLine, count(productLine) as 'Banyak Produk'
-- from products
-- group by productLine
-- order by 'Banyak Produk';  

select productLine, 
count(productLine) as  banyak_produk, 
sum(buyPrice) as total_harga_productLine,
max(buyPrice) as harga_termahal,
min(buyPrice) as harga_termurah
from products
where productLine != 'MotorCycles'
group by productLine
having banyak_produk > 10 
order by count(productLine);  

-- where itu kolomnnya harus ada ditabel
-- kalau having biar tidak ada nda papa

-- coalesce mengubah kata null 
--  update customers set status = "no status" where is null ini untuk nilai null

-- Greates and Least itu mengurutkan banyak kolom //ini untuk membandingkan
-- max untuk satu kolom 

select productName, buyPrice, MSRP, greatest(buyPrice, MSRP)
from products limit 5;

select current_timestamp; -- tanggal dan waktu ini hari, sampai detik

-- select current_date tidak menampilkan waktu

select day(current_timestamp);

select day(orderDate) from orders limit 1;
select month(current_timestamp());
select now();

select datediff(current_timestamp, '2003-02-11');


select left(customerName, 4) from customers limit 1; -- nama kolom trus limit nya atau berapa angka yang mau ditampilkan

select concat(contactLastName, contactFirstName) from employee;

