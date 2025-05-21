-- Crea un procedimiento que reciba el customer_id y 
-- devuelva el nombre completo (first_name + last_name) como salida.
USE sakila;

DROP PROCEDURE IF EXISTS nombre_cliente;

DELIMITER $$
CREATE PROCEDURE nombre_cliente (
	IN id_customer INT,
    OUT nombre_cliente VARCHAR(100)
)
BEGIN
	SELECT CONCAT(first_name,' ',last_name)
	INTO nombre_cliente
    FROM customer
    WHERE id_customer = customer_id;
END $$

DELIMITER ;
    
CALL nombre_cliente (5,@nombre);

SELECT @nombre;





-- Crear un procedimiento que reciba el nombre de una categoría 
-- (por ejemplo, 'Action') y devuelva cuántas películas hay en esa categoría.
USE sakila;

DROP PROCEDURE IF EXISTS peliculas_categoria;

DELIMITER $$
CREATE PROCEDURE peliculas_categoria(
	IN categoria VARCHAR (100),
    OUT peliculas INT
    )
BEGIN 
	SELECT COUNT(f.film_id) 
    INTO peliculas 
    FROM film f
    JOIN film_category fc ON  f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    WHERE categoria = c.name
	GROUP BY fc.category_id;
END $$

DELIMITER ;

CALL peliculas_categoria ('action',@total);
SELECT @total;


-- Crea un procedimiento que reciba un customer_id y devuelva 1 si existe, o 0 si no.
USE sakila;

DROP PROCEDURE IF EXISTS cliente_existente;

DELIMITER $$
CREATE PROCEDURE cliente_existente(
	IN customer_id INT,
    OUT existente INT
)

BEGIN
	SELECT EXISTS (
    SELECT 1
    FROM customer c
    WHERE c.customer_id = customer_id
    ) INTO existente;
    
END $$

DELIMITER ;

CALL cliente_existente(938,@existe);
SELECT @existe;


-- Crear un procedimiento que reciba un número (min_duracion) 
-- y muestre todas las películas que duran más que ese valor.
USE sakila;

DROP PROCEDURE IF EXISTS duran_mas_que_valor;

DELIMITER $$
CREATE PROCEDURE duran_mas_que_valor(
	IN valor_minimo INT
)

BEGIN
	SELECT title
    FROM film 
	WHERE length > valor_minimo;
END $$

DELIMITER ;

CALL  duran_mas_que_valor(50);


-- Crea un procedimiento que reciba el customer_id 
-- y devuelva una lista de títulos de películas que ha rentado.
USE sakila;

DROP PROCEDURE IF EXISTS peliculas_rentadas_cliente;

DELIMITER $$
CREATE PROCEDURE peliculas_rentadas_cliente(
	IN id_cliente INT
)
BEGIN
    SELECT f.title 
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN customer c ON r.customer_id = c.customer_id
    WHERE c.customer_id = id_cliente;
END $$

DELIMITER ;

CALL peliculas_rentadas_cliente (5);


	-- Crear un procedimiento que reciba el store_id 
	-- y devuelva el total de dinero generado por esa tienda.
	USE sakila;

	DROP PROCEDURE IF EXISTS dinero_en_la_tienda;

	DELIMITER $$
	CREATE PROCEDURE dinero_en_la_tienda(
		IN id_tienda INT,
		OUT dinero DOUBLE
	)

	BEGIN 
		SELECT SUM(p.amount) 
        INTO dinero
		FROM payment p
		JOIN staff sf ON p.staff_id = sf.staff_id
		JOIN store st ON sf.store_id = st.store_id
		WHERE id_tienda = st.store_id;
	END$$

	DELIMITER ;

CALL dinero_en_la_tienda (1,@dinero);
SELECT @dinero;


-- Crear un procedimiento que reciba el film_id y 
-- devuelva el número de copias disponibles en la tabla inventory.
USE sakila;

DROP PROCEDURE IF EXISTS copias_peliculas;

DELIMITER $$

CREATE PROCEDURE copias_peliculas(
	IN id_pelicula INT,
    OUT cantidad INT
)
BEGIN 
	SELECT COUNT(f.film_id)
    INTO cantidad
    FROM film f
    JOIN inventory i ON f.film_id = i.inventory_id
    WHERE id_pelicula = f.film_id;
    
END $$


DELIMITER ;

CALL copias_peliculas(44,@cantidad);
SELECT @cantidad;


-- Crear un procedimiento que reciba el film_id y muestre una 
-- lista con los nombres de los actores que participan en esa película.
USE sakila;

DROP PROCEDURE IF EXISTS actores_pelicula;

DELIMITER $$

CREATE PROCEDURE actores_pelicula(
	IN id_pelicula INT
)

BEGIN
	SELECT CONCAT(a.first_name,' ',a.last_name) AS name
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    JOIN film f ON fa.film_id = f.film_id
    WHERE id_pelicula = f.film_id;

END$$

DELIMITER ;

CALL actores_pelicula(1);


-- Recibir el customer_id y devolver el correo electrónico del cliente.
USE sakila;

DROP PROCEDURE IF EXISTS correo_cliente;

DELIMITER $$
CREATE PROCEDURE correo_cliente(
	IN id_customer INT
)
BEGIN
	SELECT email
    FROM customer
    WHERE id_customer = customer_id;
 
END$$


DELIMITER ;

CALL correo_cliente(1);


-- Recibir el nombre de una ciudad y devolver cuántos clientes viven ahí.
USE sakila;

DROP PROCEDURE IF EXISTS clientes_ciudad;

DELIMITER $$
CREATE PROCEDURE clientes_ciudad(
	IN ciudad VARCHAR (100),
    OUT cantidad_clientes INT
)
BEGIN
	SELECT COUNT(c.customer_id)
    INTO cantidad_clientes
    FROM customer c
    JOIN address ad ON c.address_id = ad.address_id
    JOIN city ct ON ad.city_id = ct.city_id
    WHERE ct.city = ciudad
    GROUP BY ct.city;

END $$

DELIMITER ;

CALL clientes_ciudad('abha',@cantidad);
SELECT @cantidad;



-- Recibir la clasificación (rating, como 'PG' o 'R') y 
-- mostrar las películas con esa clasificación.
USE sakila;

DROP PROCEDURE IF EXISTS peliculas_clasificacion;

DELIMITER $$

CREATE PROCEDURE peliculas_clasificacion(
	IN clasificacion VARCHAR(10),
    OUT cantidad INT
)
BEGIN
	SELECT COUNT(film_id)
    INTO cantidad 
    FROM film
    WHERE rating = clasificacion;    
END$$

DELIMITER ;

CALL peliculas_clasificacion('PG',@cantidad);
SELECT @cantidad;


-- Recibir el estado (activo o inactivo) y mostrar la lista de clientes.
USE sakila;

DROP PROCEDURE IF EXISTS clientes_activos;

DELIMITER $$
CREATE PROCEDURE clientes_activos(
	IN estado INT
)
BEGIN
	SELECT CONCAT(first_name,' ',last_name) AS name
    FROM customer
    WHERE active = estado;

END$$

DELIMITER ;

CALL clientes_activos(1);


-- Recibir un número y mostrar las películas con duración menor a ese valor.
USE sakila;

DROP PROCEDURE IF EXISTS duracion_menor;

DELIMITER $$

CREATE PROCEDURE duracion_menor(
	IN duracion INT
)
BEGIN 
	SELECT title 
    FROM film
    WHERE length < duracion;
END$$


DELIMITER ;

CALL duracion_menor (80);

-- Recibir una fecha y listar los clientes registrados después de esa fecha.
USE sakila;

DROP PROCEDURE IF EXISTS fecha_despues_creacion;

DELIMITER $$
CREATE PROCEDURE fecha_despues_creacion(
	IN fecha DATE
)

BEGIN 
	SELECT CONCAT(first_name,' ',last_name) AS name
    FROM customer 
    WHERE create_date > fecha;

END$$
DELIMITER ;

CALL fecha_despues_creacion('2006-02-14 22:04:36');


-- Recibir un store_id y mostrar todas las películas disponibles en esa tienda.
USE sakila;

DROP PROCEDURE IF EXISTS peliculas_disponibles;

DELIMITER $$

CREATE PROCEDURE peliculas_disponibles(
    IN tienda_id INT
)
BEGIN
    SELECT DISTINCT f.title
    FROM inventory i
    JOIN film f ON i.film_id = f.film_id
    LEFT JOIN rental r ON i.inventory_id = r.inventory_id AND r.return_date IS NULL
    WHERE i.store_id = tienda_id AND r.rental_id IS NULL;
END $$

DELIMITER ;

CALL peliculas_disponibles(1);
















