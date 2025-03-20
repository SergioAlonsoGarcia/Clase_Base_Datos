-- GROUP BY, HAVING

-- Mostraremos el número de películas (registros en la tabla film) agrupados por el lenguaje. 
USE sakila;

SELECT language_id, COUNT(*) FROM film GROUP BY language_id; 

SELECT * FROM language;
SELECT DISTINCT language_id FROM film;

/*
Mostraremos el número de películas (registros en la tabla film) 
agrupados por el lenguaje excluyendo aquellos que tienen 3 o menos. 
*/

SELECT language_id, COUNT(*) FROM film GROUP BY language_id HAVING COUNT(*)>3;

/* 
Mostraremos el número de películas (a la suma le llamaremos cuantos) 
agrupados por su duración y los ordenaremos de forma descendente por el número de registros agrupados 
*/

SELECT rental_duration, COUNT(*) AS cuantos FROM film GROUP BY rental_duration ORDER BY cuantos DESC;

/* 
Mostraremos el número de películas (a la suma le llamaremos cuantos) 
agrupados por su duración y los ordenaremos de forma descendente por el número de registros agrupados 
filtrando los que tienen menos de 200 registros. 
*/

SELECT rental_duration, COUNT(*) AS cuantos 
FROM film 
GROUP BY rental_duration 
HAVING cuantos>200 
ORDER BY cuantos DESC; 

-- Mostraremos el monto pagado por cada cliente y lo ordenaremos por el identificador del cliente

SELECT customer_id, SUM(amount) 
FROM payment
GROUP BY(customer_id) 
ORDER BY customer_id;

-- Insert para prueba

INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
VALUES (1, 1, 1, 100, NOW()),
       (2, 1, 2, 150, NOW()),
       (3, 2, 3, 300, NOW()),
       (4, 2, 4, 200, NOW());

SELECT NOW();

INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
VALUES (5, 1, 5, 120, CURRENT_TIMESTAMP()),
       (6, 2, 6, 180, CURRENT_TIMESTAMP());

SELECT CURRENT_TIMESTAMP();

/*

CREATE TABLE ejemplo (
    id_ejemplo INT AUTO_INCREMENT PRIMARY KEY,
    fecha_de_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

*/

/* 
Muestra el número total de rentas y el monto total de pagos por cada empleado (staff_id) 
para los pagos realizados desde el 1 de enero de 2024. 
solo incluyendo los empleados cuyo total de pagos supera los $500, 
y los resultados se ordenan de mayor a menor según el total de pagos.
*/

SELECT staff_id, COUNT(*) AS total_rentas, SUM(amount) AS total_pago
FROM payment
WHERE payment_date >= '2024-01-01'    				 -- 1. Filtra los pagos desde enero de 2024
GROUP BY staff_id                                    -- 2. Agrupa los datos por empleado
HAVING total_pago > 500                         	 -- 3. Filtra los grupos con pagos mayores a $500
ORDER BY total_pago DESC; 

 

-- Asignar 'Italian' a las primeras 100 películas
UPDATE film
SET language_id = 2
WHERE film_id BETWEEN 1 AND 100;

-- Asignar 'Japanese' a las siguientes 100 películas
UPDATE film
SET language_id = 3
WHERE film_id BETWEEN 101 AND 200;

-- Asignar 'Mandarin' a las siguientes 100 películas
UPDATE film
SET language_id = 4
WHERE film_id BETWEEN 201 AND 300;

-- Asignar 'French' a las siguientes 100 películas
UPDATE film
SET language_id = 5
WHERE film_id BETWEEN 301 AND 400;

-- Asignar 'German' a las siguientes 100 películas
UPDATE film
SET language_id = 6
WHERE film_id BETWEEN 401 AND 500;

-- Actividad 14

-- Monto de las rentas de cada empleado durante el mes de mayo

SELECT staff_id, SUM(amount) AS total_rentas
FROM payment
WHERE MONTH (payment_date) = 5
GROUP BY staff_id;

SELECT DISTINCT staff_id FROM payment;

SELECT SUM(amount) AS total_rentas FROM payment;


-- Promedio de los pagos por cada mes

SELECT MONTH(payment_date) AS mes, AVG(amount) AS promedio_pago
FROM payment
GROUP BY mes;

SELECT DISTINCT(MONTH(payment_date)) FROM payment;

-- Promedio de los pagos de cada cliente

SELECT customer_id, AVG(amount) AS promedio_pago
FROM payment
GROUP BY customer_id;

-- Promedio de los pagos de cada día de la semana

SELECT DAYNAME(payment_date) AS dia_semana, AVG(amount) AS promedio_pago
FROM payment
GROUP BY dia_semana;

-- Cantidad de rentas por cliente

SELECT customer_id, COUNT(*) AS total_rentas
FROM rental
GROUP BY customer_id;

-- Cantidad de rentas por empleado

SELECT staff_id, COUNT(*) AS total_rentas
FROM rental
GROUP BY staff_id;

-- Cantidad de clientes por tienda

SELECT store_id, COUNT(*) AS total_clientes
FROM customer
GROUP BY store_id;

-- Cantidad de películas por categoría de rating

SELECT rating, COUNT(*) AS total_peliculas
FROM film
GROUP BY rating;

-- Cantidad de ciudades registradas por país

SELECT country_id, COUNT(*) AS total_ciudades
FROM city
GROUP BY country_id;

-- Cantidad de películas por tienda

SELECT store_id, COUNT(*) AS total_peliculas
FROM inventory
GROUP BY store_id;

-- Calcule el monto total de pagos de cada cliente

SELECT customer_id, SUM(amount) AS total_pago
FROM payment
GROUP BY customer_id;

-- Liste los empleados que han generado pagos con un monto total mayor a $100

SELECT staff_id, SUM(amount) AS total_pago
FROM payment
GROUP BY staff_id
HAVING total_pago > 100;

-- Calcule el número de pagos realizados por cada cliente en el mes de junio

SELECT customer_id, COUNT(*) AS total_pagos
FROM payment
WHERE MONTH(payment_date) = 6
GROUP BY customer_id;

-- Calcule la cantidad de películas por cada duración de renta (rental_duration)

SELECT rental_duration, COUNT(*) AS cantidad_peliculas
FROM film
GROUP BY rental_duration;

-- Calcule la cantidad total de pagos recibidos cada año

SELECT YEAR(payment_date) AS año, SUM(amount) AS total_pago
FROM payment
GROUP BY año;

-- Calcule el monto total de pagos por cada día de la semana

SELECT DAYNAME(payment_date) AS dia_semana, SUM(amount) AS total_pago
FROM payment
GROUP BY dia_semana;

-- Liste los días donde el total de pagos fue mayor a $500

SELECT payment_date, SUM(amount) AS total_pago
FROM payment
GROUP BY payment_date
HAVING total_pago > 500;

-- Calcule cuántas películas hay en cada duración (length) específica

SELECT length, COUNT(*) AS cantidad_peliculas
FROM film
GROUP BY length;

-- Calcule la cantidad de pagos realizados en cada tienda

SELECT staff_id, COUNT(*) AS total_pagos
FROM payment
GROUP BY staff_id;

-- Calcule el monto total de pagos por cada cliente, pero solo para aquellos que han realizado más de 5 pagos

SELECT customer_id, SUM(amount) AS total_pago, COUNT(*) AS total_pagos
FROM payment
GROUP BY customer_id
HAVING total_pagos > 5;

-- Calcule el número de películas según su clasificación (rating)

SELECT rating, COUNT(*) AS cantidad_peliculas
FROM film
GROUP BY rating;

-- Liste los clientes que han realizado pagos con un monto promedio mayor a $5

SELECT customer_id, AVG(amount) AS promedio_pago
FROM payment
GROUP BY customer_id
HAVING promedio_pago > 5;

-- Calcule la cantidad de películas en cada duración de renta (rental_duration) mayor a 5 días

SELECT rental_duration, COUNT(*) AS cantidad_peliculas
FROM film
GROUP BY rental_duration
HAVING rental_duration > 5;

-- Calcule el total de pagos recibidos por cada mes, pero solo los meses con más de 100 pagos

SELECT MONTH(payment_date) AS mes, COUNT(*) AS total_pagos
FROM payment
GROUP BY mes
HAVING total_pagos > 100;

-- Liste las clasificaciones de películas (rating) que tienen más de 200 películas registradas

SELECT rating, COUNT(*) AS cantidad_peliculas
FROM film
GROUP BY rating
HAVING cantidad_peliculas > 200;