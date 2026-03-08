/* 2) Muestra los nombres de todas las películas con una clasificación por 
edades de ‘Rʼ.*/
select title 
from film f 
where rating = 'R';

/* 3) Encuentra los nombres de los actores que tengan un “actor_idˮ entre 30 
y 40.*/
select actor_id, 
	concat("first_name",' ',"last_name")
from actor a 
where actor_id between 30 and 40;

/* 4) Obtén las películas cuyo idioma coincide con el idioma original*//*¿¿¿columna idioma original datos nulos???*/
select title
from "language" l
join film f 
on l.language_id = f.language_id;

/* 5) Ordena las películas por duración de forma ascendente*/
select title, length
from film f 
order by length asc;

/* 6) Encuentra el nombre y apellido de los actores que tengan ‘Allenʼ en su 
apellido.*/
select concat(first_name,' ', last_name)
from actor a 
where last_name = 'ALLEN';

/* 7) Encuentra la cantidad total de películas en cada clasificación de la tabla 
“filmˮ y muestra la clasificación junto con el recuento.*/
select rating, count(film_id )
from film f 
group by rating;

/* 8)  Encuentra el título de todas las películas que son ‘PG13ʼ o tienen una 
duración mayor a 3 horas en la tabla film.*/
select title, rating, length
from film f
where rating='PG-13' or length>180;

/* 9) Encuentra la variabilidad de lo que costaría reemplazar las películas*/
select variance(replacement_cost )
from film f;

/* 10) Encuentra la mayor y menor duración de una película de nuestra BBDD*/
select  
	MIN(length),
	MAX(length)
from film f;

/* 11) Encuentra lo que costó el antepenúltimo alquiler ordenado por día*/
select r.rental_date, p.amount 
from rental r 
join payment p on r.rental_id = p.rental_id
order by r.rental_date desc
limit 1 offset 2;

/* 12) Encuentra el título de las películas en la tabla “filmˮ que no sean ni ‘NC
 17ʼ ni ‘Gʼ en cuanto a su clasificación.*/
select title, rating
from film f 
where rating not in ('NC-17','G');

/* 13)  Encuentra el promedio de duración de las películas para cada 
clasificación de la tabla film y muestra la clasificación junto con el 
promedio de duración.*/
select rating, round(AVG(length), 2) as promedio_duracion
from film f 
group by rating;

/* 14) Encuentra el título de todas las películas que tengan una duración mayor 
a 180 minutos.*/
select title, length
from film f 
where length >= 180;

/* 15) ¿Cuánto dinero ha generado en total la empresa?*/
select SUM(amount ) as Total_generado
from payment p;

/* 16) Muestra los 10 clientes con mayor valor de id.*/
select customer_id , first_name  
from customer c 
order by customer_id desc 
limit 10;

/* 17) Encuentra el nombre y apellido de los actores que aparecen en la 
película con título ‘Egg Igbyʼ.*/
select  a.first_name, a.last_name 
from actor a 
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
where f.title = 'EGG IGBY';

/* 18) Selecciona todos los nombres de las películas únicos.*/
select distinct title
from film f; 

/* 19) Encuentra el título de las películas que son comedias y tienen una 
duración mayor a 180 minutos en la tabla “filmˮ.*/
select f.title as movie_name, 
	c."name" as film_category, 
	f.length as movie_length
from film f 
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id 
where c.name ='Comedy' and f.length > 180;

/* 20) Encuentra las categorías de películas que tienen un promedio de 
duración superior a 110 minutos y muestra el nombre de la categoría 
junto con el promedio de duración.*/
select c."name" as film_category, 
	round(avg(f.length),2) as movie_length
from film f 
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id 
group by c.name
having avg (f.length)>110;

/* 21) ¿Cuál es la media de duración del alquiler de las películas?*/
select avg(rental_duration )
from film f ;

/* 22) Crea una columna con el nombre y apellidos de todos los actores y 
actrices.*/
select concat(first_name, ' ',last_name ) as actor_name
from actor a;

/* 23) Números de alquiler por día, ordenados por cantidad de alquiler de 
forma descendente*/
select date (rental_date) as dia, count (*) as numero_alquileres
from rental r 
group by DATE (rental_date)
order by numero_alquileres desc;

/* 24)  Encuentra las películas con una duración superior al promedio */
select f.title, f.length 
from film f 
where f.length > (
	select avg (f.length )
	from film f 
	);
/*25) Averigua el número de alquileres registrados por mes.*/
select count (*) as numero_alquileres
from rental r 


/* 26)  Encuentra el promedio, desviación estándar y vaarianza del total pagado */
select AVG(amount) as promedio,
stddev(amount) as desviaciónestándar,
variance(amount) as varianza
from payment p;

/*27) ¿Qué peliculas se alquilan por encima del precio medio?*/
SELECT title, rental_rate
FROM film
WHERE rental_rate > (
    SELECT AVG(rental_rate)
    FROM film
);

/*28) Muestra el id de los actores que hayan participado en más de 40 películas*/
select actor_id, count (film_id) as numero_pelis
from film_actor fa 
group by actor_id 
having count(fa.film_id )>40;

/* 29) Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible*/
select title, count(inventory_id) as cantidad_disponible
from film f 
left join inventory i 
on f.film_id = i.film_id 
group by f.title;

/*30) Obtener los actores y el número de películas en las que ha actuado */
select a.actor_id ,a.first_name , a.last_name , count (fa.film_id) as numero_peliculas
from actor a 
left join film_actor fa 
on a.actor_id = fa.actor_id 
group by a.actor_id, a.first_name , a.last_name 
order by numero_peliculas desc;

/* 31) Obtener todas las peliculas y mostrar los actores que han actuado en ellas (aunque alguna no tenga actores)*/
select f.title, a.first_name, a.last_name
from film f
left join film_actor fa
on f.film_id = fa.film_id
left join actor a
on fa.actor_id = a.actor_id;

/* 32) Obtener todos los actores y mostrar las peliculas en las que han actuado*/
select a.first_name, a.last_name , f.title 
from actor a 
left join film_actor fa 
on a.actor_id = fa.actor_id 
left join film f 
on fa.film_id = f.film_id;

/* 33) Obtener todas las peliculas que tenemos y todos los registros de alquiler*/
select f.title , r.rental_id , r.rental_date 
from film f 
left join inventory i 
on f.film_id = i.film_id 
left join rental r 
on i. inventory_id = r.inventory_id;

/* 34) Encuentra los 5 clientes que más dinero se hayan gastado*/
select customer_id, sum (amount) as total_gastado
from payment p 
group by customer_id 
order by total_gastado desc
limit 5;

/* 35) Selecciona todos los actores cuyo primer nombre es 'Johnny' */
select *
from actor a 
where first_name = 'Johnny';

/* 36) Renombra la columna "first name" como Nombre y "last_name" como Apellido*/
select first_name as nombre, last_name as apellido
from actor;

/* 37)Encuentra el ID del actor más bajo y más alto en la tabla actor"
 */
select min (actor_id) as id_min, max (actor_id) as id_max
from actor;

/* 38) Cuenta cuantos actores hay en la tabla actor*/
select count (*) as total_actores
from actor a ;

/* 39) Selecciona todos los actores y ordenalos por apellido en orden ascendente*/
select *
from actor a 
order by a.last_name asc;

/* 40)Selecciona las primeras 5 peliculas de la tabla film*/
select *
from film f 
limit 5;

/* 41) Agrupa los actores por su nombre y cuenta cuantos actores tienen el mismo nombre. ¿Cual es el más repetido?*/
select first_name, count (*) as cantidad
from actor a 
group by a.first_name 
order by cantidad desc;

/*42) Encuentra todos los alquileres y los nombres de los clientes que los realizaron*/
select r.rental_id, r.rental_date , c.first_name , c.last_name 
from rental r 
join customer c 
on r.customer_id = c.customer_id;

/* 43) Muestra todos los clientes y sus alquileres si existen, incluyendo aaquellos que no tienen alquileres*/
select c.customer_id,c.first_name, c.last_name, r.rental_id  
from customer c 
left join rental r 
on c.customer_id = r.customer_id;

/* 44) Realiza un CROSS JOIN entre las tablas film y category */
select f.title, c.name
from film f 
cross join category c;

/* 45) Encuentra a los actores que han participado en las peliculas de la categoria "Action" 
*/
select a.first_name, a.last_name 
from actor a 
join film_actor fa 
on a.actor_id = fa. actor_id 
join film_category fc 
on fa.film_id = fc. film_id 
join category c 
on fc.category_id = c.category_id 
where c.name = 'Action';

/* 46) Encuentra a todos los actores que no han participado en películas*/
select a.actor_id, a.first_name, a.last_name 
from actor a 
left join film_actor fa 
on a.actor_id = fa.actor_id 
where fa.film_id is null;

/* 47) Selecciona el nombre de los actores y la cantidad de peliculas en las que han participado*/
select a.first_name, a.last_name, count (fa.film_id) as numero_peliculas
from actor a
left join film_actor fa
on a.actor_id = fa.actor_id
group by a.first_name, a.last_name
order by numero_peliculas desc;

/* 48) Crea una vista llamada "actor_num_peliculas"
 */
create view actor_num_peliculas as
select a.first_name, a.last_name, count (fa.film_id) as numero_peliculas
from actor a 
left join film_actor fa 
on a.actor_id = fa. actor_id
group by a.first_name, a.last_name;

/* 49) Calcula el numero total de alquileres realizados por cada cliente*/
select customer_id, count (*) as total_alquileres
from rental r 
group by customer_id 
order by total_alquileres desc;

/* 50) Calcula la duración total de las películas en la categoría 'Action'*/
select sum(f.length) as duracion_total
from film f
join film_category fc
on f.film_id = fc.film_id
join category c
on fc.category_id = c.category_id
where c.name = 'Action';

/* 51) Crea una tabla temporal llamada "cliente_rentas_temporal"*/
create temp table cliente_rentas_temporal as
select customer_id, COUNT(*) AS total_alquileres
from rental
group by customer_id;

/* 52) Crea una tabla temporal llamada "peliculas_alquiladas"*/
create temp table peliculas_alquiladas as 
select i.film_id, count (*) as veces_alquilada
from rental r
join inventory i 
on r.inventory_id = i.inventory_id
group by i.film_id
having count (*) >= 10;

/* 53) Encuentra el titulo de las peliculas alquiladas por 'Tammy Sanders' que aun no se han devuelto*/
select f.title
from customer c 
join rental r 
on c.customer_id = r.customer_id 
join inventory i 
on r.inventory_id = i.inventory_id 
join film f
on i.film_id = f.film_id 
where c.first_name = 'Tammy'
and c.last_name = 'Sanders'
and r.return_date is null 
order by f.title;

/* 54) Encuentra los actores que han actuado en al menos una película de 'Sci-fi'*/
select distinct a.first_name, a.last_name
from actor a
join film_actor fa
on a.actor_id = fa.actor_id
join film_category fc
on fa.film_id = fc.film_id
join category c
on fc.category_id = c.category_id
where c.name = 'Sci-Fi'
order by a.last_name;

/* 55) Actores que han actuado en peliculas alquiladas despues del primer alquiler de 'Spartacus Cheaper'*/
SELECT DISTINCT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_date >
(
SELECT MIN(r2.rental_date)
FROM rental r2
JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
JOIN film f2 ON i2.film_id = f2.film_id
WHERE f2.title = 'Spartacus Cheaper'
)
ORDER BY a.last_name;

/* 56) Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría 'Music'*/
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.actor_id NOT IN (
    SELECT fa.actor_id
    FROM film_actor fa
    JOIN film_category fc ON fa.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Music'
);

/* 57) Encuentra el título de todas las películas que fueron alquiladas por más de 8 días*/
SELECT DISTINCT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE (r.return_date - r.rental_date) > INTERVAL '8 days';

/* 58) Encuentra el título de todas las películas que son de la misma categoría que 'Animation'*/
SELECT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
WHERE fc.category_id = (
    SELECT fc2.category_id
    FROM film_category fc2
    JOIN film f2 ON fc2.film_id = f2.film_id
    WHERE f2.title = 'Animation'
    LIMIT 1
);

/* 59) Encuentra las películas que tienen la misma duración que 'Dancing Fever'*/
SELECT title
FROM film
WHERE length = (
    SELECT length
    FROM film
    WHERE title = 'Dancing Fever'
)
ORDER BY title;

/* 60) Encuentra los clientes que han alquilado al menos 7 películas distintas*/
SELECT c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.film_id) >= 7
ORDER BY c.last_name;

/* 61) Cantidad total de películas alquiladas por categoría*/
SELECT c.name, COUNT(*) AS total_alquileres
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN inventory i ON fc.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name;

/* 62) Número de películas por categoría estrenadas en 2006*/
SELECT c.name, COUNT(*) AS numero_peliculas
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
WHERE f.release_year = 2006
GROUP BY c.name;

/* 63) Obtén todas las combinaciones posibles de trabajadores con las tiendas*/
SELECT s.staff_id, st.store_id
FROM staff s
CROSS JOIN store st;

/* 64) Cantidad total de películas alquiladas por cada cliente*/
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_alquileres
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_alquileres DESC;
