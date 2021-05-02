-- 1. Mostrar el nombre de usuario y contar la cantidad de playlists que tiene.

SELECT usuario.nombreusuario AS NombreUsuario, COUNT(*) AS CantPlaylist FROM playlist 
INNER JOIN usuario ON usuario.idUsuario = playlist.idusuario
GROUP BY usuario.nombreusuario;


-- 2. Mostrar los nombres de los géneros con la cantidad de temas que tienen asignadas a ellas.

SELECT genero.Genero AS NombreGenero, COUNT(generoxcancion.idCancion) AS CantCanciones FROM cancion
INNER JOIN generoxcancion ON generoxcancion.idCancion = cancion.idCancion
INNER JOIN genero ON generoxcancion.idGenero = genero.idGenero
GROUP BY genero.Genero;


-- 3. Mostrar las canciones que contienen la letra Z en su nombre, el nombre del álbum
--    al que pertenece y la banda respectiva.

SELECT cancion.titulo AS NombreCancion, album.titulo AS NombreAlbum, artista.Nombre 
AS NombreBandaOArtista FROM cancion 
INNER JOIN album ON cancion.IdAlbum = album.idAlbum
INNER JOIN artista ON album.idArtista = artista.idArtista
WHERE cancion.titulo LIKE '%z%';


-- 4. Mostrar la playlist con más canciones y el nombre del usuario que la creó.

SELECT playlist.titulo AS NombrePlaylist, usuario.nombreusuario AS NombreUsuario, 
playlist.cantcanciones AS CantCanciones FROM playlist
INNER JOIN usuario ON playlist.idusuario = usuario.idUsuario
ORDER BY cantcanciones DESC
LIMIT 1; 


-- 5. Generar un reporte de seguridad, listando las claves utilizadas por todos los usuarios, 
--    indicando el nombre del usuario y tipo, ordenado por fecha descendentemente.

SELECT usuario.nombreUsuario, tipousuario.TipoUsuario, usuario.password FROM usuario 
INNER JOIN tipousuario ON usuario.idTipoUsuario = tipousuario.idTipoUsuario
GROUP BY usuario.idUsuario;


-- 6. Listar por usuario, indicando usuario, la clave y la fecha de caducidad — 
--    90 días posterior a la fecha alta de la clave — a aquellos que posean una suscripción de tipo free.


-- 7. Listar las canciones que tienen los artistas cuyo nombre contiene la letra “r” y 
-- pertenecen al género pop.

SELECT cancion.titulo AS NombreCancion, artista.Nombre AS NombreArtista, 
genero.Genero AS NombreGenero 
FROM cancion
INNER JOIN generoxcancion ON generoxcancion.idCancion = cancion.idCancion
INNER JOIN genero ON generoxcancion.idGenero = genero.idGenero
INNER JOIN album ON cancion.idAlbum = album.idAlbum
INNER JOIN artista ON album.idArtista = artista.idArtista
WHERE artista.Nombre LIKE ("%r%") AND genero.Genero = "pop";


-- 8. Generar un reporte donde se muestre el método de pago, la cantidad de operaciones
--    que se realizaron con cada uno y el importe total.

SELECT TipoFormaPago, count(tipoformapago.idTipoFormaPago) AS operaciones, 
sum(pagos.Importe) as importeTotal
FROM tipoformapago 
INNER JOIN datospagoxusuario ON datospagoxusuario.idTipoFormaPago = tipoformapago.idTipoFormaPago
INNER JOIN pagos ON datospagoxusuario.idDatosPagoxUsuario = pagos.IdDatosPagoxUsuario 
GROUP BY TipoFormaPago; 


-- 9. Listar todos los usuarios que pagaron con QR y la fecha de pago sea del 2020.

select usuario.nombreusuario, tipoformapago.TipoFormaPago, pagos.fechaPago from usuario
inner join datospagoxusuario on datospagoxusuario.idusuario = usuario.idUsuario
inner join tipoformapago on tipoformapago.idTipoFormaPago = datospagoxusuario.idTipoFormaPago
inner join pagos on pagos.IdDatosPagoxUsuario = datospagoxusuario.idDatosPagoxUsuario
having pagos.fechaPago like ("%2020%") and tipoformapago.TipoFormaPago = "QR";


-- 10. Generar un reporte de todas las canciones cuyo álbum no posee imagen de portada.

SELECT cancion.titulo AS "Título canción",  album.titulo AS "Título album", album.imagenportada
FROM spotify_cp3.cancion 
INNER JOIN spotify_cp3.album ON album.idAlbum = cancion.IdAlbum
WHERE album.imagenportada IS null;


-- 11. Generar un reporte por género e informar la cantidad de canciones que posee. 
--     Si una canción tiene más de un género, debe ser incluida en la cuenta de cada uno de esos géneros.

SELECT genero.Genero AS NombreGenerp, count(cancion.idcancion) AS cantidadCancionesxGenero 
FROM cancion 
INNER JOIN generoxcancion ON cancion.idcancion = generoxcancion.IdCancion
INNER JOIN genero ON generoxcancion.IdGenero = genero.idGenero 
GROUP BY genero.Genero;


-- 12. Listar todas las playlists que no están en estado activo y a qué usuario pertenecen,
--     ordenado por la fecha de eliminación.

SELECT usuario.nombreusuario, playlist.titulo AS TituloPlaylist, 
playlist.idestado AS EstadoPLaylist, playlist.Fechaeliminada AS FechaEliminada
FROM playlist
INNER JOIN estadoplaylist ON estadoplaylist.idEstadoPlaylist = playlist.idestado
INNER JOIN usuario ON playlist.idusuario = usuario.idusuario
WHERE playlist.idestado = 2
ORDER BY playlist.Fechaeliminada;


-- 13. Generar un reporte que muestre por tipo de usuario la cantidad de usuarios que posee.

SELECT usuario.IdTipoUsuario AS TipoUsuario, tipousuario.TipoUsuario, 
count(idUsuario) AS CantUsuarios 
FROM usuario 
INNER JOIN tipousuario on usuario.IdTipoUsuario= tipousuario.idTipoUsuario  
GROUP BY usuario.IdTipoUsuario;


-- 14. Listar la suma total obtenida por cada tipo de suscripción, 
-- en el periodo del 01-01-2020 al 31-12-2020.

SELECT tipousuario.TipoUsuario as TipoSuscripcion, SUM(pagos.Importe) as TotalObtenido, 
pagos.idPagos as idPagos
FROM tipousuario
INNER JOIN suscripcion ON tipousuario.idTipoUsuario = suscripcion.idTipoUsuario
INNER JOIN pagos ON suscripcion.idpagos = pagos.idPagos
WHERE fechaPago BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY tipousuario.TipoUsuario;


-- 15. Listar el álbum y la discográfica que posea la canción con más reproducciones.

SELECT album.titulo AS NombreAlbum, discografica.nombre AS NombreDiscografica, 
cancion.cantreproduccion AS NroReproducciones FROM cancion
INNER JOIN album ON album.idAlbum = cancion.idAlbum
INNER JOIN discografica ON discografica.iddiscografica = album.iddiscografica
ORDER BY cancion.cantreproduccion DESC
LIMIT 1; 


-- 16. Listar todas las playlist y canciones que tienen los usuarios de Argentina.

SELECT playlist.titulo, cancion.titulo, pais.Pais FROM playlistxcancion
INNER JOIN playlist ON playlistxcancion.IdPlaylist = playlist.idPlaylist
INNER JOIN usuario  ON usuario.idUsuario = playlist.idusuario 
INNER JOIN pais ON usuario.Pais_idPais = pais.idPais
INNER JOIN cancion ON playlistxcancion.Idcancion = cancion.idCancion
WHERE pais.Pais = "Argentina";


-- Opcional
-- 17. Listar el nombre de las discográficas que posean más de 10 canciones y más de 1 género.

select discografica.nombre as discografica, count(cancion.idCancion) as cantidadCanciones, 
count(genero.idGenero) as cantidadGeneros 
from discografica
inner join album on album.iddiscografica = discografica.idDiscografica
inner join cancion on cancion.IdAlbum = album.idAlbum
inner join generoxcancion on generoxcancion.IdCancion = cancion.idCancion
inner join genero on genero.idGenero = generoxcancion.IdGenero
group by discografica.nombre 
having count(cancion.idCancion) > 10 and count(genero.idGenero) > 1;
