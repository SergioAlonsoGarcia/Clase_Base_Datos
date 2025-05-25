USE sakila;


/*Liste las ciudades (id y nombre) y las tiendas que se encuentran en cada
ciudad, use RIGHT JOIN para mostrar TODAS las ciudades haya o no tiendas
en ellas
*/
SELECT c.city_id, c.city, st.store_id FROM store st
RIGHT JOIN address a ON st.address_id = a.address_id
RIGHT JOIN city c ON a.city_id = c.city_id;

/*
Liste los países (id y nombre) y las ciudades que se encuentran en cada
país, use RIGHT JOIN para mostrar TODOS los países haya o no ciudades
en ellos
*/
SELECT co.country_id,co.country,c.city FROM city c
RIGHT JOIN country co ON co.country_id = c.country_id;


/*
Liste las ciudades (id y nombre) y los clientes que se encuentran en cada
ciudad, use RIGHT JOIN para mostrar TODAS las ciudades haya o no
clientes en ellas
*/
SELECT c.city_id,c.city,CONCAT(cus.first_name, ' ' , cus.last_name) 
AS customer
FROM customer cus
RIGHT JOIN address ad ON cus.address_id = ad.address_id
RIGHT JOIN city c ON ad.city_id = c.city_id;


-- Liste las películas que para la tienda 1 no hayan sido rentadas 
SELECT DISTINCT f.film_id,f.title 
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE i.store_id = 1
	AND r.rental_id IS NULL;


/*
Liste los nombres de los actores y en cuantas películas del catalogo
participa 
*/
SELECT CONCAT(a.first_name,' ',a.last_name) AS actor, COUNT(f.title) AS movies
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
GROUP BY a.first_name,a.last_name;

/*
Liste los nombres de las películas y en cuantas tiendas están
registradas 
*/
SELECT f.title,COUNT(DISTINCT s.store_id) AS store_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN store s ON i.store_id = s.store_id
GROUP BY f.title;

-- Liste los idiomas y cuantas películas están habladas en ese idioma 
SELECT l.name,COUNT(f.film_id) AS translated_movies
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.language_id,l.name;


-- Liste cuantas veces ha sido rentada cada película en el catalogo 
SELECT f.title ,COUNT(r.rental_id) AS number_of_rents
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title;

-- Liste cuantos pagos se realizaron en cada renta 
SELECT f.title ,COUNT(p.payment_id) AS number_of_amounts
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.title;

-- Liste cuantas películas ha rentado cada cliente 
SELECT CONCAT(c.first_name,' ',c.last_name) AS cusotmer_name,
COUNT(r.rental_id) AS total_rents
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
GROUP BY c.first_name,c.last_name;


-- Liste cuantas películas ha rentado cada miembro del staff 
SELECT CONCAT(st.first_name,' ',st.last_name) AS staff_name,
COUNT(r.rental_id) AS total_rents
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN staff st ON st.staff_id = r.staff_id
GROUP BY st.staff_id,st.first_name,st.last_name;


-- Liste los clientes que han generado pagos con un monto total mayor a $10
SELECT c.first_name,c.last_name,SUM(p.amount) AS total_amount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id,c.first_name,c.last_name
HAVING SUM(p.amount) > 10;


-- Liste los empleados que han generado pagos con un monto total mayor a $100
SELECT st.first_name,st.last_name,SUM(p.amount) AS total_amount
FROM staff st
JOIN payment p ON st.staff_id = p.staff_id
GROUP BY st.staff_id,st.first_name,st.last_name
HAVING SUM(p.amount) > 100;


-- Calcule el número de pagos realizados por cada cliente en el mes de junio
SELECT c.customer_id,c.first_name,c.last_name,COUNT(p.payment_id) AS payments
FROM customer c
JOIN payment p ON p.customer_id = c.customer_id
WHERE MONTH(p.payment_date) = 6
GROUP BY c.customer_id,c.first_name,c.last_name;


-- Calcule la cantidad de películas por cada duración de renta (rental_duration)
SELECT rental_duration,COUNT(*) AS number_of_films
FROM film
GROUP BY rental_duration; 


-- Calcule la cantidad total de pagos recibidos cada año
SELECT  YEAR(payment_date),COUNT(payment_id) FROM payment
GROUP BY YEAR(payment_date);

-- Calcule el monto total de pagos por cada día de la semana
SELECT SUM(amount) AS total_amount,DAYOFWEEK(payment_date) AS day_of_week
FROM payment
GROUP BY DAYOFWEEK(payment_date);


-- Liste los días donde el total de pagos fue mayor a $50
SELECT SUM(amount) AS total_amount,DAYOFWEEK(payment_date) AS day_of_week
FROM payment
GROUP BY DAYOFWEEK(payment_date)
HAVING  SUM(amount) > 50;


-- Calcule cuántas películas hay en cada duración (length) específica
SELECT length,COUNT(length) AS total_length
FROM film 
GROUP BY length;

-- Calcule la cantidad de pagos realizados en cada tienda
SELECT s.store_id, COUNT(p.payment_id) AS total_payments
FROM store s
JOIN inventory i ON s.store_id = i.store_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY s.store_id;

/*
Calcule el monto total de pagos por cada cliente, pero solo para
aquellos que han realizado más de 5 pagos
*/
SELECT  CONCAT(c.first_name, ' ', c.last_name) 
AS customer_name, SUM(p.amount) AS total_amount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING COUNT(p.payment_id) > 5;


/*
Calcule el número de películas (puede haber mas de 1 película por
cada titulo) según su clasificación (rating)
*/
SELECT f.rating, COUNT(f.film_id) AS total_films
FROM film f
GROUP BY f.rating;


/*
Liste los clientes que han realizado pagos con un monto promedio
mayor a $5
*/
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) 
AS customer_name,AVG(p.amount) AS avg_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING AVG(p.amount) > 5;


/*
Calcule la cantidad de títulos de películas en cada duración de renta
(rental_duration) mayor a 5 días
*/
SELECT f.rental_duration, COUNT(f.film_id) AS total_films
FROM film f
WHERE f.rental_duration > 5
GROUP BY f.rental_duration;


-- Liste el total de pagos recibidos por cada mes, pero solo los meses con más de 100 pagos
SELECT MONTH(p.payment_date) AS month, COUNT(p.payment_id) AS total_payments
FROM payment p
GROUP BY MONTH(p.payment_date)
HAVING COUNT(p.payment_id) > 100
ORDER BY month;


-- Liste las clasificaciones de películas (rating) que tienen más de 50 películas registradas
SELECT f.rating, COUNT(f.film_id) AS total_films
FROM film f
GROUP BY f.rating
HAVING COUNT(f.film_id) > 50;





