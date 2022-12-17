-- no 3
select concat(c.first_name,' ',c.last_name) as 'Nama Lengkap Pelanggan', f.title as 'Judul Film', r.rental_date as 'Tanggal Rental', f.rental_duration as 'Deadline', r.return_date as 'Tanggal Pengembalian'
from customer as c
inner join rental as r
on c.customer_id = r.customer_id
inner join inventory as i
on i.inventory_id = r.inventory_id
inner join film as f
on f.film_id = i.film_id
where 'Tanggal Pengembalian' > 'Deadline'
group by 'Nama Lengkap Pelanggan';

select rental_duration from film;

-- no 4
select l.name as 'Bahasa' , count(f.title) as 'Banyaknya Film'
from language as l
inner join film as f
on f.language_id = l.language_id
group by f.title;

select l.language_id from language as l;
select*from film;


-- no 12
select distinct(f.title) as 'Daftar film', ca.name as 'Genre film'
from film as f
inner join film_category as fc
on fc.film_id = f.film_id
inner join category as ca
on ca.category_id = fc.category_id
inner join inventory as i 
on f.film_id = i.film_id
inner join rental as r
on i.inventory_id = r.inventory_id
inner join customer as c
on c.customer_id = r.customer_id
where concat(c.first_name,' ',c.last_name) = 'AARON SELBY';

-- atau 
select group_concat(f.title,' ','Genre : ',ca.name) as 'Daftar film'
from film as f
inner join film_category as fc
on fc.film_id = f.film_id
inner join category as ca
on ca.category_id = fc.category_id
inner join inventory as i 
on f.film_id = i.film_id
inner join rental as r
on i.inventory_id = r.inventory_id
inner join customer as c
on c.customer_id = r.customer_id
where concat(c.first_name,' ',c.last_name) = 'AARON SELBY'
group by 'Daftar film';

select distinct(f.title) from film as f;
select*from category;
select*from customer;

select*from film;

-- no 1
-- select cs.first_name as 'nama depan' , day(r.rental_date) - day(r.return_date)  as 'selisih', c.city as 'kota', count('list film') as 'jumlah film', group_concat(f.title separator '||') as 'list film', 
-- 	case 
-- 		when sum(f.title) >= avg(f.title) then 'Diatas rata-rata'
--         else 'Dibawah rata-rata'
-- 	end as 'Keterangan'
-- from city as c
-- inner join address as a
-- on c.city_id = a.city_id
-- inner join customer as cs
-- on cs.address_id = a.address_id
-- inner join rental as r
-- on cs.customer_id = r.customer_id
-- inner join inventory as i
-- on r.inventory_id = i.inventory_id
-- inner join film as f
-- on i.film_id = f.film_id
-- group by 'jumlah film';

-- select*from rental;