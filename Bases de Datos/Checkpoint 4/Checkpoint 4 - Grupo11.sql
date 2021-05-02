-- ***************************************** CHECKPOINT 4 ***************************************** 
-- CAMADA: 1 
-- GRUPO: 11 

-- 1. Listar todos los usuarios que no hayan generado una playlist.

SELECT usuario.idusuario AS "ID usuario", usuario.nombreusuario AS "Nombre Usuario" , 
playlist.titulo AS "Título playlist" FROM usuario
LEFT JOIN playlist ON usuario.idUsuario = playlist.idusuario
WHERE playlist.idPlaylist IS NULL
ORDER BY usuario.idusuario ASC;


-- 2. Listar todas las canciones indicando cuántos likes recibió 
--    —hayan o no recibido likes— y si han sido reproducidas.

SELECT cancion.titulo AS "Cancion", COALESCE(cantlikes, "0") AS "Cantidad Likes",
COALESCE(cantreproduccion, "No fue reproducida") as "Cantidad reproduccion"
FROM cancion;


-- 3. Listar todas las canciones que pertenezcan a más de una playlist. 
-- Incluir en el listado el nombre de la canción, el código y a cuántas playlist pertenecen.

SELECT cancion.idCancion AS Codigo, cancion.titulo AS Cancion, 
COUNT(playlistxcancion.idPlaylist) AS CantPlaylist FROM cancion
INNER JOIN playlistxcancion ON playlistxcancion.Idcancion = cancion.idCancion
INNER JOIN playlist ON playlistxcancion.idPlaylist = playlist.idPlaylist
GROUP BY cancion.idCancion
HAVING COUNT(playlistxcancion.idPlaylist) > 1
ORDER BY Codigo;


-- 4. Generar un reporte con el nombre del artista y el nombre de la canción 
--    que no pertenecen a ninguna lista.

SELECT artista.nombre, cancion.titulo, playlistxcancion.IdPlaylist FROM artista
INNER JOIN album ON album.idArtista = artista.idArtista
INNER JOIN cancion ON cancion.IdAlbum = album.idAlbum
LEFT JOIN playlistxcancion ON playlistxcancion.Idcancion = cancion.idCancion
WHERE playlistxcancion.Idcancion IS NULL;


-- 5. Listar todas las canciones, el nombre del autor, la razón social de la discográfica y la cantidad de veces 
--    que fue reproducida.

SELECT cancion.titulo, cancion.cantreproduccion, artista.Nombre, discografica.nombre
FROM cancion
LEFT JOIN album ON album.idAlbum = cancion.IdAlbum
LEFT JOIN artista ON artista.idArtista = album.idArtista
LEFT JOIN discografica ON discografica.idDiscografica = album.iddiscografica;


-- 6. Listar todas las discográficas que pertenezcan a Inglaterra y la cantidad de álbumes que hayan editado.

SELECT discografica.nombre AS "Discográfica", pais.Pais, COUNT(album.idAlbum) AS "Cantidad de albumes"
FROM discografica
LEFT JOIN album ON discografica.idDiscografica = album.iddiscografica
LEFT JOIN pais ON pais.idPais = discografica.idPais
GROUP BY discografica.nombre
HAVING pais.Pais = "Inglaterra";


-- 7. Listar a todos los artistas que no poseen ningún álbum.
SELECT artista.nombre AS "Nombre artista" , album.titulo as "Album" FROM artista 
LEFT JOIN album ON artista.idArtista=album.idArtista
WHERE album.titulo is null;



-- 8. Listar todos los álbumes que tengan alguna canción que posea más de un género

SELECT album.titulo as NombreAlbum, cancion.titulo as NombreCancion, 
count(generoxcancion.idGenero) as CantGeneros
FROM album 
INNER JOIN cancion ON album.idAlbum=cancion.IdAlbum
INNER JOIN generoxcancion ON cancion.idCancion=generoxcancion.IdCancion
INNER JOIN genero ON generoxcancion.IdGenero=genero.idGenero
GROUP BY album.titulo
HAVING count(generoxcancion.idGenero) > 1;


-- 9. Generar un reporte por usuario, listando las suscripciones que tiene o tuvo, 
--    el importe que abonó y los datos de las formas de pago con que lo realizó.

SELECT usuario.idusuario AS "ID usuario", usuario.nombreusuario AS "Nombre Usuario",
suscripcion.idSuscripcion AS "ID Suscripcion", pagos.Importe AS "Importe suscripcion",
pagos.fechaPago AS "Fecha Pago", tipoformapago.TipoFormaPago AS "Forma de Pago",
datospagoxusuario.CBU, datospagoxusuario.Banco, datospagoxusuario.NroTarjeta AS "Numero Tarjeta"
FROM usuario
LEFT JOIN suscripcion ON usuario.idUsuario = suscripcion.idusuario
LEFT JOIN pagos ON suscripcion.idpagos = pagos.idPagos
LEFT JOIN datospagoxusuario ON usuario.idUsuario = datospagoxusuario.idusuario
LEFT JOIN tipoformapago ON datospagoxusuario.idTipoFormaPago = tipoformapago.idTipoFormaPago
ORDER BY usuario.idusuario ASC;

SELECT usuario.nombreusuario, suscripcion.FechaInicio, suscripcion.fecharenovacion, pagos.Importe, tipoformapago.TipoFormaPago FROM suscripcion
JOIN usuario ON usuario.idUsuario = suscripcion.idusuario
JOIN pagos ON pagos.idPagos = suscripcion.idpagos
JOIN datospagoxusuario ON datospagoxusuario.idusuario = usuario.idUsuario
JOIN tipoformapago ON tipoformapago.idTipoFormaPago = datospagoxusuario.idTipoFormaPago
;



