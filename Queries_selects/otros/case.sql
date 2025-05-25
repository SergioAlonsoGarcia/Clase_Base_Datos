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
    stock_status VARCHAR(20)
);

INSERT INTO productos (id, nombre, categoria, precio, stock) VALUES
(1, 'Laptop', 'Tecnología', 1500.00, 10),
(2, 'Mouse', 'Tecnología', 25.00, 0),
(3, 'Teclado', 'Tecnología', 50.00, 60),
(4, 'Monitor', 'Tecnología', 300.00, 20),
(5, 'Silla', 'Muebles', 120.00, 15),
(6, 'Escritorio', 'Muebles', 250.00, 5),
(7, 'Tablet', 'Tecnología', 500.00, 25),
(8, 'Smartphone', 'Tecnología', 800.00, 50),
(9, 'Impresora', 'Tecnología', 200.00, 8),
(10, 'Auriculares', 'Tecnología', 75.00, 30),
(11, 'Cámara', 'Tecnología', 600.00, 12),
(12, 'Altavoces', 'Tecnología', 150.00, 20),
(13, 'Cargador', 'Tecnología', 20.00, 40),
(14, 'USB 64GB', 'Tecnología', 15.00, 100),
(15, 'Disco Duro 1TB', 'Tecnología', 90.00, 18),
(16, 'Microondas', 'Electrodomésticos', 180.00, 10),
(17, 'Refrigerador', 'Electrodomésticos', 1200.00, 6),
(18, 'Licuadora', 'Electrodomésticos', 85.00, 20),
(19, 'Cafetera', 'Electrodomésticos', 130.00, 15),
(20, 'Ventilador', 'Electrodomésticos', 70.00, 25),
(21, 'Sofá', 'Muebles', 500.00, 7),
(22, 'Mesa de Centro', 'Muebles', 220.00, 12),
(23, 'Lámpara', 'Hogar', 45.00, 30),
(24, 'Almohada', 'Hogar', 25.00, 50),
(25, 'Colchón', 'Hogar', 400.00, 10),
(26, 'Ropero', 'Muebles', 700.00, 5);

/*
Mostrar el nombre y una columna llamada rango_precio que clasifique los productos así:
"Económico" si el precio es menor a 100.
"Moderado" si el precio está entre 100 y 500.
"Caro" si el precio es mayor a 500.
*/

SELECT nombre, precio,
CASE  
WHEN precio < 100 THEN 'economico'
WHEN precio BETWEEN 100 AND 500 THEN 'moderado'
ELSE 'caro'
END AS rango_precio
FROM productos;

/*
 Mostrar el nombre del producto y una columna disponibilidad que diga:
"Sin Stock" si el stock es 0.
"Bajo Stock" si el stock es menor a 20.
"Disponible" si el stock es igual o mayor a 20.
*/

SELECT nombre,
CASE
WHEN stock = 0 THEN 'Sin stock'
WHEN stock < 20 THEN 'Bajo stock'
WHEN stock >= 20 THEN 'Disponible'
END AS disponibilidad
FROM productos;

/*
Agregar una columna calculada llamada descuento que aplique lo siguiente:
Si el precio es mayor a 1000, aplicar un descuento del 10%.
Si el precio es entre 500 y 1000, aplicar un descuento del 5%.
En otros casos, sin descuento (0).
*/

ALTER TABLE productos ADD COLUMN  descuento DECIMAL(10,2);
UPDATE productos
SET descuento = CASE
WHEN precio > 1000 THEN precio * 0.10
WHEN precio BETWEEN 500 AND 1000 THEN precio * 0.05
ELSE 0
END;
SELECT * FROM productos;

/*
. Actualizar la columna stock_status de la tabla productos con los siguientes valores:
"Sin Stock" si el stock es 0.
"Bajo" si el stock es menor a 20.
"Disponible" si el stock es igual o mayor a 20.
*/
UPDATE productos
SET stock_status = 
CASE 
WHEN stock = 0 THEN 'Sin stock'
WHEN stock < 20 THEN 'Bajo stock'
ELSE  'Disponible'
END; 
SELECT * FROM productos;

/*
. Actualizar la categoría de los productos:
Si el precio es mayor a 1000, cambiar la categoría a "Alta Gama".
Si el precio está entre 500 y 1000, cambiar a "Gama Media".
En otros casos, dejar la categoría como "Gama Baja"
*/
UPDATE productos 
SET categoria = 
CASE 
WHEN precio > 1000 THEN 'Alta gama'
WHEN precio BETWEEN 500 AND 1000 THEN 'Gama media'
ELSE 'Gama baja'
END;
SELECT * FROM productos;

/*
Ordenar los productos mostrando primero los "Sin Stock", 
luego los de "Bajo Stock" y al final los "Disponibles".
*/
SELECT nombre,stock_status
FROM productos
ORDER BY
CASE
WHEN  stock_status = 'Sin stock' THEN 1
WHEN  stock_status = 'Bajo' THEN 2
WHEN  stock_status = 'Disponible' THEN 3
END;

/*
 Ordenar los productos por precio según la siguiente prioridad:
Primero los productos "Caros" (precio > 1000).
Luego los "Moderados" (precio entre 500 y 1000).
Por último, los "Económicos" (precio menor a 500).
*/

SELECT nombre, precio 
FROM productos 
	ORDER BY
		CASE 
		WHEN precio > 1000 THEN 1
		WHEN precio BETWEEN 500 AND 1000 THEN 2
	END,
precio ASC;
    
/*
Mostrar una lista de productos con una columna oferta_especial que indique:

"Sí" si el producto está en la categoría "Muebles" y tiene un stock menor a 10.
"No" en caso contrario.
*/    
SELECT nombre, categoria, stock,
	CASE
		WHEN categoria = 'Muebles' AND stock < 10 THEN 'Si'
	ELSE 'No'
END AS oferta_especial
FROM productos;
	








