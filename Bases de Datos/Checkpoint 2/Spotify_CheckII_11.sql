-- 1: Mostrar la cantidad de usuarios cuyo código de tipo de usuario es 1 (free) , 2 (standard) y 3 (premium).
SELECT IdTipoUsuario, count(IdTipoUsuario) as cantidad_usuarios FROM usuario GROUP BY IdTipoUsuario;

-- 2: Listar los álbumes que poseen la letra Z en su título.
SELECT titulo FROM album WHERE titulo LIKE '%z%';

-- 3: Listar la cantidad de canciones que posee por usuario en sus playlist y su promedio, la cantidad máxima y mínima. 
SELECT idusuario, COUNT(cantcanciones), AVG(cantcanciones), MAX(cantcanciones), MIN(cantcanciones) 
FROM playlist GROUP BY idusuario;

-- 4: Mostrar la playlist que tiene más canciones.
SELECT titulo , MAX(cantcanciones) as cant_canciones FROM playlist;

-- 5: Listar los 10 usuarios más jóvenes. 
SELECT nombreusuario, fecha_nac FROM usuario ORDER BY fecha_nac DESC LIMIT 10;

-- 6: Listar los 10 usuarios más longevos.
SELECT nombreusuario, fecha_nac FROM usuario ORDER BY fecha_nac ASC LIMIT 10;

-- 7: Listar las 5 canciones con más likes, ordenadas descendentemente.
SELECT titulo FROM cancion ORDER BY cantlikes DESC LIMIT 5;

-- 8: Generar un reporte de todos los artistas ordenados alfabéticamente.
SELECT nombre FROM artista ORDER BY nombre;

-- 9: Listar por país la cantidad de usuarios que posee.
SELECT Pais_idPais, COUNT(*) as cantidad_usuarios FROM usuario GROUP BY Pais_idPais;

-- 10: Listar la última fecha de creación de una playlist cuyo título incluya una A.
SELECT titulo, Fechacreacion FROM playlist 
WHERE titulo LIKE "%a%" ORDER BY Fechacreacion DESC LIMIT 1;

-- 11: Listar de las passwords históricas, las 3 más utilizadas, cuántas veces se utilizaron y la primera fecha que se utilizó y la última.
SELECT Password, Fecha, MIN(Fecha), MAX(Fecha), COUNT(Password) as veces_utilizadas FROM passwordxusuario 
GROUP BY Password ORDER BY Password, Fecha LIMIT 3;

-- 12: Insertar un usuario nuevo, con los siguientes datos, tener en cuenta las relaciones.
INSERT INTO usuario (idUsuario, nombreusuario, nyap, fecha_nac, sexo, CP, password, Pais_idPais, IdTipoUsuario) 
VALUES (20, "miusuariodespotify@gmail.com", "Evangelina Gomez", 19951115,"F", "B1429ATF", "S1234m", 1, 3);

-- 13: Insertar un nuevo método de pago, que sea QR y, luego, modificar todos los usuarios que tienen como método pago en efectivo por el nuevo método QR.
INSERT INTO tipoformapago(idTipoFormaPago, TipoFormaPago) VALUES (5, "QR");
UPDATE datospagoxusuario SET idTipoFormaPago = 5 WHERE idTipoFormaPago= 1;

-- 14: Eliminar todas las canciones de género trap.
DELETE FROM genero WHERE idgenero = 12;

-- 15: Generar un listado de los países con la cantidad de discográficas que posee cada uno, utilizando el código de país.
SELECT idPais, COUNT(*) as cantidad_discograficas FROM discografica GROUP BY idPais;

-- 16: Listar por género la cantidad de canciones, solo utilizar el codigo de género.
SELECT idgenero, count(*) as cantidad_canciones FROM generoxcancion GROUP BY idgenero;

-- 17: Listar la canción de menor duración.
SELECT titulo, MIN(duracion) as duracion FROM cancion;

-- 18: Listar las 5 canciones de mayor duración.
SELECT titulo, duracion FROM cancion ORDER BY duracion DESC LIMIT 5;

-- 19: Listar todas las tarjetas cuyo vencimiento sucede este año.
SELECT * FROM datospagoxusuario WHERE (idTipoFormaPago = 2 OR idTipoFormaPago = 3)
AND AnioCaduca = 21;

-- 20: Listar a todos los artistas que no tengan imagen, ordenados alfabéticamente
SELECT nombre FROM artista WHERE imagen IS NULL;
