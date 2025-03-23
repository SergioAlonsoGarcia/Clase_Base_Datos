DROP SCHEMA IF EXISTS ejercicio;
CREATE SCHEMA ejercicio;
USE ejercicio;

CREATE TABLE products (
    product_ID INTEGER PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO products (product_ID, name) VALUES
(1, 'Laptop'),
(2, 'Mouse'),
(3, 'Teclado'),
(4, 'Monitor');

CREATE TABLE sales (
    sale_ID INTEGER PRIMARY KEY,
    product_ID INTEGER,
    quantity INTEGER,
    FOREIGN KEY (product_ID) REFERENCES products(product_ID)
);

INSERT INTO sales (sale_ID, product_ID, quantity) VALUES
(101, 1, 5),
(102, 2, 10),
(103, 3, 8),
(104, 4, 2),
(105, 1, 7),
(106, 2, 3);


/*
📌 Objetivo: Encuentra los productos más vendidos,
 mostrando su product_ID, name y la cantidad total vendida,
 ordenados de mayor a menor.
*/
SELECT p.product_id,p.name,SUM(quantity) AS total_sold FROM products AS p
JOIN sales AS s ON p.product_id = s.product_id
GROUP BY p.product_id ,p.name
ORDER BY total_sold DESC;



