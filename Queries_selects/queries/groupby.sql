-- Calcule el monto de las rentas de cada empleado con durante el mes de mayo
USE sakila;
SELECT customer_id,amount FROM payment 
WHERE MONTH(payment_date) = 5 
GROUP BY amount;


-- Calcule el promedio de los pagos por cada mes
USE sakila;
SELECT MONTH(payment_date) as month ,AVG (amount) AS average_amount
FROM payment
GROUP BY MONTH(payment_date);

-- Calcule el promedio de los pagos de cada cliente
USE sakila;
SELECT customer_id,AVG(amount) AS average_amount
FROM payment
GROUP BY (amount);

-- Calcule el promedio de los pagos de cada día de la semana
USE sakila;
SELECT DAYNAME(payment_date) AS day, AVG(amount) as average_amount
FROM payment
GROUP BY DAYNAME(payment_date);

-- Calcule cuantas rentas tiene cada cliente
USE sakila;
SELECT customer_id,COUNT(*) AS total_rentas
FROM rental
GROUP BY (customer_id);


-- Calcule cuantas rentas tiene cada empleado
USE sakila;
SELECT staff_id, COUNT(*) AS total_rentas
FROM rental
GROUP BY (staff_id);

-- Calcule cuantos clientes tiene cada tienda
USE sakila;
SELECT store_id,COUNT(*) AS total_clientes
FROM customer 
GROUP BY store_id;

-- Calcule cuantas películas tiene cada categoría de rating
USE sakila;
SELECT rating,COUNT(*) AS total_rating
FROM film
GROUP BY rating;

-- Calcule cuantas ciudades están registradas por país
USE sakila;
SELECT country_id,COUNT(city_id) AS total_ciudades
FROM city
GROUP BY country_id;

-- Calcule cuantas películas hay en cada tienda
USE sakila;
SELECT store_id,COUNT(*) AS total_peliculas
FROM inventory
GROUP BY store_id;

-- Calcule el monto total de pagos de cada cliente
USE sakila;
SELECT customer_id,SUM(amount) as amount
FROM payment
GROUP BY customer_id;

-- Liste los empleados que han generado pagos con un monto total mayor a $100
USE sakila;
SELECT staff_id,sum(amount) AS amount_total
FROM payment
GROUP BY staff_id
HAVING amount_total>100;

-- Calcule el número de pagos realizados por cada cliente en el mes de junio
USE sakila;
SELECT customer_id,COUNT(*) AS total_pagos
FROM payment
WHERE MONTH(payment_date) = 6
GROUP BY customer_id;

-- Calcule la cantidad de películas por cada duración de renta (rental_duration)
USE sakila;
SELECT rental_duration,COUNT(*) AS total_peliculas
FROM film
GROUP BY rental_duration;
/*



Calcule la cantidad de películas por cada duración de renta (rental_duration)
Calcule la cantidad total de pagos recibidos cada año
Calcule el monto total de pagos por cada día de la semana
Liste los días donde el total de pagos fue mayor a $500
Calcule cuántas películas hay en cada duración (length) específica
Calcule la cantidad de pagos realizados en cada tienda
Calcule el monto total de pagos por cada cliente, pero solo para aquellos que han realizado más de 5 pagos
Calcule el número de películas según su clasificación (rating)
Liste los clientes que han realizado pagos con un monto promedio mayor a $5
Calcule la cantidad de películas en cada duración de renta (rental_duration) mayor a 5 días
Calcule el total de pagos recibidos por cada mes, pero solo los meses con más de 100 pagos
Liste las clasificaciones de películas (rating) que tienen más de 200 películas registradas