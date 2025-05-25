-- MIN, MAX, COUNT, SUM, AVG, ALIAS, CONCAT, UPPER, LOWER

-- En este caso, se muestra el pago más pequeño registrado en la tabla payment.

SELECT MIN(amount) FROM payment;

-- Aquí, obtenemos la duración más larga entre todas las películas de la tabla film.

SELECT * FROM film;
SELECT MAX(length) FROM film;

-- Aquí, obtenemos el número total de clientes en la tabla customer.

SELECT COUNT(*) AS total_clientes FROM customer;

-- En este caso, se obtiene la suma total de los costos de reemplazo de todas las películas.

SELECT SUM(replacement_cost) FROM film;

-- Aquí, se obtiene el promedio de la tarifa de alquiler de todas las películas.

SELECT AVG(rental_rate) AS promedio_tarifa_alquiler FROM film;

-- Aquí, title aparecerá como "Pelicula" y rental_rate como "Tarifa".

SELECT title AS Pelicula, rental_rate AS Tarifa FROM film;

-- En este caso, se combina el nombre y el apellido de los actores en una sola columna.

SELECT first_name FROM actor;
SELECT last_name FROM actor;
SELECT first_name, last_name FROM actor;
SELECT CONCAT(first_name, ' ', last_name) FROM actor;
SELECT CONCAT('Nombre: ',first_name, ' ', 'Apellido: ', last_name, ' ', ':-D ') AS nombre_completo FROM actor;
SELECT CONCAT(first_name, last_name) FROM actor;

SELECT CONCAT(first_name, ' ', last_name) AS Nombre_Completo FROM actor;

-- Aquí, los nombres de las categorías de películas aparecerán en mayúsculas.

SELECT name FROM category;

SELECT UPPER(name) FROM category;

-- En este caso, los correos electrónicos de los clientes aparecerán en minúsculas.

SELECT LOWER(email) FROM customer;

SELECT LOWER(name) FROM category;


SELECT first_name, last_name FROM actor  
ORDER BY first_name  
LIMIT 5 OFFSET 10;