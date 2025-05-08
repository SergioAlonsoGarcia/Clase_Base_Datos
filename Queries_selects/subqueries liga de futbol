USE liga_futbol;
-- Obtener el nombre de los jugadores que juegan en equipos de la categoría 'Sub-100
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
SELECT nombre
FROM arbitro
WHERE apellido = 'González'
  AND id_arbitro IN (
    SELECT id_arbitro
    FROM arbitro
    WHERE apellido = 'González'
);

-- Obtener los equipos que están en la categoría 'Sub-12':
SELECT nombre
FROM equipo
WHERE id_categoria = (
    SELECT id_categoria
    FROM categoria
    WHERE nombre = 'Sub-12'
);


-- Obtener el nombre de los jugadores que tienen un teléfono de 10 dígitos (sin contar los jugadores con número de teléfono nulo):
SELECT nombre
FROM jugador
WHERE LENGTH(telefono) = 10
  AND telefono IS NOT NULL;


-- Obtener el nombre de los equipos que tienen al menos un jugador con teléfono no nulo:
SELECT nombre
FROM equipo
WHERE id_equipo IN (
    SELECT id_equipo
    FROM jugador
    WHERE telefono IS NOT NULL
);
