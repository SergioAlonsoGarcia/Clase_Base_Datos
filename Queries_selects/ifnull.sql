DROP SCHEMA IF EXISTS productos_prueba;

CREATE SCHEMA productos_prueba;

USE productos_prueba;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    categoria VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT,
    descuento DECIMAL(10, 2)
);

INSERT INTO productos (id, nombre, categoria, precio, stock, descuento) VALUES
(1, 'Laptop', NULL, 1500.00, 10, NULL),
(2, 'Mouse', NULL, 25.00, NULL, 5.00),
(3, 'Teclado', 'Tecnología', 50.00, 60, NULL),
(4, 'Monitor', 'Tecnología', 300.00, 20, 15.00),
(5, 'Silla', 'Muebles', 120.00, NULL, NULL),
(6, 'Escritorio', NULL, 250.00, 5, 10.00),
(7, 'Tablet', 'Tecnología', 500.00, 30, NULL),
(8, 'Smartphone', 'Tecnología', 800.00, 50, 40.00),
(9, 'Impresora', 'Tecnología', 200.00, 8, NULL),
(10, 'Auriculares', NULL, 75.00, 30, 5.00),
(11, 'Cámara', 'Tecnología', 600.00, 12, NULL),
(12, 'Altavoces', 'Tecnología', 150.00, 20, 10.00),
(13, 'Cargador', 'Tecnología', 20.00, 40, NULL),
(14, 'USB 64GB', 'Tecnología', 15.00, 100, 3.00),
(15, 'Disco Duro 1TB', 'Tecnología', 90.00, 18, 7.00),
(16, 'Microondas', 'Electrodomésticos', 180.00, 10, NULL),
(17, 'Refrigerador', NULL, 1200.00, 6, 120.00),
(18, 'Licuadora', 'Electrodomésticos', 85.00, 20, NULL),
(19, 'Cafetera', NULL, 130.00, 15, 15.00),
(20, 'Ventilador', 'Electrodomésticos', 70.00, 25, NULL),
(21, 'Sofá', 'Muebles', 500.00, 7, 30.00),
(22, 'Mesa de Centro', 'Muebles', 220.00, 12, NULL),
(23, 'Lámpara', NULL, 45.00, 30, NULL),
(24, 'Almohada', 'Hogar', 25.00, 50, 10.00),
(25, 'Colchón', 'Hogar', 400.00, 10, NULL),
(26, 'Ropero', 'Muebles', 700.00, 5, 25.00);


SELECT * FROM productos;

-- Mostrar todos los productos y su stock. Si el stock es NULL, mostrar 0.
SELECT nombre, IFNULL(stock,0) AS stock
FROM productos;

/*
Mostrar el nombre del producto y el precio_final considerando el descuento.
Si descuento es NULL, considerarlo como 0.
*/
SELECT nombre,
	precio - IFNULL(descuento,0) AS precio_final
FROM productos;

/*
Mostrar el nombre y una columna categoria_segura que 
muestre "Desconocida" si la categoría es NULL.
*/
 SELECT nombre,IFNULL(categoria,'Desconocida') AS categoria_segura
 FROM productos;
 
-- Actualizar el campo stock para que, si es NULL, se establezca en 0.
UPDATE productos
	SET stock = IFNULL(stock,0);
SELECT * FROM productos;

-- Actualizar el campo descuento para que, si es NULL, se establezca en 0.
UPDATE productos
	SET descuento = IFNULL(descuento,0);
SELECT * FROM productos;

-- Mostrar todos los productos ordenados por stock, considerando los NULL como 0.
SELECT 	id,nombre,categoria,precio,descuento, IFNULL(stock,0) AS stock
FROM productos
ORDER BY stock;






















