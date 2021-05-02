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


-- Listar las facturas para las cuales el envío haya sido a una ciudad distinta a la ciudad del cliente.
-- Considerar únicamente los clientes de UK.
-- El listado dene incluir:
-- El número de factura completando con ceros a la izquierda 8 posiciones. Por ejemplo 00001234
-- La fecha de la factura en formato YYYY-MM-DD. Por ejemplo 1996-12-01
-- La ciudad del cliente
-- La ciudad de destino

SELECT RIGHT(CONCAT('00000000',f.FacturaID),8) AS FacturaId,
       DATE_FORMAT(f.FechaRegistro, '%Y-%m-%d') as fechaFactura,
       c.Ciudad, f.CiudadEnvio
FROM facturas f
INNER JOIN clientes c
ON f.ClienteID = c.ClienteID
WHERE c.Ciudad <> f.CiudadEnvio AND c.Pais = 'UK';


-- Listar las categorias y sus productos, incluyendo aquellas categorias para las cuales no haya productos en la base de datos.
-- En el caso de los nombres de los productos, donde diga Mix o Chef, reemplazarlo por MIX o CHEF respectivamente.
-- Por ejemplo: En lugar de Filo Mix, colocar Filo MIX. 

SELECT c.CategoriaNombre, REPLACE(REPLACE(p.ProductoNombre,'Mix','MIX'),'Chef','CHEF')
FROM categorias c
LEFT JOIN productos p
ON c.CategoriaId = p.CategoriaId
ORDER BY c.CategoriaNombre, p.ProductoNombre;


-- SEGUNDA PARTE --------------------------------------------


-- Para cada empresa de correo, calcular el total de transporte.
-- Incluir todas las empresas de correo, aun cuando no hayan realizado ninguna operación.
-- coalesce(coolas)
SELECT co.Compania, sum(coalesce(fa.Transporte,0)) as total_transporte
FROM correos co
LEFT JOIN facturas fa
ON co.CorreoId = fa.EnvioVia
GROUP BY co.Compania;


-- Listar la información de contacto (o, dirección, etc.) de los clientes que no hayan realizado compras.
-- Mostrar la información en el formato que considere más apropiado. Por ejemplo: <direccion> (CP: <codigo postal>)

SELECT CONCAT('Sr/a ',Contacto) as contacto,
       CONCAT(Direccion, '(',CodigoPostal,')') as domicilio,
       Ciudad, Pais, Telefono
FROM clientes c
LEFT JOIN facturas f
ON c.clienteId = f.ClienteId
WHERE f.ClienteId IS NULL;


-- Listar los empleados, junto con el importe total de sus ventas de la categoria Beverages.
-- Mostrar el importe con dos decimales.

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

