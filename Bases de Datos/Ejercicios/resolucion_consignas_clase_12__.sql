-- PRIMERA PARTE --------------------------------------------

-- Listar los clientes que hayan realizado compras durante el año 1996.
-- El listado debe contener las siguientes columnas:
-- Nombre y la inicial del apellido. Por ejemplo en lugar de 'Mario Pontes' debe decir 'Mario P.'
-- El título todo el mayúscula.

SELECT DISTINCT 
       CONCAT(LEFT(Contacto, INSTR(Contacto, ' ')+1),'.') as Contacto,
       UPPER(Titulo) as Titulo, 
       f.FechaRegistro
FROM facturas f
INNER JOIN clientes c
ON f.ClienteID = c.ClienteID
WHERE YEAR(f.FechaRegistro) = 1996;

/*
Listar las facturas para las cuales el envío haya sido a una ciudad distinta a la ciudad del cliente.
Considerar únicamente los clientes de UK.
El listado dene incluir:
El número de factura completando con ceros a la izquierda 8 posiciones. Por ejemplo 00001234
La fecha de la factura en formato YYYY-MM-DD. Por ejemplo 1996-12-01
La ciudad del cliente
La ciudad de destino
*/


SELECT RIGHT(CONCAT('00000000',f.FacturaID),8) AS FacturaId,
       DATE_FORMAT(f.FechaRegistro, '%Y-%m-%d') as fechaFactura,
       c.Ciudad, f.CiudadEnvio
FROM facturas f
INNER JOIN clientes c
ON f.ClienteID = c.ClienteID
WHERE c.Ciudad <> f.CiudadEnvio AND c.Pais = 'UK';


select clientes.ClienteId cliente, clientes.Ciudad ciudadCliente, clientes.Pais paisCliente, 
lpad(facturas.FacturaID,8,'0') nroFactura,  facturas.CiudadEnvio direccionEnvio, 
date_format(facturas.FechaRegistro, '%Y-%m-%d') fechaFactura 
from clientes
inner join facturas on clientes.clienteid = facturas.ClienteID
where clientes.ciudad != facturas.DireccionEnvio
and clientes.Pais = "UK";

/*
2. Listar las categorias y sus productos, incluyendo aquellas categorias para las cuales no haya 
productos en la base de datos.
En el caso de los nombres de los productos, donde diga Mix o Chef, reemplazarlo por MIX o CHEF 
respectivamente.
Por ejemplo: En lugar de Filo Mix, colocar Filo MIX. 
*/

SELECT c.CategoriaNombre, REPLACE(REPLACE(p.ProductoNombre,'Mix','MIX'),'Chef','CHEF')
FROM categorias c
LEFT JOIN productos p
ON c.CategoriaId = p.CategoriaId
ORDER BY c.CategoriaNombre, p.ProductoNombre;


SELECT categorias.CategoriaNombre, 
replace(replace(productos.ProductoNombre, 'Mix', 'MIX'), 'Chef', 'CHEF')  FROM categorias
left join productos
ON categorias.CategoriaID = productos.CategoriaID;


-- SEGUNDA PARTE --------------------------------------------

/*
1. Para cada empresa de correo, calcular el total de transporte.
Incluir todas las empresas de correo, aun cuando no hayan realizado ninguna operación.
coalesce(coolas)
*/

SELECT correos.Compania AS Correo, SUM(COALESCE(facturas.Transporte,0)) FROM correos
LEFT JOIN facturas ON correos.CorreoID = facturas.EnvioVia
GROUP BY correos.Compania;


SELECT co.Compania, sum(coalesce(fa.Transporte,0)) as total_transporte
FROM correos co
LEFT JOIN facturas fa
ON co.CorreoId = fa.EnvioVia
GROUP BY co.Compania;

/*
2. Listar la información de contacto (o, dirección, etc.) de los clientes que no  hayan realizado 
compras. Mostrar la información en el formato que considere más apropiado. 
Por ejemplo: <direccion> (CP: <codigo postal>)
*/

SELECT clientes.Contacto, clientes.Direccion, CONCAT("<", clientes.CodigoPostal, ">") AS CP, 
clientes.Telefono, clientes.Fax, facturas.FacturaID FROM clientes
LEFT JOIN facturas ON clientes.ClienteID = facturas.ClienteID
WHERE facturas.FacturaID IS NULL;


SELECT CONCAT('Sr/a ',Contacto) as contacto,
       CONCAT(Direccion, '(',CodigoPostal,')') as domicilio,
       Ciudad, Pais, Telefono
FROM clientes c
LEFT JOIN facturas f
ON c.clienteId = f.ClienteId
WHERE f.ClienteId IS NULL;

/*
3. Listar los empleados, junto con el importe total de sus ventas de la categoria Beverages.
   Mostrar el importe con dos decimales.
*/

SELECT empleados.EmpleadoID, empleados.Nombre, empleados.Apellido, 
FORMAT(SUM(facturadetalle.PrecioUnitario * facturadetalle.Cantidad * (1-facturadetalle.Descuento)), 2) AS "Importe total"
FROM empleados
INNER JOIN facturas ON empleados.EmpleadoID = facturas.EmpleadoID
INNER JOIN facturadetalle ON facturas.FacturaID = facturadetalle.FacturaID
INNER JOIN productos ON facturadetalle.ProductoID = productos.ProductoID
INNER JOIN categorias ON productos.CategoriaID = categorias.CategoriaID
WHERE categorias.CategoriaNombre = "Beverages"
GROUP BY empleados.EmpleadoID
ORDER BY empleados.EmpleadoID;



SELECT e.EmpleadoID, e.Apellido,
       FORMAT(SUM(d.PrecioUnitario * d.Cantidad * (1-d.Descuento)),2) as ImporteTotal
FROM empleados e
LEFT JOIN facturas f ON e.EmpleadoId = f.EmpleadoId
LEFT JOIN facturadetalle d ON f.FacturaId = d.FacturaId
LEFT JOIN productos p ON d.ProductoId = p.ProductoId
LEFT JOIN categorias c ON p.CategoriaId = c.CategoriaId
WHERE CategoriaNombre = 'Beverages'
GROUP BY e.EmpleadoID
ORDER BY e.EmpleadoID

