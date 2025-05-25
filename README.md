# Clase_Base_Datos

Repositorio con ejercicios y recursos prácticos para aprender y trabajar con bases de datos SQL, incluyendo la base de datos Sakila y consultas de ejemplo.

---

## 📂 Estructura del repositorio

- `data/`  
  Archivos SQL con bases de datos o datos de ejemplo (por ejemplo, `sakila.sql`).

- `src/`  
  Consultas SQL y scripts organizados por temas o tablas.

- `docs/`  
  Documentación y manuales de uso.

- `tests/`  
  Scripts para probar consultas o validar resultados.

---

## 🛠️ Cómo usar este repositorio

1. Clona el repositorio:

   ```bash
   git clone https://github.com/SergioAlonsoGarcia/Clase_Base_Datos.git
   cd Clase_Base_Datos
Importa la base de datos Sakila (u otra base de datos en data/) en tu servidor MySQL:

bash
Copiar
Editar
mysql -u tu_usuario -p < data/sakila.sql
Ejecuta consultas de ejemplo desde la carpeta src. Por ejemplo, para listar todos los clientes:

sql
Copiar
Editar
-- src/listar_clientes.sql
SELECT customer_id, first_name, last_name, email
FROM customer
ORDER BY last_name;
Si quieres probar consultas, puedes usar los scripts en la carpeta tests.

📑 Ejemplos de consultas SQL
Obtener películas por categoría
sql
Copiar
Editar
SELECT f.title, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action'
ORDER BY f.title;
Listar los actores con más películas
sql
Copiar
Editar
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS peliculas
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY peliculas DESC
LIMIT 10;
💡 Recomendaciones
Usa un cliente SQL para ejecutar los scripts y consultas (MySQL Workbench, DBeaver, etc.).

No ejecutes consultas directamente en bases de datos de producción sin pruebas previas.

Modifica y adapta las consultas a tus necesidades.

🤝 Contribuciones
Crea una rama nueva:

bash
Copiar
Editar
git checkout -b nombre-de-tu-rama
Haz tus cambios.

Realiza un commit:

bash
Copiar
Editar
git commit -m "feat: añadir consulta para películas de acción"
Sube la rama:

bash
Copiar
Editar
git push origin nombre-de-tu-rama
Abre un Pull Request.


📞 Contacto
Puedes contactarme a través de GitHub para dudas o sugerencias.

¡Gracias por usar y contribuir a este repositorio!

Copiar
Editar







