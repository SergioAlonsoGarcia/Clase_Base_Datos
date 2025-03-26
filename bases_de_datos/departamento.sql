Drop schema if exists departamento;

Create schema departamento;

Use departamento;

Create table departamento(
id_departamento INT PRIMARY KEY auto_increment,
descripción text NOT NULL,
ubicacion VARCHAR (100) NOT NULL
);

Create table vendedor (
id_vendedor INT PRIMARY KEY auto_increment,
nombre VARCHAR(100) NOT NULL,
rfc VARCHAR (13) NOT NULL,
teléfono VARCHAR (10) UNIQUE,
correo VARCHAR (100),
salario DECIMAL (10,2),
direccion VARCHAR (100)
);

Create table marca (
id_marca INT PRIMARY KEY auto_increment,
descripcion text
);

Create table articulo(
id_articulo INT PRIMARY KEY auto_increment ,
descripcion text ,
precio DECIMAL (10,2) NOT NULL,
existencia INT,
id_departamento INT,
id_marca INT,
FOREIGN KEY (id_departamento) references departamento(id_departamento),
FOREIGN KEY (id_marca) references marca(id_marca)
);



INSERT INTO departamento (descripción, ubicacion) VALUES
('Electrónica', 'Piso 1'),
('Electrónica', 'Piso 1'),
('Electrónica', NULL),
('Ropa', 'Piso 2'),
('Ropa', NULL),
('Electrónica', 'Piso 1'),
('Hogar', 'Piso 3'),
('Hogar', 'Piso 3'),
('Electrónica', 'Piso 4'),
(NULL, 'Piso 5'),
('Deportes', 'Piso 6'),
('Deportes', 'Piso 6'),
('Muebles', NULL),
('Muebles', 'Piso 7'),
(NULL, 'Piso 8'),
('Muebles', 'Piso 9'),
('Tecnología', 'Piso 10'),
('Tecnología', 'Piso 10'),
(NULL, 'Piso 11'),
('Tecnología', 'Piso 12'),
('Ropa', 'Piso 13'),
('Ropa', 'Piso 14'),
('Accesorios', 'Piso 15'),
('Accesorios', NULL);


INSERT INTO vendedor (nombre, rfc, teléfono, correo, salario, direccion) VALUES
('Juan Pérez', 'JUAP850101MN1', '5550123456', 'juan@example.com', 15000.50, 'Calle Ficticia 123'),
('Juan Pérez', 'JUAP850101MN1', NULL, 'juan@example.com', 15000.50, 'Calle Ficticia 123'),
('Carlos López', 'CALO890102HDF', '5550234567', NULL, 12000.00, 'Avenida Principal 456'),
('Ana Martínez', 'ANAM760321MNL', '5550345678', 'ana@example.com', 18000.75, NULL),
('Carlos López', 'CALO890102HDF', '5550234567', 'carlos@example.com', 12000.00, 'Avenida Principal 456'),
('Sofía González', 'SOGU990305FQ4', NULL, NULL, 13000.00, 'Calle 7'),
('Sofía González', 'SOGU990305FQ4', NULL, 'sofia@example.com', 13000.00, 'Calle 7'),
('José Sánchez', 'JOSA901212J34', '5550456789', NULL, NULL, 'Calle Sol'),
('José Sánchez', 'JOSA901212J34', '5550456789', 'jose@example.com', NULL, 'Calle Sol'),
('Pedro Ramírez', 'PERA950101HR6', '5550567890', 'pedro@example.com', 14000.00, 'Calle Luna'),
('Pedro Ramírez', 'PERA950101HR6', '5550567890', NULL, 14000.00, 'Calle Luna'),
('Laura Díaz', 'LADI880507MJ2', '5550678901', 'laura@example.com', 16000.25, 'Calle del Sol'),
('Laura Díaz', 'LADI880507MJ2', '5550678901', NULL, 16000.25, 'Calle del Sol'),
('Pedro Jiménez', 'PEJI820321D56', NULL, 'pedro.jimenez@example.com', 15000.00, 'Calle 23'),
('Pedro Jiménez', 'PEJI820321D56', NULL, NULL, NULL, 'Calle 23'),
('Raúl Torres', 'RATO750603F24', '5550789012', 'raul@example.com', 19000.00, 'Calle Viento'),
('Raúl Torres', 'RATO750603F24', '5550789012', 'raul@example.com', 19000.00, 'Calle Viento'),
('Marta López', 'MALO950707M34', '5550890123', 'marta@example.com', 11000.00, NULL),
('Marta López', 'MALO950707M34', NULL, 'marta@example.com', 11000.00, 'Calle Primavera'),
('Eduardo Pérez', 'EDPE880111HDF', '5550901234', NULL, 20000.50, 'Calle Otoño'),
('Eduardo Pérez', 'EDPE880111HDF', '5550901234', NULL, 20000.50, 'Calle Otoño'),
('Claudia Ríos', 'CLRI950709H75', NULL, 'claudia@example.com', NULL, NULL);


INSERT INTO marca (descripcion) VALUES
('Samsung'),
('Samsung'), 
('Sony'),
('Sony'), 
('Apple'),
('Apple'),
('LG'),
('LG'), 
('Huawei'),
('Huawei'), 
('Xiaomi'),
('Xiaomi'), 
('Nokia'),
('Nokia'), 
('Motorola'),
('Motorola'), 
('Alcatel'),
('Alcatel'), 
('OnePlus'),
('OnePlus'), 
('Lenovo'),
('Lenovo'); 

INSERT INTO articulo (descripcion, precio, existencia, id_departamento, id_marca) VALUES
('Smartphone Samsung', 5999.99, 10, 1, 1),
('Smartphone Samsung', 5999.99, 10, 1, 1), 
('Smartphone Sony', 6999.99, 15, 1, 2),
('Smartphone Sony', 6999.99, 15, 1, 2), 
('iPhone 13', 25999.99, 5, 2, 3),
('iPhone 13', 25999.99, 5, 2, 3), 
('Laptop HP', 8999.99, 7, 3, 4),
('Laptop HP', 8999.99, 7, 3, 4), 
('Tablet Huawei', 3599.99, 20, 4, 5),
('Tablet Huawei', 3599.99, 20, 4, 5),
('Televisor LG', 8999.99, 10, 5, 6),
('Televisor LG', 8999.99, 10, 5, 6), 
('Smartwatch Xiaomi', 1599.99, 25, 6, 7),
('Smartwatch Xiaomi', 1599.99, 25, 6, 7), 
('Auriculares Nokia', 1999.99, 30, 7, 8),
('Auriculares Nokia', 1999.99, 30, 7, 8), 
('Smartphone Motorola', 4999.99, 12, 8, 9),
('Smartphone Motorola', 4999.99, 12, 8, 9),
('Smartphone Alcatel', 3999.99, 50, 9, 10),
('Smartphone Alcatel', 3999.99, 50, 9, 10), 
('Smartphone OnePlus', 10999.99, 8, 10, 11),
('Smartphone OnePlus', 10999.99, 8, 10, 11);



SELECT DISTINCT descripcion FROM departamento LIMIT 3;
SELECT DISTINCT nombre FROM vendedor LIMIT 3;
SELECT DISTINCT descripcion FROM marca LIMIT 3;

SELECT * FROM articulo LIMIT 3;
SELECT * FROM vendedor LIMIT 3;
SELECT * FROM departamento LIMIT 3;

SELECT * FROM vendedor ORDER BY salario DESC LIMIT 3;
SELECT * FROM articulo ORDER BY precio ASC LIMIT 3;
SELECT * FROM departamento ORDER BY ubicacion DESC LIMIT 3;

SELECT * FROM vendedor WHERE salario > 15000 LIMIT 3;
SELECT * FROM articulo WHERE existencia < 10 LIMIT 3;
SELECT * FROM departamento WHERE id_departamento = 1;

SELECT * FROM vendedor WHERE nombre LIKE 'J%';
SELECT * FROM articulo WHERE descripcion LIKE '%Smartphone%';
SELECT * FROM vendedor WHERE correo LIKE '%@example.com';

SELECT * FROM articulo WHERE precio BETWEEN 5000 AND 10000;
SELECT * FROM vendedor WHERE salario BETWEEN 12000 AND 18000;
SELECT * FROM articulo WHERE existencia BETWEEN 10 AND 30;

SELECT * FROM vendedor WHERE salario > 10000 AND nombre LIKE 'J%';
SELECT * FROM articulo WHERE precio > 5000 AND existencia < 15;
SELECT * FROM departamento WHERE ubicacion IS NOT NULL AND descripcion IS NOT NULL;

SELECT * FROM vendedor WHERE salario > 18000 OR telefono IS NULL;
SELECT * FROM articulo WHERE existencia < 10 OR precio > 20000;
SELECT * FROM departamento WHERE ubicacion IS NULL OR descripcion IS NULL;

SELECT * FROM vendedor WHERE NOT salario > 15000;
SELECT * FROM articulo WHERE NOT descripcion LIKE '%iPhone%';
SELECT * FROM departamento WHERE NOT ubicacion IS NULL;

SELECT * FROM vendedor WHERE nombre IN ('Juan Pérez', 'Carlos López', 'Ana Martínez');
SELECT * FROM articulo WHERE id_marca IN (1, 3, 5);
SELECT * FROM departamento WHERE descripcion IN ('Electrónica', 'Ropa', 'Hogar');

SELECT precio * existencia AS total_valor FROM articulo LIMIT 3;
SELECT salario + 2000 AS nuevo_salario FROM vendedor LIMIT 3;
SELECT precio / 2 AS mitad_precio FROM articulo LIMIT 3;

SELECT MIN(precio) AS precio_min FROM articulo;
SELECT MIN(salario) AS salario_min FROM vendedor;
SELECT MIN(existencia) AS min_existencia FROM articulo;

SELECT MAX(precio) AS precio_max FROM articulo;
SELECT MAX(salario) AS salario_max FROM vendedor;
SELECT MAX(existencia) AS max_existencia FROM articulo;

SELECT COUNT(*) AS total_vendedores FROM vendedor;
SELECT COUNT(*) AS total_articulos FROM articulo;
SELECT COUNT(*) AS total_departamentos FROM departamento;

SELECT SUM(precio) AS total_precio FROM articulo;
SELECT SUM(salario) AS total_salario FROM vendedor;
SELECT SUM(existencia) AS total_existencia FROM articulo;

SELECT AVG(precio) AS promedio_precio FROM articulo;
SELECT AVG(salario) AS promedio_salario FROM vendedor;
SELECT AVG(existencia) AS promedio_existencia FROM articulo;

SELECT CONCAT(nombre, ' - ', rfc) AS vendedor_info FROM vendedor LIMIT 3;
SELECT CONCAT(descripcion, ' cuesta ', precio) AS articulo_info FROM articulo LIMIT 3;
SELECT CONCAT(descripcion, ' - ', ubicacion) AS departamento_info FROM departamento LIMIT 3;

SELECT UPPER(nombre) AS nombre_mayus FROM vendedor LIMIT 3;
SELECT UPPER(descripcion) AS articulo_mayus FROM articulo LIMIT 3;
SELECT UPPER(ubicacion) AS ubicacion_mayus FROM departamento LIMIT 3;

SELECT LOWER(nombre) AS nombre_minus FROM vendedor LIMIT 3;
SELECT LOWER(descripcion) AS articulo_minus FROM articulo LIMIT 3;
SELECT LOWER(ubicacion) AS ubicacion_minus FROM departamento LIMIT 3;

SELECT * FROM vendedor LIMIT 3 OFFSET 3;
SELECT * FROM articulo LIMIT 3 OFFSET 5;
SELECT * FROM departamento LIMIT 3 OFFSET 2;

SELECT id_departamento, COUNT(*) AS total_articulos FROM articulo GROUP BY id_departamento;
SELECT id_marca, COUNT(*) AS total_productos FROM articulo GROUP BY id_marca;
SELECT salario, COUNT(*) AS total_vendedores FROM vendedor GROUP BY salario;

SELECT id_departamento, COUNT(*) AS total_articulos 
FROM articulo 
GROUP BY id_departamento 
HAVING COUNT(*) > 2;

SELECT salario, COUNT(*) AS total_vendedores 
FROM vendedor 
GROUP BY salario 
HAVING COUNT(*) > 1;

SELECT id_marca, AVG(precio) AS promedio_precio 
FROM articulo 
GROUP BY id_marca 
HAVING AVG(precio) > 5000;

SELECT nombre, salario, 
CASE 
    WHEN salario > 15000 THEN 'Alto'
    WHEN salario BETWEEN 10000 AND 15000 THEN 'Medio'
    ELSE 'Bajo'
END AS nivel_salarial 
FROM vendedor;

SELECT descripcion, precio,
CASE 
    WHEN precio > 10000 THEN 'Caro'
    WHEN precio BETWEEN 5000 AND 10000 THEN 'Moderado'
    ELSE 'Barato'
END AS categoria_precio 
FROM articulo;

SELECT nombre, IFNULL(telefono, 'No registrado') AS telefono FROM vendedor;
SELECT descripcion, IFNULL(ubicacion, 'Ubicación desconocida') AS ubicacion FROM departamento;
SELECT nombre, IFNULL(salario, 0) AS salario FROM vendedor;
 
