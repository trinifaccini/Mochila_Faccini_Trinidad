-- PARTE 1

-- 1. Obtener el nombre y apellido de los primeros 5 actores disponibles, utilizar
--    aliases para mostrar los nombres de las columnas en español.

SELECT first_name AS "Nombre", last_name AS "Apellido" FROM actor
LIMIT 5; 


-- 2. Obtener un listado que incluya nombre, apellido y correo electrónico de los
--    clientes (customers) inactivos, utilizar aliases para mostrar los nombres de
--    las columnas en español.

SELECT first_name AS "Nombre", last_name AS "Apellido", email AS "Correo Electrónico" 
FROM customer
WHERE active = 0;


-- 3. Obtener un listado de films incluyendo título, año y descripción de los films
--    que tienen un rental_duration mayor a cinco. Ordenar por rental_duration de
--    mayor a menor y utilizar aliases para mostrar los nombres de las columnas
--    en español

SELECT title AS "Título", release_year AS "Año", description AS "Descripción",
rental_duration AS "Duracion rental" FROM film
WHERE rental_duration > 5
ORDER BY rental_duration DESC;


-- 4. Obtener un listado de alquileres (rentals) que se hicieron durante el mes de
--    mayo de 2005, incluir en el resultado todas las columnas disponibles.

SELECT * FROM rental
WHERE month(rental_date) = 5;

SELECT * FROM rental
WHERE EXTRACT(month FROM rental_date) = 5;


-- PARTE 2

-- 1. Obtener la cantidad TOTAL de alquileres (rentals), utilizar un alias para 
--    mostrarlo en una columna llamada “cantidad”

SELECT COUNT(*) AS "Cantidad" FROM rental;


-- 2. Obtener la suma TOTAL de todos los pagos (payments), utilizar un alias para
--    mostrarlo en una columna llamada “total”, una columna con la cantidad de
--    alquileres con el alias “Cantidad”, y una columna que indique el “Importe
--    promedio” por alquiler.

SELECT COUNT(rental_id) AS "Cantidad", SUM(amount) AS "Total", 
AVG(amount) AS "Importe proemdio" FROM payment;


-- 3. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes
--    que más dinero gastan y en cuantos alquileres lo hacen?

SELECT customer_id, SUM(amount) AS "Dinero gastado", COUNT(rental_id) AS "Cant Alquileres" 
FROM payment
GROUP BY customer_id 
ORDER BY SUM(amount) DESC
LIMIT 10;


-- 4. Generar un reporte que indique: id de cliente, cantidad de alquileres y monto
--    total para todos los clientes que hayan gastado más de 150 dólares en
--    alquileres.

SELECT customer_id, SUM(amount) AS "Dinero gastado", COUNT(rental_id) AS "Cant Alquileres" 
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 150;


-- 5. Generar un reporte que muestre por mes de alquiler (rental_date de tabla
--    rental), la cantidad de alquileres y la suma total pagado (amount de tabla
--    payment) para el año de alquiler 2005 (rental_date de tabla rental).
--    Pista: Las tablas a utilizar son rental y payment.

SELECT rental.rental_date, SUM(payment.amount) AS "Total pagado", COUNT(rental.rental_id) AS "Cantidad Alquileres" 
FROM payment
INNER JOIN rental ON payment.rental_id = rental.rental_id
WHERE YEAR(rental.rental_date) = 2005
GROUP BY MONTH(rental.rental_date);

SELECT rental.rental_date, SUM(payment.amount) AS "Total pagado", 
COUNT(rental.rental_id) AS "Cantidad Alquileres" FROM payment
INNER JOIN rental ON payment.rental_id = rental.rental_id
WHERE EXTRACT(YEAR from rental.rental_date) = 2005
GROUP BY EXTRACT(MONTH from rental.rental_date);


-- 6. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios
--    más alquilados? (columna inventory_id en la tabla rental) para cada una de
--    ellas indicar la cantidad de alquileres.

SELECT inventory.inventory_id AS "Id inventorio", 
COUNT(rental.inventory_id) AS "Cantidad alquileres" FROM inventory
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY inventory.inventory_id
ORDER BY COUNT(rental.inventory_id) DESC
LIMIT 5;


-- PARTE 3

-- 1. ¿Cuántos actores existen en la base de datos SAKILA?
SELECT COUNT(*) AS "Cantidad actores" FROM actor;

-- 2. ¿Mediante qué tabla se relacionan los Actores y los Films?
-- RTA: film_actor (tabla intermedia)

-- 3. Sobre la tabla “Payment” calcular la cantidad de pagos y 
--    la suma total de monto (amount) para el cliente (Customer_id) “10”.

SELECT COUNT(*) AS "Cantidad pagos", SUM(amount) as "Total monto" FROM payment
WHERE customer_id = 10;

-- 4. Se quiere mandar un mail a todos los clientes que estén inactivos. Es decir Active = 0. 
--   ¿A cuántos clientes vamos a enviar?

SELECT COUNT(*) FROM customer
WHERE active = 0;

-- 5. Necesitamos obtener un reporte con todas las películas (Films) de Acción.
--    Veamos la siguiente consulta.. ¿Cómo continúa?

SELECT * FROM sakila.film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id 
WHERE category.name = "Action"