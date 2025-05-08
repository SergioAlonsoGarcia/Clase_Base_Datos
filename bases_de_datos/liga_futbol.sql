DROP SCHEMA IF EXISTS liga_futbol;

CREATE SCHEMA liga_futbol;

USE liga_futbol;

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    edad_minima INT NOT NULL,
    edad_maxima INT NOT NULL
);

CREATE TABLE arbitro (
    id_arbitro INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL
);

CREATE TABLE equipo (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    entrenador VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE jugador (
    id_jugador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    posicion VARCHAR(20) NOT NULL,
    id_equipo INT NOT NULL,
    FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo)
);


INSERT INTO categoria (nombre, edad_minima, edad_maxima) VALUES
('Sub-10', 6, 10),
('Sub-12', 9, 12),
('Sub-16', 14, 16),
('Sub-18', 16, 18),
('Adultos', 18, 60), 
('Veteranos', 40, 60),
('Sub-8', 6, 8), 
('Sub-15', 13, 15);


INSERT INTO arbitro (nombre, apellido) VALUES
('Juan', 'Pérez'),
('Ana', 'López'),
('Carlos', 'González'),
('Pedro', 'Ramírez'),
('Claudia', 'Vázquez'),
('Marta', 'Sánchez'),
('Carlos', 'González'),
('Verónica', 'Díaz');


INSERT INTO equipo (nombre, entrenador, id_categoria) VALUES
('Leones FC', 'José Hernández', 1),
('Águilas Rojas', 'Carlos Rodríguez', 2),
('Cebras Negras', 'Claudia Vázquez', 4);

INSERT INTO jugador (nombre, apellido, telefono, direccion, posicion, id_equipo) VALUES
('Miguel', 'Álvarez', '5551234567', 'Calle 1', 'Delantero', 1),
('Carlos', 'Mendoza', '5552345678', 'Calle 2', 'Defensor', 1),
('Luis', 'Ramírez', '5553456789', 'Calle 3', 'Mediocampista', 1),
('Sofía', 'Sánchez', '5554567890', 'Calle 4', 'Portero', 2),  
('Juan', 'González', '5555678901', 'Calle 5', 'Delantero', 2); 
