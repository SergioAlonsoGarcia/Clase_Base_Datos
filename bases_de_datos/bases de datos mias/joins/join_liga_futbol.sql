USE liga_futbol;

-- Obtener los jugadores junto con el nombre de su equipo.
SELECT j.nombre,j.apellido,e.nombre FROM jugador j
JOIN equipo e 
ON j.id_equipo= e.id_equipo;

-- Obtener los equipos junto con la categoría a la que pertenecen.
SELECT e.nombre,c.nombre AS categoria FROM equipo e
JOIN categoria c
ON e.id_categoria = c.id_categoria;

-- RIGHT JOIN

-- Obtener todos los árbitros y los equipos asignados (si existe alguno).
SELECT a.nombre, a.apellido, e.nombre AS equipo_nombre
FROM arbitro a
RIGHT JOIN equipo e
ON a.id_arbitro = e.id_categoria;

-- Obtener todos los jugadores y el equipo al que pertenecen (aunque no tengan equipo asignado).
SELECT j.nombre,j.apellido,e.nombre FROM jugador j
RIGHT JOIN equipo e
ON j.id_equipo = e.id_equipo;


--  LEFT JOIN
-- Obtener todos los jugadores y su equipo, incluso si no tienen equipo asignado.
SELECT j.nombre,j.apellido,e.nombre FROM jugador j
LEFT JOIN equipo e
ON j.id_equipo = e.id_equipo;

-- Obtener todas las categorías y los equipos que pertenecen a cada categoría (incluso las categorías sin equipos asignados).
SELECT c.nombre AS categoria,e.nombre AS nombre_equipo FROM categoria  c
LEFT JOIN equipo e
ON c.id_categoria = e.id_categoria;

