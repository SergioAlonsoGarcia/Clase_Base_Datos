DROP SCHEMA IF EXISTS juego;
CREATE SCHEMA juego;
USE juego;

-- Tabla: juego
CREATE TABLE juego (
    id_juego INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    plataforma VARCHAR(100) NOT NULL,
    desarrollador VARCHAR(100) NOT NULL,
    fecha_lanzamiento DATE NOT NULL
);

-- Tabla: jugador
CREATE TABLE jugador (
    id_jugador INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
);

-- Tabla: proceso
CREATE TABLE proceso (
    id_proceso INT PRIMARY KEY AUTO_INCREMENT,
    nivel INT NOT NULL CHECK (nivel >= 0),
    puntaje INT NOT NULL CHECK (puntaje >= 0),
    tiempo_jugado TIME NOT NULL,
    id_jugador INT NOT NULL,
    id_juego INT NOT NULL,
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY (id_juego) REFERENCES juego(id_juego)
);

-- Datos para juego (sin duplicados ni NULLs en campos obligatorios)
INSERT INTO juego (nombre, genero, plataforma, desarrollador, fecha_lanzamiento) VALUES
('Cyberpunk 2077', 'RPG', 'PC, PS4, PS5, Xbox One, Xbox Series X/S', 'CD Projekt Red', '2020-12-10'),
('Doom Eternal', 'FPS', 'PC, PS4, Xbox One', 'id Software', '2020-03-20'),
('Animal Crossing: New Horizons', 'Simulación', 'Nintendo Switch', 'Nintendo', '2020-03-20'),
('Stardew Valley', 'Simulación', 'PC, Consolas', 'ConcernedApe', '2016-02-26'),
('Juego Prueba', 'Indefinido', 'PC', 'Desconocido', '2022-01-01'),
('Minecraft', 'Sandbox', 'PC, PS4, Xbox One, Switch', 'Mojang Studios', '2011-11-18'),
('Resident Evil Village', 'Survival Horror', 'PC, PS5, Xbox Series X/S', 'Capcom', '2021-05-07'),
('The Legend of Zelda: Breath of the Wild', 'Aventura', 'Nintendo Switch', 'Nintendo', '2017-03-03');

-- Datos para jugador (sin duplicados ni NULLs en campos obligatorios)
INSERT INTO jugador (nombre_usuario, correo_electronico, pais) VALUES
('Carlos123', 'carlos123@email.com', 'México'),
('Anónimo', 'anonimo@email.com', 'Argentina'),
('Alanguauguau', 'Alanguauguau@email.com', 'Chile'),
('TestUser', 'test@email.com', 'PaísDesconocido'),
('MartaGame', 'marta@email.com', 'Perú'),
('Sofia_97', 'sofia97@email.com', 'Chile'),
('LuciaGamers', 'luciagamers@email.com', 'España');

-- Datos para proceso (valores válidos, sin duplicados ni referencias nulas)
INSERT INTO proceso (nivel, puntaje, tiempo_jugado, id_jugador, id_juego) VALUES
(10, 1500, '02:15:30', 1, 1),
(5, 800, '01:10:00', 2, 2),
(20, 3500, '01:30:00', 3, 3),
(15, 2200, '02:00:00', 4, 4),
(30, 5000, '04:30:00', 5, 5),
(40, 9999, '04:00:00', 6, 6),
(18, 2800, '02:40:00', 7, 7);
