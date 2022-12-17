-- use learn
# No 1
-- insert into students (id, full_name, address, major)
-- values (3,'Orekii', 'Japan', 'husbuu'),
--        (4,'Toji', 'Japan', 'suami'),
--        (5,'Aulia Adha Putri', 'Yaman', 'Suka Halu');
-- 	   

# No 2
select * from students;

# No 3
update students set full_name =  'pemwasuu',
                    address = 'Thailand',                    
                    major = 'Jodoh Saya'
                where id = 5;

# No 4
select s.id, c.name, s.date, s.time  from students_schedule as ss -- from itu berarti dia dari tabel mana dan dialiaskan dulu
left join schedule s on ss.schedule_id = s.id -- didepan titik itu nama key nya
left join course c on c.id = s.course_id
left join students st on ss.student_id = st.id
where student_id = 1;

-- kapan kita tau dia pake left join atau right join itu tergantung kondisi yang diminta

# No 5
INSERT INTO course (id, name, duration) VALUES (1, 'Matematika', 30);
SELECT * from course;

# No 6
insert into schedule(id, course_id, date, time) values (1, 1, '2022-01-01', '2022-01-01 10:20:07');
insert into students_schedule(student_id, schedule_id) values (1, 1);

# No 7
update schedule
join students_schedule ss on schedule.id = ss.schedule_id
set date = '2022-01-01', time='2022-01-01 10:20:07'
where ss.student_id = 1;

-- no 2

select e.employeeNumber,
concat(e.firstName, ' ', e.lastName) as 'Karyawan', 
e.officeCode, e.jobTitle
from employees as e
where officeCode =
(select officeCode KodeKantor from employees 
group by officeCode
having count(employeeNumber) = 
	(select max(Code.KodeKantor) as 'Banyaknya Karyawan' 
    from (select officeCode, count(employeeNumber) as KodeKantor
    from employees 
    group by officeCode) as Code
    )
);


select *from employees as e
inner join offices as o
on o.officeCode = e.officeCode
where employeeNumber in 
	(select employeeNumber from employees as e2
    where officeCode = 4);
    
    
use data_mahasiswa;

select Email from registrasi where Email = "auliaa@gmail.com";

select*from registrasi;
 -- desc itu data paling akhir itu dia yang ditampilkan keatas
--  asc sebaliknya

use classicmodels;
select*from orderdetails;
select*from orders;

-- ini untuk todo 1
select o.orderDate, c.customerName
from orders as o
inner join customers as c
on c.customerNumber = o.customerNumber
order by o.orderDate desc;  -- pake aliass

-- todo 2;
set autocommit = 0;

-- todo 3;
begin;

-- update customers set customerName = yusuf where customerNumber = id
 -- count untuk mengetahui ada berapa banyak data di suatu tabel jika pake * berarti semua kolom yang ada di dalam tabel


-- materi aggregate
-- concat menggabungkan dua kolom atau lebih
-- concat group dia menggabungkan satu kolom dan di order by sesuai id atau yag ada angkanya
-- group by -- digunakan untuk menampilkan hanya satu data tidak ada samanya 

select p.productLine,
sum(quantityInStock),
case 
when  p.productLine like '%car%' then 'No need to restock'
when sum(quantityInStock) < 20000 then 'Restock'
when sum(quantityInStock) > 20000 and sum(quantityInStock) <= 60000 then 'Decent'
when sum(quantityInStock) > 60000 then 'Many'
end as 'keterangan'
from products as p
group by productLine 
order by sum(quantityInStock);

-- note : kalau index lebih baik jangan pake alias kah beda outpunta mending langsung panggil aja
		  -- dan mending aliaskan dibagian end nya 
-- weh benarmi dulu kubuat kah samaji