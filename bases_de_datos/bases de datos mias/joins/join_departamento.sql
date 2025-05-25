-- Mostrar todos los artículos junto con la marca correspondiente
SELECT a.descripcion AS articulo, m.descripcion AS marca
FROM articulo a
JOIN marca m
ON a.id_marca = m.id_marca;

-- Mostrar todos los artículos junto con su departamento
SELECT a.descripcion AS articulo, d.descripcion 
FROM articulo a
INNER JOIN departamento d
ON a.id_departamento = d.id_departamento;

-- Mostrar todos los departamentos junto con los artículos, incluso si no tienen artículos asociados
SELECT d.descripcion AS departamento, a.descripcion AS articulo
FROM departamento d
LEFT JOIN articulo a
ON d.id_departamento = a.id_departamento;

-- Mostrar todas las marcas junto con los artículos, incluso si no tienen artículos asociados
SELECT m.descripcion AS marca, a.descripcion AS articulo
FROM marca m
LEFT JOIN articulo a
ON m.id_marca = a.id_marca;

-- RIGHT JOIN

-- Mostrar todos los artículos junto con el departamento, incluso si no tienen un departamento asignado
SELECT a.descripcion AS articulo, d.descripcion AS departamento
FROM articulo a
RIGHT JOIN departamento d
ON a.id_departamento = d.id_departamento;

-- Mostrar todos los artículos junto con su marca, incluso si no tienen marca asignada
SELECT a.descripcion AS articulo, m.descripcion AS marca
FROM articulo a
RIGHT JOIN marca m
ON a.id_marca = m.id_marca;

