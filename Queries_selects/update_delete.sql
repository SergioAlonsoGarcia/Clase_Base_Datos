DROP DATABASE productos_prueba;
CREATE SCHEMA `productos_prueba`;

USE productos_prueba;

CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT
);

INSERT INTO productos (id, nombre, precio, stock) VALUES
(1, 'Laptop', 1500.00, 10),
(2, 'Mouse', 25.00, 100),
(3, 'Teclado', 50.00, 60),
(4, 'Monitor', 300.00, 20);

SELECT * FROM productos;
SELECT * FROM productos WHERE nombre = 'Laptop';

-- Momentáneamente vamos a deshabilitar el safe mode para esta actividad

SET SQL_SAFE_UPDATES = 0;

-- Al terminar vamos activarlo nuevamente

SET SQL_SAFE_UPDATES = 1;


-- Cambiamos el precio de la "Laptop" a 1600.
UPDATE productos
SET precio = 1600
WHERE nombre = 'Laptop';

SELECT * FROM productos;
SELECT * FROM productos WHERE nombre = 'Laptop';

-- Incrementar el precio en un 10% para todos los productos con precio menor a 100.

UPDATE productos
SET precio = precio * 1.1
WHERE precio < 100;

SELECT * FROM productos;

-- Eliminar el producto con nombre "Mouse".

DELETE FROM productos
WHERE nombre = 'Mouse';

SELECT * FROM productos;

-- Eliminar todos los productos con stock menor a 30.

SELECT * FROM productos;
SELECT * FROM productos WHERE stock < 30;

DELETE FROM productos
WHERE stock < 30;

SELECT * FROM productos;

SELECT * FROM productos WHERE stock < 30;

-- Actividad 15

CREATE TABLE productos2 (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    categoria VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT
);

INSERT INTO productos2 (id, nombre, categoria, precio, stock) VALUES
(1, 'Laptop', 'Tecnología', 1500.00, 10),
(2, 'Mouse', 'Tecnología', 25.00, 100),
(3, 'Teclado', 'Tecnología', 50.00, 60),
(4, 'Monitor', 'Tecnología', 300.00, 20),
(5, 'Silla', 'Muebles', 120.00, 15),
(6, 'Escritorio', 'Muebles', 250.00, 5);

SELECT * from productos2;

-- Actualizar el precio del producto "Silla" a 130.00.
SELECT * FROM productos2 WHERE nombre = 'Silla';

UPDATE productos2
SET precio = 130.00
WHERE nombre = 'Silla';

-- Verificamos resultado

SELECT * FROM productos2 WHERE nombre = 'Silla';

-- Incrementar en un 10% el precio de todos los productos de la categoría "Tecnología".
SELECT * FROM productos2 WHERE categoria = 'Tecnología';

UPDATE productos2
SET precio = precio * 1.10
WHERE categoria = 'Tecnología';

-- Verificamos resultado
SELECT * FROM productos2 WHERE categoria = 'Tecnología';

-- Aumentar el stock de todos los productos con stock menor o igual a 10 en 5 unidades.

UPDATE productos2
SET stock = stock + 5
WHERE stock <= 10;

-- Verificamos resultado
SELECT * FROM productos2 WHERE stock <= 15;

-- Cambiar el nombre del producto con id = 6 a "Escritorio de Madera".

UPDATE productos2
SET nombre = 'Escritorio de Madera'
WHERE id = 6;

-- Verificación
SELECT * FROM productos2 WHERE id = 6;

-- Reducir en un 5% el precio de los productos cuyo precio sea mayor a 500.

UPDATE productos2
SET precio = precio * 0.95
WHERE precio > 500;

-- Verificación
SELECT * FROM productos2 WHERE precio > 500;

-- Actualizar la categoría del producto "Monitor" a "Electrónica".

UPDATE productos2
SET categoria = 'Electrónica'
WHERE nombre = 'Monitor';

-- Verificación
SELECT * FROM productos2 WHERE nombre = 'Monitor';

-- Establecer el stock en 0 para todos los productos con un precio inferior a 30.

UPDATE productos2
SET stock = 0
WHERE precio < 30;

-- Verificación
SELECT * FROM productos2 WHERE precio < 30;

-- Eliminar el producto con el nombre "Mouse".

DELETE FROM productos2
WHERE nombre = 'Mouse';

-- Verificación
SELECT * FROM productos2;


-- Eliminar todos los productos cuya categoría sea "Muebles" y cuyo stock sea menor a 10.

DELETE FROM productos2
WHERE categoria = 'Muebles' AND stock < 10;

-- Verificación
SELECT * FROM productos2;

-- Eliminar los productos cuyo precio sea mayor a 1000.

DELETE FROM productos2
WHERE precio > 1000;

-- Verificación
SELECT * FROM productos2;

-- Eliminar el producto con id igual a 4.

DELETE FROM productos2
WHERE id = 4;

-- Verificación
SELECT * FROM productos2;

-- Eliminar todos los productos que tengan un stock igual a 0.

DELETE FROM productos2
WHERE stock = 0;

-- Verificación
SELECT * FROM productos2;

/* 
Actualizar el precio de todos los productos de la categoría "Tecnología" en un 15%, 
pero solo si su precio actual es menor a 1000.
*/

UPDATE productos2
SET precio = precio * 1.15
WHERE categoria = 'Tecnología' AND precio < 1000;

-- Verificación
SELECT * FROM productos2 WHERE categoria = 'Tecnología';

--  Eliminar todos los productos cuyo stock sea menor al promedio del stock de todos los productos.

-- Primero, obtener el promedio de stock
SELECT AVG(stock) AS promedio_stock FROM productos2;

-- Supongamos que el promedio es 30, entonces:
DELETE FROM productos2
WHERE stock < 30;

-- Verificación
SELECT * FROM productos2;

-- Cambiar el nombre de todos los productos de la categoría "Muebles" agregando la palabra "Deluxe" al final del nombre.

UPDATE productos2
SET nombre = CONCAT(nombre, ' Deluxe')
WHERE categoria = 'Muebles';

-- Verificación
SELECT * FROM productos2 WHERE categoria = 'Muebles';

DELETE FROM productos2;

SELECT * FROM productos2;   