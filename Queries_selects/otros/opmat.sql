-- Uso de operadores lógicos/matemáticos 

-- Alias

SELECT title AS Pelicula, rental_rate AS Tarifa FROM film;

/* Listaremos el identificador del cliente (customer_id) y pago (payment_id),monto (amount) 
y calcularemos el IVA y el total para la rentas del identificador de cliente igual a 1. */

SELECT payment_id, customer_id, amount, amount*0.16, amount*1.16
FROM payment 
WHERE customer_id=1;


SELECT payment_id, customer_id, amount, amount*0.16 as IVA, amount*1.16 as total 
FROM payment 
WHERE customer_id=1;


/* Listaremos el identificador del cliente (customer_id) y pago (payment_id),monto (amount) 
y calcularemos el IVA y el total para la rentas del identificador de cliente igual a 1 o 3. */

SELECT payment_id, customer_id, amount, amount*0.16 as IVA, amount*1.16 as total 
FROM payment 
WHERE customer_id=1 or customer_id=3;

/* Listaremos el identificador del cliente (customer_id) y pago (payment_id),monto (amount) 
y calcularemos el IVA y el total para la rentas con monto mayor que 4.99. */

SELECT payment_id, customer_id, amount, amount*0.16 as IVA, amount*1.16 as total 
FROM payment 
WHERE amount>4.99;

/* Listaremos el identificador del cliente (customer_id) y pago (payment_id),monto (amount) 
y calcularemos el IVA y el total para la rentas con monto mayor o igual que 4.99. */

SELECT payment_id, customer_id, amount, amount*0.16 as IVA, amount*1.16 as total 
FROM payment 
WHERE amount>=4.99;

/* Listaremos el identificador del cliente (customer_id) y pago (payment_id),monto (amount) 
y calcularemos el IVA y el total para la rentas con monto menor o igual que 4.99. */

SELECT payment_id, customer_id, amount, amount*0.16 as IVA, amount*1.16 as total 
FROM payment 
WHERE amount<=4.99;

/* Listaremos el identificador del cliente (customer_id) y pago (payment_id),monto (amount) 
y calcularemos el IVA y el total para la rentas con monto menor que 4.99. */

SELECT payment_id, customer_id, amount, amount*0.16 as IVA, amount*1.16 as total 
FROM payment 
WHERE amount<4.99;