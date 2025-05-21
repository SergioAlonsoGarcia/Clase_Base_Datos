USE sakila;
-- 1. Muestra los títulos de todas las películas junto con el nombre de la categoría a la que pertenecen.
SELECT f.title, c.name FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

-- 2. Lista todas las películas con el idioma en que están habladas. Si alguna película no tiene idioma, muestra "NULL".
SELECT f.title,IFNULL(l.name,'NULL') AS language FROM film f
LEFT JOIN language l ON f.language_id = l.language_id;

-- 3. Muestra todas las categorías, y si tienen películas, el número de películas en esa categoría. Si no tienen, muestra 0.
SELECT c.name,IFNULL(COUNT(f.film_id) ,0 ) AS films FROM category c
JOIN film_category fc ON  c.category_id = fc.category_id
LEFT JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name,c.category_id;

-- 4. Lista todos los clientes y cuánto dinero han pagado en total. Si no han hecho pagos, muestra 0.
SELECT CONCAT(c.first_name, ' ',c.last_name) AS name,IFNULL(SUM(p.amount),0) AS amount FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name,c.last_name,c.customer_id;

-- 5. Muestra todas las direcciones y, si hay una tienda en esa dirección, muestra su ID.
SELECT a.address,s.store_id  AS store_id FROM address a
LEFT JOIN store s ON s.address_id = a.address_id;

-- 6. Muestra la fecha de renta y el título de la película que fue rentada.
SELECT r.rental_date,f.title FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN film f ON i.film_id = f.film_id;

-- 7. Lista todos los empleados y la tienda en la que trabajan. Si algún empleado no tiene tienda asignada, muestra NULL.
SELECT CONCAT(st.first_name, ' ' ,st.last_name) AS name_staff  ,s.store_id FROM  staff st
JOIN store s ON st.store_id = s.store_id;

-- 8. Muestra todas las ciudades y la cantidad de clientes que viven en ellas. Si no hay clientes, muestra 0.
SELECT c.city,COUNT(cu.customer_id) FROM customer cu 
JOIN address ad ON cu.address_id = ad.address_id
JOIN city c ON ad.city_id = c.city_id
GROUP BY c.city,c.city_id;

-- 9. Lista los clientes junto con las películas que han rentado.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS name,  f.title FROM customer c
JOIN rental r ON c.customer_id= r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

-- 10. Muestra todas las películas y cuántas veces han sido rentadas. Incluye las que nunca se han rentado.
SELECT f.title,COUNT(r.rental_id)  AS total FROM rental r 
LEFT JOIN inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id,f.title;

-- 11. Muestra todos los actores junto con la cantidad de películas en las que han actuado. Si un actor no ha actuado en ninguna película, mostrar 0.

SELECT CONCAT(a.first_name,' ',a.last_name) AS name,COUNT(f.film_id)AS films FROM actor a
LEFT JOIN film_actor fa ON a.actor_id= fa.actor_id
LEFT JOIN film f ON fa.film_id= f.film_id
GROUP BY a.actor_id, a.first_name,a.last_name;

-- 12. Muestra todas las tiendas, incluso si no tienen empleados asignados, junto con la cantidad de empleados que trabajan en cada una.

SELECT s.store_id, COUNT(st.staff_id) AS total_staff FROM store s
LEFT JOIN staff st ON s.store_id = st.store_id
GROUP BY s.store_id;
