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
('Carlos López', 'CALO890102HDF', '55502345167', 'carlos@example.com', 12000.00, 'Avenida Principal 456'),
('Sofía González', 'SOGU990305FQ4', NULL, NULL, 13000.00, 'Calle 7'),
('Sofía González', 'SOGU990305FQ4', NULL, 'sofia@example.com', 13000.00, 'Calle 7'),
('José Sánchez', 'JOSA901212J34', '55504567289', NULL, NULL, 'Calle Sol'),
('José Sánchez', 'JOSA901212J34', '5550456789', 'jose@example.com', NULL, 'Calle Sol'),
('Pedro Ramírez', 'PERA950101HR6', '55505367890', 'pedro@example.com', 14000.00, 'Calle Luna'),
('Pedro Ramírez', 'PERA950101HR6', '5550567890', NULL, 14000.00, 'Calle Luna'),
('Laura Díaz', 'LADI880507MJ2', '55506718901', 'laura@example.com', 16000.25, 'Calle del Sol'),
('Laura Díaz', 'LADI880507MJ2', '5550678901', NULL, 16000.25, 'Calle del Sol'),
('Pedro Jiménez', 'PEJI820321D56', NULL, 'pedro.jimenez@example.com', 15000.00, 'Calle 23'),
('Pedro Jiménez', 'PEJI820321D56', NULL, NULL, NULL, 'Calle 23'),
('Raúl Torres', 'RATO750603F24', '55507892012', 'raul@example.com', 19000.00, 'Calle Viento'),
('Raúl Torres', 'RATO750603F24', '5550789012', 'raul@example.com', 19000.00, 'Calle Viento'),
('Marta López', 'MALO950707M34', '5550890123', 'marta@example.com', 11000.00, NULL),
('Marta López', 'MALO950707M34', NULL, 'marta@example.com', 11000.00, 'Calle Primavera'),
('Eduardo Pérez', 'EDPE880111HDF', '555090111234', NULL, 20000.50, 'Calle Otoño'),
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


