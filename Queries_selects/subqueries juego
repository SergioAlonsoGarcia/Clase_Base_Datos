USE juego;
-- Obtener los nombres de los jugadores que han jugado el juego "Minecraft":
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

SELECT nombre
FROM juego
WHERE id_juego IN (
    SELECT id_juego
    FROM proceso
    GROUP BY id_juego
    HAVING AVG(puntaje) > 5000
);

-- Obtener los jugadores que han jugado más de 3 horas en total en un solo juego
SELECT nombre_usuario
FROM jugador
WHERE id_jugador IN (
    SELECT id_jugador
    FROM proceso
    GROUP BY id_jugador, id_juego
    HAVING SUM(TIME_TO_SEC(tiempo_jugado)) > 10800  
);

-- Obtener el nombre de los jugadores que han jugado "Doom Eternal"
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
SELECT nombre
FROM juego
WHERE id_juego NOT IN (
    SELECT DISTINCT id_juego
    FROM proceso
);
