SET SQL_SAFE_UPDATES = 0;

/*
1. Actualizar last_update de customer cuando se actualice su dirección
Crea un trigger que actualice el campo last_update de la tabla customer cuando se modifique su address_id.
*/
USE sakila;

DROP TRIGGER IF EXISTS actualizar_las_update;

DELIMITER $$

CREATE TRIGGER actualizar_las_update
BEFORE UPDATE ON customer
FOR EACH ROW 
BEGIN 
	IF OLD.address_id != NEW.address_id THEN
		SET NEW.last_update = NOW();
    END IF;
END$$

DELIMITER ;

SELECT * FROM customer WHERE customer_id = 1;
UPDATE customer SET address_id = 1;



	/*
	2. Actualizar last_update de rental al insertar un payment
	Cuando se inserte un pago, actualiza el campo last_update del rental asociado.
	*/

DROP TRIGGER IF EXISTS last_update_rental;

DELIMITER $$
CREATE TRIGGER last_update_rental
AFTER INSERT ON payment
FOR EACH ROW 
BEGIN 
	UPDATE rental
    SET last_update = NOW()
    WHERE rental_id = NEW.rental_id;

END$$

DELIMITER ;


SELECT * FROM rental WHERE rental_id = 1;
INSERT INTO payment (customer_id,staff_id,rental_id,amount,payment_date,last_update)
VALUES (1,1,1,5.99,DATE_ADD(NOW(),INTERVAL 3 DAY),NOW());


/*
3. Actualizar last_update de la tabla inventory al actualizar film_id
Cuando se actualice el film_id de un inventario, actualiza su campo last_update.
*/

DROP TRIGGER IF EXISTS actualizar_last_update_inventory;

DELIMITER $$
CREATE TRIGGER actualizar_last_update_inventory
BEFORE UPDATE ON inventory
FOR EACH ROW 
BEGIN 
	IF OLD.film_id != NEW.film_id THEN
		SET NEW.last_update = NOW();
	END IF;
END$$
DELIMITER ;

SELECT * FROM inventory WHERE inventory_id = 15;
UPDATE inventory SET film_id = 1 WHERE inventory_id = 15;


/*
4. Actualizar last_update de la tabla staff cuando se modifique su nombre
Cuando se actualice el first_name o last_name de un empleado (staff), también debe actualizarse el campo last_update. 
*/

DROP TRIGGER IF EXISTS nombre_staff;

DELIMITER $$
CREATE TRIGGER nombre_staff
BEFORE UPDATE ON staff
FOR EACH ROW
BEGIN 
	IF OLD.first_name != NEW.first_name OR OLD.last_name != OLD.last_name THEN
		SET NEW.last_update = NOW();
    END IF;
END$$

DELIMITER ;

SELECT * FROM staff WHERE staff_id = 1;
UPDATE staff SET first_name = 'Sergio' WHERE staff_id = 1;


/*
TABAS PROPIAS

*/

-- Control de stock con historial automático
USE departamento;
DROP TRIGGER IF EXISTS historial_existencia;

DELIMITER $$
CREATE TRIGGER historial_existencia
AFTER UPDATE ON articulo
FOR EACH ROW 
BEGIN 
	INSERT INTO historial_existencia (id_articulo,cantidad_anterior,cantidad_nueva)
    VALUES(OLD.id_articulo,OLD.existencia,NEW.existencia);
END $$

DELIMITER ;

SELECT * FROM articulo WHERE id_articulo = 1;
UPDATE articulo SET existencia = 8 WHERE id_articulo = 1;

/*
Cada vez que se inserte un nuevo estudiante en la tabla estudiante, 
quieres registrar automáticamente en una nueva tabla llamada log_estudiantes
 el nombre completo del estudiante, la fecha de inserción y el grupo al que fue asignado.
*/
USE escuela;
DROP TRIGGER IF EXISTS datos_estudiante;

DELIMITER $$
CREATE TRIGGER datos_estudiante
AFTER INSERT ON estudiante
FOR EACH ROW
BEGIN
	INSERT INTO log_estudiantes(id_estudiante,nombre,apellido,fecha_inscripcion,grupo)
    VALUES (NEW.id_estudiante,NEW.nombre,NEW.apellido,NOW(),'Historia');

END$$
DELIMITER ;

INSERT INTO estudiante(id_estudiante,nombre,apellido,fecha_nacimiento,direccion,telefono,grado,id_grupo)
VALUES(287,'sergio','garcia','2008-01-22','aqui en mi casa',1234567,3,1);
SELECT * FROM log_estudiantes;

/*

*/
USE juego;

DROP TRIGGER IF EXISTS asignar_juego_aleatorio;
DELIMITER $$

CREATE TRIGGER asignar_juego_aleatorio
BEFORE INSERT ON proceso
FOR EACH ROW
BEGIN
    DECLARE juego_aleatorio INT;

    SELECT id_juego 
    INTO juego_aleatorio
    FROM juego
    ORDER BY RAND()
    LIMIT 1;

    SET NEW.id_juego = juego_aleatorio;
END$$

INSERT INTO proceso (nivel, puntaje, tiempo_jugado, id_jugador) VALUES (5, 1500, '01:30:00', 3);
SELECT * FROM proceso ORDER BY id_proceso DESC LIMIT 1;



/*
Crea un trigger que convierta automáticamente 
el nombre del jugador en mayúsculas antes de insertarlo en la tabla jugador.
*/
DROP TRIGGER IF EXISTS mayusculas_nombre_jugador;

DELIMITER $$

CREATE TRIGGER mayusculas_nombre_jugador
BEFORE INSERT ON jugador
FOR EACH ROW
BEGIN
    SET NEW.nombre = UPPER(NEW.nombre);
END$$

DELIMITER ;


INSERT INTO jugador (nombre, apellido, telefono, direccion, posicion, id_equipo)
VALUES ('pedrito', 'Gómez', '5551231234', 'Calle 8', 'Delantero', 1);

SELECT nombre FROM jugador WHERE apellido = 'Gómez';


