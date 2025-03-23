DROP SCHEMA IF EXISTS ejercicio;
CREATE SCHEMA ejercicio;
USE ejercicio;

CREATE TABLE students (
    student_ID INTEGER PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO students (student_ID, name) VALUES
(1, 'Ana'),
(2, 'Luis'),
(3, 'Pedro'),
(4, 'Elena');

CREATE TABLE grades (
    grade_ID INTEGER PRIMARY KEY,
    student_ID INTEGER,
    subject VARCHAR(50),
    score INTEGER,
    FOREIGN KEY (student_ID) REFERENCES students(student_ID)
);

INSERT INTO grades (grade_ID, student_ID, subject, score) VALUES
(101, 1, 'Math', 90),
(102, 1, 'Science', 85),
(103, 2, 'Math', 80),
(104, 2, 'Science', 78),
(105, 3, 'Math', 88),
(106, 3, 'Science', 92),
(107, 4, 'Math', 70),
(108, 4, 'Science', 75);


/*
📌 Objetivo: Encuentra los estudiantes con una calificación
promedio mayor o igual a 85. Devuelve su student_ID,
name y su promedio, ordenados en orden descendente.
*/


SELECT s.student_id,s.name,AVG(g.score) AS average FROM students AS s
JOIN grades AS g
ON s.student_id = g.student_id
GROUP BY s.student_id
HAVING AVG(g.score) >= 85
ORDER BY average DESC;

