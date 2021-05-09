-- WHERE

/*
Mostrar el nombre, precio y color de los accesorios para asientos de las bicicletas cuyo precio 
sea mayor a 100 pesos.
Tablas: Product
Campos: Name, ListPrice, Color
*/

SELECT p.Name, p.ListPrice, p.Color FROM Product p
WHERE p.ListPrice > 100;


/* Mostrar los nombre de los productos que tengan cualquier combinación de ‘mountain bike’.
Tablas: Product
Campos: Name
*/

SELECT p.name FROM product p WHERE p.name LIKE "%mountain%bike%";

/*
Mostrar las personas cuyo nombre empiece con la letra “y”.
Tablas: Contact
Campos: FirstName
*/

SELECT c.FirstName FROM contact c WHERE c.FirstName LIKE "y%";



-- ORDER BY

/*
Mostrar cinco productos más caros y su nombre ordenado en forma alfabética
Tablas: Product
Campos: Name, ListPrice
*/

SELECT p.Name, p.ListPrice  FROM Product p
ORDER BY p.ListPrice DESC, p.Name ASC 
LIMIT 5;

/*
Mostrar las personas ordenadas primero por su apellido y luego por su nombre
Tablas: Contact
Campos: Firstname, Lastname
*/

SELECT c.FirstName, c.LastName FROM contact c
ORDER BY c.LastName ASC, c.FirstName ASC;


-- OPERADORES & JOINS

/*
Mostrar los empleados que tienen más de 90 horas de vacaciones.
Tablas: Employee
Campos: VacationHours, BusinessEntityID
*/

SELECT e.VacationHours, e.EmployeeID FROM employee e
WHERE e.VacationHours > 90;

/*
Mostrar el nombre, precio y precio con iva de los productos con precio distinto de cero.
Tablas: Product
Campos: Name, ListPrice
*/

SELECT p.Name, p.ListPrice, (p.ListPrice * 1.21) AS ListPriceIVA FROM product p
WHERE p.ListPrice != 0;

/*
Mostrar precio y nombre de los productos 776, 777, 778.
Tablas: Product
Campos: ProductID, Name, ListPrice
*/
SELECT p.Name, p.ListPrice FROM product p
WHERE p.ProductID IN (776, 777, 778);


/*
Mostrar el nombre concatenado con el apellido de las personas cuyo apellido sea johnson.
Tablas: Contact
Campos: FirstName, LastName
*/

SELECT concat_ws(" ", c.FirstName, c.LastName) AS "Nombre" FROM contact c 
WHERE c.LastName = "Johnson";

/*
Mostrar todos los productos cuyo precio sea inferior a 150$ de color rojo o cuyo precio sea 
mayor a 500$ de color negro.
Tablas: Product
Campos: ListPrice, Color
*/

SELECT p.ListPrice, p.Color FROM product p 
WHERE (p.ListPrice < 150 AND p.Color = "red") 
OR (p.ListPrice > 500 AND p.Color = "black");


-- FUNCIONES DE AGREGACIÓN

/*
Mostrar la fecha más reciente de venta
Tablas: SalesOrderHeader
Campos: OrderDate
*/

SELECT soh.OrderDate FROM SalesOrderHeader soh
ORDER BY soh.OrderDate DESC
LIMIT 1;

SELECT MIN(OrderDate) FROM SalesOrderHeader;

/*
Mostrar el precio más barato de todas las bicicletas.
Tablas: Product
Campos: ListPrice, Name
*/

SELECT p.Name, p.ListPrice FROM product p
ORDER BY p.ListPrice ASC
LIMIT 1;

/*
Mostrar la cantidad y el total vendido por productos
Tablas: SalesOrderDetail
Campos: LineTotal
*/

-- GROUP BY 

/*
Mostrar el código de subcategoría y el precio del producto más barato de cada una de ellas.
Tablas: Product
Campos: ProductSubcategoryID, ListPrice
*/

/*
Mostrar los productos y la cantidad total vendida de cada uno de ellos
Tablas: SalesOrderDetail
Campos: ProductID, OrderQty
*/

SELECT ProductID, sum(OrderQty) FROM SalesOrderDetail sod
GROUP BY ProductID;

-- HAVING 

/*
Mostrar la cantidad de facturas que vendieron más de 20 unidades.
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, OrderQty
*/

/*
Mostrar todas las facturas realizadas y el total facturado de cada una de ellas ordenado por 
número de factura pero sólo de aquellas órdenes superen un total de $10.000.
Tablas: SalesOrderDetail
Campos: SalesOrderID, LineTotal
*/

-- JOINS

/*
Mostrar los empleados que también son vendedores.
Tablas: Employee, SalesPerson
Campos: BusinessEntityID
*/

/*
Mostrar los empleados ordenados alfabéticamente por apellido y por nombre.
Tablas: Employee, Contact
Campos: BusinessEntityID, LastName, FirstName
*/

/*
Mostrar el código de logueo, número de territorio y sueldo básico de los vendedores.
Tablas: Employee, SalesPerson
Campos: LoginID, TerritoryID, Bonus, BusinessEntityID
*/

/*
Mostrar los productos que sean ruedas.
Tablas: Product, ProductSubcategory
Campos: Name, ProductSubcategoryID
*/

SELECT psc.ProductSubcategoryID id, p.name producto
FROM Product p 
INNER JOIN ProductSubcategory psc
ON psc.ProductSubcategoryID = p.ProductSubcategoryID
WHERE psc.name = "wheels";

/*
Mostrar los nombres de los productos que no son bicicletas.
Tablas: Product, ProductSubcategory
Campos: Name, ProductSubcategoryID
*/

SELECT * FROM Product p INNER JOIN ProductSubcategory ps
on ps.productsubcategoryid = p.productsubcategoryid 
WHERE NOT ps.NAME LIKE "%bikes%"