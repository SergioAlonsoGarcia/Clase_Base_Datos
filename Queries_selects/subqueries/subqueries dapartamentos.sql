USE departamento;

-- Obtener los nombres de los vendedores cuyo salario es mayor al salario promedio de todos los vendedores.
SELECT nombre
FROM vendedor
WHERE salario > (
	SELECT AVG(salario)
    FROM vendedor
    WHERE salario
);

-- Mostrar los artículos cuyo precio es mayor al precio promedio de los artículos del departamento 'Electrónica'.
SELECT descripcion
FROM articulo a
WHERE precio >(
	SELECT AVG(precio)
    FROM articulo
    JOIN departamento d ON a.id_departamento = d.id_departamento
    WHERE d.descripción = 'ELectronica'
);


-- Listar los departamentos que tienen más de un artículo registrado.
SELECT d.descripción
FROM departamento d
WHERE d.id_departamento IN (
	SELECT id_departamento 
    FROM articulo 
    GROUP BY id_departamento
    HAVING COUNT(*) >1
);

-- Mostrar marcas que tienen artículos en el departamento 'Tecnología'
SELECT descripcion
FROM marca
WHERE id_marca IN (
    SELECT id_marca
    FROM articulo
    WHERE id_departamento = (
        SELECT id_departamento
        FROM departamento
        WHERE descripcion = 'Tecnología'
        LIMIT 1
    )
);

--  Mostrar los nombres de los vendedores cuyo salario es igual al salario más alto registrado 
SELECT nombre 
FROM vendedor 
WHERE salario = (
	SELECT MAX(salario)
    FROM vendedor
);

















