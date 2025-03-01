/*

SELECT campo1, campo2, ... 
FROM tabla1
    [INNER | LEFT | RIGHT | FULL] JOIN tabla2 ON condición_de_union
    ...
WHERE condición
    [AND | OR | NOT condición_adicional]
GROUP BY campo1, campo2, ...
HAVING condición_agregada
ORDER BY campo1 [ASC | DESC], campo2 [ASC | DESC];

*/

-- Clase 1 query

USE sakila;

-- Para mostrar todos los registros de la tabla “Actor” 

SELECT * FROM actor;

-- Para mostrar todos los registros de la tabla “Actor”

SELECT actor_id,first_name,last_name,last_update FROM actor;

-- Para mostrar todos los registros de la tabla “Actor”

SELECT first_name,last_name,last_update,actor_id FROM actor;

-- Para mostrar todos los registros de la tabla “Actor”

SELECT first_name,last_name FROM actor;

-- Para mostrar todos los registros de la tabla “Actor”, ordenados por el first_name descendente

SELECT first_name,last_name FROM actor;

SELECT first_name,last_name FROM actor ORDER BY first_name ASC;

SELECT first_name,last_name FROM actor ORDER BY first_name DESC;

-- DISCTINCT 

SELECT DISTINCT first_name FROM actor;
 

-- Ejemplo de LIMIT

SELECT * FROM actor;
SELECT * FROM actor LIMIT 20;




-- Actividad/tarea 9 SQL

-- Liste todos los registros y campos de la tabla country 
USE sakila;

SELECT * FROM country;

-- Liste todos los registros y campos de la tabla category

USE sakila;

SELECT * FROM category;

-- Liste todos los registros y campos de la tabla language 

USE sakila;

SELECT * FROM language;

-- Liste todos los registros y los campos country_id y country de la tabla country 

USE sakila;

SELECT country_id, country FROM country;

-- Liste todos los registros y el campo name  de la tabla category

USE sakila;

SELECT name FROM category;

SELECT * FROM category;

-- Liste todos los registros y los campos language_id y name  de la tabla language 

USE sakila;

SELECT language_id, name FROM language;

-- Liste todos los registros y campos de la tabla country ordenado por last_update de forma descendente 

USE sakila;

SELECT * FROM country ORDER BY last_update DESC;

-- Liste todos los registros y campos de la tabla category ordenados por name de forma descendente 
USE sakila;

SELECT * FROM category ORDER BY name DESC;

-- Liste todos los registros y campos de la tabla language ordenado por last_name de forma descendente 

USE sakila;

SELECT * FROM language ORDER BY name DESC;

-- Liste todos los campos de los registros no duplicados en el campo first_name 

USE sakila;

SELECT DISTINCT first_name FROM actor;