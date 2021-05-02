SELECT * FROM emarket.categorias;

SELECT CategoriaNombre, Descripcion FROM emarket.categorias;

SELECT ProductoID, ProductoNombre FROM emarket.productos;

SELECT * FROM emarket.productos 
WHERE Discontinuado = '1';

SELECT * FROM emarket.productos 
WHERE ProveedorID = '8';

SELECT * FROM emarket.productos 
WHERE PrecioUnitario BETWEEN 10 AND 22;

SELECT * FROM emarket.productos 
WHERE UnidadesStock < NivelReorden;

SELECT * FROM emarket.productos 
WHERE UnidadesStock < NivelReorden AND UnidadesPedidas = 0;

SELECT Contacto, Compania, Titulo, Pais FROM emarket.clientes
ORDER BY pais ASC; 

SELECT * FROM emarket.clientes WHERE titulo = 'Owner';

SELECT Contacto, Telefono FROM emarket.clientes 
WHERE Contacto LIKE 'C%';

SELECT * FROM emarket.facturas 
ORDER BY FechaFactura ASC;

SELECT * FROM emarket.facturas
WHERE PaisEnvio = 'USA' 
AND EnvioVia != 3;

SELECT FacturaID, ClienteID, FechaFactura FROM emarket.facturas 
WHERE ClienteID = 'GOURL';

SELECT * FROM emarket.facturas
WHERE EmpleadoID in (2,3,5,8,9);

SELECT productonombre, UnidadesStock, PrecioUnitario FROM emarket.productos 
ORDER BY PrecioUnitario DESC;

SELECT productonombre, UnidadesStock, PrecioUnitario FROM emarket.productos 
ORDER BY PrecioUnitario DESC
LIMIT 5;

SELECT productonombre, UnidadesStock FROM emarket.productos 
ORDER BY UnidadesStock DESC
LIMIT 10;

SELECT FacturaID, ProductoID, Cantidad FROM emarket.facturadetalle;

SELECT FacturaID, ProductoID, Cantidad FROM emarket.facturadetalle
ORDER BY Cantidad DESC;

SELECT * FROM emarket.facturadetalle 
WHERE Cantidad BETWEEN 50 AND 100;

SELECT FacturaID AS NroFactura, ProdutoID AS Producto, PrecioUnitario*Cantidad AS Total
FROM emarket.facturadetalle;
