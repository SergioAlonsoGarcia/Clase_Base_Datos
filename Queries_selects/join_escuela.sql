-- INNER JOIN
-- Obtener los nombres de los estudiantes y el nombre de su grupo.
SELECT e.nombre,e.apellido,g.grupo FROM estudiante e
JOIN grupo g
ON e.id_grupo = g.id_grupo;
/*
Obtener los nombres de los estudiantes junto con el nombre de la materia 
que están tomando (considerando que un estudiante puede estar inscrito en varias materias).
*/
SELECT e.nombre, e.apellido, m.nombre AS materia_nombre
FROM estudiante e
JOIN estudiante_materia em ON e.id_estudiante = em.id_estudiante
JOIN materia m ON em.id_materia = m.id_materia;

-- LEFT JOIN
-- Obtener todos los maestros junto con las materias que enseñan (si existe alguna asignada a cada maestro).
SELECT m.nombre,m.apellidos,ma.nombre FROM maestro m
LEFT JOIN materia ma
ON m.id_maestro = ma.id_maestro;

-- Obtener todos los grupos junto con los estudiantes asignados a cada uno (incluyendo los grupos sin estudiantes asignados).
SELECT e.nombre,e.apellido,g.grupo FROM grupo g
LEFT JOIN estudiante e
ON e.id_grupo = g.id_grupo;

-- RIGHT JOIN
-- Obtener todos los estudiantes junto con el nombre de su grupo (incluso si no tienen grupo asignado).
SELECT e.nombre,e.apellido,g.grupo FROM estudiante e
RIGHT JOIN grupo g
ON  e.id_grupo = g.id_grupo;


-- Obtener todos los estudiantes y su grupo (incluso si no tienen grupo asignado)
SELECT e.id_estudiante,e.nombre ,e.apellido,e.grado,g.grupo,g.salon FROM estudiante e
RIGHT JOIN grupo g
ON e.id_grupo = g.id_grupo;

