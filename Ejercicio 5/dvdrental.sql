-- Selecciona las columnas film_id y title de la tabla film.
select film_id, title from film; 

--Selecciona 5 filas de la tabla film, obteniendo todas las columnas.
select * from film limit 5;

--Selecciona filas de la tabla film donde film_id sea menor que 4.
select * from film where film_id < 4;

--Selecciona filas de la tabla film donde el rating sea PG o G.
select rating, * from film  where rating in('PG', 'G') order by rating asc;

--Selecciona filas de la tabla actor donde el nombre sea Angela, Angelina o Audrey usando IN.
select * from actor where first_name in ('Angela', 'Angelina' , 'Audrey');

--Obtén una lista de actores con el nombre Julia.
select * from actor where first_name = 'Julia';

--Obtén una lista de actores con los nombres Chris, Cameron o Cuba.
select * from actor where first_name in ('Chris', 'Cameron', 'Cuba');

--Selecciona la fila de la tabla customer para el cliente con el nombre Jamie Rice.
select * from customer where first_name = 'Jamie' and last_name = 'Rice';
select * from customer where first_name || ' ' || last_name = 'Jamie Rice';

--Selecciona el monto y la fecha de pago de la tabla payment donde el monto pagado sea menor a $1.
select amount, payment_date  from payment where amount < 1;

--¿Cuáles son las diferentes duraciones de alquiler permitidas por la tienda?
select distinct rental_duration from film order by rental_duration asc;

--Ordena las filas en la tabla city por country_id y luego por city.
select * from city order by country_id;
select * from city order by city;

--¿Cuáles son los ID de los últimos 3 clientes que devolvieron un alquiler?
select distinct customer_id, return_date  from rental where return_date  is not null order by return_date desc limit 3;

--¿Cuántas películas tienen clasificación NC-17? ¿Cuántas tienen clasificación PG o PG-13?
select
	count(case when rating = 'NC-17' then 1 end) as nc_17,
	count(case when rating = 'PG' then 1 end) as pg,
	count(case when rating = 'PG-13' then 1 end) as pg_13
from film where rating in ('NC-17', 'PG', 'PG-13');

-- ¿Cuántos clientes diferentes tienen registros en la tabla rental?
select count(distinct customer_id) as total_clientes from rental;

-- ¿Hay algún cliente con el mismo apellido? 
select last_name, count(*) as cantidad_apellidos from customer group by last_name having count(*) > 1;

--¿Qué película (id) tiene la mayor cantidad de actores?
select f.film_id , f.title, count(actor_id) as cantidad_actores from film_actor join film f on f.film_id = film_actor.film_id group by f.film_id, f.title order by cantidad_actores desc;

--¿Qué actor (id) aparece en la mayor cantidad de películas?
select a.actor_id  , concat(a.first_name,' ',a.last_name) as nombre  , count(film_id) as cantidad_peliculas from film_actor join actor a on a.actor_id  = film_actor.actor_id  group by a.actor_id , a.first_name  order by cantidad_peliculas desc;

--Cuenta el número de ciudades para cada country_id en la tabla city. Ordena los resultados por count(*).
select country_id ,count(*) as cantidad_ciudades from city group by country_id order by count(*) desc ;

--¿Cuál es la tarifa de alquiler promedio de las películas? ¿Puedes redondear el resultado a 2 decimales?
select round(avg(rental_rate), 2) as tarifa_promedio from film;

--Selecciona los 10 actores que tienen los nombres más largos (nombre y apellido combinados).
select concat(first_name, ' ', last_name) as nombre_completo from actor order by length(concat(first_name, ' ', last_name)) desc limit 10;




