use classicmodels;

-- select nama_kolom dari table 
SELECT customerName FROM customer;-- untuk query 2 sekaligus kita pake koma misal customerName,phone
SELECT *FROM offices;-- (untuk mengambil semua kolom dari tble yang ditargetkan)
-- select officeCode,city,phone untuk mengakses table yang kita inginkan 
SELECT city AS 'Kota', phone AS 'no hp'FROM offices;-- untuk mengubah nama kolom/table menggunakan (As)
SELECT 5 + 2 AS 'jumlah 5 + 2';--  menggunakan operator

SELECT *FROM offices WHERE city = 'boston';--  untuk mengambil salah satu kolom dari sebuah table, memfilter sesuai kondisi
SELECT *FROM offices WHERE
    city != 'boston'; -- artinya hanya kolom boston tidak diambil
describe products;
show create table products;
SELECT *FROM products WHERE 
	buyPrice > 100;-- hanya buyprice dari table, yang > 100 yang ditampilkan
SELECT *FROM products WHERE
    buyPrice > 100
        AND quantityInStock > 6000;-- untuk 2 kolom yang mau ditampilkan sama seperti or

SELECT productName, quantityInStock FROM products
ORDER BY quantityInStock desc;-- desc (menurun) dan naik asc secara default itu asc
-- order by bisa digabung dengan where

SELECT productName, quantityInStock, buyprice FROM products 
WHERE buyPrice > 40
ORDER BY buyprice DESC , quantityInStock ASC;
-- harus ada yang sama jika tidak, tidak akan berubah

select * from orders
order by status desc, 
		customerNumber, 
        shippedDate desc; -- sesuai dengan customerNumber terurut
        
select *from products
where buyPrice > 40 -- jika pake limit hanya 5 yang diambil 
order by buyPrice -- karena ini urutannya menaik
limit 5, 5; 

select distinct 'status' from orders;


