-- Mostrar los juegos junto con los puntajes obtenidos por los jugadores
SELECT j.nombre AS juego, p.puntaje
FROM proceso p  
INNER JOIN juego j
ON p.id_juego = j.id_juego;

-- Mostrar los nombres de los jugadores junto con los juegos que han jugado y su puntaje
SELECT ju.nombre_usuario, j.nombre AS juego, p.puntaje
FROM proceso p  
JOIN juego j
ON p.id_juego = j.id_juego
JOIN jugador ju
ON p.id_jugador = ju.id_jugador;

-- LEFT JOIN
/* Mostrar todos los procesos de los jugadores junto con el nombre del juego y el puntaje
Si no hay un puntaje registrado, se mostrará NULL en la columna "puntaje"
*/
SELECT p.id_proceso, j.nombre AS juego, p.puntaje
FROM proceso p  
LEFT JOIN juego j
ON p.id_juego = j.id_juego;

-- Mostrar todos los juegos junto con el puntaje, incluso si no tienen puntaje registrado
SELECT j.nombre AS juego, p.puntaje
FROM juego j  
LEFT JOIN proceso p
ON j.id_juego = p.id_juego;


-- RIGHT JOIN
/*
Mostrar todos los procesos de los jugadores junto con el nombre del juego y el puntaje
Si no hay un juego asociado, se mostrará NULL en la columna "juego"
*/
SELECT p.id_proceso, j.nombre AS juego, p.puntaje
FROM proceso p  
RIGHT JOIN juego j
ON p.id_juego = j.id_juego;

-- Mostrar todos los juegos junto con el puntaje, incluso si no tienen puntaje registrado
SELECT j.nombre AS juego, p.puntaje
FROM proceso p  
RIGHT JOIN juego j
ON p.id_juego = j.id_juego;
