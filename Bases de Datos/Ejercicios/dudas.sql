-- 3) Generar un listado de todas las facturas con el nombre y apellido de los empleados.
SELECT concat_ws(" ",empleados.nombre, empleados.apellido) 
as NombreYApellido, facturas.EmpleadoID FROM facturas 
INNER JOIN empleados ON facturas.EmpleadoID = empleados.EmpleadoID;

SELECT facturas.FacturaID, concat_ws(' ', empleados.Nombre, empleados.Apellido)
 as 'Nombre y Apellido' 
FROM empleados
JOIN facturas ON empleados.EmpleadoID = facturas.EmpleadoID;


-- 7) Generar un listado con los cinco mejores clientes, según sus importes 
-- de compras total (PrecioUnitario * Cantidad).
SELECT clientes.ClienteID, clientes.contacto, sum(PrecioUnitario * Cantidad) 
FROM clientes 
INNER JOIN facturas ON facturas.ClienteID = clientes.ClienteID 
INNER JOIN facturadetalle ON facturas.FacturaID = facturadetalle.FacturaID 
GROUP BY facturas.ClienteID 
ORDER BY sum(PrecioUnitario * Cantidad) 
DESC LIMIT 5;

select Compania, round(sum(PrecioUnitario*Cantidad),2) Compras_Total 
from clientes
inner join facturas on clientes.ClienteID = facturas.ClienteID
inner join facturadetalle on facturas.FacturaID = facturadetalle.FacturaID
group by Compania
order by Compras_total desc
limit 5;


-- 8) Generar un listado de facturas, con los campos id, nombre y apellido del cliente, 
-- fecha de factura, país de envío, Total, ordenado de manera descendente por 
-- fecha de factura y limitado a 10 filas.
SELECT DISTINCT facturas.FacturaID, clientes.Contacto, facturas.FechaFactura, facturas.PaisEnvio, facturadetalle.Cantidad AS Total 
FROM facturas 
INNER JOIN clientes ON clientes.ClienteID = facturas.ClienteID 
INNER JOIN facturadetalle ON facturadetalle.FacturaID = facturas.FacturaID 
ORDER BY facturas.FechaFactura 
DESC LIMIT 10;

select clientes.ClienteID, Compania, Contacto, facturas.FacturaID, FechaFactura, PaisEnvio, sum(PrecioUnitario * Cantidad) Total  from clientes
inner join facturas on clientes.ClienteID = facturas.ClienteID
inner join facturadetalle on facturas.FacturaID = facturadetalle.FacturaID
group by FacturaID
order by FechaFactura desc
limit 10;