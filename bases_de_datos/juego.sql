DROP SCHEMA IF EXISTS juego;
CREATE SCHEMA juego;
USE juego;

CREATE TABLE juego (
    id_juego INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    plataforma VARCHAR(100) NOT NULL,
    desarrollador VARCHAR(100) NOT NULL,
    fecha_lanzamiento DATE NOT NULL
);

CREATE TABLE jugador (
    id_jugador INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
);

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

INSERT INTO juego (nombre, genero, plataforma, desarrollador, fecha_lanzamiento) VALUES
('Cyberpunk 2077', 'RPG', 'PC, PS4, PS5, Xbox One, Xbox Series X/S', 'CD Projekt Red', '2020-12-10'),
('Doom Eternal', 'FPS', 'PC, PS4, Xbox One', 'id Software', '2020-03-20'),
('Animal Crossing: New Horizons', 'Simulación', 'Nintendo Switch', 'Nintendo', '2020-03-20'),
('Stardew Valley', 'Simulación', 'PC, Consolas', 'ConcernedApe', '2016-02-26'),
('Juego Prueba', 'Indefinido', 'PC', 'Desconocido', '2022-01-01'),
('Minecraft', 'Sandbox', 'PC, PS4, Xbox One, Switch', 'Mojang Studios', '2011-11-18'),
('Resident Evil Village', 'Survival Horror', 'PC, PS5, Xbox Series X/S', 'Capcom', '2021-05-07'),
('The Legend of Zelda: Breath of the Wild', 'Aventura', 'Nintendo Switch', 'Nintendo', '2017-03-03'),
('Hades', 'Acción', 'PC, PS4, Switch', 'Supergiant Games', '2020-09-17'),
('The Witcher 3: Wild Hunt', 'RPG', 'PC, PS4, Xbox One, Switch', 'CD Projekt Red', '2015-05-19'),
('Half-Life: Alyx', 'FPS', 'PC VR', 'Valve', '2020-03-23'),
('Red Dead Redemption 2', 'Acción', 'PC, PS4, Xbox One', 'Rockstar Games', '2018-10-26'),
('Overwatch', 'Shooter', 'PC, PS4, Xbox One, Switch', 'Blizzard Entertainment', '2016-05-24'),
('Final Fantasy VII Remake', 'RPG', 'PS4', 'Square Enix', '2020-04-10');

INSERT INTO jugador (nombre_usuario, correo_electronico, pais) VALUES
('PlayerOne', 'one@example.com', 'Estados Unidos'),
('GamerGirl', 'gamer_girl@example.com', 'Colombia'),
('JuanitoXD', 'juanito@example.com', 'México'),
('Nico_arg', 'nico@example.com', 'Argentina'),
('ZeldaFan', 'zelda@example.com', 'Japón'),
('GGWP99', 'ggwp99@example.com', 'Alemania'),
('LuigiMain', 'luigi@example.com', 'Italia'),
('Sasuke77', 'sasuke77@example.com', 'Brasil'),
('MariChan', 'mari@example.com', 'Japón'),
('ChilangoPro', 'chilango@example.com', 'México');

INSERT INTO proceso (nivel, puntaje, tiempo_jugado, id_jugador, id_juego) VALUES
(25, 4200, '03:10:00', 8, 8),
(12, 1300, '01:45:00', 9, 9),
(35, 8000, '05:00:00', 10, 10),
(50, 10500, '06:30:00', 1, 11),
(8, 600, '00:50:00', 2, 12),     
(22, 3600, '02:20:00', 3, 13),  
(60, 12000, '07:10:00', 4, 14),
(10, 1000, '01:00:00', 5, 1),
(45, 7000, '05:15:00', 6, 2),
(28, 5100, '03:50:00', 7, 3),
(33, 6300, '04:25:00', 8, 4),
(38, 7200, '04:45:00', 9, 5),
(14, 1900, '01:30:00', 10, 6);
