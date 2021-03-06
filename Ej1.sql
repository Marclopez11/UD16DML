#1.1 Obtener los nombres de los productos de la tienda

SELECT NOMBRE FROM articulos;

#1.2 Obtener los nombres y los precios de los productos de la tienda

SELECT NOMBRE,PRECIO FROM articulos;

#1.3 Obtener el nombre de los productos cuyo precio se menos o igual a 200

SELECT NOMBRE FROM articulos WHERE PRECIO <= 200;

#1.4  Obtener todos los datos de los articulos cuyo precio este entre los 60 y los 120 (ambas cantidades incluidas)

SELECT * FROM articulos WHERE PRECIO >= 60 AND PRECIO <= 120;

#1.5 Obtener el nombre y el precio en pesetas(es decir, el precio en euros multiplicado por 166'386)

SELECT NOMBRE,PRECIO,PRECIO*(166386) AS VALOREN_PESETAS FROM articulos;

#1.6 Seleccionar el precio medio de todos los productos

SELECT AVG(PRECIO) AS TotalPerProduct FROM articulos ;

#1.7 Obtener el precio medio de los artículos cuyo codigo del fabricante sea 2.

SELECT AVG(PRECIO) FROM articulos WHERE CODIGO = 2;


#1.8 Obtener un numero de artículos cuyo precio sea mayor o igual a 180
 SELECT CODIGO FROM articulos WHERE PRECIO >= 180;

#1.9 Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 180 y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.

SELECT nombre,precio FROM articulos WHERE PRECIO >= 180  ORDER BY PRECIO DESC;

SELECT nombre,precio FROM articulos WHERE PRECIO >= 180  ORDER BY NOMBRE ASC;






#1.10 Obtener un listado completo de artículos, incluyendo por cada articulo los datos del artículo y de su fabricante

FORMA 1

SELECT * FROM articulos AS a ,fabricantes AS f WHERE a.FABRICANTE = f.CODIGO;

FORMA 2

SELECT * FROM articulos AS a INNER JOIN  fabricantes AS f WHERE a.FABRICANTE = f.CODIGO;

#1.11 Obtener un listado completo de artículos, incluyendo el nombre del articulo,su precio y el del nombre del fabricante 

Select a.NOMBRE, a.PRECIO, f.NOMBRE as NOMBRE_FABRICANTE FROM articulos AS a INNER JOIN fabricantes as f;

#1.12 Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante.

SELECT f.CODIGO, AVG(a.PRECIO) FROM articulos as a INNER JOIN fabricantes as f  on  a.fabricante=f.codigo GROUP BY f.codigo;

#1.13 Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.

SELECT f.NOMBRE, AVG(a.PRECIO) FROM articulos as a INNER JOIN fabricantes as f  on  a.fabricante=f.codigo GROUP BY f.codigo;

#1.14 Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual 150.

SELECT f.nombre ,avg(a.precio) as 'PrecioMedio' FROM articulos AS a INNER JOIN fabricantes AS f ON a.FABRICANTE = f.CODIGO group by f.nombre having avg(a.precio) >= 150;

#1.15 Obtener el nombre y precio del artículo más barato.
SELECT  a.NOMBRE , MIN(a.precio) as min_price
FROM articulos AS a WHERE (SELECT MIN(a.precio) = 5)
GROUP BY a.NOMBRE;

#1.16 Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor (incluyendo el nombre del proveedor)

SELECT F.NOMBRE AS FABRICANTE, A.NOMBRE ARTICULO, A.PRECIO
FROM articulos A
INNER JOIN fabricantes F
ON A.FABRICANTE = F.CODIGO
WHERE A.PRECIO IN (SELECT MAX(A.PRECIO) FROM articulos A JOIN fabricantes F ON A.FABRICANTE = F.CODIGO GROUP BY F.NOMBRE);


#1.17 Añadir un nuevo producto: Altavoces de 70€ (del fabricante 2).

INSERT INTO articulos (NOMBRE, PRECIO, FABRICANTE)
VALUES ("Altavoces", 70, 2);


#1.18 Cambiar el nombre del producto 8 a ‘Impresora Laser’

UPDATE articulos
SET NOMBRE='Impresora Laser' WHERE CODIGO=8;

#1.19 Aplicar un descuento de 10% (multiplicar el precio por 0,9) a todos los productos.

UPDATE articulos
SET precio = precio*0.9;
