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






