USE sakila;
/*- Muestra los títulos de las películas que tienen la misma duración que la 
película 'ALIEN CENTER' */
DROP VIEW IF EXISTS peliculas_alien_center;

CREATE VIEW peliculas_alien_center AS
SELECT title 
FROM film 
WHERE length >(
	SELECT length
    FROM film 
    WHERE title = 'ALIEN CENTER'
);


/*
- Muestra los nombres de los clientes que han hecho al menos un pago mayor a 
5 dólares.
*/
DROP VIEW IF EXISTS clientes_pago_mayor_5;

CREATE VIEW clientes_pago_mayor_5 AS
SELECT CONCAT(first_name,' ',last_name) AS name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
    WHERE amount > 5
);

/*- Muestra los títulos de las películas que tienen el mismo precio de renta que la 
película 'ZOOLANDER FICTION'.
*/
DROP VIEW IF EXISTS peliculas_zoolander_fiction;

CREATE VIEW peliculas_zoolander_fiction As
SELECT title 
FROM film 
WHERE rental_rate = (
	SELECT rental_rate
    FROM film
    WHERE title = 'ZOOLANDER FICTION'
);
/*- Muestra los nombres de los actores que actuaron en la película 
'GHOSTBUSTERS ELF'.
*/
DROP VIEW IF EXISTS actores_ghostbusters_elf;

CREATE VIEW actores_ghostbusters_elf AS
SELECT CONCAT(first_name, ' ', last_name) AS actor_name
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    WHERE film_id = (
        SELECT film_id
        FROM film
        WHERE title = 'GHOSTBUSTERS ELF'
    )
);

/*
- Muestra las películas cuya duración es mayor al promedio de todas las 
películas.
*/
DROP VIEW IF EXISTS peliculas_mayor_al_promedio;

CREATE VIEW peliculas_mayor_al_promedio AS
SELECT title 
FROM film
WHERE length >(
	SELECT AVG(length)
    FROM film
);

-- Lista los nombres de los clientes que han realizado al menos un pago.
DROP VIEW IF EXISTS clientes_pago;

CREATE VIEW clientes_pago AS
SELECT CONCAT(first_name,' ',last_name) AS name
FROM customer c
WHERE EXISTS (
	SELECT 1
    FROM payment p
    WHERE c.customer_id = p.customer_id
    );


-- Muestra los títulos de las películas que nunca han sido rentadas.
DROP VIEW IF EXISTS peliculas_no_rentadas;

CREATE VIEW peliculas_no_rentadas AS
SELECT title
FROM film
WHERE film_id NOT IN (
	SELECT film_id
    FROM inventory
    WHERE inventory_id IN (
		SELECT inventory_id
		FROM rental
    )
);


-- Muestra el nombre de las categorías que tienen más de 50 películas.
DROP VIEW IF EXISTS peliculas_categorias_mas_50;

CREATE VIEW peliculas_categorias_mas_50 AS
SELECT name
FROM category
WHERE category_id IN (
	SELECT category_id
    FROM film_category
    GROUP BY category_id
    HAVING COUNT(film_id) >50
);

/*
- Muestra los nombres de los empleados que trabajan en la tienda que tiene 
más películas en inventario.
*/
DROP VIEW IF EXISTS empleado_tienda_mas_inventario;

CREATE VIEW empleado_tienda_mas_inventario AS
SELECT CONCAT(s.first_name, ' ', s.last_name) AS name
FROM staff s
WHERE s.store_id = (
    SELECT store_id
    FROM inventory i
    JOIN film f ON i.film_id = f.film_id
    GROUP BY store_id
    ORDER BY COUNT(i.inventory_id) DESC
    LIMIT 1
);





/*
- Muestra los títulos de las películas que tienen el mismo rating que la película 
'ACADEMY DINOSAUR'.
*/
DROP VIEW IF EXISTS peliculas_rating_igual_academy_dinosaur;

CREATE VIEW peliculas_rating_igual_academy_dinosaur AS
SELECT title 
FROM film
WHERE rating =(
	SELECT rating
    FROM film
    WHERE title = 'ACADEMY DINOSAUR'
);


/*- Muestra el nombre de los actores que han participado en más de 20 
películas.*/
DROP VIEW IF EXISTS actores_mas_de_20_peliculas;

CREATE VIEW actores_mas_de_20_peliculas AS
SELECT CONCAT(first_name,' ',last_name) AS name
FROM actor
WHERE actor_id IN(
	SELECT actor_id
    FROM film_actor
    GROUP BY actor_id
    HAVING COUNT(film_id) >20
);



/*- Muestra los títulos de las películas que tienen el mismo costo de reposición 
que la película 'CRUSADE HONEY'.*/
DROP VIEW IF EXISTS costo_crasade_honey;

CREATE VIEW costo_crasade_honey AS
SELECT title 
FROM film
WHERE replacement_cost =(
	SELECT replacement_cost
    FROM film
    WHERE title = 'CRUSADE HONEY'
    );




