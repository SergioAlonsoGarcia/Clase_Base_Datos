USE escuela;
-- Subconsulta para obtener los estudiantes que están en el grupo de "Matemáticas":
SELECT nombre,apellido
FROM estudiante
WHERE id_estudiante IN (
	SELECT id_grupo
    FROM grupo
    WHERE grupo = 'Matematicas'
);


-- 2. Subconsulta para obtener los nombres de las materias que un maestro imparte:
SELECT nombre
FROM materia
WHERE id_maestro IN (
	SELECT id_maestro
    FROM maestro
    WHERE nombre = 'Juan'  AND apellidos = 'Pérez Gómez'
);


--  Subconsulta para obtener los nombres de los estudiantes que están en el grupo de "Historia":
SELECT nombre,apellido
FROM estudiante
WHERE id_grupo IN (
	SELECT id_grupo
    FROM grupo
    WHERE grupo = 'Historia'
);

-- Subconsulta para obtener los maestros que imparten materias que contienen la palabra "Estudio":
SELECT  nombre,apellidos
FROM maestro
WHERE id_maestro IN (
	SELECT id_maestro
    FROM materia
    WHERE descripcion LIKE  '%ESTUDIO%'
);

-- Subconsulta para obtener los nombres de las materias impartidas por maestros que viven en "Av. Juárez 303":

SELECT nombre 
FROM materia 
WHERE id_maestro = (
    SELECT id_maestro 
    FROM maestro 
    WHERE direccion = 'Av. Juárez 303'
);



