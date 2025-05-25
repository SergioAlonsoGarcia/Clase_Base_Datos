DROP SCHEMA IF EXISTS departamento;
CREATE SCHEMA departamento;
USE departamento;

CREATE TABLE departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT NOT NULL,
    ubicacion VARCHAR(100) NOT NULL
);

CREATE TABLE vendedor (
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    rfc VARCHAR(13) NOT NULL,
    teléfono VARCHAR(10) UNIQUE,
    correo VARCHAR(100),
    salario DECIMAL(10,2),
    direccion VARCHAR(100)
);

CREATE TABLE marca (
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT
);

CREATE TABLE articulo (
    id_articulo INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    existencia INT,
    id_departamento INT,
    id_marca INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento),
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
);

-- Datos únicos para departamento
INSERT INTO departamento (descripcion, ubicacion) VALUES
('Electrónica', 'Piso 1'),
('Ropa', 'Piso 2'),
('Hogar', 'Piso 3'),
('Juguetería', 'Piso 4'),
('Deportes', 'Piso 5'),
('Tecnología', 'Piso 6'),
('Muebles', 'Piso 7'),
('Accesorios', 'Piso 8'),
('Libros', 'Piso 9'),
('Zapatería', 'Piso 10'),
('Otro jsjs', 'Piso 11');

-- Datos únicos para vendedor
INSERT INTO vendedor (nombre, rfc, teléfono, correo, salario, direccion) VALUES
('Juan Pérez', 'JUAP850101MN1', '5550123456', 'juan@example.com', 15000.50, 'Calle Ficticia 123'),
('Carlos Herrera', 'CAHE850202HDF', '5550234567', 'carlos@example.com', 12000.00, 'Av. Siempre Viva 742'),
('Ana Martínez', 'ANMA900101FRT', '5550345678', 'ana@example.com', 18000.75, 'Calle Roble 12'),
('Laura Díaz', 'LADI880507MJ2', '5550678901', 'laura@example.com', 16000.25, 'Calle del Sol 45'),
('Pedro Ramírez', 'PERA950101HR6', '5550567890', 'pedro@example.com', 14000.00, 'Calle Luna 33'),
('Marta López', 'MALO950707M34', '5550890123', 'marta@example.com', 11000.00, 'Calle Primavera 21'),
('Eduardo Pérez', 'EDPE880111HDF', '5550901234', 'eduardo@example.com', 20000.50, 'Calle Otoño 88'),
('Claudia Ríos', 'CLRI950709H75', '5550912345', 'claudia@example.com', 14500.00, 'Calle Invierno 9'),
('Roberto Méndez', 'ROME900222PR3', '5550923456', 'roberto@example.com', 17000.00, 'Calle Norte 11'),
('Gabriela Torres', 'GATO870411MN7', '5550934567', 'gabriela@example.com', 15500.00, 'Calle Sur 14');

-- Datos únicos para marca
INSERT INTO marca (descripcion) VALUES
('Samsung'),
('Sony'),
('Apple'),
('LG'),
('Huawei'),
('Xiaomi'),
('Nokia'),
('Motorola'),
('OnePlus'),
('Lenovo');

-- Datos únicos para articulo
INSERT INTO articulo (descripcion, precio, existencia, id_departamento, id_marca) VALUES
('Smartphone Galaxy A52', 5999.99, 10, 1, 1),
('Smart TV Sony 55"', 8999.99, 8, 1, 2),
('iPhone 13 Pro', 25999.99, 5, 6, 3),
('Smartwatch LG Fit', 1999.99, 12, 1, 4),
('Tablet Huawei T10', 3599.99, 20, 6, 5),
('Redmi Note 11', 4999.99, 18, 1, 6),
('Audífonos Nokia WH-205', 799.99, 30, 8, 7),
('Moto G Stylus', 6999.99, 15, 1, 8),
('OnePlus Nord N10', 10999.99, 9, 6, 9),
('Laptop Lenovo IdeaPad', 11999.99, 6, 6, 10);
