DROP SCHEMA IF EXISTS ejercicio;
CREATE SCHEMA ejercicio;
USE ejercicio;

CREATE TABLE employee_info (
    employee_ID INTEGER PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employee_info (employee_ID, name, department) VALUES
(1, 'Ana', 'IT'),
(2, 'Luis', 'HR'),
(3, 'Juan', 'Sales'),
(4, 'Sofia', 'IT');

CREATE TABLE employee_salary (
    employee_ID INTEGER PRIMARY KEY,
    salary INTEGER
);

INSERT INTO employee_salary (employee_ID, salary) VALUES
(1, 6000),
(2, 4000),
(3, 7000),
(4, 8000);
	
	
/*
✍ Escribe una consulta para encontrar los empleados del departamento de IT 
que ganan más de 5000. Devuelve el employee_ID y name ordenados en orden ascendente.
*/

SELECT e.employee_id,e.name FROM employee_info AS e
JOIN employee_salary AS s
ON e.employee_id = s.employee_id
WHERE salary > 5000 AND e.department = 'IT'
ORDER BY e.employee_id;
