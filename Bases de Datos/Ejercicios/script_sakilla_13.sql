-- PARTE 1 

-- 1. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes
--    que más dinero gastan y en cuantos alquileres lo hacen?

SELECT SUM(payment.amount) AS total , customer.first_name AS nombre, 
customer.last_name AS apellido, COUNT(rental.rental_id) as cantidad_alquileres
FROM payment
INNER JOIN rental ON payment.rental_id = rental.rental_id
INNER JOIN customer ON rental.customer_id = customer.customer_id
GROUP BY rental.customer_id
ORDER BY SUM(payment.amount) DESC
LIMIT 10;


-- 2. Generar un reporte que indique: el id del cliente, la cantidad de alquileres y
--    el monto total para todos los clientes que hayan gastado más de 150 dólares
--    en alquileres.

SELECT customer.customer_id AS cliente, COUNT(rental.rental_id) as cantidad_alquileres, SUM(payment.amount) AS total
FROM rental
INNER JOIN payment ON payment.rental_id = rental.rental_id
INNER JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY rental.customer_id
HAVING total > 150
ORDER BY total DESC;


-- 3. Generar un reporte que responda a la pregunta: ¿cómo se distribuyen la
--    cantidad y el monto total de alquileres en los meses pertenecientes al año
--    2005? (tabla payment).

SELECT EXTRACT(month from payment_date) AS mes, COUNT(rental_id) AS cantidad_alquileres, 
SUM(amount) AS total FROM payment
WHERE EXTRACT(YEAR from payment_date)
GROUP BY mes
ORDER BY mes;


-- 4. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios
--    más alquilados? (columna inventory_id en la tabla rental) Para cada una de
--    ellas, indicar la cantidad de alquileres.

SELECT inventory.inventory_id AS "Id inventorio", 
COUNT(rental.inventory_id) AS "Cantidad alquileres" FROM inventory
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY inventory.inventory_id
ORDER BY COUNT(rental.inventory_id) DESC
LIMIT 5;


-- PARTE 2

-- 1. Generar un reporte que responda a la pregunta: Para cada tienda
--    (store), ¿cuál es la cantidad de alquileres y el monto total del dinero
--    recaudado por mes?




select store.store_id tienda, count(rental.rental_id),
sum(payment.amount),
extract(month from payment.payment_date) as mes from store
inner join inventory on store.store_id = inventory.store_id
inner join rental on rental.inventory_id = inventory.inventory_id
inner join payment on rental.rental_id = payment.rental_id
group by mes, tienda;



-- 2. Generar un reporte que responda a la pregunta: ¿cuáles son las 10 películas
--    que generan más ingresos? ¿ Y cuáles son las que generan menos ingresos?
--    Para cada una de ellas indicar la cantidad de alquileres.

SELECT film.title AS "Película" , SUM(payment.amount) AS Total, COUNT(rental.rental_id) AS Cantidad FROM film
INNER JOIN inventory ON inventory.film_id = film.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY film.title
ORDER BY Total DESC
LIMIT 10;

SELECT film.title AS "Película" , SUM(payment.amount) AS Total, COUNT(rental.rental_id) AS Cantidad FROM film
INNER JOIN inventory ON inventory.film_id = film.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY film.title
ORDER BY Total ASC
LIMIT 10;

-- 3. ¿Existen clientes que no hayan alquilado películas?

SELECT customer.customer_id, rental.rental_id FROM rental
RIGHT JOIN customer ON customer.customer_id = rental.customer_id
ORDER BY customer_id ASC;


select concat_ws(" ", first_name, last_name) AS cliente, count(rental.rental_id) AS alquileres
from customer
left join rental on customer.customer_id = rental.customer_id
group by customer.customer_id


-- 4. Nivel avanzado: El jefe de stock quiere discontinuar las películas (film) con
--    menos alquileres (rental). ¿Qué películas serían candidatas a discontinuar?
--    Recordemos que pueden haber películas con 0 (Cero) alquileres.



