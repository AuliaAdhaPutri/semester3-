-- use classicmodels
-- use offices
-- relationship

-- one to one
-- one to many
-- many to many 
-- self referencing

-- inner join (membandingkan)
-- seperti irisan hanya menampilkan yang sama



-- titik itu untuk menggabungkan dengan kolom dari tabel itu
-- on membandingkan key misal customers.customersNumber customersNumber ini adalah primary key nya

-- outher join 
-- left join = dia menampilkan kolom pada tabel pertama
-- dan dia tetap menampilkan yang tidak sama

-- right join dia menampilkan semua primary key yang sebelah kanan


-- equi join 

select * from customers, employees
where customers.salesRepEmployeeNumber = employees.employeeNumber and offices.officeCode = employees.employeeNumber  and offices.country='USA';

-- self join dia gabung dengan dirinya sendiri 
-- pake alias


 