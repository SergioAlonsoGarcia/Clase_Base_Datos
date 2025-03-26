drop schema if exists juego;

create schema juego;

use juego;

create table juego(
id_juego INT PRIMARY KEY auto_increment,
nombre VARCHAR (100) NOT NULL,
genero VARCHAR (100) NOT NULL,
plataforma VARCHAR (100) NOT NULL,
desarrollador VARCHAR (100) NOT NULL,
fecha_lanzamiento date NOT NULL
);

create table jugador(
id_jugador INT PRIMARY KEY auto_increment,
nombre_usuario VARCHAR (100) NOT NULL,
correo_electronico VARCHAR (100) NOT NULL,
pais VARCHAR (100) NOT NULL
);

create table proceso(
id_proceso INT PRIMARY KEY auto_increment,
nivel int NOT NULL,
puntaje int NOT NULL,
tiempo_jugado time NOT NULL,
id_jugador INT NOT NULL,
id_juego INT NOT NULL,
FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador),
FOREIGN KEY (id_juego) REFERENCES juego(id_juego)
);

INSERT INTO juego (nombre, genero, plataforma, desarrollador, fecha_lanzamiento) VALUES
('Cyberpunk 2077', 'RPG', 'PC, PS4, PS5, Xbox One, Xbox Series X/S', 'CD Projekt Red', '2020-12-10'),
('Cyberpunk 2077', 'RPG', 'PC, PS4, PS5, Xbox One, Xbox Series X/S', 'CD Projekt Red', '2020-12-10'),
(NULL, 'Acción', 'PC, PS5', 'Desconocido', '2022-01-01'),
('Doom Eternal', 'FPS', NULL, 'id Software', '2020-03-20'),
('Animal Crossing: New Horizons', 'Simulación', 'Nintendo Switch', NULL, '2020-03-20'),
('Stardew Valley', NULL, 'PC, Consolas', 'ConcernedApe', '2016-02-26'),
('Juego Prueba', 'Indefinido', 'PC', 'Desconocido', NULL),
('Minecraft', 'Sandbox', 'PC, PS4, Xbox One, Switch', 'Mojang Studios', '2011-11-18'),
('Resident Evil Village', 'Survival Horror', 'PC, PS5, Xbox Series X/S', 'Capcom', '2021-05-07'),
('The Legend of Zelda: Breath of the Wild', 'Aventura', 'Nintendo Switch', 'Nintendo', '2017-03-03');

INSERT INTO jugador (nombre_usuario, correo_electronico, pais) VALUES
('Carlos123', 'carlos123@email.com', 'México'),
('Carlos123', 'carlos123@email.com', 'México'),
(NULL, 'usuariox@email.com', 'España'),
('Anónimo', NULL, 'Argentina'),
('LuisPlayer', 'luisplayer@email.com', NULL),
('TestUser', 'test@email.com', 'PaísDesconocido'),
('MartaGame', 'marta@email.com', 'Perú'),
('MartaGame', 'marta@email.com', 'Perú'),
('Sofia_97', 'sofia97@email.com', 'Chile'),
('LuciaGamers', 'luciagamers@email.com', 'España');

INSERT INTO proceso (nivel, puntaje, tiempo_jugado, id_jugador, id_juego) VALUES
(10, 1500, '02:15:30', 1, 1),
(10, 1500, '02:15:30', 1, 1),
(NULL, 800, '01:10:00', 2, 2),
(5, NULL, '01:10:00', 3, 3),
(20, 3500, NULL, 4, 4),
(15, 2200, '02:00:00', NULL, 5),
(30, 5000, '04:30:00', 6, NULL),
(40, 999999, '99:99:99', 7, 7),
(-5, 4000, '03:20:00', 8, 8),
(18, -2800, '02:40:00', 9, 9),
(100, 9999, '00:00:00', 10, 10);

SELECT DISTINCT nombre FROM juego;
SELECT DISTINCT pais FROM jugador;
SELECT DISTINCT nivel FROM proceso;

SELECT * FROM juego LIMIT 3;
SELECT * FROM jugador LIMIT 3;
SELECT * FROM proceso LIMIT 3;

SELECT * FROM juego ORDER BY fecha_lanzamiento ASC;
SELECT * FROM jugador ORDER BY nombre_usuario DESC;
SELECT * FROM proceso ORDER BY puntaje ASC;

SELECT * FROM juego WHERE fecha_lanzamiento > '2020-01-01';
SELECT * FROM jugador WHERE id_jugador < 5;
SELECT * FROM proceso WHERE puntaje >= 2000;

SELECT * FROM juego WHERE nombre LIKE 'C%';
SELECT * FROM jugador WHERE nombre_usuario LIKE '%a%';
SELECT * FROM proceso WHERE tiempo_jugado LIKE '02:%';

SELECT * FROM proceso WHERE nivel BETWEEN 10 AND 30;
SELECT * FROM juego WHERE fecha_lanzamiento BETWEEN '2015-01-01' AND '2022-12-31';
SELECT * FROM proceso WHERE puntaje BETWEEN 1000 AND 5000;

SELECT * FROM jugador WHERE pais = 'México' AND nombre_usuario = 'Carlos123';
SELECT * FROM juego WHERE genero = 'RPG' AND plataforma LIKE '%PC%';
SELECT * FROM proceso WHERE nivel > 10 AND puntaje > 2000;

SELECT * FROM jugador WHERE pais = 'Chile' OR pais = 'España';
SELECT * FROM juego WHERE genero = 'FPS' OR genero = 'Aventura';
SELECT * FROM proceso WHERE nivel = 5 OR puntaje = 1500;

SELECT * FROM jugador WHERE NOT pais = 'México';
SELECT * FROM juego WHERE NOT plataforma = 'PC';
SELECT * FROM proceso WHERE NOT nivel = 10;

SELECT * FROM juego WHERE genero IN ('RPG', 'FPS', 'Aventura');
SELECT * FROM jugador WHERE pais IN ('Argentina', 'España', 'México');
SELECT * FROM proceso WHERE nivel IN (10, 20, 30);

SELECT id_jugador, puntaje + 100 AS "Puntaje Mejorado" FROM proceso;
SELECT id_juego, nivel * 2 AS "Doble Nivel" FROM proceso;
SELECT id_jugador, puntaje - 500 AS "Puntaje Ajustado" FROM proceso;

SELECT MIN(fecha_lanzamiento) FROM juego;
SELECT MIN(nivel) FROM proceso;
SELECT MIN(puntaje) FROM proceso;

SELECT MAX(fecha_lanzamiento) FROM juego;
SELECT MAX(nivel) FROM proceso;
SELECT MAX(puntaje) FROM proceso;

SELECT COUNT(*) FROM juego;
SELECT COUNT(*) FROM jugador;
SELECT COUNT(*) FROM proceso;

SELECT SUM(nivel) FROM proceso;
SELECT SUM(puntaje) FROM proceso;
SELECT SUM(id_juego) FROM proceso;

SELECT AVG(nivel) FROM proceso;
SELECT AVG(puntaje) FROM proceso;
SELECT AVG(id_juego) FROM proceso;

SELECT CONCAT(nombre_usuario, ' - ', pais) AS "Usuario y País" FROM jugador;
SELECT CONCAT(nombre, ' - ', plataforma) AS "Juego y Plataforma" FROM juego;
SELECT CONCAT(nivel, ' | ', puntaje) AS "Nivel y Puntaje" FROM proceso;

SELECT UPPER(nombre) FROM juego;
SELECT UPPER(nombre_usuario) FROM jugador;
SELECT UPPER(genero) FROM juego;

SELECT LOWER(nombre) FROM juego;
SELECT LOWER(nombre_usuario) FROM jugador;
SELECT LOWER(genero) FROM juego;

SELECT * FROM juego LIMIT 3 OFFSET 2;
SELECT * FROM jugador LIMIT 3 OFFSET 2;
SELECT * FROM proceso LIMIT 3 OFFSET 2;

SELECT genero, COUNT(*) FROM juego GROUP BY genero;
SELECT pais, COUNT(*) FROM jugador GROUP BY pais;
SELECT nivel, COUNT(*) FROM proceso GROUP BY nivel;

SELECT genero, COUNT(*) FROM juego GROUP BY genero HAVING COUNT(*) > 1;
SELECT pais, COUNT(*) FROM jugador GROUP BY pais HAVING COUNT(*) > 1;
SELECT nivel, COUNT(*) FROM proceso GROUP BY nivel HAVING COUNT(*) > 1;

SELECT nombre, 
    CASE 
        WHEN fecha_lanzamiento > '2020-01-01' THEN 'Juego Moderno'
        ELSE 'Juego Clásico'
    END AS "Categoría"
FROM juego;

SELECT nombre_usuario, 
    CASE 
        WHEN pais = 'México' THEN 'Latinoamérica'
        WHEN pais = 'España' THEN 'Europa'
        ELSE 'Otro'
    END AS "Región"
FROM jugador;

SELECT nivel, 
    CASE 
        WHEN nivel < 10 THEN 'Básico'
        WHEN nivel BETWEEN 10 AND 30 THEN 'Intermedio'
        ELSE 'Avanzado'
    END AS "Dificultad"
FROM proceso;

SELECT nombre, IFNULL(plataforma, 'No disponible') AS "Plataforma" FROM juego;
SELECT nombre_usuario, IFNULL(correo_electronico, 'Correo no registrado') AS "Correo" FROM jugador;
SELECT nivel, IFNULL(puntaje, 'Sin puntaje') AS "Puntaje" FROM proceso;


