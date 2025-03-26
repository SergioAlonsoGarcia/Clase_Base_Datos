drop schema if exists liga_futbol;

create schema liga_futbol;

use liga_futbol;

create table categoria(
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (20) NOT NULL,
edad_minima INT NOT NULL,
edad_maxima INT NOT NULL
);


CREATE TABLE arbitro(
id_arbitro INT PRIMARY KEY auto_increment,
nombre VARCHAR (50) NOT NULL,
apellido VARCHAR (50) NOT NULL
);

CREATE TABLE equipo(
id_equipo INT PRIMARY KEY auto_increment,
nombre VARCHAR (100) NOT NULL,
entranador VARCHAR (100) NOT NULL,
id_categoria INT NOT NULL,
foreign key (id_categoria) references categoria(id_categoria)
);


create table jugador(
id_jugador INT PRIMARY KEY AUTO_INCREMENT,
nombre varchar(100) NOT NULL,
apellido VARCHAR (100) NOT NULL,
telefono VARCHAR (10) NOT NULL,
direccion VARCHAR (50) NOT NULL,
posicion  VARCHAR (20) NOT NULL,
id_equipo INT NOT NULL,
foreign key (id_equipo) references equipo(id_equipo)
);

INSERT INTO categoria (nombre, edad_minima, edad_maxima) VALUES
('Sub-10', 6, 10),
('Sub-12', 9, 12),
('Sub-12', 9, 12),
(NULL, 8, 11),
('Sub-16', 14, 16),
('Sub-18', 16, 18),
('Adultos', 18, NULL),
('Veteranos', 40, 60),
('Sub-8', NULL, 8),
('Sub-15', 13, 15);

INSERT INTO arbitro (nombre, apellido) VALUES
('Juan', 'Pérez'),
('Ana', 'López'),
('Carlos', 'González'),
(NULL, 'Martínez'),
('Pedro', 'Ramírez'),
('Claudia', 'Vázquez'),
('Ricardo', NULL),
('Marta', 'Sánchez'),
('Carlos', 'González'),
('Verónica', 'Díaz');

INSERT INTO equipo (nombre, entranador, id_categoria) VALUES
('Leones FC', 'José Hernández', 1),
('Águilas Rojas', 'Carlos Rodríguez', 2),
('Águilas Rojas', 'Carlos Rodríguez', 2),
(NULL, 'Pedro Ramírez', 4),
('Cebras Negras', 'Claudia Vázquez', NULL);

INSERT INTO jugador (nombre, apellido, telefono, direccion, posicion, id_equipo) VALUES
('Miguel', 'Álvarez', '5551234567', 'Calle 1', 'Delantero', 1),
('Carlos', 'Mendoza', '5552345678', 'Calle 2', 'Defensor', 1),
('Luis', 'Ramírez', NULL, 'Calle 3', 'Mediocampista', 1),
(NULL, 'Sánchez', '5554567890', 'Calle 4', 'Portero', 2),
('Juan', 'González', '5555678901', NULL, 'Delantero', 2);


SELECT DISTINCT nombre FROM categoria;
SELECT DISTINCT apellido FROM arbitro;
SELECT DISTINCT posicion FROM jugador;

SELECT * FROM categoria LIMIT 3;
SELECT * FROM arbitro LIMIT 3;
SELECT * FROM equipo LIMIT 3;

SELECT * FROM categoria ORDER BY edad_minima ASC;
SELECT * FROM equipo ORDER BY nombre DESC;
SELECT * FROM jugador ORDER BY posicion ASC;

SELECT * FROM categoria WHERE edad_maxima > 15;
SELECT * FROM equipo WHERE id_categoria < 3;
SELECT * FROM jugador WHERE id_equipo >= 2;

SELECT * FROM arbitro WHERE nombre LIKE 'C%';
SELECT * FROM equipo WHERE nombre LIKE '%FC';
SELECT * FROM jugador WHERE direccion LIKE 'Calle%';

SELECT * FROM categoria WHERE edad_minima BETWEEN 10 AND 18;
SELECT * FROM equipo WHERE id_categoria BETWEEN 1 AND 3;
SELECT * FROM jugador WHERE id_equipo BETWEEN 1 AND 2;

SELECT * FROM equipo WHERE nombre = 'Leones FC' AND id_categoria = 1;
SELECT * FROM jugador WHERE posicion = 'Delantero' AND id_equipo = 1;
SELECT * FROM categoria WHERE edad_minima >= 10 AND edad_maxima <= 18;

SELECT * FROM equipo WHERE nombre = 'Águilas Rojas' OR nombre = 'Leones FC';
SELECT * FROM jugador WHERE posicion = 'Mediocampista' OR posicion = 'Defensor';
SELECT * FROM categoria WHERE edad_minima = 8 OR edad_maxima = 16;

SELECT * FROM equipo WHERE NOT nombre = 'Leones FC';
SELECT * FROM jugador WHERE NOT posicion = 'Portero';
SELECT * FROM categoria WHERE NOT edad_minima = 10;

SELECT * FROM equipo WHERE nombre IN ('Leones FC', 'Águilas Rojas');
SELECT * FROM jugador WHERE posicion IN ('Delantero', 'Defensor', 'Mediocampista');
SELECT * FROM categoria WHERE edad_minima IN (8, 10, 12);

SELECT id_categoria, edad_maxima - edad_minima AS "Rango de Edad" FROM categoria;
SELECT id_equipo, id_categoria * 2 AS "Categoría x2" FROM equipo;
SELECT id_jugador, id_equipo + 5 AS "ID Ajustado" FROM jugador;

SELECT MIN(edad_minima) FROM categoria;
SELECT MIN(id_equipo) FROM equipo;
SELECT MIN(id_jugador) FROM jugador;

SELECT MAX(edad_maxima) FROM categoria;
SELECT MAX(id_equipo) FROM equipo;
SELECT MAX(id_jugador) FROM jugador;

SELECT COUNT(*) FROM categoria;
SELECT COUNT(*) FROM arbitro;
SELECT COUNT(*) FROM equipo;

SELECT SUM(edad_minima) FROM categoria;
SELECT SUM(id_categoria) FROM equipo;
SELECT SUM(id_equipo) FROM jugador;

SELECT AVG(edad_minima) FROM categoria;
SELECT AVG(id_categoria) FROM equipo;
SELECT AVG(id_equipo) FROM jugador;

SELECT CONCAT(nombre, ' - ', edad_minima) AS "Categoría y Edad" FROM categoria;
SELECT CONCAT(nombre, ' - ', apellido) AS "Nombre Completo" FROM arbitro;
SELECT CONCAT(nombre, ' | ', posicion) AS "Jugador y Posición" FROM jugador;

SELECT UPPER(nombre) FROM categoria;
SELECT UPPER(nombre) FROM equipo;
SELECT UPPER(posicion) FROM jugador;

SELECT LOWER(nombre) FROM categoria;
SELECT LOWER(nombre) FROM equipo;
SELECT LOWER(posicion) FROM jugador;

SELECT * FROM categoria LIMIT 3 OFFSET 2;
SELECT * FROM equipo LIMIT 3 OFFSET 2;
SELECT * FROM jugador LIMIT 3 OFFSET 2;

SELECT edad_minima, COUNT(*) FROM categoria GROUP BY edad_minima;
SELECT posicion, COUNT(*) FROM jugador GROUP BY posicion;
SELECT id_categoria, COUNT(*) FROM equipo GROUP BY id_categoria;

SELECT edad_minima, COUNT(*) FROM categoria GROUP BY edad_minima HAVING COUNT(*) > 1;
SELECT posicion, COUNT(*) FROM jugador GROUP BY posicion HAVING COUNT(*) > 1;
SELECT id_categoria, COUNT(*) FROM equipo GROUP BY id_categoria HAVING COUNT(*) > 1;

SELECT nombre, 
    CASE 
        WHEN edad_maxima > 18 THEN 'Categoría Mayor'
        ELSE 'Categoría Juvenil'
    END AS "Clasificación"
FROM categoria;

SELECT nombre, 
    CASE 
        WHEN id_categoria = 1 THEN 'Categoría Infantil'
        WHEN id_categoria = 2 THEN 'Categoría Intermedia'
        ELSE 'Categoría Avanzada'
    END AS "Tipo de Equipo"
FROM equipo;

SELECT posicion, 
    CASE 
        WHEN posicion = 'Delantero' THEN 'Ataque'
        WHEN posicion = 'Defensor' THEN 'Defensa'
        ELSE 'Medio'
    END AS "Rol"
FROM jugador;

SELECT nombre, IFNULL(edad_maxima, 'No definida') AS "Edad Máxima" FROM categoria;
SELECT nombre, IFNULL(entranador, 'Entrenador no asignado') AS "Entrenador" FROM equipo;
SELECT nombre, IFNULL(telefono, 'Teléfono no registrado') AS "Teléfono" FROM jugador;
