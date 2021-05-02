-- 1. Listar todos los albumes de Queen

SELECT titulo FROM albumes 
INNER JOIN artistas ON albumes.id_artista = artistas.id
WHERE artistas.nombre = "Queen";

-- 2. Devuelva los albumes de Simply Red (cuantos)

SELECT count(*) FROM albumes 
INNER JOIN artistas ON albumes.id_artista = artistas.id
WHERE artistas.nombre = "Simply Red";

-- 3. Consultar las canciones (Overdose) de AC/DC y cuantas veces fueron vendidas

SELECT COUNT(*) FROM items_de_facturas
INNER JOIN canciones ON canciones.id = items_de_facturas.id_cancion
WHERE canciones.nombre = "Overdose";


-- 4. Listar las canciones de Caetano Veloso que tengan una duración de 
-- más de 4 minutos (240000 milisegundos). 
-- De las canciones en esta lista,  ¿Cuál es el nombre de la única que no se vendió?

SELECT canciones.id, canciones.nombre, milisegundos, items_de_facturas.id_cancion FROM canciones
INNER JOIN albumes ON canciones.id_album = albumes.id
INNER JOIN artistas ON albumes.id_artista = artistas.id
LEFT JOIN items_de_facturas ON canciones.id = items_de_facturas.id_cancion
WHERE artistas.nombre = "Caetano Veloso" AND milisegundos > 240000;

SELECT * FROM canciones c
LEFT JOIN items_de_facturas idf ON idf.id_cancion = c.id 
INNER JOIN albumes al ON al.id = c.id_album
INNER JOIN artistas ar ON ar.id = al.id_artista
WHERE ar.nombre = "Caetano Veloso" AND c.milisegundos > 240000 AND idf.id_cancion IS NULL;

-- 5. Crear una vista llamada FACTURAS_NACIONALES. La vista debe tener las siguientes columnas: 
--   id de factura, fecha de factura, id del cliente, nombre y apellido del cliente,
--   total de la factura, y solamente debe incluir las facturas de Argentina. 
--   Luego ejecutar SELECT * FROM FACTURAS_NACIONALES. 
--   ¿Cuántos registros devuelve la consulta?

CREATE VIEW FACTURAS_NACIONALES AS
SELECT facturas.id, fecha_factura, facturas.id_cliente, clientes.primer_nombre, 
clientes.apellido, total FROM facturas
INNER JOIN clientes ON clientes.id = facturas.id_cliente
WHERE facturas.pais_de_facturacion LIKE "Argentina"; 

SELECT * FROM FACTURAS_NACIONALES;

-- 6. Crear una vista llamada LATINOS con información de artistas con sus álbumes y canciones. 
--    La vista debe tener las siguientes columnas: nombre del artista, título del álbum,
--    nombre de la canción, y debe incluir únicamente aquellas canciones del género latin. 
--    Hacer un SELECT sobre la vista LATINOS ordenada por nombre, artista y canción. 
--    ¿Cuál es el nombre de la segunda canción que aparece en el resultado?

CREATE VIEW LATIN AS
SELECT artistas.nombre AS nombre_artista, albumes.titulo AS titulo_album, 
canciones.nombre AS cancion, generos.nombre AS genero FROM artistas
INNER JOIN albumes ON artistas.id = albumes.id_artista
INNER JOIN canciones ON albumes.id = canciones.id_album
INNER JOIN generos ON generos.id = canciones.id_genero
WHERE generos.nombre = "Latin";

SELECT * FROM LATIN
ORDER BY nombre_artista, titulo_album, genero;