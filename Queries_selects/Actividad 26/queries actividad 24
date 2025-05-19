USE departamento;

-- Obtener los nombres de los vendedores cuyo salario es mayor al salario promedio de todos los vendedores.
DROP VIEW IF EXISTS salario_mayor_al_promedio;

CREATE VIEW salario_mayor_al_promedio AS
SELECT nombre
FROM vendedor
WHERE salario > (
	SELECT AVG(salario)
    FROM vendedor
    WHERE salario
);

-- Mostrar los artículos cuyo precio es mayor al precio promedio de los artículos del departamento 'Electrónica'.
DROP VIEW IF EXISTS precio_mayor_promedio_en_electronica;

CREATE VIEW precio_mayor_promedio_en_electronica AS
SELECT descripcion d
FROM articulo a
WHERE precio >(
	SELECT AVG(precio)
    FROM articulo
    JOIN departamento d ON a.id_departamento = d.id_departamento
    WHERE d.descripcion = 'ELectronica'
);


-- Listar los departamentos que tienen más de un artículo registrado.
DROP VIEW IF EXISTS articulo_registrado_en_departamento;

CREATE VIEW articulo_registrado_en_departamento AS
SELECT d.descripcion
FROM departamento d
WHERE d.id_departamento IN (
	SELECT id_departamento 
    FROM articulo 
    GROUP BY id_departamento
    HAVING COUNT(*) >1
);

-- Mostrar marcas que tienen artículos en el departamento 'Tecnología'
DROP VIEW IF EXISTS marcas_en_departamento_tecnologia;

CREATE VIEW marcas_en_departamento_tecnologia AS
SELECT descripcion
FROM marca
WHERE id_marca IN (
    SELECT id_marca
    FROM articulo
    WHERE id_departamento = (
        SELECT id_departamento
        FROM departamento
        WHERE descripcion = 'Tecnología'
        LIMIT 1
    )
);

--  Mostrar los nombres de los vendedores cuyo salario es igual al salario más alto registrado 
DROP VIEW IF EXISTS salario_igual_al_mas_alto;

CREATE VIEW salario_igual_al_mas_alto AS
SELECT nombre 
FROM vendedor 
WHERE salario = (
	SELECT MAX(salario)
    FROM vendedor
);

--
--                	-- JUEGO
--
USE juego;
-- Obtener los nombres de los jugadores que han jugado el juego "Minecraft":
DROP VIEW IF EXISTS jugadores_en_minecraft;

CREATE VIEW jugadores_en_minecraft AS
SELECT nombre_usuario
FROM jugador
WHERE id_jugador IN (
    SELECT id_jugador
    FROM proceso
    WHERE id_juego = (
        SELECT id_juego
        FROM juego
        WHERE nombre = 'Minecraft'
    )
);

-- Obtener los juegos que tienen un puntaje promedio superior a 5000
DROP VIEW IF EXISTS juegos_puntaje_mayor_5000;

CREATE VIEW juegos_puntaje_mayor_5000 AS
SELECT nombre
FROM juego
WHERE id_juego IN (
    SELECT id_juego
    FROM proceso
    GROUP BY id_juego
    HAVING AVG(puntaje) > 5000
);

-- Obtener los jugadores que han jugado más de 3 horas en total en un solo juego
DROP VIEW IF EXISTS jugadores_mas_3_horas;

CREATE VIEW jugadores_mas_3_horas AS
SELECT nombre_usuario
FROM jugador
WHERE id_jugador IN (
    SELECT id_jugador
    FROM proceso
    GROUP BY id_jugador, id_juego
    HAVING SUM(TIME_TO_SEC(tiempo_jugado)) > 10800  
);

-- Obtener el nombre de los jugadores que han jugado "Doom Eternal"
DROP VIEW IF EXISTS jugadores_de_doom_eternal;

CREATE VIEW jugadores_de_doom_eternal AS
SELECT nombre_usuario
FROM jugador
WHERE id_jugador IN (
    SELECT id_jugador
    FROM proceso
    WHERE id_juego = (
        SELECT id_juego
        FROM juego
        WHERE nombre = 'Doom Eternal'
    )
);

-- Obtener los juegos que no tienen jugadores asociados
DROP VIEW IF EXISTS juego_no_jugadores;

CREATE VIEW juego_no_jugadores AS
SELECT nombre
FROM juego
WHERE id_juego NOT IN (
    SELECT DISTINCT id_juego
    FROM proceso
);


--
-- --  LIGA DE FUTBOL
--

USE liga_futbol;
-- Obtener el nombre de los jugadores que juegan en equipos de la categoría 'Sub-100
DROP VIEW IF EXISTS categoria_sub100;

CREATE VIEW categoria_sub100 AS
SELECT nombre
FROM jugador
WHERE id_equipo IN (
    SELECT id_equipo
    FROM equipo
    WHERE id_categoria = (
        SELECT id_categoria
        FROM categoria
        WHERE nombre = 'Sub-10'
    )
);


-- Obtener los árbitros cuyo apellido es 'González':
DROP VIEW IF EXISTS arbitros_apellido_gonzalez;

CREATE VIEW arbitros_apellido_gonzalez AS 
SELECT nombre
FROM arbitro
WHERE apellido = 'González'
  AND id_arbitro IN (
    SELECT id_arbitro
    FROM arbitro
    WHERE apellido = 'González'
);

-- Obtener los equipos que están en la categoría 'Sub-12':
DROP VIEW IF EXISTS equipos_sub12;

CREATE VIEW equipos_sub12 AS
SELECT nombre
FROM equipo
WHERE id_categoria = (
    SELECT id_categoria
    FROM categoria
    WHERE nombre = 'Sub-12'
);


-- Obtener el nombre de los jugadores que tienen un teléfono de 10 dígitos (sin contar los jugadores con número de teléfono nulo):
DROP VIEW IF EXISTS jugadores_telefonos_10_digitos;

CREATE VIEW jugadores_telefonos_10_digitos AS
SELECT nombre
FROM jugador
WHERE LENGTH(telefono) = 10
  AND telefono IS NOT NULL;


-- Obtener el nombre de los equipos que tienen al menos un jugador con teléfono no nulo:
DROP VIEW IF EXISTS equipos_con_jugadores_sin_telefono;

CREATE VIEW equipos_con_jugadores_sin_telefono AS
SELECT nombre
FROM equipo
WHERE id_equipo IN (
    SELECT id_equipo
    FROM jugador
    WHERE telefono IS NOT NULL
);

--
-- --   ESCUELA
--

USE escuela;
-- Subconsulta para obtener los estudiantes que están en el grupo de "Matemáticas":
DROP VIEW IF EXISTS estudiantes_en_matematicas;

CREATE VIEW estudiantes_en_matematicas AS
SELECT nombre,apellido
FROM estudiante
WHERE id_estudiante IN (
	SELECT id_grupo
    FROM grupo
    WHERE grupo = 'Matematicas'
);


-- 2. Subconsulta para obtener los nombres de las materias que un maestro imparte:
DROP VIEW IF EXISTS materias_maestros;

CREATE VIEW materias_maestros AS
SELECT nombre
FROM materia
WHERE id_maestro IN (
	SELECT id_maestro
    FROM maestro
    WHERE nombre = 'Juan'  AND apellidos = 'Pérez Gómez'
);


--  Subconsulta para obtener los nombres de los estudiantes que están en el grupo de "Historia":
DROP VIEW IF EXISTS estudiantes_en_historia;

CREATE VIEW estudiantes_en_historia AS
SELECT nombre,apellido
FROM estudiante
WHERE id_grupo IN (
	SELECT id_grupo
    FROM grupo
    WHERE grupo = 'Historia'
);

-- Subconsulta para obtener los maestros que imparten materias que contienen la palabra "Estudio":
DROP VIEW IF EXISTS maestros_con_materia_estudio;

CREATE VIEW maestros_con_materia_estudio AS
SELECT  nombre,apellidos
FROM maestro
WHERE id_maestro IN (
	SELECT id_maestro
    FROM materia
    WHERE descripcion LIKE  '%ESTUDIO%'
);

-- Subconsulta para obtener los nombres de las materias impartidas por maestros que viven en "Av. Juárez 303":
DROP VIEW IF EXISTS materias_maestros_viven_en_una_calle;

CREATE VIEW materias_maestros_viven_en_una_calle AS
SELECT nombre 
FROM materia 
WHERE id_maestro = (
    SELECT id_maestro 
    FROM maestro 
    WHERE direccion = 'Av. Juárez 303'
);















