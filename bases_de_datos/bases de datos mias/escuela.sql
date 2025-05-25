drop schema if exists escuela;

create schema escuela;
 use escuela;

create table grupo(
id_grupo INT PRIMARY KEY auto_increment,
grupo VARCHAR (30) NOT NULL,
salon INT NOT NULL
);

create table maestro(
id_maestro INT PRIMARY KEY auto_increment,
nombre VARCHAR (100) NOT NULL,
apellidos VARCHAR (100) NOT NULL,
telefono VARCHAR (10) NOT NULL,
direccion VARCHAR (100) NOT NULL
);

create table materia(
id_materia INT PRIMARY KEY,
nombre VARCHAR (50) NOT NULL,
descripcion text NOT NULL,
id_maestro INT,
foreign key (id_maestro) references maestro(id_maestro)
);

create table estudiante(
id_estudiante INT PRIMARY KEY auto_increment,
nombre VARCHAR (50) NOT NULL,
apellido varchar (100) NOT NULL,
fecha_nacimiento date NOT NULL,
direccion VARCHAR (100) NOT NULL,
telefono VARCHAR (10) NOT NULL,
grado INT NOT NULL,
id_grupo INT NOT NULL,
FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
);

INSERT INTO grupo (grupo, salon) VALUES
('Matemáticas', 101),
('Historia', 102),
('Ciencias', 103),
('Literatura', 104),
('Arte', 105),
('Física', 106),
('Química', 107),
('Geografía', 108),
('Deportes', 109),
('Inglés', 110);

INSERT INTO maestro (nombre, apellidos, telefono, direccion) VALUES
('Juan', 'Pérez Gómez', '5551234567', 'Calle Ficticia 123'),
('Ana', 'López Martínez', '5552345678', 'Calle Real 456'),
('Carlos', 'Hernández Pérez', '5553456789', 'Av. Principal 789'),
('María', 'González Ruiz', '5554567890', 'Calle del Sol 101'),
('Luis', 'Rodríguez Gómez', '5555678901', 'Calle 5 de Febrero 202'),
('Juan', 'Díaz Ramírez', '5556789012', 'Av. Juárez 303'),
('Pedro', 'Jiménez Sánchez', '5557890123', 'Calle 16 de Septiembre 404'),
('Claudia', 'Morales García', '5558901234', 'Calle Morelos 505'),
('Ricardo', 'Sánchez García', '5559012345', 'Calle Hidalgo 606'),
('Verónica', 'Vázquez López', '5550123456', 'Av. México 707');

INSERT INTO materia (id_materia, nombre, descripcion, id_maestro) VALUES
(1, 'Matemáticas', 'Curso básico de álgebra y cálculo', 1),
(2, 'Historia', 'Estudio de la historia mundial', 2),
(3, 'Ciencias', 'Estudio de la biología y la física', 3),
(4, 'Literatura', 'Estudio de la literatura clásica y moderna', 4),
(5, 'Arte', 'Estudio de técnicas de pintura y escultura', 5),
(6, 'Física', 'Estudio de los principios físicos', 6),
(7, 'Química', 'Estudio de los elementos y reacciones químicas', 7),
(8, 'Geografía', 'Estudio de la geografía física y humana', 8),
(9, 'Deportes', 'Entrenamiento y práctica de diversas disciplinas deportivas', 9),
(10, 'Inglés', 'Estudio de la lengua inglesa y su literatura', 10);


INSERT INTO estudiante (nombre, apellido, fecha_nacimiento, direccion, telefono, grado, id_grupo) VALUES
('Laura', 'Gómez Sánchez', '2004-05-12', 'Calle Las Palmas 1', '5551239876', 3, 1),
('José', 'Martínez Fernández', '2005-06-15', 'Calle del Sol 2', '5552348765', 2, 2),
('Pedro', 'Hernández Díaz', '2003-08-20', 'Calle Real 3', '5553457654', 4, 3),
('Marta', 'Ramírez Rodríguez', '2004-07-18', 'Av. México 4', '5554566543', 1, 4),
('Carlos', 'Sánchez Pérez', '2005-02-25', 'Calle Ficticia 5', '5555675432', 3, 5),
('Ana', 'Jiménez López', '2004-12-05', 'Calle 5 de Febrero 6', '5556784321', 2, 6),
('Luis', 'Vázquez González', '2006-03-10', 'Calle Hidalgo 7', '5557893210', 1, 7),
('Sofía', 'Morales Fernández', '2005-04-14', 'Calle Benito Juárez 8', '5558902109', 4, 8),
('Ricardo', 'Torres García', '2004-09-08', 'Av. Juárez 9', '5559011098', 2, 9),
('Elena', 'González Vázquez', '2005-11-30', 'Calle Morelos 10', '5550129987', 3, 10);


SELECT DISTINCT grupo FROM grupo;
SELECT DISTINCT nombre FROM maestro;
SELECT DISTINCT grado FROM estudiante;

SELECT * FROM estudiante LIMIT 3;
SELECT * FROM maestro LIMIT 3;
SELECT * FROM grupo LIMIT 3;

SELECT * FROM estudiante ORDER BY nombre ASC;
SELECT * FROM maestro ORDER BY apellidos DESC;
SELECT * FROM grupo ORDER BY salon ASC;

SELECT * FROM estudiante WHERE grado = 3;
SELECT * FROM maestro WHERE id_maestro > 5;
SELECT * FROM grupo WHERE salon < 105;

SELECT * FROM estudiante WHERE nombre LIKE 'L%';
SELECT * FROM maestro WHERE apellidos LIKE '%z%';
SELECT * FROM grupo WHERE grupo LIKE '%a%';

SELECT * FROM estudiante WHERE grado BETWEEN 2 AND 4;
SELECT * FROM grupo WHERE salon BETWEEN 102 AND 108;
SELECT * FROM maestro WHERE id_maestro BETWEEN 3 AND 7;

SELECT * FROM estudiante WHERE grado = 3 AND id_grupo = 1;
SELECT * FROM maestro WHERE nombre = 'Juan' AND telefono = '5551234567';
SELECT * FROM grupo WHERE grupo = 'Matemáticas' AND salon = 101;

SELECT * FROM estudiante WHERE grado = 1 OR grado = 4;
SELECT * FROM maestro WHERE nombre = 'Carlos' OR apellidos = 'Gómez';
SELECT * FROM grupo WHERE grupo = 'Arte' OR grupo = 'Física';

SELECT * FROM estudiante WHERE NOT grado = 3;
SELECT * FROM maestro WHERE NOT nombre = 'Ana';
SELECT * FROM grupo WHERE NOT salon = 105;

SELECT * FROM estudiante WHERE grado IN (1, 3, 4);
SELECT * FROM maestro WHERE id_maestro IN (2, 5, 8);
SELECT * FROM grupo WHERE salon IN (101, 107, 110);

SELECT nombre, grado + 1 AS "Siguiente Grado" FROM estudiante;
SELECT id_maestro, id_maestro * 2 AS "Doble ID" FROM maestro;
SELECT salon, salon - 100 AS "Diferencia" FROM grupo;

SELECT MIN(grado) FROM estudiante;
SELECT MIN(salon) FROM grupo;
SELECT MIN(id_maestro) FROM maestro;

SELECT MAX(grado) FROM estudiante;
SELECT MAX(salon) FROM grupo;
SELECT MAX(id_maestro) FROM maestro;

SELECT COUNT(*) FROM estudiante;
SELECT COUNT(*) FROM maestro;
SELECT COUNT(*) FROM grupo;

SELECT SUM(grado) FROM estudiante;
SELECT SUM(salon) FROM grupo;
SELECT SUM(id_maestro) FROM maestro;

SELECT AVG(grado) FROM estudiante;
SELECT AVG(salon) FROM grupo;
SELECT AVG(id_maestro) FROM maestro;

SELECT CONCAT(nombre, ' ', apellido) AS "Nombre Completo" FROM estudiante;
SELECT CONCAT(nombre, ' ', apellidos) AS "Nombre Completo" FROM maestro;
SELECT CONCAT(grupo, ' - ', salon) AS "Grupo y Salón" FROM grupo;

SELECT UPPER(nombre) FROM estudiante;
SELECT UPPER(apellidos) FROM maestro;
SELECT UPPER(grupo) FROM grupo;

SELECT LOWER(nombre) FROM estudiante;
SELECT LOWER(apellidos) FROM maestro;
SELECT LOWER(grupo) FROM grupo;

SELECT * FROM estudiante LIMIT 3 OFFSET 2;
SELECT * FROM maestro LIMIT 3 OFFSET 2;
SELECT * FROM grupo LIMIT 3 OFFSET 2;

SELECT grado, COUNT(*) FROM estudiante GROUP BY grado;
SELECT salon, COUNT(*) FROM grupo GROUP BY salon;
SELECT id_maestro, COUNT(*) FROM materia GROUP BY id_maestro;

SELECT grado, COUNT(*) FROM estudiante GROUP BY grado HAVING COUNT(*) > 1;
SELECT salon, COUNT(*) FROM grupo GROUP BY salon HAVING COUNT(*) > 1;
SELECT id_maestro, COUNT(*) FROM materia GROUP BY id_maestro HAVING COUNT(*) > 1;

SELECT nombre, grado,
    CASE 
        WHEN grado = 1 THEN 'Principiante'
        WHEN grado = 2 THEN 'Intermedio'
        ELSE 'Avanzado'
    END AS "Nivel"
FROM estudiante;

SELECT nombre, 
    CASE 
        WHEN id_maestro < 5 THEN 'Profesor Junior'
        ELSE 'Profesor Senior'
    END AS "Categoría"
FROM maestro;

SELECT grupo, 
    CASE 
        WHEN salon < 105 THEN 'Planta baja'
        ELSE 'Piso superior'
    END AS "Ubicación"
FROM grupo;

SELECT nombre, IFNULL(telefono, 'No registrado') AS "Teléfono" FROM estudiante;
SELECT nombre, IFNULL(direccion, 'No disponible') AS "Dirección" FROM maestro;
SELECT grupo, IFNULL(salon, 'No asignado') AS "Salón" FROM grupo;
